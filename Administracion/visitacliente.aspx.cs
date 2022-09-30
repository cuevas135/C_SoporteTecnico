using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SEGURIDAD;
using System.Data;
using System.Drawing;

//987242489 Traumatologo Dr. Torres.

public partial class Administracion_visitacliente : System.Web.UI.Page
{
    private String Ruta = System.Configuration.ConfigurationManager.AppSettings.Get("CadenaConeccion");
    policia.clsaccesodatos servidor = new policia.clsaccesodatos();
    TableRow tRow;
    Lista _Lista = new Lista();
    CsSignal _CsSignal = new CsSignal();

    private void Obtener_Tecnicos()
    {
        policia.clsaccesodatos servidor = new policia.clsaccesodatos();
        try
        {
            servidor.cadenaconexion = Ruta;
            if (servidor.abrirconexion() == true)
            {
                DataTable dt = servidor.consultar("[dbo].[_pa_obtener_tecnico]").Tables[0];
                if (dt.Rows.Count == 0)
                {
                    servidor.cerrarconexion();
                    __mensaje.Value = "No hay tecnicos.";
                    __pagina.Value = "";
                }
                else
                {
                    Tecnico.DataSource = dt;
                    Tecnico.DataTextField = "Nombre";
                    Tecnico.DataValueField = "Codigo";
                    Tecnico.DataBind();
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

    private void Visualiza_Detalle_Solicitud(object sender, EventArgs e)
    {
        //this.Page.RegisterStartupScript("", "<script> alert('aa'); </script>}");
        Button b = (Button)sender;
        b.Focus();

        String codigo = Convert.ToString(b.CommandArgument);

        //this.Page.RegisterStartupScript("", "<script> alert('" + codigo + "'); </script>}");

        int posicion = codigo.IndexOf('-');

        lblCliente.Text = "<b>Cliente: " + codigo.Substring(posicion + 1) + "</b>";

        Ver_Detalle_Solicitud(Convert.ToInt32(codigo.Substring(0, posicion)));

        Tecnico_SelectedIndexChanged(sender, e);

        ScriptManager.RegisterStartupScript(this, GetType(), "Pop", "openModal();", true);
    }

    private void Ver_Detalle_Solicitud(int Codigo)
    {
        __mensaje.Value = "";
        __pagina.Value = "";


        String[] ResaltarFilaColor = { "active", "success", "warning", "danger" };
        int k = 0;

        for (int i = 1; i < Table_Detalle.Rows.Count; i++)
        {
            Table_Detalle.Rows[i].Cells.Clear();
        }

        try
        {
            policia.clsaccesodatos servidor = new policia.clsaccesodatos();
            servidor.cadenaconexion = Ruta;
            if (servidor.abrirconexion() == true)
            {
                DataTable dt = servidor.consultar("[dbo].[_pa_obtener_Detalle_Solicitudes_Pendientes_Servicios_Solicitados_2]", Codigo).Tables[0];
                if (dt.Rows.Count == 0)
                {
                    servidor.cerrarconexion();
                    __mensaje.Value = "No hay detalles para mostrar";
                    __pagina.Value = "";

                }
                else
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        tRow = new TableRow();
                        if (k < 4)
                        {
                            tRow.CssClass = ResaltarFilaColor[k];
                        }
                        else
                        {
                            k = 0;
                            tRow.CssClass = ResaltarFilaColor[k];
                        }

                        for (int j = 0; j < 3; j++)//Cabecera de la tabla
                        {
                            TableCell tCell = new TableCell();
                            switch (j)
                            {
                                case 0:
                                    tCell.Text = dt.Rows[i]["CODIGO_SOLICITUD"].ToString();
                                    tCell.ForeColor = System.Drawing.Color.Black;
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 1:
                                    tCell.Text = dt.Rows[i]["SERVIVIO"].ToString();
                                    tCell.ForeColor = System.Drawing.Color.Black;
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 2:
                                    tCell.Text = dt.Rows[i]["MODALIDAD"].ToString();
                                    tCell.ForeColor = System.Drawing.Color.Black;
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                            }
                        }

                        Table_Detalle.Rows.Add(tRow);
                        k++;
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

    private void listarticketsincidentes()
    {


        __mensaje.Value = "";
        __pagina.Value = "";


        String[] ResaltarFilaColor = { "active", "success", "warning", "danger" };
        int k = 0;

        for (int i = 1; i < Table_.Rows.Count; i++)
        {
            for (int j = Table_.Rows[i].Cells.Count - 1; j >= 0; j--)
            {
                Table_.Rows[i].Cells.RemoveAt(j);
            }
        }

        try
        {
            policia.clsaccesodatos servidor = new policia.clsaccesodatos();
            servidor.cadenaconexion = Ruta;
            if (servidor.abrirconexion() == true)
            {
                DataTable dt = servidor.consultar("[dbo].[_pa_Asignar_Solicitudes_Pendientes_Personal_Tecnico]").Tables[0];

                if (dt.Rows.Count == 0)
                {
                    servidor.cerrarconexion();
                    __mensaje.Value = "No hay solicitudes para mostrar";
                    __pagina.Value = "";

                }
                else
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        tRow = new TableRow();
                        if (k < 4)
                        {
                            tRow.CssClass = ResaltarFilaColor[k];
                        }
                        else
                        {
                            k = 0;
                            tRow.CssClass = ResaltarFilaColor[k];
                        }

                        for (int j = 0; j < 8; j++)//Cabecera de la tabla
                        {
                            TableCell tCell = new TableCell();
                            switch (j)
                            {
                                case 0:
                                    CheckBox cb = new CheckBox();
                                    cb.AutoPostBack = false;
                                    //cb.CheckedChanged += new System.EventHandler(VerificaSeleccion);
                                    //cb.Init += new System.EventHandler(VerificaSeleccion);
                                    cb.Checked = false;
                                    //cb.ID = i.ToString() + j.ToString();
                                    tCell.ForeColor = System.Drawing.Color.Black; /*Esto lo hacemos para ocultar el color de letra que por defecto asigna el framework.*/
                                    tCell.Controls.Add(cb);
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 1:
                                    tCell.Text = dt.Rows[i]["NRO. SOLICITUD"].ToString();
                                    tCell.ForeColor = System.Drawing.Color.Black;
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 2:
                                    tCell.Text = dt.Rows[i]["FECHA"].ToString();
                                    tCell.ForeColor = System.Drawing.Color.Black;
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 3:
                                    tCell.Text = dt.Rows[i]["CLIENTE"].ToString();
                                    tCell.ForeColor = System.Drawing.Color.Black;
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 4:
                                    tCell.Text = dt.Rows[i]["DIRECCION"].ToString();
                                    tCell.ForeColor = System.Drawing.Color.Black;
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 5:
                                    tCell.Text = dt.Rows[i]["TEL FIJO"].ToString();
                                    tCell.ForeColor = System.Drawing.Color.Black;
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 6:
                                    tCell.Text = dt.Rows[i]["TEL MOVIL"].ToString();
                                    tCell.ForeColor = System.Drawing.Color.Black;
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 7:
                                    //System.Web.UI.WebControls.LinkButton b = new System.Web.UI.WebControls.LinkButton();
                                    System.Web.UI.WebControls.Button b = new System.Web.UI.WebControls.Button();

                                    b.Text = "Ver";

                                    b.CssClass = "btn btn-success";

                                    b.ToolTip = "Seleccione solicitud para ver sus detalles";

                                    //b.Height = 25;

                                    b.Width = System.Web.UI.WebControls.Unit.Parse("50px");

                                    ////b.BorderStyle = BorderStyle.None;

                                    ////b.BackColor = System.Drawing.Color.Lavender;

                                    ////b.ForeColor = System.Drawing.Color.Black;

                                    b.CausesValidation = false;

                                    b.UseSubmitBehavior = false;

                                    //b.Attributes.Add("data-toggle", "modal");

                                    //b.Attributes.Add("data-target", "#myModal");

                                    ////b.PostBackUrl = "lote.aspx?Codigo=" + dt.Rows[i]["NRO. SOLICITUD"].ToString();

                                    b.CommandArgument = dt.Rows[i]["NRO. SOLICITUD"].ToString() + "-" + dt.Rows[i]["CLIENTE"].ToString();

                                    b.Click += new System.EventHandler(Visualiza_Detalle_Solicitud);

                                    ////b.OnClientClick = "prueba()";

                                    //tCell.HorizontalAlign = HorizontalAlign.Center;                                   

                                    //tCell.Text = "<a href='#' data-toggle ='modal'  data-target ='#myModal' class='popup-link' onClick='prueba(" + dt.Rows[i]["NRO. SOLICITUD"].ToString() + ")'>" + "Ver";

                                    tCell.Controls.Add(b);

                                    tRow.Cells.Add(tCell);
                                    //tCell.Text = "";
                                    //tCell.ForeColor = System.Drawing.Color.Black;
                                    //tCell.Visible = true;
                                    //tRow.Cells.Add(tCell);
                                    break;

                            }
                        }

                        Table_.Rows.Add(tRow);
                        k++;
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

    private void Visitas_Asignadas_Tecnico()
    {


        __mensaje.Value = "";
        __pagina.Value = "";

        btnEliminar.Visible = false;


        String[] ResaltarFilaColor = { "active", "success", "warning", "danger" };
        int k = 0;

        for (int i = 1; i < Table_.Rows.Count; i++)
        {
            for (int j = TableVisita.Rows[i].Cells.Count - 1; j >= 0; j--)
            {
                TableVisita.Rows[i].Cells.RemoveAt(j);
            }
        }

        try
        {
            policia.clsaccesodatos servidor = new policia.clsaccesodatos();
            servidor.cadenaconexion = Ruta;
            if (servidor.abrirconexion() == true)
            {
                DataTable dt = servidor.consultar("[dbo].[_pa_Visitas_Asignadas_Personal_Tecnico]").Tables[0];

                if (dt.Rows.Count == 0)
                {
                    servidor.cerrarconexion();
                    __mensaje.Value = "No hay visitas asignadas para mostrar";
                    __pagina.Value = "";

                }
                else
                {
                    btnEliminar.Visible = true;

                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        tRow = new TableRow();
                        if (k < 4)
                        {
                            tRow.CssClass = ResaltarFilaColor[k];
                        }
                        else
                        {
                            k = 0;
                            tRow.CssClass = ResaltarFilaColor[k];
                        }

                        for (int j = 0; j < 11; j++)//Cabecera de la tabla
                        {
                            TableCell tCell = new TableCell();
                            switch (j)
                            {
                                case 0:
                                    CheckBox cb = new CheckBox();
                                    cb.AutoPostBack = false;
                                    //cb.CheckedChanged += new System.EventHandler(VerificaSeleccion);
                                    //cb.Init += new System.EventHandler(VerificaSeleccion);
                                    cb.Checked = false;
                                    cb.ID = i.ToString() + j.ToString();
                                    tCell.ForeColor = System.Drawing.Color.Black; /*Esto lo hacemos para ocultar el color de letra que por defecto asigna el framework.*/
                                    tCell.Controls.Add(cb);
                                    tRow.Cells.Add(tCell);
                                    break;

                                //tCell.Text = "";
                                //tCell.ForeColor = System.Drawing.Color.Black;
                                //tCell.Visible = true;
                                //tRow.Cells.Add(tCell);
                                //break;

                                case 1:
                                    tCell.Text = dt.Rows[i]["CODIGO VISITA"].ToString();
                                    tCell.ForeColor = System.Drawing.Color.Black;
                                    tCell.Visible = false;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 2:
                                    tCell.Text = dt.Rows[i]["FEC ASIGNACION"].ToString();
                                    tCell.ForeColor = System.Drawing.Color.Black;
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 3:
                                    tCell.Text = dt.Rows[i]["TECNICO"].ToString();
                                    tCell.ForeColor = System.Drawing.Color.Black;
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 4:
                                    tCell.Text = dt.Rows[i]["NRO SOLICITUD"].ToString();
                                    tCell.ForeColor = System.Drawing.Color.Black;
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 5:
                                    tCell.Text = dt.Rows[i]["FEC SOLICITUD"].ToString();
                                    tCell.ForeColor = System.Drawing.Color.Black;
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 6:
                                    tCell.Text = dt.Rows[i]["CLIENTE"].ToString();
                                    tCell.ForeColor = System.Drawing.Color.Black;
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 7:
                                    tCell.Text = dt.Rows[i]["DIRECCION"].ToString();
                                    tCell.ForeColor = System.Drawing.Color.Black;
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 8:
                                    tCell.Text = dt.Rows[i]["TEL FIJO"].ToString();
                                    tCell.ForeColor = System.Drawing.Color.Black;
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 9:
                                    tCell.Text = dt.Rows[i]["TEL MOVIL"].ToString();
                                    tCell.ForeColor = System.Drawing.Color.Black;
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 10:
                                    //System.Web.UI.WebControls.LinkButton b = new System.Web.UI.WebControls.LinkButton();
                                    System.Web.UI.WebControls.Button b = new System.Web.UI.WebControls.Button();

                                    b.Text = "Ver";

                                    b.CssClass = "btn btn-success";

                                    b.ToolTip = "Seleccione solicitud para ver sus detalles";

                                    //b.Height = 25;

                                    b.Width = System.Web.UI.WebControls.Unit.Parse("50px");

                                    ////b.BorderStyle = BorderStyle.None;

                                    ////b.BackColor = System.Drawing.Color.Lavender;

                                    ////b.ForeColor = System.Drawing.Color.Black;

                                    b.CausesValidation = false;

                                    b.UseSubmitBehavior = false;

                                    //b.Attributes.Add("data-toggle", "modal");

                                    //b.Attributes.Add("data-target", "#myModal");

                                    ////b.PostBackUrl = "lote.aspx?Codigo=" + dt.Rows[i]["NRO. SOLICITUD"].ToString();

                                    b.CommandArgument = dt.Rows[i]["NRO SOLICITUD"].ToString() + "-" + dt.Rows[i]["CLIENTE"].ToString();

                                    b.Click += new System.EventHandler(Visualiza_Detalle_Solicitud);

                                    ////b.OnClientClick = "prueba()";

                                    //tCell.HorizontalAlign = HorizontalAlign.Center;                                   

                                    //tCell.Text = "<a href='#' data-toggle ='modal'  data-target ='#myModal' class='popup-link' onClick='prueba(" + dt.Rows[i]["NRO. SOLICITUD"].ToString() + ")'>" + "Ver";

                                    tCell.Controls.Add(b);

                                    tRow.Cells.Add(tCell);
                                    //tCell.Text = "";
                                    //tCell.ForeColor = System.Drawing.Color.Black;
                                    //tCell.Visible = true;
                                    //tRow.Cells.Add(tCell);
                                    break;


                            }
                        }

                        TableVisita.Rows.Add(tRow);
                        k++;
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

    protected void Page_Load(object sender, EventArgs e)
    {

        //=============================================================================================================
        //Verificamos si el usuario ha iniciado sesion.
        __mensaje.Value = "";
        __pagina.Value = "";
        string[] Datos = (string[])Session["__JSAR__"];
        if (Datos == null)
        {
            __mensaje.Value = "Ud. no esta autorizado para ingresar a esta página, inicie sesion por favor.";
            __pagina.Value = "CerrarSession.aspx";
            return;
        }
        //============================================================================================================

        lblUsuario.Text = "<B>USUARIO: " + Convert.ToString(Datos[1]) + "</B>";

        Tecnico_SelectedIndexChanged(sender, e);

    }

    protected void Page_init(object sender, EventArgs e)
    {


        Obtener_Tecnicos();
        Visitas_Asignadas_Tecnico();


    }



    //private bool VerificaSeleccion()
    //{
    //    bool ok = false;
    //    for (int i = 1; i < this.Table_.Rows.Count; i++)
    //    {
    //        System.Web.UI.WebControls.CheckBox cb;
    //        cb = (System.Web.UI.WebControls.CheckBox)this.Table_.Rows[i].Cells[0].Controls[0];
    //        if (cb.Checked == true)
    //        {
    //            ok = true;
    //            break;
    //        }
    //    }
    //    return ok;
    //}

    //private void VerificaSeleccion(object sender, EventArgs e)
    //{

    //    this.__mensaje.Value = "";
    //    this.__pagina.Value = "";

    //    CheckBox c = (CheckBox)sender;
    //    if (c.Checked == true)
    //    {

    //        c.AutoPostBack = false;
    //        c.Checked = true;
    //    }
    //    else
    //    {
    //        c.AutoPostBack = false;
    //        c.Checked = false;

    //    }

    //      //return;
    //}





    protected void btnRegistrarVisita_Click(object sender, EventArgs e)
    {
        __mensaje.Value = "";
        __pagina.Value = "";

        Boolean ok;
        ok = rvTecnico.IsValid;
        ok = ok && rfvTecnico.IsValid;
        if (ok == false)
        {
            return;
        }

        ok = false;
        try
        {
            policia.clsaccesodatos servidor = new policia.clsaccesodatos();
            servidor.cadenaconexion = Ruta;
            if (servidor.abrirconexiontrans() == true)
            {

                for (int i = 1; i < Table_.Rows.Count; i++)
                {
                    CheckBox cb;
                    cb = (CheckBox)Table_.Rows[i].Cells[0].Controls[0];

                    if (cb.Checked == true)
                    {
                        ok = true;

                        servidor.ejecutar("[dbo].[_pa_mantenimiento_Visita]",
                        false,
                        0,/*Codigo visita.*/
                        Convert.ToInt32(Table_.Rows[i].Cells[1].Text),/*Codigo solicitud.*/
                        Convert.ToInt32(Tecnico.SelectedValue),/*Codigo tecnico*/
                        "N",
                        0, "");
                    }
                }

                if (servidor.getRespuesta() == 1)
                {
                    //=====================================================
                    //ENVIAR NOTIFICACIONES A LOS ADMINISTRADORES
                    _CsSignal.EnviarNotificacionAdministrador();
                    //=====================================================

                    servidor.cerrarconexiontrans();
                    _Lista.ShowMessage(__mensaje, __pagina, servidor.getMensaje(), "visitacliente.aspx");

                }
                else
                {
                    servidor.cancelarconexiontrans();
                    _Lista.ShowMessage(__mensaje, __pagina, servidor.getMensaje(), "");
                }
            }
            else
            {
                servidor.cancelarconexiontrans();
                _Lista.ShowMessage(__mensaje, __pagina, servidor.getMensageError(), "CerrarSession.aspx");
            }
        }
        catch (Exception ex)
        {
            _Lista.ShowMessage(__mensaje, __pagina
                , ex.Message.ToString() + " Error inesperado al intentar conectarnos con el servidor.", "");
        }


        if (ok == false)
        {



            __mensaje.Value = "Seleccione solicitud(es) de servicios por favor.";
            __pagina.Value = "";
        }

    }

    protected void Tecnico_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Tecnico.SelectedIndex > 0)
        {
            listarticketsincidentes();

            btnRegistrarVisita.Visible = true;
        }
        else
        {
            btnRegistrarVisita.Visible = false;

            for (int i = 1; i < Table_.Rows.Count; i++)
            {
                for (int j = Table_.Rows[i].Cells.Count - 1; j >= 0; j--)
                {
                    Table_.Rows[i].Cells.RemoveAt(j);
                }
            }
        }
    }
    protected void btnEliminar_Click(object sender, EventArgs e)
    {
        __mensaje.Value = "";
        __pagina.Value = "";

        Boolean ok;
        ok = rvTecnico.IsValid;
        ok = ok && rfvTecnico.IsValid;
        if (ok == false)
        {
            return;
        }

        ok = false;
        try
        {
            policia.clsaccesodatos servidor = new policia.clsaccesodatos();
            servidor.cadenaconexion = Ruta;
            if (servidor.abrirconexiontrans() == true)
            {

                for (int i = 1; i < TableVisita.Rows.Count; i++)
                {
                    CheckBox cb;
                    cb = (CheckBox)TableVisita.Rows[i].Cells[0].Controls[0];

                    if (cb.Checked == true)
                    {
                        ok = true;

                        servidor.ejecutar("[dbo].[_pa_mantenimiento_Visita]",
                        false,
                        Convert.ToInt32(TableVisita.Rows[i].Cells[1].Text),/*Codigo visita.*/
                        Convert.ToInt32(TableVisita.Rows[i].Cells[4].Text),/*Codigo solicitud.*/
                        null,/*Codigo tecnico*/
                        "E",
                        0, "");
                    }
                }

                if (servidor.getRespuesta() == 1)
                {
                    servidor.cerrarconexiontrans();
                    _Lista.ShowMessage(__mensaje, __pagina, servidor.getMensaje(), "visitacliente.aspx");
                }
                else
                {
                    servidor.cancelarconexiontrans();
                    _Lista.ShowMessage(__mensaje, __pagina, servidor.getMensaje(), "");
                }
            }
            else
            {
                servidor.cancelarconexiontrans();
                _Lista.ShowMessage(__mensaje, __pagina, servidor.getMensageError(), "CerrarSession.aspx");
            }
        }
        catch (Exception ex)
        {
            _Lista.ShowMessage(__mensaje, __pagina
                , ex.Message.ToString() + " Error inesperado al intentar conectarnos con el servidor.", "");
        }


        if (ok == false)
        {



            __mensaje.Value = "Seleccione visita(s) por favor.";
            __pagina.Value = "";
        }
    }
}