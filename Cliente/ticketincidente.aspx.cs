using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cliente_ticketincidente : System.Web.UI.Page
{

    private string Ruta = System.Configuration.ConfigurationManager.AppSettings.Get("CadenaConeccion");
    policia.clsaccesodatos servidor = new policia.clsaccesodatos();
    Lista _Lista = new Lista();
    System.Data.DataTable dt;

    void Busca(System.Web.UI.WebControls.DropDownList control, string strcampo)
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

                    __mensaje.Value = "Error, al intentar recuperar datos de Ticket Incidente.";

                    __pagina.Value = "CerrarSession.aspx";
                    }
                    else
                    {

                    btnAceptar.OnClientClick = "return Confirmar('¿Desea modificar los datos de Ticket Incidente?');";

                    ID_TIKET.Value = dt.Rows[0]["IDTIKET"].ToString();

                    ID_INCI.Value = ID_TIKET.Value;

                    NRO_TICKET.Text = dt.Rows[0]["NRO TICKET"].ToString().Trim();

                    ID_USUA.Value = dt.Rows[0]["IDUSUARIO"].ToString();

                    //this.NOMBRES.Text = dt.Rows[0]["COLABORADOR"].ToString().Trim();

                    FECHAEMISON.Text = dt.Rows[0]["FECHA EMISON"].ToString().Trim();

                        Busca(CANAL, "CANAL");

                        Busca(AREA, "AREA");

                    DESCRIPCION.Text = dt.Rows[0]["INCIDENTE"].ToString().Trim();

                        Busca(PRIORIDAD, "PRIORIDAD");

                        Busca(IMPACTO, "IMPACTO");

                        //this.FIJO.Text = dt.Rows[0]["ESTADO TICKET"].ToString().Trim();

                    }
       
                servidor.cerrarconexion();

            }
            else
            {
                servidor.cerrarconexion();

                __mensaje.Value = servidor.getMensageError();

                __pagina.Value = "CerrarSession.aspx";
            }

        }
        catch (Exception)
        {

            __mensaje.Value = "Error inesperado al intentar conectarnos con el servidor.";

            __pagina.Value = "CerrarSession.aspx";
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
                    IMPACTO.DataSource = dt;
                    IMPACTO.DataTextField = "NOMBRE";
                    IMPACTO.DataValueField = "CODIGO";
                    IMPACTO.DataBind();
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
                    PRIORIDAD.DataSource = dt;
                    PRIORIDAD.DataTextField = "NOMBRE";
                    PRIORIDAD.DataValueField = "CODIGO";
                    PRIORIDAD.DataBind();
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
                    AREA.DataSource = dt;
                    AREA.DataTextField = "NOMBRE";
                    AREA.DataValueField = "CODIGO";
                    AREA.DataBind();
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

    private string obtenernumeroticketincidente()
    {
        string numero = "";
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

    private string obtenerfechasistema()
    {
        string fecha ="";
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
                    CANAL.DataSource = dt;
                    CANAL.DataTextField = "NOMBRE";
                    CANAL.DataValueField = "CODIGO";
                    CANAL.DataBind();
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
        __mensaje.Value = "";
        __pagina.Value = "";
        string[] Datos = (string[])Session["__JSAR__"];
        if (Datos == null)
        {
            __mensaje.Value = "Ud. no esta autorizado para ingresar a esta página, inicie sesion por favor.";
            __pagina.Value = "../CerrarSession.aspx";
            return;
        }
        //=============================================================================================================


        //Codigo del ticket.
        ID_TIKET.Value = Request.QueryString.Get("CodigoT").Trim();

        //Nuevo registro.
        if (Convert.ToInt32(ID_TIKET.Value) == 0)
        {
            //CAPTURAMOS EL CODIGO DEL USUARIO QUE INICIO SESION.
            ID_USUA.Value = Datos[0];

            NRO_TICKET.Text = obtenernumeroticketincidente().Trim();
            FECHAEMISON.Text = obtenerfechasistema().ToString().Trim();
        }

        ObtenerCanales();
        ObtenerArea();
        ObtenerPrioridad();
        ObtenerImpacto();

        if (Convert.ToInt32(ID_TIKET.Value) > 0){
            consultarticketincidente(Convert.ToInt32(ID_TIKET.Value));
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
        if (Convert.ToInt32(ID_TIKET.Value) == 0)
        {
            try
            {
                policia.clsaccesodatos servidor = new policia.clsaccesodatos();

                servidor.cadenaconexion = Ruta;

                if (servidor.abrirconexiontrans() == true)
                {

                    servidor.ejecutar("[dbo].[mantenimiento_ticket]",
                                     false,
                                     Convert.ToInt32(ID_TIKET.Value),
                                     Convert.ToInt32(ID_USUA.Value),//id usuario
                                     CANAL.SelectedValue,
                                     "N",
                                     0, "");

                    int _IDTIKET = servidor.getRespuesta();

                    ID_INCI.Value = _IDTIKET.ToString();

                    if (_IDTIKET > 0)
                    {

                        servidor.ejecutar("[dbo].[mantenimiento_incidente]",
                                     false,
                                     Convert.ToInt32(ID_INCI.Value),
                                     DESCRIPCION.Text.Trim(),
                                     PRIORIDAD.SelectedValue,
                                     IMPACTO.SelectedValue,
                                     AREA.SelectedValue,
                                     "N",
                                     0, "");

                        if (servidor.getRespuesta() == 1)
                        {

                            servidor.cerrarconexiontrans();

                            __mensaje.Value = servidor.getMensaje();

                            __pagina.Value = "ticketsincidentes.aspx";
                        }
                        else
                        {
                            servidor.cancelarconexiontrans();

                            __mensaje.Value = servidor.getMensaje();

                            __pagina.Value = "ticketsincidentes.aspx";
                        }
                    }
                    else
                    {
                        servidor.cancelarconexiontrans();

                        __mensaje.Value = servidor.getMensaje();

                        __pagina.Value = "ticketsincidentes.aspx";
                    }

                }
                else
                {
                    servidor.cerrarconexion();

                    __mensaje.Value = servidor.getMensageError();

                    __pagina.Value = "CerrarSession.aspx";
                }

            }
            catch (Exception)
            {

                __mensaje.Value = "Error inesperado al intentar conectarnos con el servidor.";

                __pagina.Value = "";
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
                                     Convert.ToInt32(ID_TIKET.Value),
                                     Convert.ToInt32(ID_USUA.Value),//id usuario
                                     CANAL.SelectedValue,
                                     "M",
                                     0, "");
                  

                    if (servidor.getRespuesta()==1)
                    {

                        servidor.ejecutar("[dbo].[mantenimiento_incidente]",
                                     false,
                                     Convert.ToInt32(ID_INCI.Value),
                                     DESCRIPCION.Text.Trim(),
                                     PRIORIDAD.SelectedValue,
                                     IMPACTO.SelectedValue,
                                     AREA.SelectedValue,
                                     "M",
                                     0, "");

                        if (servidor.getRespuesta() == 1)
                        {

                            servidor.cerrarconexiontrans();

                            __mensaje.Value = servidor.getMensaje();

                            __pagina.Value = "ticketsincidentes.aspx";
                        }
                        else
                        {
                            servidor.cancelarconexiontrans();

                            __mensaje.Value = servidor.getMensaje();

                            __pagina.Value = "ticketsincidentes.aspx";
                        }
                    }
                    else
                    {
                        servidor.cancelarconexiontrans();

                        __mensaje.Value = servidor.getMensaje();

                        __pagina.Value = "ticketsincidentes.aspx";
                    }

                }
                else
                {
                    servidor.cerrarconexion();

                    __mensaje.Value = servidor.getMensageError();

                    __pagina.Value = "CerrarSession.aspx";
                }

            }
            catch (Exception)
            {

                __mensaje.Value = "Error inesperado al intentar conectarnos con el servidor.";

                __pagina.Value = "";
            }
        }
    }
}