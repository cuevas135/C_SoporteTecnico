using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cliente_cancelarticketincidente : System.Web.UI.Page
{
    private String Ruta = System.Configuration.ConfigurationManager.AppSettings.Get("CadenaConeccion");
    policia.clsaccesodatos servidor = new policia.clsaccesodatos();
    private int ID_INCIDENETE;
    
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

        this.__mensaje.Value = "";
        this.__pagina.Value = "";
        ID_INCIDENETE = Convert.ToInt32(Request.QueryString.Get("Codigo").Trim());

        try
        {
            policia.clsaccesodatos servidor = new policia.clsaccesodatos();
            servidor.cadenaconexion = Ruta;
            if (servidor.abrirconexiontrans() == true)
            {
                servidor.ejecutar("[dbo].[cancelarticketincidente]",
                                 false,
                                 ID_INCIDENETE,
                                 "C",
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
                servidor.cerrarconexion();
                this.__mensaje.Value = servidor.getMensageError();
                this.__pagina.Value = "../CerrarSession.aspx";
            }

        }
        catch (Exception)
        {
            this.__mensaje.Value = "Error inesperado al intentar conectarnos con el servidor.";
            this.__pagina.Value = "";
        }
    }
}