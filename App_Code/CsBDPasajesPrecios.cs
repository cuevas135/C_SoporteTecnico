using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;

/// <summary>
/// Descripción breve de CsBDPasajesPrecios
/// </summary>
public class CsBDPasajesPrecios
{
    public CsBDPasajesPrecios()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }


    private readonly string Ruta = ConfigurationManager.AppSettings.Get("CadenaConeccion2");
    private string Mensaje;
    private string Pagina;
    private int Respuesta;
    public int ObtenerRespuesta()
    { return Respuesta; }
    public string ObtenerMensaje()
    { return Mensaje; }

    public string ObtenerPagina()
    { return Pagina; }


    public DataTable ListarPreciosFormato(string Opcion, string Origen, string Destino, string Servicio
        , string Canal, string FechaInial, string FechaFinal)
    {
        DataTable dt = null;
        policia.clsaccesodatos servidor = new policia.clsaccesodatos
        {
            cadenaconexion = Ruta
        };
        try
        {
            if (servidor.abrirconexion() == true)
            {
                dt = servidor.consultar("[dbo].[BD_Pje_Listar_Precios]"
                    , Opcion, Origen, Destino, Servicio, Canal, FechaInial, FechaFinal).Tables[0];
                if (dt.Rows.Count == 0)
                {
                    //dt = null;
                    servidor.cerrarconexion();
                    Mensaje = "No hay registros para mostrar";
                    //Pagina = "";
                }
                else
                {
                    servidor.cerrarconexion();
                }
            }
            else
            {
                //dt = null;
                servidor.cerrarconexion();
                Mensaje = servidor.getMensageError();
                //Pagina = "../CerrarSession.aspx";
            }

        }
        catch (Exception e)
        {
            //CODIGO DE RESPUESTA  DE ERROR
            //Respuesta = 999;
            //=============================================
            servidor.cerrarconexion();
            Mensaje = servidor.getMensageError() + (e);
        }
        return (dt);
    }

    public void Mantenimiento(int Id_Precios_Fecha, string Canal, string Nacionalidad, double Precio_Nor
        , double Precio_Min, double Precio_Max, string Nivel, DateTime Fecha, string Hora, string fecha2
        , string Operacion)
    {
        policia.clsaccesodatos servidor = new policia.clsaccesodatos();
        servidor.cadenaconexion = Ruta;
        try
        {
            if (servidor.abrirconexiontrans() == true)
            {
                servidor.ejecutar("[dbo].[BD_Pje_PaMantenimiento_Precios]",
                                        false,
                                        Id_Precios_Fecha,
                                        Canal.Trim(),
                                        Nacionalidad.Trim(),
                                        Precio_Nor,
                                        Precio_Min,
                                        Precio_Max,
                                        Nivel,
                                        Fecha,
                                        Hora.Trim(),
                                        fecha2.Trim(),
                                        Operacion,
                                        0, "");

                //OBTENER CODIGO DE RESPUESTA
                Respuesta = servidor.getRespuesta();
                //=============================================

                if (servidor.getRespuesta() == 1)
                {
                    servidor.cerrarconexiontrans();
                    Mensaje = servidor.getMensaje();
                    //Pagina = "";
                }
                else
                {
                    servidor.cancelarconexiontrans();
                    Mensaje = servidor.getMensaje();
                    //Pagina = "";
                }
            }
            else
            {
                servidor.cancelarconexiontrans();
                Mensaje = servidor.getMensageError();
                //Pagina = "";
            }
        }
        catch (Exception e)
        {
            //CODIGO DE RESPUESTA  DE ERROR
            Respuesta = 999;
            //=============================================
            servidor.cerrarconexion();
            Mensaje = servidor.getMensageError() + (e);
        }
    }

}