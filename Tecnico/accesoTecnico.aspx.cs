using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SEGURIDAD;

public partial class Tecnico_acceso : Page
{
    private string Ruta = ConfigurationManager.AppSettings.Get("CadenaConeccion");

    protected void Page_Load(object sender, EventArgs e)
    {
        txtUsuario.Focus();
    }

    protected void Aceptar_Click(object sender, EventArgs e)
    {
        bool ok;
        ok = rfvtxtUsuario.IsValid;
        ok = ok && rfvtxtContraseña.IsValid;
        if (ok == false)
        { return; }

        string strLogin, strPassword;
        strLogin = txtUsuario.Text.Trim();

        encriptar en = new encriptar();
        strPassword = en.EncriptarCadena(txtContraseña.Text.Trim());

        try
        {
            policia.clsaccesodatos servidor = new policia.clsaccesodatos();
            servidor.cadenaconexion = Ruta;
            if (servidor.abrirconexiontrans() == true)
            {
                DataTable dt = servidor.consultar("[dbo].[PaValidarAccesoSistemaTecnico]",
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

                    if (Persona.Equals("CO"))
                    {
                        Session["__JSAR__"] = new string[] { dt.Rows[0]["CODIGO"].ToString(),
                                                             dt.Rows[0]["COLABORADOR"].ToString(),
                                                            };
                        //Server.Transfer("solicitudes.aspx");
                        Response.Clear();
                        Response.Redirect("~/Tecnico/solicitudesTecnico.aspx");
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
        catch (Exception)
        {
            __mensaje.Value = "Error inesperado al intentar conectarnos con el servidor.";
            __pagina.Value = "";
        }
    }
}