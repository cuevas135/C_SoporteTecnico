using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data;

public partial class Cliente_asignaincidentetecnico : System.Web.UI.Page
{
    private String Ruta = System.Configuration.ConfigurationManager.AppSettings.Get("CadenaConeccion");
    policia.clsaccesodatos servidor = new policia.clsaccesodatos();
    Lista _Lista = new Lista();
    System.Data.DataTable dt;
    System.Web.UI.WebControls.TableRow tRow;

    int CODIGO_USUARIO = 0;

    void Busca(System.Web.UI.WebControls.DropDownList control, String strcampo)
    {
        if (dt.Rows.Count == 0) return;

        for (int i = 0; i < control.Items.Count; i++)
        {
            if (control.Items[i].Text.Trim().Equals(dt.Rows[0][strcampo].ToString().Trim()))
            {

                control.SelectedIndex = i;

            }
          
        }
    }

    private void ObtenerTecnico()
    {
        try
        {
            servidor.cadenaconexion = Ruta;
            if (servidor.abrirconexion() == true)
            {
                System.Data.DataTable dt = servidor.consultar("[dbo].[_pr_ObtenerTecnico]").Tables[0];
                if (dt.Rows.Count == 0)
                {
                    servidor.cerrarconexion();
                    _Lista.ShowMessage(__mensaje, __pagina, "Error, al intentar recuperar datos.", "CerrarSession.aspx");
                }
                else
                {
                    this.TECNICO.DataSource = dt;
                    this.TECNICO.DataTextField = "NOMBRE";
                    this.TECNICO.DataValueField = "CODIGO";
                    this.TECNICO.DataBind();
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

    private void oculta(bool ok)
    {
        this.btnModificar.Visible = ok;
        //this.btnEliminar.Visible = ok;
        //this.btnCancelar.Visible = ok;
    }

    private void listarasignaincidentetecnico(int ID_USUARIO)
    {
        this.__mensaje.Value = "";

        this.__pagina.Value = "";

        for (int i = 1; i < this.TableTecnico.Rows.Count; i++)
        {
            this.TableTecnico.Rows[i].Cells.Clear();
        }

        try
        {
            policia.clsaccesodatos servidor = new policia.clsaccesodatos();

            servidor.cadenaconexion = Ruta;

            if (servidor.abrirconexion() == true)
            {
                System.Data.DataTable dt = servidor.consultar("[dbo].[listarasignaincidentetecnico]",
                                    ID_USUARIO).Tables[0];

                if (dt.Rows.Count == 0)
                {
                    servidor.cerrarconexion();

                    ShowMessage("No hay datos Incidente Tecnico para mostrar.", "");
                }
                else
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        tRow = new TableRow();

                        for (int j = 0; j < 7; j++)//Cabecera de la tabla
                        {
                            TableCell tCell = new TableCell();

                            switch (j)
                            {
                                case 0:

                                    System.Web.UI.WebControls.HyperLink hl = new System.Web.UI.WebControls.HyperLink();
                                    hl.ImageUrl = "~/imagenes/editar.png";
                                    hl.ForeColor = Color.Blue;
                                    hl.NavigateUrl = "asignaincidentetecnico.aspx?Codigo=" + dt.Rows[i]["ID"].ToString().Trim() + "&Operacion=M";
                                    hl.Text = "EDITAR";
                                    tCell.Controls.Add(hl);
                                    tCell.HorizontalAlign = HorizontalAlign.Center;
                                    tRow.Cells.Add(tCell);

                                    tRow.Cells.Add(tCell);

                                    break;

                                case 1:

                                    tCell.Text = dt.Rows[i]["NRO TICKET"].ToString().Trim();

                                    tCell.Visible = true;

                                    tRow.Cells.Add(tCell);

                                    break;

                                case 2:

                                    tCell.Text = dt.Rows[i]["FECHA EMISON"].ToString().Trim();

                                    tCell.Visible = true;

                                    tRow.Cells.Add(tCell);

                                    break;

                                case 3:

                                    tCell.Text = dt.Rows[i]["AREA"].ToString().Trim();

                                    tCell.Visible = true;

                                    tRow.Cells.Add(tCell);

                                    break;

                                case 4:

                                    tCell.Text = dt.Rows[i]["INCIDENTE"].ToString();

                                    tCell.Visible = true;

                                    tRow.Cells.Add(tCell);

                                    break;

                                case 5:

                                    tCell.Text = dt.Rows[i]["TECNICO"].ToString();

                                    tCell.Visible = true;

                                    tRow.Cells.Add(tCell);

                                    break;

                                case 6:

                                    tCell.Text = Convert.ToDateTime(dt.Rows[i]["FECHA ASIGNACION"].ToString()).ToShortDateString();

                                    tCell.Visible = true;

                                    tRow.Cells.Add(tCell);

                                    break;


                            }
                        }

                        this.TableTecnico.Rows.Add(tRow);
                    }

                    servidor.cerrarconexion();

                }

            }
            else
            {
                servidor.cerrarconexion();

                ShowMessage(servidor.getMensageError(), "CerrarSessionDocente.aspx");
            }

        }
        catch (Exception)
        {

            ShowMessage("Error inesperado al intentar conectarnos con el servidor.", "CerrarSessionDocente.aspx");
        }
    }

    private void ShowMessage(string msg, string paginaweb)
    {
        this.__mensaje.Value = msg;

        this.__pagina.Value = paginaweb;
    }

    private void mantenimientodetalleincidente(int ID_DETINCI_, string FECHAASIGNACION_, int ID_COL_, string OPERACION_)
    {
        try
        {
            policia.clsaccesodatos servidor = new policia.clsaccesodatos();
            servidor.cadenaconexion = Ruta;
            if (servidor.abrirconexiontrans() == true)
            {
                servidor.ejecutar("[dbo].[mantenimientodetalleincidente]",
                                    false,
                                    ID_DETINCI_,
                                    Convert.ToDateTime(FECHAASIGNACION_.Trim()),
                                    ID_COL_,
                                    OPERACION_,
                                    0, "");
                if (servidor.getRespuesta() == 1)
                {
                    servidor.cerrarconexiontrans();
                    this.__mensaje.Value = servidor.getMensaje();
                    if (OPERACION_.Equals("M") || OPERACION_.Equals("E"))
                    {
                        this.__pagina.Value = "asignaincidentetecnico.aspx?Codigo=" + ID_DETINCI_.ToString() + "&Operacion=N";
                    }
                    else
                    {
                        this.__pagina.Value = "asignaincidentetecnico.aspx?Codigo=" + ID_DETINCI_.ToString() + "&Operacion=" + OPERACION_;
                    }
                }
                else
                {
                    servidor.cancelarconexiontrans();
                    this.__mensaje.Value = servidor.getMensaje();
                    if (OPERACION_.Equals("M") || OPERACION_.Equals("E"))
                    {
                        this.__pagina.Value = "asignaincidentetecnico.aspx?Codigo=" + ID_DETINCI_.ToString() + "&Operacion=N";
                    }
                    else
                    {
                        this.__pagina.Value = "asignaincidentetecnico.aspx?Codigo=" + ID_DETINCI_.ToString() + "&Operacion=" + OPERACION_;
                    }
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

    private void consultarticketincidente(int IDTIKET)
    {
        try
        {
            policia.clsaccesodatos servidor = new policia.clsaccesodatos();

            servidor.cadenaconexion = Ruta;

            if (servidor.abrirconexion() == true)
            {


                DataTable dt = servidor.consultar("[dbo].[consultarticketincidente]", IDTIKET).Tables[0];

                if (dt.Rows.Count == 0)
                {
                    servidor.cerrarconexion();

                    this.__mensaje.Value = "Error, al intentar recuperar datos del Colaborador.";

                    this.__pagina.Value = "CerrarSession.aspx";
                }
                else
                {

                    this._NRO_TICKET.Text = dt.Rows[0]["NRO TICKET"].ToString().Trim();
                    this._FECHAEMISION.Text = dt.Rows[0]["FECHA EMISON"].ToString().Trim();
                    this._AREA_.Text = dt.Rows[0]["AREA"].ToString().Trim();
                    this._INCIDENTE.Text = dt.Rows[0]["INCIDENTE"].ToString().Trim();
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

    private void consultarincidenteasignadotecnico(int IDTIKET)
    {
        try
        {
            policia.clsaccesodatos servidor = new policia.clsaccesodatos();

            servidor.cadenaconexion = Ruta;

            if (servidor.abrirconexion() == true)
            {


                dt = servidor.consultar("[dbo].[consultarincidenteasignadotecnico]", IDTIKET).Tables[0];

                if (dt.Rows.Count == 0)
                {
                    servidor.cerrarconexion();

                    this.__mensaje.Value = "Error, al intentar recuperar datos del Colaborador.";

                    this.__pagina.Value = "CerrarSession.aspx";
                }
                else
                {

                    this.FechaAsignacion.Text = Convert.ToDateTime(dt.Rows[0]["FECHA ASIGNACION"].ToString().Trim()).ToShortDateString();
                    Busca(TECNICO, "TECNICO");
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

        //CAPTURAMOS EL CODIGO DEL USUARIO QUE INICIO SESION.
        CODIGO_USUARIO = Convert.ToInt32(Datos[0]);

        this.listarasignaincidentetecnico(CODIGO_USUARIO);//falta pasar el usuario.
        
        this.ObtenerTecnico();

        int ID_INCIDENTE = Convert.ToInt32(Request.QueryString.Get("Codigo").Trim());
        ID_DETINCI.Value = ID_INCIDENTE.ToString();

        string Opreacion = Request.QueryString.Get("Operacion").Trim();
        OPERACION.Value = Opreacion;

        this.consultarticketincidente(ID_INCIDENTE);

        if (OPERACION.Value.Trim().Equals("M"))
        {
            this.consultarincidenteasignadotecnico(ID_INCIDENTE);
        }

       

    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (OPERACION.Value.Trim().Equals("N"))
        {
            this.btnRegistrar.Visible = true;
            this.btnCancelar.Visible = true;
            oculta(false);
        }
        else
        {
            this.btnRegistrar.Visible = false;
            this.btnCancelar.Visible = true;
            oculta(true);

        }
    }


    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        Boolean ok;
        ok = rfvFechaAsignacion.IsValid; ;
        ok = ok && rvTECNICO.IsValid;
        if (ok == false)
        {
            return;
        }


        mantenimientodetalleincidente(Convert.ToInt32(ID_DETINCI.Value.Trim()),
            Convert.ToString(this.FechaAsignacion.Text.Trim()),
            Convert.ToInt32(this.TECNICO.SelectedValue),
            "N");
    }
    protected void btnModificar_Click(object sender, EventArgs e)
    {
        Boolean ok;
        ok = rfvFechaAsignacion.IsValid; ;
        ok = ok && rvTECNICO.IsValid;
        if (ok == false)
        {
            return;
        }

        DateTime fe = Convert.ToDateTime(Convert.ToDateTime(this._FECHAEMISION.Text.Trim()).ToShortDateString());
        DateTime fa = Convert.ToDateTime(this.FechaAsignacion.Text.Trim());

        //verificamos si la fecha de emision es mayor o igual a la fecha asignacion.
        if (!(fa >= fe))
        {
            this.__mensaje.Value = "Fecha asignacion debe ser mayor igual a Fecha Emision.";
            this.__pagina.Value = "";
            return;
        }

        mantenimientodetalleincidente(Convert.ToInt32(ID_DETINCI.Value.Trim()),
            Convert.ToString(this.FechaAsignacion.Text.Trim()),
            Convert.ToInt32(this.TECNICO.SelectedValue),
            "M");
    }

    protected void btnEliminar_Click(object sender, EventArgs e)
    {
        Boolean ok;
        ok = rfvFechaAsignacion.IsValid; ;
        ok = ok && rvTECNICO.IsValid;
        if (ok == false)
        {
            return;
        }


        mantenimientodetalleincidente(Convert.ToInt32(ID_DETINCI.Value.Trim()),
            Convert.ToString(this.FechaAsignacion.Text.Trim()),
            Convert.ToInt32(this.TECNICO.SelectedValue),
            "E");
    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Response.Redirect("asignaincidentetecnico.aspx?Codigo=" + ID_DETINCI.Value + "&Operacion=N");
    }

   
}