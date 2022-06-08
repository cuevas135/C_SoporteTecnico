﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cliente_cargo : System.Web.UI.Page
{
    //obtenemos la ruta del servidor de la base de datos.
    private String Ruta = System.Configuration.ConfigurationManager.AppSettings.Get(0);
    System.Web.UI.WebControls.TableRow tRow;
    policia.clsaccesodatos servidor = new policia.clsaccesodatos();

    private void oculta(bool ok)
    {
        btnModificar.Visible = ok;
        btnEliminar.Visible = ok;
        //this.btnCancelar.Visible = ok;
    }

    private void listarcargos()
    {
        __mensaje.Value = "";

        __pagina.Value = "";

        for (int i = 1; i < Tablecargos.Rows.Count; i++)
        {
            Tablecargos.Rows[i].Cells.Clear();
        }

        try
        {
            policia.clsaccesodatos servidor = new policia.clsaccesodatos();

            servidor.cadenaconexion = Ruta;

            if (servidor.abrirconexion() == true)
            {
                System.Data.DataTable dt = servidor.consultar("[dbo].[listarcargos]").Tables[0];

                if (dt.Rows.Count == 0)
                {
                    servidor.cerrarconexion();

                    ShowMessage("No hay cargos para mostrar.", "");
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

                                    tCell.Text = dt.Rows[i]["CARGO"].ToString();

                                    tCell.Visible = true;

                                    tRow.Cells.Add(tCell);

                                    break;

                                case 2:

                                    System.Web.UI.WebControls.LinkButton b = new System.Web.UI.WebControls.LinkButton();

                                    b.Text = "CARGO";

                                    b.ForeColor = System.Drawing.Color.Magenta;

                                    b.ToolTip = "Seleccionar Cargo";

                                    b.CssClass = "CssClass='btn btn-primary'";

                                    b.BorderStyle = BorderStyle.None;

                                    b.CausesValidation = false;

                                    b.OnClientClick = "Datos_Cargo(" + dt.Rows[i]["ID"].ToString() + ",'" + dt.Rows[i]["CARGO"].ToString() + "');";

                                    tCell.HorizontalAlign = HorizontalAlign.Center;

                                    tCell.Controls.Add(b);

                                    tRow.Cells.Add(tCell);

                                    break;

                            }
                        }

                        Tablecargos.Rows.Add(tRow);
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

    private void mantenimientocargo(int _ID_CAR, string _DESCRIPCION, string operacion)
    {
        try
        {
            servidor.cadenaconexion = Ruta;

            if (servidor.abrirconexiontrans() == true)
            {
                servidor.ejecutar("[dbo].[mantenimientocargo]",
                                    false,
                                    _ID_CAR,
                                    _DESCRIPCION.Trim(),                                   
                                    operacion,
                                    0, "");
                if (servidor.getRespuesta() == 1)
                {
                    servidor.cerrarconexiontrans();

                    ShowMessage(servidor.getMensaje(), "cargo.aspx");

                }
                else
                {
                    servidor.cancelarconexiontrans();

                    ShowMessage(servidor.getMensaje(), "cargo.aspx");
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
        __mensaje.Value = msg;

        __pagina.Value = paginaweb;
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(ID_CARGO.Value.Trim()) == 0)
        {
            btnRegistrar.Visible = true;
            btnCancelar.Visible = true;
            oculta(false);
        }
        else
        {
            btnRegistrar.Visible = false;
            btnCancelar.Visible = true;
            oculta(true);

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

        lblusurio.Text = "TIPO USUARIO : " + Datos[1] + "    " + "   USUARIO : " + Datos[2];

        listarcargos();

    }

    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        Boolean ok;
        ok = rfvCARGO.IsValid;       
        if (ok == false)
        {
            return;
        }

        mantenimientocargo(Convert.ToInt32(ID_CARGO.Value.Trim()),
            Convert.ToString(CARGO.Text.Trim()),
            "N");

        Page.RegisterStartupScript("", "<script> Limpiar_Datos_Cargo(); </script>}");
    }
    protected void btnModificar_Click(object sender, EventArgs e)
    {
        Boolean ok;
        ok = rfvCARGO.IsValid;
        if (ok == false)
        {
            return;
        }

        mantenimientocargo(Convert.ToInt32(ID_CARGO.Value.Trim()),
            Convert.ToString(CARGO.Text.Trim()),
            "M");

        Page.RegisterStartupScript("", "<script> Limpiar_Datos_Cargo(); </script>}");
    }
    protected void btnEliminar_Click(object sender, EventArgs e)
    {
        Boolean ok;
        ok = rfvCARGO.IsValid;
        if (ok == false)
        {
            return;
        }

        mantenimientocargo(Convert.ToInt32(ID_CARGO.Value.Trim()),
            Convert.ToString(CARGO.Text.Trim()),
            "E");

        Page.RegisterStartupScript("", "<script> Limpiar_Datos_Cargo(); </script>}");
    }
    protected void btnCancelar_Click(object sender, EventArgs e)
    {

    }
}