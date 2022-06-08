using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;

public partial class Cliente_asignarincidentecolaborador : System.Web.UI.Page
{
    private String Ruta = System.Configuration.ConfigurationManager.AppSettings.Get("CadenaConeccion");
    policia.clsaccesodatos servidor = new policia.clsaccesodatos();
    System.Web.UI.WebControls.TableRow tRow;
    Lista _Lista = new Lista();

    int CODIGO_USUARIO = 0;

    private void listarasignarincidentetecnico(string _AREA_, int _CODIGOUSUARIO_)
    {


        __mensaje.Value = "";
        __pagina.Value = "";
        for (int i = 1; i < Table_.Rows.Count; i++)
        {
            Table_.Rows[i].Cells.Clear();
        }

        try
        {
            policia.clsaccesodatos servidor = new policia.clsaccesodatos();
            servidor.cadenaconexion = Ruta;
            if (servidor.abrirconexion() == true)
            {
                DataTable dt = servidor.consultar("[dbo].[listarasignarincidentetecnico]", _AREA_, _CODIGOUSUARIO_).Tables[0];
                if (dt.Rows.Count == 0)
                {
                    servidor.cerrarconexion();
                    __mensaje.Value = "No hay datos de Tickets / Incidentes para mostrar";
                    __pagina.Value = "";
                    //this.Nombre.Text = "";
                }
                else
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        tRow = new TableRow();
                        for (int j = 0; j < 11; j++)//Cabecera de la tabla
                        {
                            TableCell tCell = new TableCell();
                            switch (j)
                            {
                                case 0:
                                    tCell.Text = dt.Rows[i]["NRO TICKET"].ToString();
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 1:
                                    tCell.Text = dt.Rows[i]["IDUSUARIO"].ToString();
                                    tCell.Visible = false;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 2:
                                    tCell.Text = dt.Rows[i]["COLABORADOR"].ToString();
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 3:
                                    tCell.Text = dt.Rows[i]["FECHA EMISON"].ToString();
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 4:
                                    tCell.Text = dt.Rows[i]["CANAL"].ToString();
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 5:
                                    tCell.Text = dt.Rows[i]["AREA"].ToString();
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 6:
                                    tCell.Text = dt.Rows[i]["INCIDENTE"].ToString();
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 7:
                                    tCell.Text = dt.Rows[i]["PRIORIDAD"].ToString();
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 8:
                                    tCell.Text = dt.Rows[i]["IMPACTO"].ToString();
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 9:
                                    string et = dt.Rows[i]["ESTADO TICKET"].ToString().Trim();
                                    tCell.Text = et;
                                    if (et.Equals("ABIERTO"))
                                    {
                                        tCell.ForeColor = Color.Green;
                                        
                                    }
                                    if (et.Equals("ASIGNADO"))
                                    {
                                        tCell.ForeColor = Color.Blue;

                                    }
                                    tCell.Font.Bold = true;
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 10:
                                    System.Web.UI.WebControls.HyperLink hl = new System.Web.UI.WebControls.HyperLink();
                                    //hl.ImageUrl = "~/imagenes/editar.png";
                                    hl.ForeColor = Color.Blue;
                                    hl.NavigateUrl = "asignaincidentetecnico.aspx?Codigo=" + dt.Rows[i]["IDTIKET"].ToString() + "&Operacion=N";
                                    hl.Text = "TECNICO";
                                    tCell.Controls.Add(hl);
                                    tCell.HorizontalAlign = HorizontalAlign.Center;
                                    tRow.Cells.Add(tCell);
                                    break;


                            }
                        }

                        Table_.Rows.Add(tRow);
                    }
                    servidor.cerrarconexion();
                }
            }
            else
            {
                servidor.cerrarconexion();
                __mensaje.Value = servidor.getMensageError();
                __pagina.Value = "CerrarSession.aspx";
            }

        }
        catch (Exception)
        {
            __mensaje.Value = "Error inesperado al intentar conectarnos con el servidor.";
            __pagina.Value = "CerrarSession.aspx";
        }
    }

    private void ObtenerArea()
    {
        try
        {
            servidor.cadenaconexion = Ruta;
            if (servidor.abrirconexion() == true)
            {
                System.Data.DataTable dt = servidor.consultar("[dbo].[_pr_ObtenerArea]").Tables[0];
                if (dt.Rows.Count == 0)
                {
                    servidor.cerrarconexion();
                    _Lista.ShowMessage(__mensaje, __pagina, "Error, al intentar recuperar datos.", "CerrarSession.aspx");
                }
                else
                {
                    AREA.DataSource = dt;
                    AREA.DataTextField = "NOMBRE";
                    AREA.DataValueField = "CODIGO";
                    AREA.DataBind();
                    servidor.cerrarconexion();
                }
            }
            else
            {
                servidor.cerrarconexion();
                _Lista.ShowMessage(__mensaje, __pagina, servidor.getMensageError(), "CerrarSession.aspx");
            }
        }
        catch (Exception)
        {
            servidor.cerrarconexion();
            _Lista.ShowMessage(__mensaje, __pagina, "Error inesperado al intentar conectarnos con el servidor.", "CerrarSession.aspx");
        }
    }
        
    protected void Page_init(object sender, EventArgs e)
    {
        //=============================================================================================================
        //Verificamos si el usuario ha iniciado sesion.
        __mensaje.Value = "";
        __pagina.Value = "";
        string[] Datos = (string[])Session["__JSAR__"];
        if (Datos == null)
        {
            __mensaje.Value = "Ud. no esta autorizado para ingresar a esta página, inicie sesion por favor.";
            __pagina.Value = "../CerrarSession.aspx";
            return;
        }
        //=============================================================================================================

        //CAPTURAMOS EL CODIGO DEL USUARIO QUE INICIO SESION.
        CODIGO_USUARIO = Convert.ToInt32(Datos[0]);

        ObtenerArea();
        listarasignarincidentetecnico("", CODIGO_USUARIO);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        TableRow1.TableSection = TableRowSection.TableHeader;
    }

   
    protected void BuscarTicketsIncidente_Click(object sender, EventArgs e)
    {
        _Lista.ShowMessage(__mensaje, __pagina, "", "");
       
        String area_ = "";
        if (AREA.SelectedIndex > 0)
        {
            area_ = AREA.Items[AREA.SelectedIndex].Text.Trim();
        }

        listarasignarincidentetecnico(area_, CODIGO_USUARIO);
    }
}