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

public partial class Clientes_solicitudservicio : Page
{

    private String Ruta = ConfigurationManager.AppSettings.Get("CadenaConeccion");
    TableRow tRow;
    Lista _Lista = new Lista();
    //CsSignal _CsSignal = new CsSignal();
    bool OSPSS = true;
    string EnviarNotificacion = "NO";

    public void MensajeValidaciones(string Message)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("<script type = 'text/javascript'>");
        sb.Append("alert('");
        sb.Append(Message + "');");
        sb.Append("</script>");
        ScriptManager.RegisterStartupScript(this, GetType(), "alert", string.Format("alert('{0}');", Message), true);
    }

    private void ObtenerSolicitudes()
    {
        policia.clsaccesodatos servidor = new policia.clsaccesodatos();
        try
        {
            servidor.cadenaconexion = Ruta;
            if (servidor.abrirconexion() == true)
            {
                DataTable dt = servidor.consultar("[dbo].[_pa_obtener_servcios]").Tables[0];
                if (dt.Rows.Count == 0)
                {
                    servidor.cerrarconexion();
                    __mensaje.Value = "No hay servcios.";
                    __pagina.Value = "";
                }
                else
                {
                    Servicios.DataSource = dt;
                    Servicios.DataTextField = "Nombre";
                    Servicios.DataValueField = "Codigo";
                    Servicios.DataBind();
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
    }


    private void ObtenerModalidades(int Codigo_Servicio)
    {
        policia.clsaccesodatos servidor = new policia.clsaccesodatos();
        try
        {
            servidor.cadenaconexion = Ruta;
            if (servidor.abrirconexion() == true)
            {
                DataTable dt = servidor.consultar("[dbo].[_pa_obtener_modalidades]", Codigo_Servicio).Tables[0];
                if (dt.Rows.Count == 0)
                {
                    servidor.cerrarconexion();
                    __mensaje.Value = "No hay modalidades.";
                    __pagina.Value = "";
                }
                else
                {
                    Modalidades.DataSource = dt;
                    Modalidades.DataTextField = "Nombre";
                    Modalidades.DataValueField = "Codigo";
                    Modalidades.DataBind();
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
    }


    private String ObtenerFechaSistema()
    {
        String Fecha = "";
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
        btnGenerarSolicitud_Click(sender, e);

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

        lblUsuario.Text = " [USUARIO: " + Convert.ToString(Datos[1]) + "]";

        //CAPTURAMOS EL CODIGO DEL USUARIO QUE INICIO SESION.
        CodigoPersona_S.Text = Convert.ToString(Datos[0]);

        //CAPTURAMOS EL NOMBRE DEL USUARIO QUE INICIO SESION.
        Nombre_P.Text = Convert.ToString(Datos[1]);

        ObtenerSolicitudes();

        Fecha_S.Text = ObtenerFechaSistema();

        //Inicialmente empezamos por crear la cabecera de la tabla.
        if (Session["Tabla"] == null)//Preguntamos si la sesion tiene informacion.
        {
            Session["Tabla"] = _Lista.Crear_Cabecera_Grilla("CODIGOSERVICIO", "SERVICIO", "CODIGOMODALIDAD", "MODALIDAD");
        }
        //this.gvDetalleSokicitud.DataSource = (DataTable)Session["Tabla"];
        //this.gvDetalleSokicitud.DataBind();

        ////ocultamos columnas
        //if (((DataTable)Session["Tabla"]).Rows[((DataTable)Session["Tabla"]).Rows.Count - 1].ItemArray[0].ToString() != ""){
        //    this.gvDetalleSokicitud.Columns[4].Visible = true;
        //    this.gvDetalleSokicitud.Columns[5].Visible = true;
        //}else{
        //    this.gvDetalleSokicitud.Columns[4].Visible = false;
        //    this.gvDetalleSokicitud.Columns[5].Visible = false;
        //}

        ActualizaDetalleSolicitud((DataTable)Session["Tabla"]);

        try
        {
            /*Eliminamos la primera fila que es agregada por defecto.*/
            if (Table_.Rows[1].Cells[0].Text.Trim() == "")
            {
                Table_.Rows[1].Cells.Clear();
            }
        }
        catch (Exception) { }


        ObtenerSolicitudesPendientesServiciosSolicitados(Convert.ToString(Datos[0]));

        try
        {
            Detalle_Solicitudes_Pendientes_Servicios_Solicitados(sender, e);
        }
        catch (Exception) { }




    }
    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        __mensaje.Value = "";
        __pagina.Value = "";

        //Validamos datos
        if (Convert.ToInt32(Servicios.Items[Servicios.SelectedIndex].Value) == -1)
        {
            __mensaje.Value = "Seleccione servicio.";
            __pagina.Value = "";
            Servicios.Focus();
            return;
        }

        if (Convert.ToInt32(Modalidades.Items[Modalidades.SelectedIndex].Value) == -1)
        {
            __mensaje.Value = "Seleccione modalidad.";
            __pagina.Value = "";
            Modalidades.Focus();
            return;
        }

        DataTable dt = (DataTable)Session["Tabla"];

        if (Valida_Datos_Detalle((DataTable)Session["Tabla"], Servicios.Items[Servicios.SelectedIndex].Text, Modalidades.Items[Modalidades.SelectedIndex].Text) == true)
        {
            __mensaje.Value = "Servicio y modalidad ya existen.";
            __pagina.Value = "";
            return;
        }

        try
        {
            if (dt.Rows[0].ItemArray[0].ToString() == "")
            {
                dt.Rows[0].Delete();
            }
        }
        catch (Exception) { }

        dt.Rows.Add(Servicios.SelectedValue,
               Servicios.Items[Servicios.SelectedIndex].Text,
               Modalidades.SelectedValue,
               Modalidades.Items[Modalidades.SelectedIndex].Text
               );

        Session["Tabla"] = dt;

        Response.Clear();
        Response.Redirect("solicitudservicio.aspx");
        Response.Flush();
        btnEnviarSolicitudServicio.Focus();
    }

    protected void Servicios_SelectedIndexChanged(object sender, EventArgs e)
    {
        __mensaje.Value = "";
        __pagina.Value = "";
        ObtenerModalidades(Convert.ToInt32(Servicios.SelectedValue));
        Modalidades.Focus();
    }


    private void ActualizaDetalleSolicitud(DataTable dt)
    {
        String[] ResaltarFilaColor = { "active", "success", "warning", "danger" };
        int k = 0;

        for (int i = 1; i < Table_.Rows.Count; i++)
        {
            Table_.Rows[i].Cells.Clear();
        }

        if (dt.Rows.Count == 0)
        {
            ;
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
                for (int j = 0; j < 5; j++)//Cabecera de la tabla
                {
                    TableCell tCell = new TableCell();
                    switch (j)
                    {
                        case 0:
                            tCell.Text = dt.Rows[i]["CODIGOSERVICIO"].ToString();
                            tCell.Visible = false;
                            tCell.ForeColor = Color.Black; /*Esto lo hacemos para ocultar el color de letra que por defecto asigna el framework.*/
                            tRow.Cells.Add(tCell);
                            break;

                        case 1:
                            tCell.Text = dt.Rows[i]["SERVICIO"].ToString();
                            tCell.Visible = true;
                            tCell.ForeColor = Color.Black;
                            tRow.Cells.Add(tCell);
                            break;

                        case 2:
                            tCell.Text = dt.Rows[i]["CODIGOMODALIDAD"].ToString();
                            tCell.Visible = false;
                            tCell.ForeColor = Color.Black;
                            tRow.Cells.Add(tCell);
                            break;

                        case 3:
                            tCell.Text = dt.Rows[i]["MODALIDAD"].ToString();
                            tCell.Visible = true;
                            tCell.ForeColor = Color.Black;
                            tRow.Cells.Add(tCell);
                            break;

                        case 4:
                            Button b = new Button();
                            b.Text = "QUITAR";
                            b.CssClass = "btn btn-danger btn-sm btn-block";
                            b.BorderStyle = BorderStyle.None;
                            b.CausesValidation = false;
                            b.UseSubmitBehavior = true;
                            //b.OnClientClick = "return Confirmar('¿Desea quitar servicio?');";
                            b.PostBackUrl = "solicitudservicio.aspx?FILA=" + i.ToString();
                            b.Click += new EventHandler(Quitar_Servicio);
                            tCell.HorizontalAlign = HorizontalAlign.Center;
                            tCell.ForeColor = Color.Black;
                            tCell.Controls.Add(b);
                            tRow.Cells.Add(tCell);
                            break;
                    }
                }

                Table_.Rows.Add(tRow);
                k++;
            }

        }

    }


    bool Valida_Datos_Detalle(DataTable dt, String _Servicio, String _Modalidad)
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

    protected void Quitar_Servicio(object sender, EventArgs e)
    {
        int fila = Convert.ToInt32(Request.QueryString.Get("FILA").Trim());
        Session["Tabla"] = _Lista.Eliminar_Fila_Tabla_Datos((DataTable)Session["Tabla"], fila);//actualizamos sesion.
        if (((DataTable)Session["Tabla"]).Rows.Count == 0)//preguntamos si hay filas.
        {
            Session["Tabla"] = null;//anulamos sesion
        }
        Response.Clear();
        Response.Redirect("solicitudservicio.aspx");
        Response.Flush();

    }


    private void ObtenerSolicitudesPendientesServiciosSolicitados(String CodgoPersona)
    {
        for (int i = 1; i < TableDSPSS.Rows.Count; i++)
        {
            for (int j = TableDSPSS.Rows[i].Cells.Count - 1; j >= 0; j--)
            {
                TableDSPSS.Rows[i].Cells.RemoveAt(j);
            }
        }


        String[] ResaltarFilaColor = { "active", "success", "warning", "danger" };
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
                DataTable dt = servidor.consultar("[dbo].[_pa_obtener_Solicitudes_Pendientes_Servicios_Solicitados]", CodgoPersona).Tables[0];
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
                                    b.PostBackUrl = "solicitudservicio.aspx?CODIGOSOLICTUDSERVICIO=" + dt.Rows[i]["Codigo"].ToString();
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
        catch (Exception)
        {
            servidor.cerrarconexion();
            _Lista.ShowMessage(__mensaje, __pagina, "Error inesperado al intentar conectarnos con el servidor.", "CerrarSession.aspx");
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


        String[] ResaltarFilaColor = { "active", "success", "warning", "danger" };
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
                    MensajeValidaciones("Solicitud seleccionada no tiene servicios.");
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
                        for (int j = 0; j < 5; j++)//Cabecera de la tabla
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
                Page.RegisterClientScriptBlock("", "<script> alert('" + servidor.getMensageError() + "'); location.href = 'CerrarSession.aspx';</script>");
            }
        }
        catch (Exception)
        {
            servidor.cerrarconexion();
            Page.RegisterClientScriptBlock("", "<script> alert('Error inesperado al intentar conectarnos con el servidor.'); location.href = 'CerrarSession.aspx';</script>");
        }
    }

    protected void Detalle_Solicitudes_Pendientes_Servicios_Solicitados(object sender, EventArgs e)
    {
        __mensaje.Value = "";
        __pagina.Value = "";

        int CODIGOSOLICTUDSERVICIO = Convert.ToInt32(Request.QueryString.Get("CODIGOSOLICTUDSERVICIO").Trim());

        Obtener_Detalle_Solicitudes_Pendientes_Servicios_Solicitados(CODIGOSOLICTUDSERVICIO);

        //String[] ResaltarFilaColor = { "active", "success", "warning", "danger" };
        //int k = 0;

        //for (int i = 1; i < this.TableDSPSS.Rows.Count; i++)
        //{
        //    this.TableDSPSS.Rows[i].Cells.Clear();
        //}

        //policia.clsaccesodatos servidor = new policia.clsaccesodatos();
        //try
        //{
        //    servidor.cadenaconexion = Ruta;
        //    if (servidor.abrirconexion() == true)
        //    {
        //        System.Data.DataTable dt = servidor.consultar("[dbo].[_pa_obtener_Detalle_Solicitudes_Pendientes_Servicios_Solicitados]", CODIGOSOLICTUDSERVICIO).Tables[0];
        //        if (dt.Rows.Count == 0)
        //        {
        //            servidor.cerrarconexion();
        //            this.Page.RegisterClientScriptBlock("", "<script> alert('Solicitud seleccionada no tiene servicios.');</script>");
        //        }
        //        else
        //        {
        //            for (int i = 0; i < dt.Rows.Count; i++)
        //            {
        //                tRow = new TableRow();
        //                if (k < 4)
        //                {
        //                    tRow.CssClass = ResaltarFilaColor[k];
        //                }
        //                else
        //                {
        //                    k = 0;
        //                    tRow.CssClass = ResaltarFilaColor[k];
        //                }
        //                for (int j = 0; j < 5; j++)//Cabecera de la tabla
        //                {
        //                    TableCell tCell = new TableCell();
        //                    switch (j)
        //                    {
        //                        case 0:
        //                            System.Web.UI.WebControls.CheckBox cb = new System.Web.UI.WebControls.CheckBox();
        //                            //l.Text = dt.Rows[i]["Codigo"].ToString();
        //                            tCell.ForeColor = System.Drawing.Color.Black; /*Esto lo hacemos para ocultar el color de letra que por defecto asigna el framework.*/
        //                            tCell.Controls.Add(cb);
        //                            tRow.Cells.Add(tCell);
        //                            break;

        //                        case 1:
        //                            //tCell.Text = dt.Rows[i]["CODIGO_DETALLE_SOLICITUD"].ToString();
        //                            //tCell.Visible = false;
        //                            //tCell.ForeColor = System.Drawing.Color.Black; /*Esto lo hacemos para ocultar el color de letra que por defecto asigna el framework.*/
        //                            //tRow.Cells.Add(tCell);

        //                            System.Web.UI.WebControls.Label l = new System.Web.UI.WebControls.Label();
        //                            l.Text = dt.Rows[i]["CODIGO_DETALLE_SOLICITUD"].ToString();
        //                            tCell.Visible = false;
        //                            tCell.ForeColor = System.Drawing.Color.Black; /*Esto lo hacemos para ocultar el color de letra que por defecto asigna el framework.*/
        //                            tCell.Controls.Add(l);
        //                            tRow.Cells.Add(tCell);
        //                            break;

        //                        case 2:
        //                            //tCell.Text = dt.Rows[i]["CODIGO_SOLICITUD"].ToString();
        //                            //tCell.Visible = false;
        //                            //tCell.ForeColor = System.Drawing.Color.Black;
        //                            //tRow.Cells.Add(tCell);

        //                            l = new System.Web.UI.WebControls.Label();
        //                            l.Text = dt.Rows[i]["CODIGO_SOLICITUD"].ToString();
        //                            tCell.Visible = false;
        //                            tCell.ForeColor = System.Drawing.Color.Black; /*Esto lo hacemos para ocultar el color de letra que por defecto asigna el framework.*/
        //                            tCell.Controls.Add(l);
        //                            tRow.Cells.Add(tCell);
        //                            break;

        //                        case 3:
        //                            tCell.Text = dt.Rows[i]["SERVIVIO"].ToString();
        //                            tCell.Visible = true;
        //                            tCell.ForeColor = System.Drawing.Color.Black;
        //                            tRow.Cells.Add(tCell);
        //                            break;

        //                        case 4:
        //                            tCell.Text = dt.Rows[i]["MODALIDAD"].ToString();
        //                            tCell.Visible = true;
        //                            tCell.ForeColor = System.Drawing.Color.Black;
        //                            tRow.Cells.Add(tCell);
        //                            break;                               
        //                    }
        //                }

        //                this.TableDSPSS.Rows.Add(tRow);
        //                k++;
        //            }
        //            servidor.cerrarconexion();
        //        }
        //    }
        //    else
        //    {
        //        servidor.cerrarconexion();
        //        this.Page.RegisterClientScriptBlock("", "<script> alert('" + servidor.getMensageError() + "'); location.href = 'CerrarSession.aspx';</script>");
        //    }
        //}
        //catch (Exception)
        //{
        //    servidor.cerrarconexion();
        //    this.Page.RegisterClientScriptBlock("", "<script> alert('Error inesperado al intentar conectarnos con el servidor.'); location.href = 'CerrarSession.aspx';</script>");           
        //}

    }

    protected void btnEnviarSolicitudServicio_Click(object sender, EventArgs e)
    {

        DataTable dt = (DataTable)Session["Tabla"];
        try
        {
            if (dt.Rows[0].ItemArray[0].ToString() == "")
            {
                dt.Rows[0].Delete();
            }
        }
        catch (Exception) { }
        int Filas = dt.Rows.Count;
        if (Filas == 0)
        {
            __mensaje.Value = "No hay servicio(s) para enviar.";
            __pagina.Value = "";
            return;
        }

        try
        {
            policia.clsaccesodatos servidor = new policia.clsaccesodatos();
            servidor.cadenaconexion = Ruta;
            if (servidor.abrirconexiontrans() == true)
            {
                servidor.ejecutar("[dbo].[_pa_mantenimiento_Solicitud_Servicio]",
                false,
                0,/*Codigo de la solicitud de servicio.*/
                0,/*Codigo estado solicitud de servicio.*/
                CodigoPersona_S.Text.Trim(),/*Codigo del cliente*/
                "N",
                0, "");
                int ID_CODIGO_SOLICITUD_SERVCIO = servidor.getRespuesta();
                if (ID_CODIGO_SOLICITUD_SERVCIO > 0)
                {
                    String Mensage = "";
                    /*Verificar si existen solicitudes para el mismo servicio en la misma fecha*/
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        servidor.ejecutar("[dbo].[_pa_verificar_Existencia_Solicitud_Servicio_Fecha_Actual]",
                                                             false,
                                                             CodigoPersona_S.Text.Trim(),/*Codigo del cliente*/
                                                             Convert.ToInt32(dt.Rows[i]["CODIGOMODALIDAD"].ToString().Trim()),/*Codigo de la modalidad del servcio*/
                                                             0, "");
                        if (servidor.getRespuesta() == 1)
                        {
                            Mensage += (i + 1).ToString() + ") " + dt.Rows[i]["SERVICIO"].ToString() + " DE UNA " + dt.Rows[i]["MODALIDAD"].ToString() + ".\n";
                        }
                    }
                    if (Mensage.Trim() != "")
                    {
                        servidor.cancelarconexiontrans();
                        Mensage = "Ud. hasta el " + Convert.ToDateTime(ObtenerFechaSistema()).ToShortDateString() + " tiene solicitudes pendientes por los siguientes servicios:" + "\n" + Mensage;
                        _Lista.ShowMessage(__mensaje, __pagina, Mensage, "");
                        return;
                    }

                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        servidor.ejecutar("[dbo].[_pa_mantenimiento_Detalle_Solicitud_Servicio]",
                                            false,
                                            0,/*Codigo detalle solicitud de servicio*/
                                            ID_CODIGO_SOLICITUD_SERVCIO,/*Codigo solicitud de servcio*/
                                            Convert.ToInt32(dt.Rows[i]["CODIGOMODALIDAD"].ToString().Trim()),/*Codigo de la modalidad del servcio*/
                                            "N",
                                            0, "");

                    }
                    if (servidor.getRespuesta() == 1)
                    {
                        ////=====================================================
                        ////ENVIAR NOTIFICACIONES A LOS ADMINISTRADORES
                        //_CsSignal.EnviarNotificacionAdministrador();
                        ////=====================================================

                        servidor.cerrarconexiontrans();
                        Session["Tabla"] = null;
                        _Lista.ShowMessage(__mensaje, __pagina, servidor.getMensaje(), "solicitudservicio.aspx?EnviarNotificacion=SI");
                    }
                    else
                    {
                        servidor.cancelarconexiontrans();
                        _Lista.ShowMessage(__mensaje, __pagina, servidor.getMensaje(), "");
                    }

                }
                else
                {
                    servidor.cancelarconexiontrans();
                    _Lista.ShowMessage(__mensaje, __pagina, servidor.getMensaje(), "");
                }

            }
            else
            {
                servidor.cancelarconexiontrans();
                _Lista.ShowMessage(__mensaje, __pagina, servidor.getMensageError(), "CerrarSession.aspx");
            }
        }
        catch (Exception ex)
        {

            _Lista.ShowMessage(__mensaje, __pagina, ex.Message.ToString()
                + " Error inesperado al intentar conectarnos con el servidor.", "");
        }

    }

    protected void btnGenerarSolicitud_Click(object sender, EventArgs e)
    {
        __mensaje.Value = "";
        __pagina.Value = "";

        PANEL_GENERAR_SOLCITUD.Visible = true;
        PANEL_CANCELAR_SOLCITUD.Visible = false;


    }

    protected void btnCancelarSolicitud_Click(object sender, EventArgs e)
    {
        __mensaje.Value = "";
        __pagina.Value = "";

        Session["Tabla"] = null;

        PANEL_GENERAR_SOLCITUD.Visible = false;
        PANEL_CANCELAR_SOLCITUD.Visible = true;

        if (OSPSS == false)
            Page.RegisterClientScriptBlock("", "<script> alert('No hay solicitudes pendeientes de servicios solicitados.');</script>");

    }

    protected void btnEliminarSolicitud_Click(object sender, EventArgs e)
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
                        "E",
                        0, "");
                        if (servidor.getRespuesta() == 1)
                        {
                            servidor.cerrarconexiontrans();
                            for (int j = TableSPSS.Rows[i].Cells.Count - 1; j >= 0; j--)
                            {
                                TableSPSS.Rows[i].Cells.RemoveAt(j);
                            }
                            Page.RegisterClientScriptBlock("", "<script> alert('" + servidor.getMensaje() + "');</script>");
                        }
                        else
                        {
                            servidor.cancelarconexiontrans();
                            Page.RegisterClientScriptBlock("", "<script> alert('" + servidor.getMensaje() + "');</script>");
                        }
                    }
                    else
                    {
                        servidor.cancelarconexiontrans();
                        Page.RegisterClientScriptBlock("", "<script> alert('" + servidor.getMensageError() + "'); location.href = 'CerrarSession.aspx';</script>");
                    }
                }
                catch (Exception)
                {
                    Page.RegisterClientScriptBlock("", "<script> alert('Error inesperado al intentar conectarnos con el servidor.'); location.href = 'CerrarSession.aspx';</script>");
                }
            }
        }

        if (ok == false)
        {
            Page.RegisterClientScriptBlock("", "<script> alert('Seleccione solicitud por favor.');</script>");
        }
    }

    protected void btnCancelarSolicitudes_Click(object sender, EventArgs e)
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
                        "M",
                        0, "");
                        if (servidor.getRespuesta() == 1)
                        {
                            servidor.cerrarconexiontrans();
                            for (int j = TableSPSS.Rows[i].Cells.Count - 1; j >= 0; j--)
                            {
                                TableSPSS.Rows[i].Cells.RemoveAt(j);
                            }
                            Page.RegisterClientScriptBlock("", "<script> alert('" + servidor.getMensaje() + "');</script>");
                        }
                        else
                        {
                            servidor.cancelarconexiontrans();
                            Page.RegisterClientScriptBlock("", "<script> alert('" + servidor.getMensaje() + "');</script>");
                        }
                    }
                    else
                    {
                        servidor.cancelarconexiontrans();
                        Page.RegisterClientScriptBlock("", "<script> alert('" + servidor.getMensageError() + "'); location.href = 'CerrarSession.aspx';</script>");
                    }
                }
                catch (Exception)
                {
                    Page.RegisterClientScriptBlock("", "<script> alert('Error inesperado al intentar conectarnos con el servidor.'); location.href = 'CerrarSession.aspx';</script>");
                }
            }
        }

        if (ok == false)
        {
            Page.RegisterClientScriptBlock("", "<script> alert('Seleccione solicitud por favor.');</script>");
        }
    }

    protected void btnEliminarDetalleSolicitud_Click(object sender, EventArgs e)
    {
        //Detalle_Solicitudes_Pendientes_Servicios_Solicitados(sender, e);

        //String rpta = "";
        //for (int i = 1; i < this.TableDSPSS.Rows.Count; i++)
        //{
        //    System.Web.UI.WebControls.CheckBox cb;
        //    cb = (System.Web.UI.WebControls.CheckBox)this.TableDSPSS.Rows[i].Cells[0].Controls[0];
        //    if (cb.Checked == true)
        //    {
        //        System.Web.UI.WebControls.Label ds;//codigo detalle solicitud
        //        ds = (System.Web.UI.WebControls.Label)this.TableDSPSS.Rows[i].Cells[1].Controls[0];

        //        rpta += ds.Text;
        //    }
        //}



        //this.Page.RegisterClientScriptBlock("", "<script> alert('" + rpta + "');</script>");

        __mensaje.Value = "";
        __pagina.Value = "";

        bool ok = false;

        try
        {
            int i = TableDSPSS.Rows.Count - 1;
            while (i > 0 && i < TableDSPSS.Rows.Count)
            {
                CheckBox cb;
                cb = (CheckBox)TableDSPSS.Rows[i].Cells[0].Controls[0];
                if (cb.Checked == true)
                {
                    Label ds;//codigo detalle solicitud
                    ds = (Label)TableDSPSS.Rows[i].Cells[1].Controls[0];

                    Label cs;//codigo solicitud
                    cs = (Label)TableDSPSS.Rows[i].Cells[2].Controls[0];
                    ok = true;
                    try
                    {
                        policia.clsaccesodatos servidor = new policia.clsaccesodatos();
                        servidor.cadenaconexion = Ruta;
                        if (servidor.abrirconexiontrans() == true)
                        {
                            servidor.ejecutar("[dbo].[_pa_mantenimiento_Detalle_Solicitud_Servicio]",
                            false,
                            Convert.ToInt32(ds.Text),/*Codigo de la solicitud de servicio.*/
                            Convert.ToInt32(cs.Text),/*Codigo solicitud de servicio.*/
                            null,/*Codigo modalidad*/
                            "E",
                            0, "");
                            if (servidor.getRespuesta() == 1)
                            {
                                servidor.cerrarconexiontrans();
                                for (int j = TableDSPSS.Rows[i].Cells.Count - 1; j >= 0; j--)
                                {
                                    TableDSPSS.Rows[i].Cells.RemoveAt(j);
                                }
                                Page.RegisterClientScriptBlock("", "<script> alert('" + servidor.getMensaje() + "');</script>");
                            }
                            else
                            {
                                servidor.cancelarconexiontrans();
                                Page.RegisterClientScriptBlock("", "<script> alert('" + servidor.getMensaje() + "');</script>");
                            }
                        }
                        else
                        {
                            servidor.cancelarconexiontrans();
                            Page.RegisterClientScriptBlock("", "<script> alert('" + servidor.getMensageError() + "'); location.href = 'CerrarSession.aspx';</script>");
                        }
                    }
                    catch (Exception)
                    {
                        Page.RegisterClientScriptBlock("", "<script> alert('Error inesperado al intentar conectarnos con el servidor.'); location.href = 'CerrarSession.aspx';</script>");
                    }

                }
                i = i - 1;
            }
            ObtenerSolicitudesPendientesServiciosSolicitados(CodigoPersona_S.Text.Trim());
        }
        catch (Exception) {; }


        try
        {
            int CODIGOSOLICTUDSERVICIO = Convert.ToInt32(Request.QueryString.Get("CODIGOSOLICTUDSERVICIO").Trim());
            Obtener_Detalle_Solicitudes_Pendientes_Servicios_Solicitados(CODIGOSOLICTUDSERVICIO);
        }
        catch (Exception) {; }

        if (ok == false)
        {
            Page.RegisterClientScriptBlock("", "<script> alert('Seleccione detalle(s).');</script>");
        }


    }


}