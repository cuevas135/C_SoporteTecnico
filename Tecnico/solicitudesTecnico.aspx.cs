using System;
using System.Configuration;
using System.Data;
//using Newtonsoft.Json;
using System.Drawing;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Net;
//using System.Net.Sockets;

public partial class Tecnico_solicitudes : Page
{
    private string Ruta = ConfigurationManager.AppSettings.Get("CadenaConeccion");
    TableRow tRow;
    Lista _Lista = new Lista();
    Utilitarios _Utilitarios = new Utilitarios();
    //CsSignal _CsSignal = new CsSignal();
    bool OSPSS = true;
    string EnviarNotificacion = "NO";





    private string ObtenerFechaSistema()
    {
        string Fecha = "";
        policia.clsaccesodatos servidor = new policia.clsaccesodatos();
        try
        {
            servidor.cadenaconexion = Ruta;
            if (servidor.abrirconexion() == true)
            {
                DataTable dt = servidor.consultar("[dbo].[obtenerfechasistema]").Tables[0];
                if (dt.Rows.Count == 0)
                {
                    servidor.cerrarconexion();
                    Fecha = "";
                }
                else
                {
                    Fecha = dt.Rows[0]["Fecha"].ToString();
                    servidor.cerrarconexion();
                }
            }
            else
            {
                servidor.cerrarconexion();
                _Lista.ShowMessage(__mensaje, __pagina, servidor.getMensageError(), "CerrarSession.aspx");
            }
        }
        catch (Exception)
        {
            servidor.cerrarconexion();
            _Lista.ShowMessage(__mensaje, __pagina, "Error inesperado al intentar conectarnos con el servidor.", "CerrarSession.aspx");
        }
        return Fecha;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            ////=====================================================
            //EnviarNotificacion = Request.QueryString["EnviarNotificacion"]; // OPCION
            //if (EnviarNotificacion == "SI")
            //{
            //    //ENVIAR NOTIFICACIONES A LOS ADMINISTRADORES
            //    _CsSignal.EnviarNotificacionAdministrador();
            //}
            ////=====================================================
        }
        catch (Exception)
        {
            //throw;
        }
    }

    protected void Page_init(object sender, EventArgs e)
    {
        __mensaje.Value = "";
        __pagina.Value = "";

        /*No se porque se tiene que activarse el boton desde aqui para ver si se inicio sesion.*/
        // btnGenerarSolicitud_Click(sender, e);

        //=============================================================================================================
        //Verificamos si el usuario ha iniciado sesion.
        __mensaje.Value = "";
        __pagina.Value = "";
        string[] Datos = (string[])Session["__JSAR__"];
        if (Datos == null)
        {
            __mensaje.Value = "Ud. no esta autorizado para ingresar a esta página, inicie sesion por favor.";
            __pagina.Value = "CerrarSession.aspx";
            return;
        }
        //============================================================================================================
        string CODIGO = Convert.ToString(Datos[0]);
        //lblUsuario.Text = " [USUARIO: " + Convert.ToString(Datos[1]) + "]";

     
        //ActualizaDetalleSolicitud((DataTable)Session["Tabla"]);
        try
        {
            ///*Eliminamos la primera fila que es agregada por defecto.*/
            //if (Table_.Rows[1].Cells[0].Text.Trim() == "")
            //{
            //    Table_.Rows[1].Cells.Clear();
            //}
        }
        catch (Exception) { }


        ObtenerSolicitudesPendientesServiciosSolicitados(Convert.ToString(Datos[0]));
        try
        {
            Detalle_Solicitudes_Pendientes_Servicios_Solicitados(sender, e);
        }
        catch (Exception) { }
    }

  

   

    bool Valida_Datos_Detalle(DataTable dt, string _Servicio, string _Modalidad)
    {
        bool ok = false;
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ok = dt.Rows[i]["SERVICIO"].ToString().Trim().Equals(_Servicio);
            ok = ok && dt.Rows[i]["MODALIDAD"].ToString().Trim().Equals(_Modalidad);
            if (ok == true)
                break;
        }
        return ok;
    }

    public DataTable Eliminar_Fila_Tabla_Datos(DataTable dt, int fila)
    {
        DataRow FilaTabla = dt.Rows[fila];//obtenemos la fila de la fuente de datos.
        dt.Rows.Remove(FilaTabla);//eliminamos la fila de la fuente de datos.
        return dt;
    }

    private void ObtenerSolicitudesPendientesServiciosSolicitados(string CodgoPersona)
    {
        for (int i = 1; i < TableDSPSS.Rows.Count; i++)
        {
            for (int j = TableDSPSS.Rows[i].Cells.Count - 1; j >= 0; j--)
            {
                TableDSPSS.Rows[i].Cells.RemoveAt(j);
            }
        }


        string[] ResaltarFilaColor = { "table-info", "table-success", "table-warning", "table-danger" };
        int k = 0;

        for (int i = 1; i < TableSPSS.Rows.Count; i++)
        {
            TableSPSS.Rows[i].Cells.Clear();
        }

        policia.clsaccesodatos servidor = new policia.clsaccesodatos();
        try
        {
            servidor.cadenaconexion = Ruta;
            if (servidor.abrirconexion() == true)
            {
                DataTable dt = servidor.consultar("[dbo].[PaObtenerSolicitudesPendientesServiciosSolicitadosTecnico]"
                    , CodgoPersona).Tables[0];
                if (dt.Rows.Count == 0)
                {
                    servidor.cerrarconexion();
                    //this.__mensaje.Value = "No hay solicitudes pendeientes de servicios solicitados.";
                    //this.__pagina.Value = "";
                    //this.Page.RegisterClientScriptBlock("", "<script> alert('No hay solicitudes pendeientes de servicios solicitados.');</script>");
                    OSPSS = false;
                }
                else
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        tRow = new TableRow();
                        if (k < 4)
                        {
                            tRow.CssClass = ResaltarFilaColor[k];
                        }
                        else
                        {
                            k = 0;
                            tRow.CssClass = ResaltarFilaColor[k];
                        }
                        for (int j = 0; j < 4; j++)//Cabecera de la tabla
                        {
                            TableCell tCell = new TableCell();
                            switch (j)
                            {
                                case 0:
                                    //tCell.Text = dt.Rows[i]["Codigo"].ToString();
                                    //tCell.Visible = true;
                                    //tCell.ForeColor = System.Drawing.Color.Black; /*Esto lo hacemos para ocultar el color de letra que por defecto asigna el framework.*/
                                    //tRow.Cells.Add(tCell);

                                    CheckBox cb = new CheckBox();
                                    cb.ID = "OSPSS" + i.ToString() + j.ToString();
                                    //l.Text = dt.Rows[i]["Codigo"].ToString();
                                    tCell.ForeColor = Color.Black; /*Esto lo hacemos para ocultar el color de letra que por defecto asigna el framework.*/
                                    tCell.Controls.Add(cb);
                                    tRow.Cells.Add(tCell);


                                    break;

                                case 1:
                                    //tCell.Text = dt.Rows[i]["Codigo"].ToString();
                                    //tCell.Visible = true;
                                    //tCell.ForeColor = System.Drawing.Color.Black; /*Esto lo hacemos para ocultar el color de letra que por defecto asigna el framework.*/
                                    //tRow.Cells.Add(tCell);

                                    Label l = new Label();
                                    l.ID = "OSPSS" + i.ToString() + j.ToString();
                                    l.Text = dt.Rows[i]["Codigo"].ToString();
                                    tCell.ForeColor = Color.Black; /*Esto lo hacemos para ocultar el color de letra que por defecto asigna el framework.*/
                                    tCell.Controls.Add(l);
                                    tRow.Cells.Add(tCell);

                                    Button b = new Button();
                                    b.Text = "VER DETALLE";
                                    b.CssClass = "btn btn-info btn-sm btn-block";
                                    b.BorderStyle = BorderStyle.None;
                                    b.CausesValidation = false;
                                    b.UseSubmitBehavior = true;
                                    //b.OnClientClick = "return Confirmar('¿Desea quitar servicio?');";
                                    b.PostBackUrl = "solicitudesTecnico.aspx?CODIGOSOLICTUDSERVICIO=" + dt.Rows[i]["Codigo"].ToString();
                                    b.Click += new System.EventHandler(Detalle_Solicitudes_Pendientes_Servicios_Solicitados);
                                    tCell.HorizontalAlign = HorizontalAlign.Center;
                                    tCell.ForeColor = Color.Black;
                                    tCell.Controls.Add(b);
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 2:
                                    //tCell.Text = dt.Rows[i]["Fecha"].ToString();
                                    //tCell.Visible = true;
                                    //tCell.ForeColor = System.Drawing.Color.Black;
                                    //tRow.Cells.Add(tCell);

                                    l = new Label();
                                    l.ID = "OSPSS" + i.ToString() + j.ToString();
                                    l.Text = dt.Rows[i]["Fecha"].ToString();
                                    tCell.ForeColor = Color.Black; /*Esto lo hacemos para ocultar el color de letra que por defecto asigna el framework.*/
                                    tCell.Controls.Add(l);
                                    tRow.Cells.Add(tCell);

                                    break;

                                case 3:
                                    //tCell.Text = dt.Rows[i]["Estado"].ToString();
                                    //tCell.Visible = true;
                                    //tCell.ForeColor = System.Drawing.Color.Black;
                                    //tRow.Cells.Add(tCell);

                                    l = new Label();
                                    l.ID = "OSPSS" + i.ToString() + j.ToString();
                                    l.Text = dt.Rows[i]["Estado"].ToString();
                                    tCell.ForeColor = Color.Black; /*Esto lo hacemos para ocultar el color de letra que por defecto asigna el framework.*/
                                    tCell.Controls.Add(l);
                                    tRow.Cells.Add(tCell);

                                    break;
                            }
                        }

                        TableSPSS.Rows.Add(tRow);
                        k++;
                    }
                    servidor.cerrarconexion();
                }
            }
            else
            {
                servidor.cerrarconexion();
                _Lista.ShowMessage(__mensaje, __pagina, servidor.getMensageError(), "CerrarSession.aspx");
            }
        }
        catch (Exception e)
        {
            servidor.cerrarconexion();
            _Lista.ShowMessage(__mensaje, __pagina, "Error inesperado al intentar conectarnos con el servidor." + e.Message.ToString()
                , "CerrarSession.aspx");
        }
    }

    protected void Obtener_Detalle_Solicitudes_Pendientes_Servicios_Solicitados(int _Codigo_Solicitud)
    {
        for (int i = 1; i < TableDSPSS.Rows.Count; i++)
        {
            for (int j = TableDSPSS.Rows[i].Cells.Count - 1; j >= 0; j--)
            {
                TableDSPSS.Rows[i].Cells.RemoveAt(j);
            }
        }


        string[] ResaltarFilaColor = { "table-info", "table-success", "table-warning", "table-danger" };
        int k = 0;

        for (int i = 1; i < TableDSPSS.Rows.Count; i++)
        {
            TableDSPSS.Rows[i].Cells.Clear();
        }

        policia.clsaccesodatos servidor = new policia.clsaccesodatos();
        try
        {
            servidor.cadenaconexion = Ruta;
            if (servidor.abrirconexion() == true)
            {
                DataTable dt = servidor.consultar("[dbo].[_pa_obtener_Detalle_Solicitudes_Pendientes_Servicios_Solicitados]", _Codigo_Solicitud).Tables[0];
                if (dt.Rows.Count == 0)
                {
                    servidor.cerrarconexion();
                    _Utilitarios.MensajeValidaciones("Solicitud seleccionada no tiene servicios.", this);
                    //Page.RegisterClientScriptBlock("", "<script> alert('Solicitud seleccionada no tiene servicios.');</script>");
                }
                else
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        tRow = new TableRow();
                        if (k < 4)
                        {
                            tRow.CssClass = ResaltarFilaColor[k];
                        }
                        else
                        {
                            k = 0;
                            tRow.CssClass = ResaltarFilaColor[k];
                        }
                        for (int j = 0; j < 6; j++)//Cabecera de la tabla
                        {
                            TableCell tCell = new TableCell();
                            switch (j)
                            {
                                case 0:
                                    CheckBox cb = new CheckBox();
                                    //l.Text = dt.Rows[i]["Codigo"].ToString();
                                    cb.ID = "ODSPSS" + i.ToString() + j.ToString();
                                    tCell.ForeColor = Color.Black; /*Esto lo hacemos para ocultar el color de letra que por defecto asigna el framework.*/
                                    tCell.Controls.Add(cb);
                                    tCell.Visible = false;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 1:
                                    //tCell.Text = dt.Rows[i]["CODIGO_DETALLE_SOLICITUD"].ToString();
                                    //tCell.Visible = false;
                                    //tCell.ForeColor = System.Drawing.Color.Black; /*Esto lo hacemos para ocultar el color de letra que por defecto asigna el framework.*/
                                    //tRow.Cells.Add(tCell);

                                    Label l = new Label();
                                    l.Text = dt.Rows[i]["CODIGO_DETALLE_SOLICITUD"].ToString();
                                    l.ID = "ODSPSS" + i.ToString() + j.ToString();
                                    tCell.Visible = false;
                                    tCell.ForeColor = Color.Black; /*Esto lo hacemos para ocultar el color de letra que por defecto asigna el framework.*/
                                    tCell.Controls.Add(l);
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 2:
                                    //tCell.Text = dt.Rows[i]["CODIGO_SOLICITUD"].ToString();
                                    //tCell.Visible = false;
                                    //tCell.ForeColor = System.Drawing.Color.Black;
                                    //tRow.Cells.Add(tCell);

                                    l = new Label();
                                    l.Text = dt.Rows[i]["CODIGO_SOLICITUD"].ToString();
                                    l.ID = "ODSPSS" + i.ToString() + j.ToString();
                                    tCell.Visible = false;
                                    tCell.ForeColor = Color.Black; /*Esto lo hacemos para ocultar el color de letra que por defecto asigna el framework.*/
                                    tCell.Controls.Add(l);
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 3:
                                    tCell.Text = dt.Rows[i]["SERVIVIO"].ToString();
                                    tCell.Visible = true;
                                    tCell.ForeColor = Color.Black;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 4:
                                    tCell.Text = dt.Rows[i]["MODALIDAD"].ToString();
                                    tCell.Visible = true;
                                    tCell.ForeColor = Color.Black;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 5:
                                    tCell.Text = dt.Rows[i]["DESCRIPCION"].ToString();
                                    tCell.Visible = true;
                                    tCell.ForeColor = Color.Black;
                                    tRow.Cells.Add(tCell);
                                    break;
                            }
                        }

                        TableDSPSS.Rows.Add(tRow);
                        k++;
                    }
                    servidor.cerrarconexion();
                }
            }
            else
            {
                servidor.cerrarconexion();
                _Utilitarios.MensajeValidacionLink(
                 servidor.getMensageError(), "CerrarSession.aspx", this);

            }
        }
        catch (Exception)
        {
            servidor.cerrarconexion();
            _Utilitarios.MensajeValidacionLink(
                servidor.getMensageError(), "CerrarSession.aspx", this);

        }
    }

    protected void Detalle_Solicitudes_Pendientes_Servicios_Solicitados(object sender, EventArgs e)
    {
        __mensaje.Value = "";
        __pagina.Value = "";

        int CODIGOSOLICTUDSERVICIO = Convert.ToInt32(Request.QueryString.Get("CODIGOSOLICTUDSERVICIO").Trim());

        Obtener_Detalle_Solicitudes_Pendientes_Servicios_Solicitados(CODIGOSOLICTUDSERVICIO);


    }


  
    protected void btnAtenderSolicitudes_Click(object sender, EventArgs e)
    {
        __mensaje.Value = "";
        __pagina.Value = "";

        for (int i = 1; i < TableDSPSS.Rows.Count; i++)
        {
            for (int j = TableDSPSS.Rows[i].Cells.Count - 1; j >= 0; j--)
            {
                TableDSPSS.Rows[i].Cells.RemoveAt(j);
            }
        }

        bool ok = false;
        for (int i = 1; i < TableSPSS.Rows.Count; i++)
        {
            CheckBox cb;
            cb = (CheckBox)TableSPSS.Rows[i].Cells[0].Controls[0];
            if (cb.Checked == true)
            {
                Label l;
                l = (Label)TableSPSS.Rows[i].Cells[1].Controls[0];
                ok = true;
                try
                {
                    policia.clsaccesodatos servidor = new policia.clsaccesodatos();
                    servidor.cadenaconexion = Ruta;
                    if (servidor.abrirconexiontrans() == true)
                    {
                        servidor.ejecutar("[dbo].[_pa_mantenimiento_Solicitud_Servicio]",
                        false,
                        Convert.ToInt32(l.Text),/*Codigo de la solicitud de servicio.*/
                        0,/*Codigo estado solicitud de servicio.*/
                        null,/*Codigo del cliente*/
                        "A",
                        0, "");
                        if (servidor.getRespuesta() == 1)
                        {
                            servidor.cerrarconexiontrans();
                            for (int j = TableSPSS.Rows[i].Cells.Count - 1; j >= 0; j--)
                            {
                                TableSPSS.Rows[i].Cells.RemoveAt(j);
                            }
                            _Utilitarios.MensajeValidaciones(servidor.getMensaje(), this);
                        }
                        else
                        {
                            servidor.cancelarconexiontrans();
                            _Utilitarios.MensajeValidaciones(servidor.getMensaje(), this);
                        }
                    }
                    else
                    {
                        servidor.cancelarconexiontrans();
                        _Utilitarios.MensajeValidacionLink(servidor.getMensageError(), "CerrarSession.aspx", this);
                    }
                }
                catch (Exception ex)
                {
                    _Utilitarios.MensajeValidaciones(ex.Message.ToString(), this);
                }
            }
        }

        if (ok == false)
        {
            _Utilitarios.MensajeValidaciones("Seleccione solicitud por favor.", this);
        }
    }

   

}
 