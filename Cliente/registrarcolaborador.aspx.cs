using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cliente_registrarcolaborador : System.Web.UI.Page
{

    private String Ruta = System.Configuration.ConfigurationManager.AppSettings.Get("CadenaConeccion");
    policia.clsaccesodatos servidor = new policia.clsaccesodatos();
    Lista _Lista = new Lista();
    int ID_COLOLABORADOR = -1;
    System.Data.DataTable dt;

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
       
        
        this.ObtenerTipoColaborador();

        try { 
            ID_COLOLABORADOR = Convert.ToInt32(Request.QueryString.Get("Codigo").Trim());
            ConsultarColaboradores(ID_COLOLABORADOR);
        }
        catch (Exception ex)
        {
            ID_COLOLABORADOR=-1;
        }
    }

    private void ObtenerTipoColaborador()
    {
        try
        {
            servidor.cadenaconexion = Ruta;
            if (servidor.abrirconexion() == true)
            {
                System.Data.DataTable dt = servidor.consultar("[dbo].[_pr_ObtenerTipoColaborador]").Tables[0];
                if (dt.Rows.Count == 0)
                {
                    servidor.cerrarconexion();
                    _Lista.ShowMessage(__mensaje, __pagina, "Error, al intentar recuperar datos.", "CerrarSession.aspx");
                }
                else
                {
                    this.TIPOCOLABORADOR.DataSource = dt;
                    this.TIPOCOLABORADOR.DataTextField = "NOMBRE";
                    this.TIPOCOLABORADOR.DataValueField = "CODIGO";
                    this.TIPOCOLABORADOR.DataBind();
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

    private void ConsultarColaboradores(int CodigoColaborador)
    {
        try
        {
            policia.clsaccesodatos servidor = new policia.clsaccesodatos();

            servidor.cadenaconexion = Ruta;

            if (servidor.abrirconexion() == true)
            {

                if (ID_COLOLABORADOR>0)
                {
                    dt = servidor.consultar("[dbo].[consultarcolaboradores]", CodigoColaborador).Tables[0];

                    if (dt.Rows.Count == 0)
                    {
                        servidor.cerrarconexion();

                        this.__mensaje.Value = "Error, al intentar recuperar datos del Colaborador.";

                        this.__pagina.Value = "CerrarSession.aspx";
                    }
                    else
                    {

                        this.btnAceptar.OnClientClick = "return Confirmar('¿Desea modificar los datos del Colaborador?');";

                        this.ID_COLOLABORADOR = Convert.ToInt32(dt.Rows[0]["ID"].ToString());

                        Busca(TIPOCOLABORADOR, "TIPO COLABORADOR");

                        this.NOMBRES.Text = dt.Rows[0]["NOMBRE"].ToString().Trim();

                        this.APELLIDOPATERNO.Text = dt.Rows[0]["APELLIDO PATERNO"].ToString().Trim();

                        this.APELLIDOMATERNO.Text = dt.Rows[0]["APELLIDO MATERNO"].ToString().Trim();

                        this.FIJO.Text = dt.Rows[0]["NRO FIJO"].ToString().Trim();

                        this.CELULAR.Text = dt.Rows[0]["NRO CELULAR"].ToString().Trim();

                        this.EMAIL.Text = dt.Rows[0]["CORREO"].ToString().Trim();

                        this.DIRECCION.Text = dt.Rows[0]["DIRECCION"].ToString().Trim();

                        this.ESTADO.Checked = Convert.ToBoolean(dt.Rows[0]["ESTADO"].ToString().Trim());


                    }
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

    protected void btnAceptar_Click(object sender, EventArgs e)
    {
        String Opcion = "N";

        if(ID_COLOLABORADOR!=-1){

           Opcion = "M";          
        }

        Boolean ok;

        ok = rvTIPOCOLABORADOR.IsValid;

        ok = ok && rfvAPELLIDOPATERNO.IsValid;

        ok = ok && rfvTAPELLIDOMATERNO.IsValid;

        ok = ok && rfvNOMBRES.IsValid;

        //ok = ok && rfvFIJO.IsValid;

        ok = ok && rfvCELULAR.IsValid;

        ok = ok && rfvEMAIL.IsValid;

        ok = ok && regexEmailValid.IsValid;      

        if (ok == false)
        {
            return;
        }

        try
        {
            policia.clsaccesodatos servidor = new policia.clsaccesodatos();

            servidor.cadenaconexion = Ruta;

            if (servidor.abrirconexiontrans() == true)
            {

                servidor.ejecutar("[dbo].[mantenimientocolaborador]",
                                 false,
                                 Convert.ToInt32(ID_COLOLABORADOR),
                                 this.APELLIDOPATERNO.Text.Trim(),
                                 this.APELLIDOMATERNO.Text.Trim(),
                                 this.NOMBRES.Text.Trim(),
                                 this.FIJO.Text.Trim(),
                                 this.CELULAR.Text.Trim(),
                                 this.DIRECCION.Text.Trim(),
                                 this.EMAIL.Text.Trim(),
                                 this.ESTADO.Checked,
                                 this.TIPOCOLABORADOR.SelectedValue,
                                 Opcion,
                                 0, "");

                if (servidor.getRespuesta() == 1)
                {
                    servidor.cerrarconexiontrans();

                    this.__mensaje.Value = servidor.getMensaje();

                    this.__pagina.Value = "listarcolaboradores.aspx";
                }
                else
                {
                    servidor.cancelarconexiontrans();

                    this.__mensaje.Value = servidor.getMensaje();

                    this.__pagina.Value = "listarcolaboradores.aspx";
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