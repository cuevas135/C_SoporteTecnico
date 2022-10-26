using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
//using Servicios;
using SEGURIDAD;

public partial class Clientes_acceso2 : Page
{
    private string Ruta = System.Configuration.ConfigurationManager.AppSettings.Get("CadenaConeccion");
    private int intentos = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        login.Focus();
    }

    protected void Aceptar_Click(object sender, EventArgs e)
    {
        __mensaje.Value = "";
        __pagina.Value = "";
        bool ok;
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
                DataTable dt = servidor.consultar("[dbo].[_pa_validar_acceso_sistema_clientes]",
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
                    /*Persona natural o juridica*/
                    if (Persona.Equals("PN") || Persona.Equals("PJ"))
                    {
                        Session["__JSAR__"] = new string[] { dt.Rows[0]["CODIGO"].ToString(),
                                                             dt.Rows[0]["PERSONA"].ToString(),
                                                            };
                        //Server.Transfer("solicitudservicio.aspx?EnviarNotificacion=NO");

                        Response.Clear();
                        Response.Redirect("~/Clientes/solicitudservicio.aspx?EnviarNotificacion=NO");
                        Response.Flush();
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
        catch (Exception ex)
        {
            //throw;
            this.__mensaje.Value = "Error inesperado al intentar conectarnos con el servidor."
                + ex.Message.ToString();
            this.__pagina.Value = "";
        }
    }
}