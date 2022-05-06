using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;

public partial class Cliente_listarcolaboradores : System.Web.UI.Page
{

    private String Ruta = System.Configuration.ConfigurationManager.AppSettings.Get("CadenaConeccion");
    policia.clsaccesodatos servidor = new policia.clsaccesodatos();
    System.Web.UI.WebControls.TableRow tRow;
    Lista _Lista = new Lista();
    private void ListarColaboradores(String Nombre)
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
                DataTable dt = servidor.consultar("[dbo].[listarcolaboradores]", Nombre).Tables[0];
                if (dt.Rows.Count == 0)
                {
                    servidor.cerrarconexion();
                    this.__mensaje.Value = "No hay datos de Colaboradores para mostrar";
                    this.__pagina.Value = "";
                    //this.Nombre.Text = "";
                }
                else
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        tRow = new TableRow();
                        for (int j = 0; j < 10; j++)//Cabecera de la tabla
                        {
                            TableCell tCell = new TableCell();
                            switch (j)
                            {
                                case 0:
                                    System.Web.UI.WebControls.HyperLink hl = new System.Web.UI.WebControls.HyperLink();
                                    hl.ImageUrl = "~/imagenes/editar.png";
                                    hl.ForeColor = Color.Blue;
                                    hl.NavigateUrl = "registrarcolaborador.aspx?Codigo=" + dt.Rows[i]["ID"].ToString();
                                    hl.Text = "EDITAR";
                                    tCell.Controls.Add(hl);
                                    tCell.HorizontalAlign = HorizontalAlign.Center;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 1:
                                    tCell.Text = dt.Rows[i]["TIPO COLABORADOR"].ToString();
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 2:
                                    tCell.Text = dt.Rows[i]["NOMBRE"].ToString() + " " + dt.Rows[i]["APELLIDO PATERNO"].ToString() + " " + dt.Rows[i]["APELLIDO MATERNO"].ToString();
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 3:
                                    tCell.Text = dt.Rows[i]["NRO FIJO"].ToString();
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 4:
                                    tCell.Text = dt.Rows[i]["NRO CELULAR"].ToString();
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 5:
                                    tCell.Text = dt.Rows[i]["CORREO"].ToString();
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 6:
                                    tCell.Text = dt.Rows[i]["DIRECCION"].ToString();
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 7:
                                    if (Convert.ToBoolean(dt.Rows[i]["ESTADO"].ToString()) == true)
                                    {
                                        tCell.Text = "ACTIVO";
                                    }
                                    else
                                    {
                                        tCell.Text = "INACTIVO";
                                    }
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 8:
                                    System.Web.UI.WebControls.HyperLink chl = new System.Web.UI.WebControls.HyperLink();
                                    chl.Attributes.Add("onclick", "return Confirmar('¿Desea Eliminar Colaborador?');"); //se agrego el dia 08051017 - 20:28.
                                    chl.ImageUrl = "~/imagenes/eliminar.png";
                                    chl.NavigateUrl = "eliminarcolaborador.aspx?Codigo=" + dt.Rows[i]["ID"].ToString();
                                    tCell.Controls.Add(chl);
                                    tCell.HorizontalAlign = HorizontalAlign.Center;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 9:
                                    System.Web.UI.WebControls.HyperLink ch2 = new System.Web.UI.WebControls.HyperLink();
                                    ch2.Attributes.Add("onclick", "return Confirmar('¿Desea Crear Usurio?');"); //se agrego el dia 08051017 - 20:28.
                                    ch2.ImageUrl = "~/imagenes/user.gif";
                                    ch2.NavigateUrl = "usuario.aspx?Codigo=" + dt.Rows[i]["ID"].ToString() + "&Operacion=N";
                                    tCell.Controls.Add(ch2);
                                    tCell.HorizontalAlign = HorizontalAlign.Center;
                                    tRow.Cells.Add(tCell);
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

    protected void Page_Load(object sender, EventArgs e)
    {
        this.TableRow1.TableSection = TableRowSection.TableHeader;
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

        this.lblusurio.Text = "TIPO USUARIO : " + Datos[1] + "    " + "   USUARIO : " + Datos[2];

        this.__mensaje.Value = "";
        this.__pagina.Value = "";

        
        string NombreColaborador="";
        try
        {
            NombreColaborador = Request.QueryString.Get("NombreColaborador").Trim();
        }
        catch (Exception ex)
        {
            NombreColaborador = "";
        }

        this.Nombre.Text = NombreColaborador;
        this.Nombre.Focus();
        this.ListarColaboradores(NombreColaborador);        
        //_Lista.ShowMessage(__mensaje, __pagina, "", "");
    }


    protected void BuscarCliente_Click(object sender, EventArgs e)
    {
        _Lista.ShowMessage(__mensaje, __pagina, "", "");
        bool ok = this.Nombre.Text.Trim() != ",";
        if (ok == false)
        {
            //this.Nombre.Text = "";
            _Lista.ShowMessage(__mensaje, __pagina, "Complete datos formulario.\n\nIngrese Nombre por favor.", ""); this.Nombre.Focus();
            return;
        }

        //"restables.js" --> GENERA UNA "," AL FINAL DEL NOMBRE A BUSCAR (23-10-2019)
        string NombreColaborador = Nombre.Text.Trim();
        int posicion = NombreColaborador.IndexOf(',');
        NombreColaborador = NombreColaborador.Remove(posicion);
        Response.Redirect("listarcolaboradores.aspx?NombreColaborador=" + NombreColaborador);
        //Nombre.Text = NombreColaborador;
        //this.ListarColaboradores(Nombre.Text);

        
    }
    protected void Limpiar_Click(object sender, EventArgs e)
    {
        this.Nombre.Text = "";
        this.ListarColaboradores("");
    }
}