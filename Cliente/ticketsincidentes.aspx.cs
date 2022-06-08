using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;

public partial class Cliente_ticketsincidentes : System.Web.UI.Page
{
    private String Ruta = System.Configuration.ConfigurationManager.AppSettings.Get("CadenaConeccion");
    policia.clsaccesodatos servidor = new policia.clsaccesodatos();
    System.Web.UI.WebControls.TableRow tRow;
    Lista _Lista = new Lista();

    int CODIGO_USUARIO = 0;


    private void listarticketsincidentes(string _CANAL_, string _AREA_, string _PRIRIDAD_, string _IMPACTO_, string _FECHAINICIO_, string _FECHAFIN_, int _CODIGOUSUARIO_)
    {


        this.__mensaje.Value = "";
        this.__pagina.Value = "";
        for (int i = 1; i < this.Table_.Rows.Count; i++)
        {
            this.Table_.Rows[i].Cells.Clear();
        }

        try
        {
            policia.clsaccesodatos servidor = new policia.clsaccesodatos();
            servidor.cadenaconexion = Ruta;
            if (servidor.abrirconexion() == true)
            {
                DataTable dt = servidor.consultar("[dbo].[listarticketsincidentes]", _CANAL_, _AREA_, _PRIRIDAD_, _IMPACTO_, _FECHAINICIO_, _FECHAFIN_, _CODIGOUSUARIO_).Tables[0];
                if (dt.Rows.Count == 0)
                {
                    servidor.cerrarconexion();
                    this.__mensaje.Value = "No hay datos de Tickets / Incidentes para mostrar";
                    this.__pagina.Value = "";
                    //this.Nombre.Text = "";
                }
                else
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        tRow = new TableRow();
                        for (int j = 0; j < 14; j++)//Cabecera de la tabla
                        {
                            TableCell tCell = new TableCell();
                            switch (j)
                            {
                                case 0:
                                    System.Web.UI.WebControls.HyperLink hl = new System.Web.UI.WebControls.HyperLink();
                                    hl.ImageUrl = "~/imagenes/editar.png";
                                    hl.ForeColor = Color.Blue;
                                    hl.NavigateUrl = "ticketincidente.aspx?CodigoT=" + dt.Rows[i]["IDTIKET"].ToString();
                                    hl.Text = "EDITAR";
                                    tCell.Controls.Add(hl);
                                    tCell.HorizontalAlign = HorizontalAlign.Center;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 1:
                                    tCell.Text = dt.Rows[i]["NRO TICKET"].ToString();
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 2:
                                    tCell.Text = dt.Rows[i]["IDUSUARIO"].ToString();
                                    tCell.Visible = false;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 3:
                                    tCell.Text = dt.Rows[i]["COLABORADOR"].ToString();
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 4:
                                    tCell.Text = dt.Rows[i]["FECHA EMISON"].ToString();
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 5:
                                    tCell.Text = dt.Rows[i]["CANAL"].ToString();
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 6:
                                    tCell.Text = dt.Rows[i]["AREA"].ToString();
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 7:
                                    tCell.Text = dt.Rows[i]["INCIDENTE"].ToString();
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 8:
                                    tCell.Text = dt.Rows[i]["PRIORIDAD"].ToString();
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 9:
                                    tCell.Text = dt.Rows[i]["IMPACTO"].ToString();
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 10:
                                    string et =  dt.Rows[i]["ESTADO TICKET"].ToString();
                                    tCell.Font.Bold=true;
                                    tCell.Text = et;
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 11:
                                    et = dt.Rows[i]["ESTADO TICKET"].ToString();
                                    if (et.Trim() != "SOLUCIONADO" && et.Trim() != "ASIGNADO" && et.Trim() != "EN PRROCESO" && et.Trim() != "CERRADO")
                                    {
                                        System.Web.UI.WebControls.HyperLink chl = new System.Web.UI.WebControls.HyperLink();
                                        chl.Attributes.Add("onclick", "return Confirmar('¿Desea Eliminar Ticket Incidencia?');"); //se agrego el dia 08051017 - 20:28.
                                        chl.ImageUrl = "~/imagenes/eliminar.png";
                                        chl.NavigateUrl = "eliminarticketincidente.aspx?Codigo=" + dt.Rows[i]["IDTIKET"].ToString();
                                        tCell.Controls.Add(chl);
                                        tCell.HorizontalAlign = HorizontalAlign.Center;
                                        tRow.Cells.Add(tCell);
                                    }
                                    else
                                    {
                                        tCell.Text = "";
                                        tRow.Cells.Add(tCell);
                                    }
                                    break;

                                case 12:
                                    et = dt.Rows[i]["ESTADO TICKET"].ToString();
                                    if (et.Trim() != "SOLUCIONADO" && et.Trim() != "ASIGNADO" && et.Trim() != "EN PRROCESO" && et.Trim() != "CERRADO")
                                    {
                                        System.Web.UI.WebControls.HyperLink chl = new System.Web.UI.WebControls.HyperLink();
                                        chl.Attributes.Add("onclick", "return Confirmar('¿Desea Cancelar Ticket Incidencia?');"); //se agrego el dia 08051017 - 20:28.
                                        chl.ImageUrl = "~/imagenes/delete.png";
                                        chl.NavigateUrl = "cancelarticketincidente.aspx?Codigo=" + dt.Rows[i]["IDTIKET"].ToString();
                                        tCell.Controls.Add(chl);
                                        tCell.HorizontalAlign = HorizontalAlign.Center;
                                        tRow.Cells.Add(tCell);
                                    }
                                    else
                                    {
                                        tCell.Text = "";
                                        tRow.Cells.Add(tCell);
                                    }
                                    break;


                                case 13:
                                    et = dt.Rows[i]["ESTADO TICKET"].ToString();
                                    if (et.Trim() != "ASIGNADO" && et.Trim() != "EN PRROCESO" && et.Trim() != "ABIERTO" && et.Trim() != "CERRADO")
                                    {
                                        System.Web.UI.WebControls.HyperLink chl_CERRAR = new System.Web.UI.WebControls.HyperLink();
                                        chl_CERRAR.Attributes.Add("onclick", "return Confirmar('¿Desea Cerrar Ticket Incidencia?');"); //se agrego el dia 08051017 - 20:28.
                                        chl_CERRAR.ImageUrl = "~/imagenes/trash.gif";
                                        chl_CERRAR.NavigateUrl = "cerrarincidente.aspx?Codigo=" + dt.Rows[i]["IDTIKET"].ToString();
                                        tCell.Controls.Add(chl_CERRAR);
                                        tCell.HorizontalAlign = HorizontalAlign.Center;
                                        tRow.Cells.Add(tCell);
                                    }
                                    break;

                               
                            }
                        }

                        this.Table_.Rows.Add(tRow);
                    }
                    servidor.cerrarconexion();
                }
            }
            else
            {
                servidor.cerrarconexion();
                this.__mensaje.Value = servidor.getMensageError();
                this.__pagina.Value = "CerrarSession.aspx";
            }

        }
        catch (Exception)
        {
            this.__mensaje.Value = "Error inesperado al intentar conectarnos con el servidor.";
            this.__pagina.Value = "CerrarSession.aspx";
        }
    }

    private void ObtenerCanales()
    {
        try
        {
            servidor.cadenaconexion = Ruta;
            if (servidor.abrirconexion() == true)
            {
                System.Data.DataTable dt = servidor.consultar("[dbo].[_pr_ObtenerCanales]").Tables[0];
                if (dt.Rows.Count == 0)
                {
                    servidor.cerrarconexion();
                    _Lista.ShowMessage(__mensaje, __pagina, "Error, al intentar recuperar datos.", "CerrarSession.aspx");
                }
                else
                {
                    this.CANAL.DataSource = dt;
                    this.CANAL.DataTextField = "NOMBRE";
                    this.CANAL.DataValueField = "CODIGO";
                    this.CANAL.DataBind();
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
                    this.AREA.DataSource = dt;
                    this.AREA.DataTextField = "NOMBRE";
                    this.AREA.DataValueField = "CODIGO";
                    this.AREA.DataBind();
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

    private void ObtenerPrioridad()
    {
        try
        {
            servidor.cadenaconexion = Ruta;
            if (servidor.abrirconexion() == true)
            {
                System.Data.DataTable dt = servidor.consultar("[dbo].[_pr_ObtenerPrioridad]").Tables[0];
                if (dt.Rows.Count == 0)
                {
                    servidor.cerrarconexion();
                    _Lista.ShowMessage(__mensaje, __pagina, "Error, al intentar recuperar datos.", "CerrarSession.aspx");
                }
                else
                {
                    this.PRIORIDAD.DataSource = dt;
                    this.PRIORIDAD.DataTextField = "NOMBRE";
                    this.PRIORIDAD.DataValueField = "CODIGO";
                    this.PRIORIDAD.DataBind();
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

    private void ObtenerImpacto()
    {
        try
        {
            servidor.cadenaconexion = Ruta;
            if (servidor.abrirconexion() == true)
            {
                System.Data.DataTable dt = servidor.consultar("[dbo].[_pr_ObtenerImpacto]").Tables[0];
                if (dt.Rows.Count == 0)
                {
                    servidor.cerrarconexion();
                    _Lista.ShowMessage(__mensaje, __pagina, "Error, al intentar recuperar datos.", "CerrarSession.aspx");
                }
                else
                {
                    this.IMPACTO.DataSource = dt;
                    this.IMPACTO.DataTextField = "NOMBRE";
                    this.IMPACTO.DataValueField = "CODIGO";
                    this.IMPACTO.DataBind();
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

        //CAPTURAMOS EL CODIGO DEL USUARIO QUE INICIO SESION.
        CODIGO_USUARIO = Convert.ToInt32(Datos[0]); 
        
        this.ObtenerCanales();
        this.ObtenerArea();
        this.ObtenerPrioridad();
        this.ObtenerImpacto();

        //CONSULTAMOS INFORMACION SOLO CON EL USUARIO QUE INICIO SESION.
        this.listarticketsincidentes("", "", "", "", "", "", CODIGO_USUARIO);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        this.TableRow1.TableSection = TableRowSection.TableHeader;
    }
    
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void BuscarTicketsIncidente_Click(object sender, EventArgs e)
    {
        _Lista.ShowMessage(__mensaje, __pagina, "", "");
        
        String canal_ = "";
        if (this.CANAL.SelectedIndex > 0)
        {
            canal_ = this.CANAL.Items[this.CANAL.SelectedIndex].Text.Trim();
        }
        String area_ = "";
        if (this.AREA.SelectedIndex > 0)
        {
            area_ = this.AREA.Items[this.AREA.SelectedIndex].Text.Trim();
        }
        String prioridad_ = "";
        if (this.PRIORIDAD.SelectedIndex > 0)
        {
            prioridad_ = this.PRIORIDAD.Items[this.PRIORIDAD.SelectedIndex].Text.Trim();
        }
        String impacto_ = "";
        if (this.IMPACTO.SelectedIndex > 0)
        {
            impacto_ = this.IMPACTO.Items[this.IMPACTO.SelectedIndex].Text.Trim();
        }

        string fi;
        string ff;

       
        fi = this.FechaInicio.Text.Trim();
        ff = this.FechaFin.Text.Trim();

        if (fi == "" && ff != "")
        {
            _Lista.ShowMessage(__mensaje, __pagina, "Ingrese Fecha Inicio", "");
            return;
        }

        if (fi != "" && ff == "")
        {
            _Lista.ShowMessage(__mensaje, __pagina, "Ingrese Fecha Fin", "");
            return;
        }

        if (fi != "" && ff != "")
        {
            if (!(Convert.ToDateTime(fi) <= Convert.ToDateTime(ff)))
            {
                _Lista.ShowMessage(__mensaje, __pagina, "Fecha inicio debe ser menor a la Fecha Fin", "");
                return;

            }
            else
            {
                fi = Convert.ToDateTime(fi).Month.ToString() + "-" + Convert.ToDateTime(fi).Day.ToString() + "-" + Convert.ToDateTime(fi).Year.ToString();

                DateTime _ff = Convert.ToDateTime(ff).AddDays(1);
                ff = Convert.ToDateTime(_ff).Month.ToString() + "-" + Convert.ToDateTime(_ff).Day.ToString() + "-" + Convert.ToDateTime(_ff).Year.ToString();
            }
        }



        listarticketsincidentes(canal_, area_, prioridad_, impacto_, fi.Trim(), ff.Trim(), CODIGO_USUARIO);
    }

    protected void hlnuevo_Click(object sender, EventArgs e)
    {

    }
}