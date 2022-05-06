using System.Net.Mail;
using System.Configuration;
using System.Web.Configuration;
using System.Net.Configuration;
using System.Net;
using System.Security.Cryptography.X509Certificates;
using System.Net.Security;
using System.Web;
using System.Threading.Tasks;
using System.Web.UI.WebControls;
using System;
using System.Text;
using System.Web.UI;
using System.Data;
/// <summary>
/// Descripción breve de Utilitarios
/// </summary>
public class Utilitarios
{
	public Utilitarios()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    //SOLO ENVIA A UNA SOLA DIRECCION DE CORREO ELECTRONICO
    public void EnvioCorreoRecuperacionCuenta(string Asunto, string Destino, string Body)
    {
        //https://www.kyocode.com/2019/08/configurar-web-config-correos-asp/
        MailMessage correo = new MailMessage();
        Configuration c = WebConfigurationManager.OpenWebConfiguration(HttpContext.Current.Request.ApplicationPath);
        MailSettingsSectionGroup settings = (MailSettingsSectionGroup)c.GetSectionGroup("system.net/mailSettings");
        correo.From = new System.Net.Mail.MailAddress(settings.Smtp.From, settings.Smtp.Network.UserName, System.Text.Encoding.UTF8); //Correo de salida
        correo.To.Add(Destino.Trim()); //Correo destino
        correo.Subject = Asunto.Trim(); //Asunto
        correo.Body = Body.Trim(); //Mensaje del correo
        //-------------------------------------------------------
        //-- COPIA OCULTA
        MailAddress bcc = new MailAddress("soportetecnico202011@outlook.com");
        correo.Bcc.Add(bcc);
        //-------------------------------------------------------
        correo.IsBodyHtml = true;
        correo.Priority = MailPriority.Normal;
        SmtpClient smtp = new SmtpClient();
        smtp.UseDefaultCredentials = settings.Smtp.Network.DefaultCredentials;
        smtp.Host = settings.Smtp.Network.Host; //Host del servidor de correo
        smtp.Port = settings.Smtp.Network.Port; //Puerto de salida
        smtp.Credentials = new NetworkCredential(settings.Smtp.From, settings.Smtp.Network.Password); //Cuenta de correo
        ServicePointManager.ServerCertificateValidationCallback = delegate(object s, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors) { return true; };
        smtp.EnableSsl = settings.Smtp.Network.EnableSsl;//True si el servidor de correo permite ssl
        smtp.Send(correo);
    }
}