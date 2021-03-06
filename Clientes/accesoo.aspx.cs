using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
//using Servicios;
using SEGURIDAD;

public partial class acceso : System.Web.UI.Page
{
    private String Ruta = System.Configuration.ConfigurationManager.AppSettings.Get("CadenaConeccion");
    private int intentos = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        this.login.Focus();
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

        String strLogin, strPassword;
        strLogin = this.login.Text.Trim();

        encriptar en = new encriptar();
        strPassword = en.EncriptarCadena(this.password.Text.Trim());


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
                    this.__mensaje.Value = dt.Rows[0]["PERSONA"].ToString().Trim();
                    this.__pagina.Value = "";
                }
                else
                {
                    String Persona = dt.Rows[0]["TIPOPERSONA"].ToString().Trim();
                    /*Persona natural o juridica*/
                    if (Persona.Equals("PN") || Persona.Equals("PJ"))
                    {
                        Session["__JSAR__"] = new string[] { dt.Rows[0]["CODIGO"].ToString(),
                                                             dt.Rows[0]["PERSONA"].ToString(),
                                                            };

                        Response.Clear();
                        Response.Redirect("~/Clientes/solicitudservicio.aspx");
                        Response.Flush();
                    }
                }
            }
            else
            {
                servidor.cerrarconexion();
                this.__mensaje.Value = servidor.getMensageError();
                this.__pagina.Value = "";
            }
        }
        catch (Exception)
        {
            throw;
            //this.__mensaje.Value = "Error inesperado al intentar conectarnos con el servidor.";
            //this.__pagina.Value = "";
        }


    }
}