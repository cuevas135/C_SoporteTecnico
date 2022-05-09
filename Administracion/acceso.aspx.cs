//using Servicios;
using SEGURIDAD;
using System;
using System.Data;


/*
 * USUARIO : ricardo
 * CONTRASEÑA: ricardo
 */


public partial class acceso : System.Web.UI.Page
{
    private string Ruta = System.Configuration.ConfigurationManager.AppSettings.Get("CadenaConeccion");
    protected void Page_Load(object sender, EventArgs e)
    {
        login.Focus();
    }
    protected void Aceptar_Click(object sender, EventArgs e)
    {
        Boolean ok;

        ok = rfvlogin.IsValid;

        ok = ok && rfvpassword.IsValid;

        if (ok == false)
        {
            return;
        }

        string strLogin, strPassword;
        strLogin = login.Text.Trim();

        encriptar en = new encriptar();
        strPassword = en.EncriptarCadena(password.Text.Trim());


        try
        {
            policia.clsaccesodatos servidor = new policia.clsaccesodatos();
            servidor.cadenaconexion = Ruta;
            if (servidor.abrirconexiontrans() == true)
            {
                DataTable dt = servidor.consultar("[dbo].[_pa_validar_acceso_sistema_administracion]",
                                    strLogin, strPassword).Tables[0];


                if (dt.Rows[0]["CODIGO"].ToString().Trim() == "")
                {
                    servidor.cerrarconexion();
                    __mensaje.Value = dt.Rows[0]["PERSONA"].ToString().Trim();
                    __pagina.Value = "";
                }
                else
                {
                    string Persona = dt.Rows[0]["TIPOPERSONA"].ToString().Trim();
                    
                    if (Persona.Equals("CO")){
                        Session["__JSAR__"] = new string[] { dt.Rows[0]["CODIGO"].ToString(),
                                                             dt.Rows[0]["COLABORADOR"].ToString(),
                                                            };
                       Server.Transfer("menu.aspx");
                    }
                }               
            }
            else
            {
                servidor.cerrarconexion();
                __mensaje.Value = servidor.getMensageError();
                __pagina.Value = "";
            }
        }
        catch (Exception)
        {
            __mensaje.Value = "Error inesperado al intentar conectarnos con el servidor.";
            __pagina.Value = "";
        }

       
    }
}