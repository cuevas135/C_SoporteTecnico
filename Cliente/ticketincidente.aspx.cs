using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cliente_ticketincidente : System.Web.UI.Page
{

    private String Ruta = System.Configuration.ConfigurationManager.AppSettings.Get("CadenaConeccion");
    policia.clsaccesodatos servidor = new policia.clsaccesodatos();
    Lista _Lista = new Lista();
    System.Data.DataTable dt;

    void Busca(System.Web.UI.WebControls.DropDownList control, String strcampo)
    {
        if (dt.Rows.Count == 0) return;

        for (int i = 0; i < control.Items.Count; i++)
        {
            if (control.Items[i].Text.Trim().Equals(dt.Rows[0][strcampo].ToString()))
            {

                control.SelectedIndex = i;

            }
        }
    }

    private void consultarticketincidente(int CodigoTicket)
    {
        try
        {
            policia.clsaccesodatos servidor = new policia.clsaccesodatos();

            servidor.cadenaconexion = Ruta;

            if (servidor.abrirconexion() == true)
            {

                dt = servidor.consultar("[dbo].[consultarticketincidente]", CodigoTicket).Tables[0];

                    if (dt.Rows.Count == 0)
                    {
                        servidor.cerrarconexion();

                        this.__mensaje.Value = "Error, al intentar recuperar datos de Ticket Incidente.";

                        this.__pagina.Value = "CerrarSession.aspx";
                    }
                    else
                    {

                        this.btnAceptar.OnClientClick = "return Confirmar('¿Desea modificar los datos de Ticket Incidente?');";

                        this.ID_TIKET.Value = dt.Rows[0]["IDTIKET"].ToString();

                        this.ID_INCI.Value = this.ID_TIKET.Value;

                        this.NRO_TICKET.Text = dt.Rows[0]["NRO TICKET"].ToString().Trim();

                        this.ID_USUA.Value = dt.Rows[0]["IDUSUARIO"].ToString();

                        //this.NOMBRES.Text = dt.Rows[0]["COLABORADOR"].ToString().Trim();

                        this.FECHAEMISON.Text = dt.Rows[0]["FECHA EMISON"].ToString().Trim();

                        Busca(CANAL, "CANAL");

                        Busca(AREA, "AREA");

                        this.DESCRIPCION.Text = dt.Rows[0]["INCIDENTE"].ToString().Trim();

                        Busca(PRIORIDAD, "PRIORIDAD");

                        Busca(IMPACTO, "IMPACTO");

                        //this.FIJO.Text = dt.Rows[0]["ESTADO TICKET"].ToString().Trim();

                    }
       
                servidor.cerrarconexion();

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

    private void ObtenerImpacto()
    {
        try
        {
            servidor.cadenaconexion = Ruta;
            if (servidor.abrirconexion() == true)
            {
                System.Data.DataTable dt = servidor.consultar("[dbo].[_pr_ObtenerImpacto]").Tables[0];
                if (dt.Rows.Count == 0)
                {
                    servidor.cerrarconexion();
                    _Lista.ShowMessage(__mensaje, __pagina, "Error, al intentar recuperar datos.", "CerrarSession.aspx");
                }
                else
                {
                    this.IMPACTO.DataSource = dt;
                    this.IMPACTO.DataTextField = "NOMBRE";
                    this.IMPACTO.DataValueField = "CODIGO";
                    this.IMPACTO.DataBind();
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

    private void ObtenerPrioridad()
    {
        try
        {
            servidor.cadenaconexion = Ruta;
            if (servidor.abrirconexion() == true)
            {
                System.Data.DataTable dt = servidor.consultar("[dbo].[_pr_ObtenerPrioridad]").Tables[0];
                if (dt.Rows.Count == 0)
                {
                    servidor.cerrarconexion();
                    _Lista.ShowMessage(__mensaje, __pagina, "Error, al intentar recuperar datos.", "CerrarSession.aspx");
                }
                else
                {
                    this.PRIORIDAD.DataSource = dt;
                    this.PRIORIDAD.DataTextField = "NOMBRE";
                    this.PRIORIDAD.DataValueField = "CODIGO";
                    this.PRIORIDAD.DataBind();
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

    private void ObtenerArea()
    {
        try
        {
            servidor.cadenaconexion = Ruta;
            if (servidor.abrirconexion() == true)
            {
                System.Data.DataTable dt = servidor.consultar("[dbo].[_pr_ObtenerArea]").Tables[0];
                if (dt.Rows.Count == 0)
                {
                    servidor.cerrarconexion();
                    _Lista.ShowMessage(__mensaje, __pagina, "Error, al intentar recuperar datos.", "CerrarSession.aspx");
                }
                else
                {
                    this.AREA.DataSource = dt;
                    this.AREA.DataTextField = "NOMBRE";
                    this.AREA.DataValueField = "CODIGO";
                    this.AREA.DataBind();
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

    private String obtenernumeroticketincidente()
    {
        String numero = "";
        try
        {
            servidor.cadenaconexion = Ruta;
            if (servidor.abrirconexion() == true)
            {
                System.Data.DataTable dt = servidor.consultar("[dbo].[obtenernumeroticketincidente]").Tables[0];
                if (dt.Rows.Count == 0)
                {
                    servidor.cerrarconexion();
                    _Lista.ShowMessage(__mensaje, __pagina, "Error, al intentar recuperar datos.", "CerrarSession.aspx");
                }
                else
                {
                    numero = dt.Rows[0].ItemArray[0].ToString().Trim();
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

        return numero;
    }

    private String obtenerfechasistema()
    {
        String fecha ="";
        try
        {
            servidor.cadenaconexion = Ruta;
            if (servidor.abrirconexion() == true)
            {
                System.Data.DataTable dt = servidor.consultar("[dbo].[obtenerfechasistema]").Tables[0];
                if (dt.Rows.Count == 0)
                {
                    servidor.cerrarconexion();
                    _Lista.ShowMessage(__mensaje, __pagina, "Error, al intentar recuperar datos.", "CerrarSession.aspx");
                }
                else
                {
                    fecha = Convert.ToDateTime(dt.Rows[0].ItemArray[0].ToString()).ToString();
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

        return fecha;
    }

    private void ObtenerCanales()
    {
        try
        {
            servidor.cadenaconexion = Ruta;
            if (servidor.abrirconexion() == true)
            {
                System.Data.DataTable dt = servidor.consultar("[dbo].[_pr_ObtenerCanales]").Tables[0];
                if (dt.Rows.Count == 0)
                {
                    servidor.cerrarconexion();
                    _Lista.ShowMessage(__mensaje, __pagina, "Error, al intentar recuperar datos.", "CerrarSession.aspx");
                }
                else
                {
                    this.CANAL.DataSource = dt;
                    this.CANAL.DataTextField = "NOMBRE";
                    this.CANAL.DataValueField = "CODIGO";
                    this.CANAL.DataBind();
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

    protected void Page_Load(object sender, EventArgs e)
    {

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
        
        
        //Codigo del ticket.
        this.ID_TIKET.Value = Request.QueryString.Get("CodigoT").Trim();

        //Nuevo registro.
        if (Convert.ToInt32(this.ID_TIKET.Value) == 0)
        {
            //CAPTURAMOS EL CODIGO DEL USUARIO QUE INICIO SESION.
            this.ID_USUA.Value = Datos[0];
 
            this.NRO_TICKET.Text = obtenernumeroticketincidente().Trim();
            this.FECHAEMISON.Text = obtenerfechasistema().ToString().Trim();
        }

        this.ObtenerCanales();
        this.ObtenerArea();
        this.ObtenerPrioridad();
        this.ObtenerImpacto();

        if (Convert.ToInt32(this.ID_TIKET.Value) > 0){
            this.consultarticketincidente(Convert.ToInt32(this.ID_TIKET.Value));
        }
  
    }

    protected void btnAceptar_Click(object sender, EventArgs e)
    {
        //validamos que el formulario este completo.
        Boolean ok;

        ok = NRO_TICKET.Text.Trim().Length>0;

        ok = ok && FECHAEMISON.Text.Trim().Length > 0;

        ok = ok && rvCANAL.IsValid;

        ok = ok && rvAREA.IsValid;

        ok = ok && rfvDESCRIPCION.IsValid;

        ok = ok && rvPRIORIDAD.IsValid;

        ok = ok && rvIMPACTO.IsValid;

        if (ok == false)
        {
            return;
        }


        //Nuevo registro.
        if (Convert.ToInt32(this.ID_TIKET.Value) == 0)
        {
            try
            {
                policia.clsaccesodatos servidor = new policia.clsaccesodatos();

                servidor.cadenaconexion = Ruta;

                if (servidor.abrirconexiontrans() == true)
                {

                    servidor.ejecutar("[dbo].[mantenimiento_ticket]",
                                     false,
                                     Convert.ToInt32(this.ID_TIKET.Value),
                                     Convert.ToInt32(this.ID_USUA.Value),//id usuario
                                     this.CANAL.SelectedValue,
                                     "N",
                                     0, "");

                    int _IDTIKET = servidor.getRespuesta();

                    this.ID_INCI.Value = _IDTIKET.ToString();

                    if (_IDTIKET > 0)
                    {

                        servidor.ejecutar("[dbo].[mantenimiento_incidente]",
                                     false,
                                     Convert.ToInt32(this.ID_INCI.Value),
                                     this.DESCRIPCION.Text.Trim(),
                                     this.PRIORIDAD.SelectedValue,
                                     this.IMPACTO.SelectedValue,
                                     this.AREA.SelectedValue,
                                     "N",
                                     0, "");

                        if (servidor.getRespuesta() == 1)
                        {

                            servidor.cerrarconexiontrans();

                            this.__mensaje.Value = servidor.getMensaje();

                            this.__pagina.Value = "ticketsincidentes.aspx";
                        }
                        else
                        {
                            servidor.cancelarconexiontrans();

                            this.__mensaje.Value = servidor.getMensaje();

                            this.__pagina.Value = "ticketsincidentes.aspx";
                        }
                    }
                    else
                    {
                        servidor.cancelarconexiontrans();

                        this.__mensaje.Value = servidor.getMensaje();

                        this.__pagina.Value = "ticketsincidentes.aspx";
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

                this.__pagina.Value = "";
            }
        }
        else
        {
            try
            {
                policia.clsaccesodatos servidor = new policia.clsaccesodatos();

                servidor.cadenaconexion = Ruta;

                if (servidor.abrirconexiontrans() == true)
                {

                    servidor.ejecutar("[dbo].[mantenimiento_ticket]",
                                     false,
                                     Convert.ToInt32(this.ID_TIKET.Value),
                                     Convert.ToInt32(this.ID_USUA.Value),//id usuario
                                     this.CANAL.SelectedValue,
                                     "M",
                                     0, "");
                  

                    if (servidor.getRespuesta()==1)
                    {

                        servidor.ejecutar("[dbo].[mantenimiento_incidente]",
                                     false,
                                     Convert.ToInt32(this.ID_INCI.Value),
                                     this.DESCRIPCION.Text.Trim(),
                                     this.PRIORIDAD.SelectedValue,
                                     this.IMPACTO.SelectedValue,
                                     this.AREA.SelectedValue,
                                     "M",
                                     0, "");

                        if (servidor.getRespuesta() == 1)
                        {

                            servidor.cerrarconexiontrans();

                            this.__mensaje.Value = servidor.getMensaje();

                            this.__pagina.Value = "ticketsincidentes.aspx";
                        }
                        else
                        {
                            servidor.cancelarconexiontrans();

                            this.__mensaje.Value = servidor.getMensaje();

                            this.__pagina.Value = "ticketsincidentes.aspx";
                        }
                    }
                    else
                    {
                        servidor.cancelarconexiontrans();

                        this.__mensaje.Value = servidor.getMensaje();

                        this.__pagina.Value = "ticketsincidentes.aspx";
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

                this.__pagina.Value = "";
            }
        }
    }
}