using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using SEGURIDAD;
using System.Text;
//using Servicios;

public partial class Clientes_recuperarClientes : System.Web.UI.Page
{
    private String Ruta = System.Configuration.ConfigurationManager.AppSettings.Get("CadenaConeccion");
    Utilitarios _Utilitarios = new Utilitarios();
    DataTable TablaDatos;
    //int NroFilas_TablaDatos = 0;
    static string Cliente = "";
     //string contraseña = "";
    string NuevaContraseña = "";

    //sencriptacion se = new sencriptacion();

    protected void Page_Load(object sender, EventArgs e)
    {

    }


    public void Lista_Datos_Cliente(string opcion, string nro_dcto, string Correo)
    {
        __mensaje.Value = "";
        __pagina.Value = "";

      

        try
        {
            policia.clsaccesodatos servidor = new policia.clsaccesodatos();
            servidor.cadenaconexion = Ruta;
            if (servidor.abrirconexion() == true)
            {                
                    TablaDatos = servidor.consultar("[dbo].[pa_ListarRecuperar_Clientes]"
                        , opcion, nro_dcto, Correo).Tables[0];               
                //NroFilas_TablaDatos = TablaDatos.Rows.Count;
                if (TablaDatos.Rows.Count == 0)
                {
                    servidor.cerrarconexion();
                    __mensaje.Value = "No hay datos para mostrar. Verifique datos ingresados.";
                    txtNroDcto.Focus();
                }
                else
                {
                    hfId.Value = Convert.ToString(TablaDatos.Rows[0]["ID"].ToString());
                    Cliente = Convert.ToString(TablaDatos.Rows[0]["CLIENTE"].ToString());
                    hfCorreo.Value = Convert.ToString(TablaDatos.Rows[0]["CORREO"].ToString());
                    hfUsuario.Value = Convert.ToString(TablaDatos.Rows[0]["USUARIO"].ToString());
                    //hfContraseña.Value = ((TablaDatos.Rows[0]["PASS"].ToString()));
                    //contraseña = Convert.ToString(TablaDatos.Rows[0]["PASS"].ToString());
                   


                    servidor.cerrarconexion();
                }
            }
            else
            {
                servidor.cerrarconexion();
                __mensaje.Value = servidor.getMensageError();
                __pagina.Value = "../CerrarSession.aspx";
            }
        }
        catch (Exception)
        {
            throw;
            //__mensaje.Value = "Vuelva a Generar Reporte";
        }
    }

    private void mantenimientoPerNatural(string id, string contraseña, string operacion)
    {
        try
        {
            policia.clsaccesodatos servidor = new policia.clsaccesodatos();
            servidor.cadenaconexion = Ruta;
            if (servidor.abrirconexiontrans() == true)
            {
                servidor.ejecutar("[dbo].[_pa_mantenimiento_Persona_Natural]",
                                    false,
                                    id.Trim(),
                                    "",
                                    "",
                                    "",
                                    "",
                                    "",
                                    "",
                                    "",
                                    "",
                                    contraseña.Trim(),//10                                   
                                    "",
                                    "",
                                    "",
                                    operacion,
                                    0, "");
                if (servidor.getRespuesta() == 1)
                {
                    servidor.cerrarconexiontrans();
                    __mensaje.Value = servidor.getMensaje();
                    __pagina.Value = "recuperarClientes.aspx";
                }
                else
                {
                    servidor.cancelarconexiontrans();
                    __mensaje.Value = servidor.getMensaje();
                    //__pagina.Value = "recuperarClientes.aspx";
                }
            }
            else
            {
                servidor.cancelarconexiontrans();
                __mensaje.Value = servidor.getMensageError();
                __pagina.Value = "../CerrarSession.aspx";
            }
        }
        catch (Exception)
        {
            throw;
            //__mensaje.Value = "Error inesperado al intentar conectarnos con el servidor.";
            //__pagina.Value = "../CerrarSession.aspx";
        }
    }

    private void mantenimientoPerJuridica(string id, string contraseña, string operacion)
    {
        try
        {
            policia.clsaccesodatos servidor = new policia.clsaccesodatos();
            servidor.cadenaconexion = Ruta;
            if (servidor.abrirconexiontrans() == true)
            {
                servidor.ejecutar("[dbo].[_pa_mantenimiento_Persona_Juridica]",
                                    false,
                                    id.Trim(),
                                    "",
                                    "",
                                    "",
                                    "",
                                    "",
                                    "",                                 
                                    contraseña.Trim(),//8                                 
                                    "",
                                    "",
                                    "",
                                    operacion,
                                    0, "");
                if (servidor.getRespuesta() == 1)
                {
                    servidor.cerrarconexiontrans();
                    __mensaje.Value = servidor.getMensaje();
                    __pagina.Value = "recuperarClientes.aspx";
                }
                else
                {
                    servidor.cancelarconexiontrans();
                    __mensaje.Value = servidor.getMensaje();
                    //__pagina.Value = "recuperarClientes.aspx";
                }
            }
            else
            {
                servidor.cancelarconexiontrans();
                __mensaje.Value = servidor.getMensageError();
                __pagina.Value = "../CerrarSession.aspx";
            }
        }
        catch (Exception)
        {
            throw;
            //__mensaje.Value = "Error inesperado al intentar conectarnos con el servidor.";
            //__pagina.Value = "../CerrarSession.aspx";
        }
    }

    protected void btnRecuperar_Click(object sender, EventArgs e)
    {
        //Title = Convert.ToString(se.DecryptKey(hfContraseña.Value));
        Lista_Datos_Cliente(rbOpcion.SelectedValue, txtNroDcto.Text.Trim(), "");

        NuevaContraseña = CrearPassword(4);
        encriptar en = new encriptar();

        String strTextoEncriptado = en.EncriptarCadena(this.NuevaContraseña.Trim());

        if (TablaDatos.Rows.Count > 0)
        {
            if (rbOpcion.SelectedValue == "1")
            {
                mantenimientoPerNatural(hfId.Value, strTextoEncriptado.Trim(), "C");
            }

            else if (rbOpcion.SelectedValue == "2")
            {
                mantenimientoPerJuridica(hfId.Value, strTextoEncriptado.Trim(), "C");
            }
            _Utilitarios.EnvioCorreoRecuperacionCuenta("Recuperacion de cuenta (Cliente)", hfCorreo.Value.Trim(), CreateBody());
        }
       
    }

    public string CrearPassword(int longitud)
    {
        string caracteres = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder res = new StringBuilder();
        Random rnd = new Random();
        while (0 < longitud--)
        {
            res.Append(caracteres[rnd.Next(caracteres.Length)]);
        }
        return res.ToString();
    }

    private string CreateBody()
    {
        string body = string.Empty;
        using (StreamReader reader = new StreamReader(Server.MapPath("~/PlantillasCorreo/RecuperaCuenta.html")))
        {
            body = reader.ReadToEnd();
        }

        body = body.Replace("{Cliente}", Cliente.Trim()); //replacing Parameters
        body = body.Replace("{Usuario}", hfUsuario.Value.Trim());
        body = body.Replace("{contrasena}", (NuevaContraseña.Trim()));

        return body;

    }
}