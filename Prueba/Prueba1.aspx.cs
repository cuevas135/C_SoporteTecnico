using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClosedXML.Excel;
using System.Data;
using System.IO;
using System.Configuration;

public partial class Prueba_Prueba1 : System.Web.UI.Page
{
    CsBDPasajesPrecios _CsBDPasajesPrecios = new CsBDPasajesPrecios();
    //CsControlAccesos _CsControlAccesos = new CsControlAccesos();
    //CsUtilitarios _CsUtilitarios = new CsUtilitarios();
    DataTable dtPrecios = new DataTable();
    private DataTable dtRegistrar = new DataTable();
    public void ListarPreciosFormato(string Opcion, string Origen, string Destino, string Servicio
       , string Canal, string FechaInial, string FechaFinal)
    {
        dtPrecios = _CsBDPasajesPrecios.ListarPreciosFormato(Opcion, Origen, Destino, Servicio, Canal, FechaInial, FechaFinal);
        int NroFilas = dtPrecios.Rows.Count;
        if (NroFilas == 0)
        {
            __mensaje.Value = _CsBDPasajesPrecios.ObtenerMensaje();
        }
        else
        {
            //dtPrecios.Columns.Remove("Id_precio");
            //dtPrecios.Columns.Remove("Codi_Sucursal");
            //dtPrecios.Columns.Remove("Codi_subruta");
            //dtPrecios.Columns.Remove("Id_precio");
            //dtPrecios.Columns.Remove("Id_precio");
            Excel();
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        __mensaje.Value = "";
        __pagina.Value = "";
        Limpiar();

        using (XLWorkbook wokbook = new XLWorkbook(FileUpload1.PostedFile.InputStream))
        {
            IXLWorksheet sheet = wokbook.Worksheet(1);

            bool firstRow = true;
            foreach (IXLRow row in sheet.Rows())
            {
                if (firstRow)
                {
                    foreach (IXLCell cell in row.Cells())
                    {
                        dtRegistrar.Columns.Add(cell.Value.ToString());
                    }
                    firstRow = false;
                }
                else
                {
                    dtRegistrar.Rows.Add();
                    int i = 0;
                    foreach (IXLCell cell in row.Cells())
                    {
                        dtRegistrar.Rows[dtRegistrar.Rows.Count - 1][i] = cell.Value.ToString();
                        i++;
                    }
                }
              
            }
            gvReporte.DataSource = dtRegistrar;
            gvReporte.DataBind();

            //GridView1.DataSource = dtRegistrar;
            //GridView1.DataBind();
            //dtRegistrar.Dispose();
            btnRegistrar.Visible = true;
        }
    }

    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        __mensaje.Value = "";
        __pagina.Value = "";

        //int Id_Precios_Fecha;
        //string Canal;
        //string Nacionalidad;
        //double Precio_Nor;
        //double Precio_Min;
        //double Precio_Max;
        //string Nivel;
        //DateTime Fecha;
        //string Hora;
        //string fecha2;

        try
        {
            //__mensaje.Value = Convert.ToString( gvReporte.Rows.Count);
            //Mantenimiento(680, "VENTANILLA", "GENERAL", 40, 20
            //      , 20, '2', Convert.ToDateTime("26/11/2022"), "null", "null", "N");

            //_CsBDPasajesPrecios.Mantenimiento(596, "VENTANILLA", "GENERAL", 20, 20
            //       , 20, '1', Convert.ToDateTime("25/11/2022"), "", "", "N");
            //if (_CsBDPasajesPrecios.ObtenerRespuesta() == 1)
            //{
            //    __mensaje.Value = _CsBDPasajesPrecios.ObtenerMensaje();
            //    __pagina.Value = "BdPsjePrecios.aspx";
            //}
            //else
            //{
            //    __mensaje.Value = _CsBDPasajesPrecios.ObtenerMensaje();
            //    __pagina.Value = "";
            //}


            ////__mensaje.Value = Convert.ToString(GridView1.Rows.Count);
            foreach (GridViewRow gvrow in gvReporte.Rows)
            {

                int Id_Precios_Fecha = Convert.ToInt32(gvReporte.DataKeys[gvrow.RowIndex].Value);
                string Canal = gvrow.Cells[5].Text;
                string Nacionalidad = gvrow.Cells[6].Text;
                double Precio_Nor = Convert.ToDouble(gvrow.Cells[7].Text);
                double Precio_Min = Convert.ToDouble(gvrow.Cells[8].Text);
                double Precio_Max = Convert.ToDouble(gvrow.Cells[9].Text);
                string Nivel = gvrow.Cells[4].Text;
                DateTime Fecha = Convert.ToDateTime(gvrow.Cells[10].Text);
                string Hora = gvrow.Cells[11].Text.Trim();
                string fecha2 = "";

                if (Canal != "")
                {
                    if (Hora == "&nbsp;")
                    {
                        Hora = "";
                    }
                    _CsBDPasajesPrecios.Mantenimiento(Id_Precios_Fecha, Canal, Nacionalidad, Precio_Nor, Precio_Min
                   , Precio_Max, Nivel, Fecha, Hora, fecha2, "N");
                }

                if (_CsBDPasajesPrecios.ObtenerRespuesta() == 1)
                {
                    // servidor.cerrarconexiontrans();
                    __mensaje.Value = _CsBDPasajesPrecios.ObtenerMensaje();
                    __pagina.Value = "BdPsjePrecios.aspx";
                }
                else
                {
                    // servidor.cancelarconexiontrans();
                    __mensaje.Value = _CsBDPasajesPrecios.ObtenerMensaje();
                    __pagina.Value = "";
                }

                //__mensaje.Value = gvrow.Cells[12].Text;
            }

        }
        catch (Exception ex)
        {
            __mensaje.Value = ex.Message.ToString();
            //throw;
        }
       

        ////__mensaje.Value = Convert.ToString( dtRegistrar.Rows.Count);
        //if (dtRegistrar.Rows.Count == 0)
        //{
        //    //__mensaje.Value = Convert.ToString(dtRegistrar.Rows.Count);
        //    //__mensaje.Value = Convert.ToString(dtPrecios.Rows.Count);
        //    ////_CsUtilitarios.MensajeValidaciones("No hay datos para registrar", this);
        //    __mensaje.Value = "Vuelva a cargar Excel registrar" + Convert.ToString(dtRegistrar.Rows.Count)
        //      + "  precios - "+ Convert.ToString(dtPrecios.Rows.Count);
        //    //return;
        //}
        //////else
        //////{
        //for (int i = 0; i <= dtRegistrar.Rows.Count - 1; i++)
        //{
        //    //Id_Precios_Fecha = Convert.ToInt32(dtRegistrar.Rows[i]["Id_Precios_Fecha"].ToString());
        //    //Canal = dtRegistrar.Rows[i]["CANAL"].ToString();
        //    //Nacionalidad = dtRegistrar.Rows[i]["NACIONALIDAD"].ToString();
        //    //Precio_Nor = Convert.ToDouble(dtRegistrar.Rows[i]["Precio_Nor"].ToString());
        //    //Precio_Min = Convert.ToDouble(dtRegistrar.Rows[i]["Precio_Nor"].ToString());
        //    //Precio_Max = Convert.ToDouble(dtRegistrar.Rows[i]["Precio_Max"].ToString());
        //    //Nivel = dtRegistrar.Rows[i]["Nivel"].ToString();
        //    //Fecha = Convert.ToDateTime(dtRegistrar.Rows[i]["Fecha"].ToString());
        //    //Hora = dtRegistrar.Rows[i]["Hora"].ToString();
        //    //fecha2 = dtRegistrar.Rows[i]["fecha2"].ToString();

        //    //_CsBDPasajesPrecios.Mantenimiento(
        //    //    Convert.ToInt32(dtRegistrar.Rows[i]["Id_Precios_Fecha"].ToString()),
        //    //    dtRegistrar.Rows[i]["CANAL"].ToString(),
        //    //    dtRegistrar.Rows[i]["NACIONALIDAD"].ToString(),
        //    //    Convert.ToDouble(dtRegistrar.Rows[i]["Precio_Nor"].ToString()),
        //    //    Convert.ToDouble(dtRegistrar.Rows[i]["Precio_Min"].ToString()),
        //    //    Convert.ToDouble(dtRegistrar.Rows[i]["Precio_Max"].ToString()),
        //    //    dtRegistrar.Rows[i]["Nivel"].ToString(),
        //    //    Convert.ToDateTime(dtRegistrar.Rows[i]["Fecha"].ToString()),
        //    //    dtRegistrar.Rows[i]["Hora"].ToString(),
        //    //    dtRegistrar.Rows[i]["fecha2"].ToString(), 
        //    //    "N");

        //    _CsBDPasajesPrecios.Mantenimiento(
        //        Convert.ToInt32(dtRegistrar.Rows[i].ItemArray[0].ToString()),//Id_Precios_Fecha
        //        dtRegistrar.Rows[i].ItemArray[5].ToString(),//CANAL
        //        dtRegistrar.Rows[i].ItemArray[6].ToString(),//NACIONALIDAD
        //        Convert.ToDouble(dtRegistrar.Rows[i].ItemArray[7].ToString()),//Precio_Nor
        //        Convert.ToDouble(dtRegistrar.Rows[i].ItemArray[8].ToString()),//Precio_Min
        //        Convert.ToDouble(dtRegistrar.Rows[i].ItemArray[9].ToString()),//Precio_Max
        //        dtRegistrar.Rows[i].ItemArray[4].ToString(),//Nivel
        //       Convert.ToDateTime("25/11/2022"),
        //       //Convert.ToString(Convert.ToDateTime(dtRegistrar.Rows[i].ItemArray[10]).ToString("dd/MM/yyyy")),//Fecha
        //        dtRegistrar.Rows[i].ItemArray[11].ToString(),//Hora
        //        dtRegistrar.Rows[i].ItemArray[12].ToString(),//fecha2
        //        "N");

        //    __mensaje.Value = dtRegistrar.Rows[i].ItemArray[11].ToString();
        //    if (_CsBDPasajesPrecios.ObtenerRespuesta() == 1)
        //    {
        //        // servidor.cerrarconexiontrans();
        //        __mensaje.Value = _CsBDPasajesPrecios.ObtenerMensaje();
        //        __pagina.Value = "BdPsjePrecios.aspx";
        //    }
        //    else
        //    {
        //        // servidor.cancelarconexiontrans();
        //        __mensaje.Value = _CsBDPasajesPrecios.ObtenerMensaje();
        //        __pagina.Value = "";
        //    }
        //}

        //__mensaje.Value = "Vuelva a cargar Excel registrar..." + Convert.ToString(dtRegistrar.Rows.Count)
        //      + "  precios - " + Convert.ToString(dtPrecios.Rows.Count);
        ////}

        //GridView1.DataSource = null;
        //dtRegistrar.Clear();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
         Mantenimiento(680, "VENTANILLA", "GENERAL", 40, 20
                  , 20, '2', Convert.ToDateTime("26/11/2022"), "null", "null", "e");
    }
    private void Excel()
    {
        //DataTable dt = new DataTable("GridView_Data");
        //foreach (TableCell cell in GridView1.HeaderRow.Cells)
        //{
        //    dt.Columns.Add(cell.Text);
        //}
        //foreach (GridViewRow row in GridView1.Rows)
        //{
        //    dt.Rows.Add();
        //    for (int i = 0; i < row.Cells.Count; i++)
        //    {
        //        dt.Rows[dt.Rows.Count - 1][i] = row.Cells[i].Text;
        //    }
        //}
        using (XLWorkbook wb = new XLWorkbook())
        {
            wb.Worksheets.Add(dtPrecios);

            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            Response.AddHeader("content-disposition", "attachment;filename=formatoPrecios.xlsx");

            using (MemoryStream MyMemoryStream = new MemoryStream())
            {
                wb.SaveAs(MyMemoryStream);
                MyMemoryStream.WriteTo(Response.OutputStream);
                Response.Flush();
                Response.End();
            }
        }
    }

    protected void lbtnDescargarExcel_Click(object sender, EventArgs e)
    {
        ListarPreciosFormato("1", "", "", "", "", "", "");
    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Limpiar();
    }

    void Limpiar()
    {
        __mensaje.Value = "";
        __pagina.Value = "";

        //Response.Redirect("_AsistenciasCargar.aspx");
        GridView1.DataSource = null;
        //GridView1.Columns.Clear();
        GridView1.DataBind();
        dtPrecios.Clear();
        dtPrecios.Dispose();
        dtRegistrar.Clear();
        dtRegistrar.Dispose();

        btnRegistrar.Visible = false;

    }

    private readonly string Ruta = ConfigurationManager.AppSettings.Get("CadenaConeccion2");
    policia.clsaccesodatos servidor = new policia.clsaccesodatos();
    public void Mantenimiento(int Id_Precios_Fecha, string Canal, string Nacionalidad, double Precio_Nor
      , double Precio_Min, double Precio_Max, char Nivel1, DateTime Fecha, string Hora, string fecha2
      , string Operacion)
    {
       
        servidor.cadenaconexion = Ruta;
        try
        {
            if (servidor.abrirconexiontrans() == true)
            {
                servidor.ejecutar("[dbo].[BD_Pje_PaMantenimiento_Precios]",
                                        false,
                                        596,
                                        "VENTANILLA",
                                        "GENERAL",
                                        30,
                                        30,
                                        30,
                                        '1',
                                        "25/11/2022",
                                         "",
                                        "",
                                        Operacion,
                                        0, "");

                ////OBTENER CODIGO DE RESPUESTA
                //Respuesta = servidor.getRespuesta();
                ////=============================================

                if (servidor.getRespuesta() == 1)
                {
                    servidor.cerrarconexiontrans();
                    __mensaje.Value = servidor.getMensaje();
                    //Pagina = "";
                }
                else
                {
                    servidor.cancelarconexiontrans();
                    __mensaje.Value = servidor.getMensaje();
                    //Pagina = "";
                }
            }
            else
            {
                servidor.cancelarconexiontrans();
                __mensaje.Value = servidor.getMensageError();
                //Pagina = "";
            }
        }
        catch (Exception ex)
        {
            ////CODIGO DE RESPUESTA  DE ERROR
            //Respuesta = 999;
            ////=============================================
            servidor.cerrarconexion();
            __mensaje.Value = servidor.getMensageError() + " " + (ex.Message.ToString());
        }
    }

   
}