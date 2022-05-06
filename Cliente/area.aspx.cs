using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cliente_area : System.Web.UI.Page
{
    private String Ruta = System.Configuration.ConfigurationManager.AppSettings.Get("CadenaConeccion");
    System.Web.UI.WebControls.TableRow tRow;
    policia.clsaccesodatos servidor = new policia.clsaccesodatos();
    Lista _Lista = new Lista();

    private void oculta(bool ok)
    {
        this.btnModificar.Visible = ok;
        this.btnEliminar.Visible = ok;
        //this.btnCancelar.Visible = ok;
    }

    private void ObtenerCargo()
    {
        try
        {
            servidor.cadenaconexion = Ruta;
            if (servidor.abrirconexion() == true)
            {
                System.Data.DataTable dt = servidor.consultar("[dbo].[_pr_ObtenerCargo]").Tables[0];
                if (dt.Rows.Count == 0)
                {
                    servidor.cerrarconexion();
                    _Lista.ShowMessage(__mensaje, __pagina, "Error, al intentar recuperar datos.", "CerrarSession.aspx");
                }
                else
                {
                    this.CARGO.DataSource = dt;
                    this.CARGO.DataTextField = "NOMBRE";
                    this.CARGO.DataValueField = "CODIGO";
                    this.CARGO.DataBind();
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

    private void listarcargos()
    {
        this.__mensaje.Value = "";

        this.__pagina.Value = "";

        for (int i = 1; i < this.Tableareas.Rows.Count; i++)
        {
            this.Tableareas.Rows[i].Cells.Clear();
        }

        try
        {
            policia.clsaccesodatos servidor = new policia.clsaccesodatos();

            servidor.cadenaconexion = Ruta;

            if (servidor.abrirconexion() == true)
            {
                System.Data.DataTable dt = servidor.consultar("[dbo].[listarareas]").Tables[0];

                if (dt.Rows.Count == 0)
                {
                    servidor.cerrarconexion();

                    _Lista.ShowMessage(__mensaje, __pagina, "No hay areas para mostrar.", "");
                }
                else
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        tRow = new TableRow();

                        for (int j = 0; j < 4; j++)//Cabecera de la tabla
                        {
                            TableCell tCell = new TableCell();

                            switch (j)
                            {
                                case 0:

                                    tCell.Text = dt.Rows[i]["ID"].ToString();

                                    tCell.Visible = false;

                                    tRow.Cells.Add(tCell);

                                    break;

                                case 1:

                                    tCell.Text = dt.Rows[i]["AREA"].ToString();

                                    tCell.Visible = true;

                                    tRow.Cells.Add(tCell);

                                    break;

                                case 2:

                                    tCell.Text = dt.Rows[i]["CARGO"].ToString();

                                    tCell.Visible = true;

                                    tRow.Cells.Add(tCell);

                                    break;

                                case 3:

                                    System.Web.UI.WebControls.LinkButton b = new System.Web.UI.WebControls.LinkButton();

                                    b.Text = "AREA";

                                    b.ForeColor = System.Drawing.Color.Green;

                                    b.ToolTip = "Seleccionar Area";

                                    b.CssClass = "CssClass='btn btn-primary'";

                                    b.BorderStyle = BorderStyle.None;

                                    b.CausesValidation = false;                                   

                                    b.OnClientClick = "Datos_Area(" + dt.Rows[i]["ID"].ToString().Trim() + ",'" + dt.Rows[i]["AREA"].ToString().Trim() + "','" + dt.Rows[i]["CARGO"].ToString().Trim() + "');";

                                    tCell.HorizontalAlign = HorizontalAlign.Center;

                                    tCell.Controls.Add(b);

                                    tRow.Cells.Add(tCell);

                                    break;

                            }
                        }

                        this.Tableareas.Rows.Add(tRow);
                    }

                    servidor.cerrarconexion();

                }

            }
            else
            {
                servidor.cerrarconexion();

                _Lista.ShowMessage(__mensaje, __pagina, servidor.getMensageError(), "CerrarSessionDocente.aspx");
            }

        }
        catch (Exception)
        {

            _Lista.ShowMessage(__mensaje, __pagina, "Error inesperado al intentar conectarnos con el servidor.", "CerrarSessionDocente.aspx");
        }
    }

    private void mantenimientoarea(int _ID_AREA, string _DESCRIPCION, int _ID_CAR, string operacion)
    {
        try
        {
            servidor.cadenaconexion = Ruta;

            if (servidor.abrirconexiontrans() == true)
            {
                servidor.ejecutar("[dbo].[mantenimientoarea]",
                                    false,
                                    _ID_AREA,
                                    _DESCRIPCION.Trim(),
                                    _ID_CAR,
                                    operacion,
                                    0, "");
                if (servidor.getRespuesta() == 1)
                {
                    servidor.cerrarconexiontrans();

                    _Lista.ShowMessage(__mensaje, __pagina, servidor.getMensaje(), "area.aspx");

                }
                else
                {
                    servidor.cancelarconexiontrans();

                    _Lista.ShowMessage(__mensaje, __pagina, servidor.getMensaje(), "area.aspx");
                }
            }
            else
            {
                servidor.cancelarconexiontrans();

                _Lista.ShowMessage(__mensaje, __pagina, servidor.getMensageError(), "CerrarSessionDocente.aspx");
            }

        }
        catch (Exception)
        {

            servidor.cancelarconexiontrans();

            _Lista.ShowMessage(__mensaje, __pagina, "Error inesperado al intentar conectarnos con el servidor.", "CerrarSessionDocente.aspx");
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

        this.lblusurio.Text = "TIPO USUARIO : " + Datos[1] + "    " + "   USUARIO : " + Datos[2];
        
        this.ObtenerCargo();
        this.listarcargos();
       
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(this.ID_AREA.Value.Trim()) == 0)
        {
            this.btnRegistrar.Visible = true;
            this.btnCancelar.Visible = true;
            oculta(false);
        }
        else
        {
            this.btnRegistrar.Visible = false;
            this.btnCancelar.Visible = true;
            oculta(true);

        }
    }
    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        Boolean ok;
        ok = rfvAREA.IsValid;
        ok = ok && rvCARGO.IsValid;
        if (ok == false)
        {
            return;
        }

        mantenimientoarea(Convert.ToInt32(ID_AREA.Value.Trim()),
            Convert.ToString(AREA.Text.Trim()),
            Convert.ToInt32(this.CARGO.SelectedValue),
            "N");

        this.Page.RegisterStartupScript("", "<script> Limpiar_Datos_Area(); </script>}"); 
    }
    protected void btnModificar_Click(object sender, EventArgs e)
    {
        Boolean ok;
        ok = rfvAREA.IsValid;
        ok = ok && rvCARGO.IsValid;
        if (ok == false)
        {
            return;
        }

        mantenimientoarea(Convert.ToInt32(ID_AREA.Value.Trim()),
            Convert.ToString(AREA.Text.Trim()),
            Convert.ToInt32(this.CARGO.SelectedValue),
            "M");

        this.Page.RegisterStartupScript("", "<script> Limpiar_Datos_Area(); </script>}");
    }
    protected void btnEliminar_Click(object sender, EventArgs e)
    {
        Boolean ok;
        ok = rfvAREA.IsValid;
        ok = ok && rvCARGO.IsValid;
        if (ok == false)
        {
            return;
        }

        mantenimientoarea(Convert.ToInt32(ID_AREA.Value.Trim()),
            Convert.ToString(AREA.Text.Trim()),
            Convert.ToInt32(this.CARGO.SelectedValue),
            "E");

        this.Page.RegisterStartupScript("", "<script> Limpiar_Datos_Area(); </script>}");
    }
    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        
    }
}