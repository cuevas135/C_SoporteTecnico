using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SEGURIDAD;

public partial class Clientes_persona : System.Web.UI.Page
{
    private String Ruta = System.Configuration.ConfigurationManager.AppSettings.Get("CadenaConeccion");
    
    private void LimpiarDatosPN()
    {
        this.NroDNI_PN.Text = "";
        this.ApellidoPaterno_PN.Text = "";
        this.ApellidoMaterno_PN.Text = "";
        this.Nombre_PN.Text = "";
        this.Direccion_PN.Text = "";
        this.TelefonoFijo_PN.Text = "";
        this.TelefonoMovil_PN.Text = "";
        this.Login_PN.Text = "";
        this.Password_PN.Text = "";
        this.Email_PN.Text = "";
        this.Faceboock_PN.Text = "";
        this.Twiter_PN.Text = "";
    }

    private void LimpiarDatosPJ()
    {
        this.NroRUC_PJ.Text = "";
        this.RazonSocial_PJ.Text = "";
        this.Direccion_PJ.Text = "";
        this.TelefonoFijo_PJ.Text = "";
        this.TelefonoMovil_PJ.Text = "";
        this.Login_PJ.Text = "";
        this.Password_PJ.Text = "";
        this.Email_PJ.Text = "";
        this.Faceboock_PJ.Text = "";
        this.Twiter_PJ.Text = "";
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
   
    protected void btnPersonaNatural_Click(object sender, EventArgs e)
    {
        this.__mensaje.Value = "";

        this.__pagina.Value = "";
        
        this.PPN.Visible = true;

        this.PPJ.Visible = false;

        LimpiarDatosPJ();
    }
    protected void btnPersonaJuridica_Click(object sender, EventArgs e)
    {
        this.__mensaje.Value = "";

        this.__pagina.Value = "";
        
        this.PPN.Visible = false;

        this.PPJ.Visible = true;

        LimpiarDatosPN();
    }
    

    
   
    protected void lbGaurdar_PN_Click(object sender, EventArgs e)
    {
        String Opcion = "N";

        Boolean ok;

        ok = rfvNroDNI_PN.IsValid;

        ok = ok && revNroDNI_PN.IsValid;

        ok = ok && rfvApellidoPaterno_PN.IsValid;

        ok = ok && rfvApellidoMaterno_PN.IsValid;

        ok = ok && rfvNombre_PN.IsValid;

        ok = ok && rfvDireccion_PN.IsValid;

        ok = ok && revTelefonoFijo_PN.IsValid;

        ok = ok && revTelefonoMovil_PN.IsValid;

        ok = ok && rfvLogin_PN.IsValid;

        ok = ok && rfvPassword_PN.IsValid;

        ok = ok && revEmail_PN.IsValid;

        if (ok == false)
        {
            return;
        }

        encriptar en = new encriptar();

        String strTextoEncriptado = en.EncriptarCadena(this.Password_PN.Text.Trim());


        try
        {
            policia.clsaccesodatos servidor = new policia.clsaccesodatos();

            servidor.cadenaconexion = Ruta;

            if (servidor.abrirconexiontrans() == true)
            {

                servidor.ejecutar("[dbo].[_pa_mantenimiento_Persona_Natural]",
                                 false,
                                 "",/* Codigo persona natural*/
                                 this.NroDNI_PN.Text.Trim(),
                                 this.ApellidoPaterno_PN.Text.Trim(),
                                 this.ApellidoMaterno_PN.Text.Trim(),
                                 this.Nombre_PN.Text.Trim(),
                                 this.Direccion_PN.Text.Trim(),
                                 this.TelefonoFijo_PN.Text.Trim(),
                                 this.TelefonoMovil_PN.Text.Trim(),
                                 this.Login_PN.Text.Trim(),
                                 strTextoEncriptado,
                                 this.Email_PN.Text.Trim(),
                                 this.Faceboock_PN.Text.Trim(),
                                 this.Twiter_PN.Text.Trim(),
                                 Opcion,
                                 0, "");

                if (servidor.getRespuesta() == 1)
                {
                    servidor.cerrarconexiontrans();

                    this.__mensaje.Value = servidor.getMensaje();

                    this.__pagina.Value = "acceso.aspx"; 
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
                servidor.cerrarconexion();

                this.__mensaje.Value = servidor.getMensageError();

                this.__pagina.Value = "";
            }

        }
        catch (Exception)
        {

            this.__mensaje.Value = "Error inesperado al intentar conectarnos con el servidor.";

            this.__pagina.Value = "";
        }

    }
    protected void lbLimpiar_PN_Click(object sender, EventArgs e)
    {
        LimpiarDatosPN();
    }
    protected void lbLimpiar_PJ_Click(object sender, EventArgs e)
    {
        LimpiarDatosPJ();
    }
    protected void lbGuardar_PJ_Click(object sender, EventArgs e)
    {
        String Opcion = "N";

        Boolean ok;

        ok = rfvNroRUC_PJ.IsValid;

        ok = ok && revNroRUC_PJ.IsValid;


        ok = ok && rfvRazonSocial_PJ.IsValid;

        ok = ok && rfvDireccion_PJ.IsValid;


        ok = ok && rfvTelefonoFijo_PJ.IsValid;

        ok = ok && revTelefonoFijo_PJ.IsValid;


        ok = ok && rfvTelefonoMovil_PJ.IsValid;

        ok = ok && revTelefonoMovil_PJ.IsValid;


        ok = ok && rfvLogin_PJ.IsValid;

        ok = ok && rfvPassword_PJ.IsValid;


        ok = ok && rfvEmail_PJ.IsValid;

        ok = ok && revEmail_PJ.IsValid;

        if (ok == false)
        {
            return;
        }

        encriptar en = new encriptar();

        String strTextoEncriptado = en.EncriptarCadena(this.Password_PJ.Text.Trim());


        try
        {
            policia.clsaccesodatos servidor = new policia.clsaccesodatos();

            servidor.cadenaconexion = Ruta;

            if (servidor.abrirconexiontrans() == true)
            {

                servidor.ejecutar("[dbo].[_pa_mantenimiento_Persona_Juridica]",
                                 false,
                                 "",/* Codigo persona juridica*/
                                 this.NroRUC_PJ.Text.Trim(),
                                 this.RazonSocial_PJ.Text.Trim(),
                                 this.Direccion_PJ.Text.Trim(),
                                 this.TelefonoFijo_PJ.Text.Trim(),
                                 this.TelefonoMovil_PJ.Text.Trim(),
                                 this.Login_PJ.Text.Trim(),
                                 strTextoEncriptado,
                                 this.Email_PJ.Text.Trim(),
                                 this.Faceboock_PJ.Text.Trim(),
                                 this.Twiter_PJ.Text.Trim(),
                                 Opcion,
                                 0, "");

                if (servidor.getRespuesta() == 1)
                {
                    servidor.cerrarconexiontrans();

                    this.__mensaje.Value = servidor.getMensaje();

                    this.__pagina.Value = "acceso.aspx";
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
                servidor.cerrarconexion();

                this.__mensaje.Value = servidor.getMensageError();

                this.__pagina.Value = "";
            }

        }
        catch (Exception)
        {

            this.__mensaje.Value = "Error inesperado al intentar conectarnos con el servidor.";

            this.__pagina.Value = "";
        }
    }
}