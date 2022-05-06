using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cliente_prioridad : System.Web.UI.Page
{
    //obtenemos la ruta del servidor de la base de datos.
    private String Ruta = System.Configuration.ConfigurationManager.AppSettings.Get(0);
    System.Web.UI.WebControls.TableRow tRow;
    policia.clsaccesodatos servidor = new policia.clsaccesodatos();

    private void oculta(bool ok)
    {
        this.btnModificar.Visible = ok;
        this.btnEliminar.Visible = ok;
        //this.btnCancelar.Visible = ok;
    }

    private void listarprioridades()
    {
        this.__mensaje.Value = "";

        this.__pagina.Value = "";

        for (int i = 1; i < this.Tablepriopridades.Rows.Count; i++)
        {
            this.Tablepriopridades.Rows[i].Cells.Clear();
        }

        try
        {
            policia.clsaccesodatos servidor = new policia.clsaccesodatos();

            servidor.cadenaconexion = Ruta;

            if (servidor.abrirconexion() == true)
            {
                System.Data.DataTable dt = servidor.consultar("[dbo].[listarprioridades]").Tables[0];

                if (dt.Rows.Count == 0)
                {
                    servidor.cerrarconexion();

                    ShowMessage("No hay prioriades para mostrar.", "");
                }
                else
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        tRow = new TableRow();

                        for (int j = 0; j < 3; j++)//Cabecera de la tabla
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

                                    tCell.Text = dt.Rows[i]["PRIORIDAD"].ToString();

                                    tCell.Visible = true;

                                    tRow.Cells.Add(tCell);

                                    break;

                                case 2:

                                    System.Web.UI.WebControls.LinkButton b = new System.Web.UI.WebControls.LinkButton();

                                    b.Text = "PRIORIDAD";

                                    b.ForeColor = System.Drawing.Color.Green;

                                    b.ToolTip = "Seleccionar Prioridad";

                                    b.CssClass = "CssClass='btn btn-primary'";

                                    b.BorderStyle = BorderStyle.None;

                                    b.CausesValidation = false;

                                    b.OnClientClick = "Datos_Prioridad(" + dt.Rows[i]["ID"].ToString() + ",'" + dt.Rows[i]["PRIORIDAD"].ToString() + "');";

                                    tCell.HorizontalAlign = HorizontalAlign.Center;

                                    tCell.Controls.Add(b);

                                    tRow.Cells.Add(tCell);

                                    break;

                            }
                        }

                        this.Tablepriopridades.Rows.Add(tRow);
                    }

                    servidor.cerrarconexion();

                }

            }
            else
            {
                servidor.cerrarconexion();

                ShowMessage(servidor.getMensageError(), "CerrarSessionDocente.aspx");
            }

        }
        catch (Exception)
        {

            ShowMessage("Error inesperado al intentar conectarnos con el servidor.", "CerrarSessionDocente.aspx");
        }
    }

    private void mantenimientoprioridad(int _ID_PRIO, string _DESCRIPCION, string operacion)
    {
        try
        {
            servidor.cadenaconexion = Ruta;

            if (servidor.abrirconexiontrans() == true)
            {
                servidor.ejecutar("[dbo].[mantenimientoprioridad]",
                                    false,
                                    _ID_PRIO,
                                    _DESCRIPCION.Trim(),
                                    operacion,
                                    0, "");
                if (servidor.getRespuesta() == 1)
                {
                    servidor.cerrarconexiontrans();

                    ShowMessage(servidor.getMensaje(), "prioridad.aspx");

                }
                else
                {
                    servidor.cancelarconexiontrans();

                    ShowMessage(servidor.getMensaje(), "prioridad.aspx");
                }
            }
            else
            {
                servidor.cancelarconexiontrans();

                ShowMessage(servidor.getMensageError(), "CerrarSessionDocente.aspx");
            }

        }
        catch (Exception)
        {

            servidor.cancelarconexiontrans();

            ShowMessage("Error inesperado al intentar conectarnos con el servidor.", "CerrarSessionDocente.aspx");
        }
    }

    private void ShowMessage(string msg, string paginaweb)
    {
        this.__mensaje.Value = msg;

        this.__pagina.Value = paginaweb;
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(this.ID_PRIO.Value.Trim()) == 0)
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

        listarprioridades();

    }
    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        Boolean ok;
        ok = rfvPRIORIDAD.IsValid;
        if (ok == false)
        {
            return;
        }

        mantenimientoprioridad(Convert.ToInt32(ID_PRIO.Value.Trim()),
            Convert.ToString(PRIORIDAD.Text.Trim()),
            "N");

        this.Page.RegisterStartupScript("", "<script> Limpiar_Datos__Prioridad(); </script>}");
    }
    protected void btnModificar_Click(object sender, EventArgs e)
    {
        Boolean ok;
        ok = rfvPRIORIDAD.IsValid;
        if (ok == false)
        {
            return;
        }

        mantenimientoprioridad(Convert.ToInt32(ID_PRIO.Value.Trim()),
            Convert.ToString(PRIORIDAD.Text.Trim()),
            "M");

        this.Page.RegisterStartupScript("", "<script> Limpiar_Datos__Prioridad(); </script>}");
    }
    protected void btnEliminar_Click(object sender, EventArgs e)
    {
        Boolean ok;
        ok = rfvPRIORIDAD.IsValid;
        if (ok == false)
        {
            return;
        }

        mantenimientoprioridad(Convert.ToInt32(ID_PRIO.Value.Trim()),
            Convert.ToString(PRIORIDAD.Text.Trim()),
            "E");

        this.Page.RegisterStartupScript("", "<script> Limpiar_Datos__Prioridad(); </script>}");
    }
}