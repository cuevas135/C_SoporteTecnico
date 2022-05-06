using System;
using System.Data;
using System.IO;
using System.Text;
using SEGURIDAD;

public partial class Administracion_recuperarAdministrador : System.Web.UI.Page
{
	private String Ruta = System.Configuration.ConfigurationManager.AppSettings.Get("CadenaConeccion");
	Utilitarios _Utilitarios = new Utilitarios();
	static string Cliente = "";
	string NuevaContraseña = "";
    DataTable TablaDatos;
	public void Lista_Datos(string opcion, string nro_dcto, string Correo)
	{
		__mensaje.Value = "";
		__pagina.Value = "";

		try
		{
			policia.clsaccesodatos servidor = new policia.clsaccesodatos();
			servidor.cadenaconexion = Ruta;
			if (servidor.abrirconexion() == true)
			{
				 TablaDatos = servidor.consultar("[dbo].[pa_ListarRecuperar_Colaboradores]"
					, opcion, nro_dcto, Correo).Tables[0];
				if (TablaDatos.Rows.Count == 0)
				{
					servidor.cerrarconexion();
					__mensaje.Value = "No hay datos para mostrar. Verifique datos ingresados.";
                    txtNroDcto.Focus();
				}
				else
				{
					hfId.Value = Convert.ToString(TablaDatos.Rows[0]["ID"].ToString());
					Cliente = Convert.ToString(TablaDatos.Rows[0]["NOMBRE"].ToString());
					hfCorreo.Value = Convert.ToString(TablaDatos.Rows[0]["CORREO"].ToString());
					hfUsuario.Value = Convert.ToString(TablaDatos.Rows[0]["USUARIO"].ToString());

                    //NuevaContraseña = CrearPassword(4);
                    //encriptar en = new encriptar();
                    //String strTextoEncriptado = en.EncriptarCadena(this.NuevaContraseña.Trim());
                    ////Title = Convert.ToString(TablaDatos.Rows.Count);
                    //Title = Convert.ToString(strTextoEncriptado.Trim());

                    ////if (TablaDatos.Rows.Count > 0)
                    ////{
                    //    mantenimientoTrabajador(hfId.Value, strTextoEncriptado.Trim(), "C");
                    //    _Utilitarios.EnvioCorreoRecuperacionCuenta("Recuperacion de cuenta (Administrador)", hfCorreo.Value.Trim(), CreateBody());
                    ////}

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

	private void mantenimientoTrabajador(string id, string contraseña, string operacion)
	{
		try
		{
			policia.clsaccesodatos servidor = new policia.clsaccesodatos();
			servidor.cadenaconexion = Ruta;
			if (servidor.abrirconexiontrans() == true)
			{
				servidor.ejecutar("[dbo].[_pa_mantenimiento_Personal]",
									false,
									id.Trim(),//1
									"",//2
									"",//3
									"",//4
									"",//5
									"",//6
									"",//7
									"",//8
									contraseña.Trim(),//9
									"",//10
									"",//11
									"",//12
									"",//13
                                    true,//14 -- Estado	
                                    1,//15 -- CodigoTP
                                    1,//16 -- CodigoA
									operacion,
									0, "");
				if (servidor.getRespuesta() == 1)
				{
					servidor.cerrarconexiontrans();
					__mensaje.Value = servidor.getMensaje();
					__pagina.Value = "recuperarAdministrador.aspx";
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

	protected void Page_Load(object sender, EventArgs e)
	{

	}
	protected void btnRecuperar_Click(object sender, EventArgs e)
	{
		//Title = Convert.ToString(se.DecryptKey(hfContraseña.Value));
		Lista_Datos("1", txtNroDcto.Text.Trim(), "");

        NuevaContraseña = CrearPassword(4);
        encriptar en = new encriptar();
        String strTextoEncriptado = en.EncriptarCadena(this.NuevaContraseña.Trim());
        //Title = Convert.ToString(TablaDatos.Rows.Count);
        //Title = Convert.ToString(strTextoEncriptado.Trim());

        if (TablaDatos.Rows.Count > 0)
        {
            mantenimientoTrabajador(hfId.Value, strTextoEncriptado.Trim(), "C");
            _Utilitarios.EnvioCorreoRecuperacionCuenta("Recuperacion de cuenta (Administrador)", hfCorreo.Value.Trim(), CreateBody());
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