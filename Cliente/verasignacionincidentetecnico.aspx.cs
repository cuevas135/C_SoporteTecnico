using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;

public partial class Cliente_verasignacionincidentetecnico : System.Web.UI.Page
{
    private String Ruta = System.Configuration.ConfigurationManager.AppSettings.Get("CadenaConeccion");
    policia.clsaccesodatos servidor = new policia.clsaccesodatos();
    System.Web.UI.WebControls.TableRow tRow;
    Lista _Lista = new Lista();

    int CODIGO_USUARIO = 0;

    private void oculta(bool ok)
    {
        this.btnModificar.Visible = ok;
        //this.btnEliminar.Visible = ok;
        //this.btnCancelar.Visible = ok;
    }

    private void verincidenteasignadotecnico(int _ID_USUA)
    {


        this.__mensaje.Value = "";
        this.__pagina.Value = "";
        for (int i = 1; i < this.Tableveraignacionincidentetecnico.Rows.Count; i++)
        {
            this.Tableveraignacionincidentetecnico.Rows[i].Cells.Clear();
        }

        try
        {
            policia.clsaccesodatos servidor = new policia.clsaccesodatos();
            servidor.cadenaconexion = Ruta;
            if (servidor.abrirconexion() == true)
            {
                DataTable dt = servidor.consultar("[dbo].[verincidenteasignadotecnico]", _ID_USUA).Tables[0];
                if (dt.Rows.Count == 0)
                {
                    servidor.cerrarconexion();
                    this.__mensaje.Value = "No hay datos de Incidentes Asignados para Atencion";
                    this.__pagina.Value = "";
                    //this.Nombre.Text = "";
                }
                else
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        tRow = new TableRow();
                        for (int j = 0; j < 12; j++)//Cabecera de la tabla
                        {
                            TableCell tCell = new TableCell();
                            switch (j)
                            {
                                case 0:
                                    tCell.Text = dt.Rows[i]["ID_DETINCI"].ToString();
                                    tCell.Visible = false;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 1:
                                    tCell.Text = dt.Rows[i]["AREA"].ToString();
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 2:
                                    tCell.Text = dt.Rows[i]["NRO TICKET"].ToString();
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 3:
                                    tCell.Text = dt.Rows[i]["INCIDENTE"].ToString();
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 4:
                                    tCell.Text = Convert.ToDateTime(dt.Rows[i]["FECHA ASIGNACION"].ToString()).ToShortDateString();
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 5:
                                    try
                                    {
                                        tCell.Text = Convert.ToDateTime(dt.Rows[i]["FECHA ATENCION"].ToString()).ToShortDateString();
                                    }catch(Exception){
                                        tCell.Text = "";
                                    }

                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 6:
                                    tCell.Text = dt.Rows[i]["COMENTARIO"].ToString();
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 7:
                                    tCell.Text = dt.Rows[i]["ESTADO TICKET"].ToString();
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                               case 8:
                                    System.Web.UI.WebControls.HyperLink hl = new System.Web.UI.WebControls.HyperLink();

                                    string et = dt.Rows[i]["ESTADO TICKET"].ToString();
                                    if (et.Trim() == "EN PRROCESO")
                                    {
                                        //System.Web.UI.WebControls.HyperLink hl = new System.Web.UI.WebControls.HyperLink();
                                        //hl.ImageUrl = "~/imagenes/editar.png";
                                        hl.ForeColor = Color.Blue;
                                        hl.NavigateUrl = "verasignacionincidentetecnico.aspx?Codigo=" + dt.Rows[i]["ID_DETINCI"].ToString() + "&Operacion=M";
                                        hl.Text = "INCIDENTE";
                                        tCell.Controls.Add(hl);
                                        tCell.HorizontalAlign = HorizontalAlign.Center;
                                        tRow.Cells.Add(tCell);
                                    }
                                    else
                                    {
                                        tCell.Text = "";
                                        tRow.Cells.Add(tCell);
                                    }
                                    break;

                               case 9:

                                    et = dt.Rows[i]["ESTADO TICKET"].ToString();
                                    if (et.Trim() != "EN PRROCESO" && et.Trim() != "DETENIDO")
                                    {

                                        hl = new System.Web.UI.WebControls.HyperLink();
                                        hl.ImageUrl = "~/imagenes/ARW02LT.ICO";
                                        hl.Attributes.Add("onclick", "return Confirmar('¿Desea poner el incidente al estado de devuelto?');");
                                        hl.ToolTip = "INCIDENTE";
                                        hl.ForeColor = Color.Blue;
                                        hl.NavigateUrl = "devolverticketincidente.aspx?Codigo=" + dt.Rows[i]["ID_DETINCI"].ToString();
                                        //hl.Text = "INCIDENTE";
                                        tCell.Controls.Add(hl);
                                        tCell.HorizontalAlign = HorizontalAlign.Center;
                                        tRow.Cells.Add(tCell);
                                    }
                                    else
                                    {
                                        tCell.Text = "";
                                        tRow.Cells.Add(tCell);
                                    }
                                    break;

                               case 10:
                                    //et = dt.Rows[i]["ESTADO TICKET"].ToString();
                                    //if (et.Trim() != "EN PRROCESO"){
                                        hl = new System.Web.UI.WebControls.HyperLink();
                                        hl.Attributes.Add("onclick", "return Confirmar('¿Desea poner el incidente al estado en proceso?');");
                                        hl.ToolTip = "INCIDENTE";
                                        hl.ImageUrl = "~/imagenes/ARW02RT.ICO";
                                        hl.ForeColor = Color.Blue;
                                        hl.NavigateUrl = "enprocesoticketincidente.aspx?Codigo=" + dt.Rows[i]["ID_DETINCI"].ToString();
                                        //hl.Text = "INCIDENTE";
                                        tCell.Controls.Add(hl);
                                        tCell.HorizontalAlign = HorizontalAlign.Center;
                                        tRow.Cells.Add(tCell);
                                    //}
                                    //else
                                    //{
                                    //    tCell.Text = "";
                                    //    tRow.Cells.Add(tCell);
                                    //}
                                    break;

                               case 11:
                                    //et = dt.Rows[i]["ESTADO TICKET"].ToString();
                                    //if (et.Trim() != "EN PRROCESO"){
                                    hl = new System.Web.UI.WebControls.HyperLink();
                                    hl.Attributes.Add("onclick", "return Confirmar('¿Desea poner el incidente al estado de detenido?');");
                                    hl.ToolTip = "INCIDENTE";
                                    hl.ImageUrl = "~/imagenes/ARW02DN.ICO";
                                    hl.ForeColor = Color.Blue;
                                    hl.NavigateUrl = "detenerincidente.aspx?Codigo=" + dt.Rows[i]["ID_DETINCI"].ToString();
                                    //hl.Text = "INCIDENTE";
                                    tCell.Controls.Add(hl);
                                    tCell.HorizontalAlign = HorizontalAlign.Center;
                                    tRow.Cells.Add(tCell);
                                    //}
                                    //else
                                    //{
                                    //    tCell.Text = "";
                                    //    tRow.Cells.Add(tCell);
                                    //}
                                    break;


                            }
                        }

                        this.Tableveraignacionincidentetecnico.Rows.Add(tRow);
                    }
                    servidor.cerrarconexion();
                }
            }
            else
            {
                servidor.cerrarconexion();
                this.__mensaje.Value = servidor.getMensageError();
                this.__pagina.Value = "CerrarSession.aspx";
            }

        }
        catch (Exception)
        {
            this.__mensaje.Value = "Error inesperado al intentar conectarnos con el servidor.";
            this.__pagina.Value = "CerrarSession.aspx";
        }
    }

    private void consultarincidenteasignadotecnico(int ID__DETINCI)
    {
        try
        {
            policia.clsaccesodatos servidor = new policia.clsaccesodatos();

            servidor.cadenaconexion = Ruta;

            if (servidor.abrirconexion() == true)
            {


                DataTable dt = servidor.consultar("[dbo].[consultarincidenteasignadotecnico_2]", ID__DETINCI).Tables[0];

                if (dt.Rows.Count == 0)
                {
                    servidor.cerrarconexion();

                    this.__mensaje.Value = "Error, al intentar recuperar datos del Colaborador.";

                    this.__pagina.Value = "CerrarSession.aspx";
                }
                else
                {

                    this.ID_DETINCI.Value = dt.Rows[0]["ID_DETINCI"].ToString().Trim();
                    this._AREA_.Text = dt.Rows[0]["AREA"].ToString().Trim();
                    this._NROTICKET_.Text = dt.Rows[0]["NRO TICKET"].ToString().Trim();
                    this._INCIDENTE_.Text = dt.Rows[0]["INCIDENTE"].ToString().Trim();
                    this._FECHAASIGNACION_.Text = Convert.ToDateTime(dt.Rows[0]["FECHA ASIGNACION"].ToString().Trim()).ToShortDateString();
                    this.FechaAtencion.Text = dt.Rows[0]["FECHA ATENCION"].ToString().Trim();
                    this.COMENTARIO.Text = dt.Rows[0]["COMENTARIO"].ToString().Trim();
                    servidor.cerrarconexion();


                }

            }
            else
            {
                servidor.cerrarconexion();
                this.__mensaje.Value = servidor.getMensageError();
                this.__pagina.Value = "CerrarSession.aspx";
            }

        }
        catch (Exception)
        {
            this.__mensaje.Value = "Error inesperado al intentar conectarnos con el servidor.";
            this.__pagina.Value = "CerrarSession.aspx";
        }
    }

    private void mantenimientodetalleincidente_tecnico(int ID_DETINCI_, string FECHAATENCION_, string COMENTARIO_, string OPERACION_)
    {
        try
        {
            policia.clsaccesodatos servidor = new policia.clsaccesodatos();
            servidor.cadenaconexion = Ruta;
            if (servidor.abrirconexiontrans() == true)
            {
                servidor.ejecutar("[dbo].[mantenimientodetalleincidente_tecnico]",
                                    false,
                                    ID_DETINCI_,
                                    Convert.ToDateTime(FECHAATENCION_.Trim()),
                                    COMENTARIO_.Trim(),
                                    OPERACION_,
                                    0, "");
                if (servidor.getRespuesta() == 1)
                {
                    servidor.cerrarconexiontrans();
                    this.__mensaje.Value = servidor.getMensaje();
                    this.__pagina.Value = "verasignacionincidentetecnico.aspx?Codigo=0&Operacion=C";                    
                }
                else
                {
                    servidor.cancelarconexiontrans();
                    this.__mensaje.Value = servidor.getMensaje();
                    this.__pagina.Value = "";
                    
                }
            }
            else
            {
                servidor.cancelarconexiontrans();
                this.__mensaje.Value = servidor.getMensageError();
                this.__pagina.Value = "CerrarSession.aspx";
            }

        }
        catch (Exception)
        {
            this.__mensaje.Value = "Error inesperado al intentar conectarnos con el servidor.";
            //this.__pagina.Value = "CerrarSession.aspx";
        }
    }

    protected void Page_init(object sender, EventArgs e)
    {
        //=============================================================================================================
        //Verificamos si el usuario ha iniciado sesion.
        this.__mensaje.Value = "";
        this.__pagina.Value = "";
        string[] Datos = (string[])Session["__JSAR__"];
        if (Datos == null)
        {
            this.__mensaje.Value = "Ud. no esta autorizado para ingresar a esta página, inicie sesion por favor.";
            this.__pagina.Value = "../CerrarSession.aspx";
            return;
        }
        //=============================================================================================================

        try
        {
            
            string Opreacion = Request.QueryString.Get("Operacion").Trim();
            OPERACION.Value = Opreacion;

            if (OPERACION.Value.Trim().Equals("M"))
            {
                int ID_DETINCI_ = Convert.ToInt32(Request.QueryString.Get("Codigo").Trim());
                ID_DETINCI.Value = ID_DETINCI_.ToString();
                this.consultarincidenteasignadotecnico(Convert.ToInt32(ID_DETINCI.Value));
            }
            else if (OPERACION.Value.Trim().Equals("C"))
            {
                this.ID_DETINCI.Value = "0";
                this._AREA_.Text = "";
                this._NROTICKET_.Text = "";
                this._INCIDENTE_.Text = "";
                this._FECHAASIGNACION_.Text = "";
                this.FechaAtencion.Text = "";
                this.COMENTARIO.Text = "";
                this.OPERACION.Value = "";
            }
        }
        catch (Exception)
        {
            ID_DETINCI.Value = "0";
            OPERACION.Value = "";
        }

        //CAPTURAMOS EL CODIGO DEL USUARIO QUE INICIO SESION.
        CODIGO_USUARIO = Convert.ToInt32(Datos[0]);

        this.verincidenteasignadotecnico(CODIGO_USUARIO); // codigo tecnico.
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (OPERACION.Value.Trim().Equals("M"))
        {
            this.btnRegistrar.Visible = false;
            this.btnCancelar.Visible = true;
            oculta(true);
        }
    }
    protected void btnRegistrar_Click(object sender, EventArgs e)
    {

    }
    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Redirect("verasignacionincidentetecnico.aspx?Codigo=0&Operacion=C");
        Response.End();
    }
    protected void btnModificar_Click(object sender, EventArgs e)
    {
        this.__mensaje.Value = "";
        this.__pagina.Value = "";
        
        Boolean ok;
        ok = this._AREA_.Text.Trim().Length > 0;
        ok = ok && this._NROTICKET_.Text.Trim().Length > 0;
        ok = ok && this._INCIDENTE_.Text.Trim().Length > 0;
        ok = ok && this._FECHAASIGNACION_.Text.Trim().Length > 0;
        ok = ok && this.FechaAtencion.Text.Trim().Length > 0;
        ok = ok && this.COMENTARIO.Text.Trim().Length > 0;
        ok = ok && this.rfvFechaAtencion.IsValid;
        ok = ok && this.rfvCOMENTARIO.IsValid;
        if (ok == false)
        {
            this.__mensaje.Value = "Seleccione incidente para ingresar fecha de atencion y solucion del incidente.\nFecha de Atencion debe ser mayor a Fecha de Asignacion.";
            this.__pagina.Value = "";
            return;
        }
        try
        {
            ok = ok && Convert.ToDateTime(this.FechaAtencion.Text.Trim()) >= Convert.ToDateTime(this._FECHAASIGNACION_.Text.Trim());
            if (ok == false)
            {
                this.__mensaje.Value = "Seleccione incidente para ingresar fecha de atencion y solucion del incidente.\nFecha de Atencion debe ser mayor a Fecha de Asignacion.";
                this.__pagina.Value = "";
                return;
            }
        }
        catch (Exception)
        {
            this.__mensaje.Value = "Seleccione incidente para ingresar fecha de atencion y solucion del incidente.\nFecha de Atencion debe ser mayor a Fecha de Asignacion.";
            this.__pagina.Value = "";
            return;
        }

        this.mantenimientodetalleincidente_tecnico(Convert.ToInt32(this.ID_DETINCI.Value.ToString().Trim()), this.FechaAtencion.Text.Trim(), this.COMENTARIO.Text.Trim(), "M");

    }
}