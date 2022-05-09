using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using SEGURIDAD;

public partial class Administracion_colaborador : System.Web.UI.Page
{

    private string Ruta = System.Configuration.ConfigurationManager.AppSettings.Get("CadenaConeccion");
    policia.clsaccesodatos servidor = new policia.clsaccesodatos();
    System.Web.UI.WebControls.TableRow tRow;
    Lista _Lista = new Lista();

    private void mantenimiento_colaborador(int __CodigoP,
                                           string __NroDNI,
                                           string __ApellidoPaterno,
                                           string __ApellidoMaterno,
                                           string __Nombre,
                                           string __Direccion,
                                           string __TelefonoFijo,
                                           string __TelefonoMovil,
                                           string __Login,
                                           string __Password,
                                           string __Email,
                                           string __Faceboock,
                                           string __Twiter,
                                           bool __Estado,
                                           int __CodigoTP,
                                           int _CodigoA,
                                           char operacion)
    {
        try
        {
            servidor.cadenaconexion = Ruta;

            if (servidor.abrirconexiontrans() == true)
            {
                servidor.ejecutar("[dbo].[_pa_mantenimiento_Personal]",
                                    false,
                                    __CodigoP,
                                    __NroDNI,
                                    __ApellidoPaterno,
                                    __ApellidoMaterno,
                                    __Nombre,
                                    __Direccion,
                                    __TelefonoFijo,
                                    __TelefonoMovil,
                                    __Login,
                                    __Password,
                                    __Email,
                                    __Faceboock,
                                    __Twiter,
                                    __Estado,
                                    __CodigoTP,
                                    _CodigoA,
                                    operacion,
                                    0, "");
                if (servidor.getRespuesta() == 1)
                {
                    servidor.cerrarconexiontrans();

                    _Lista.ShowMessage(__mensaje, __pagina, servidor.getMensaje(), "colaborador.aspx");

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

    private void oculta(bool ok)
    {
        btnModificar.Visible = ok;
        btnEliminar.Visible = ok;
        //this.btnCancelar.Visible = ok;
    }

    private void ObtenerColaboradores()
    {
        policia.clsaccesodatos servidor = new policia.clsaccesodatos();
        try
        {
            servidor.cadenaconexion = Ruta;
            if (servidor.abrirconexion() == true)
            {
                System.Data.DataTable dt = servidor.consultar("[dbo].[_pa_obtener_colaboradores]").Tables[0];
                if (dt.Rows.Count == 0)
                {
                    servidor.cerrarconexion();
                    __mensaje.Value = "No hay tipo colaboradores.";
                    __pagina.Value = "";
                }
                else
                {
                    TipoColaborador.DataSource = dt;
                    TipoColaborador.DataTextField = "Nombre";
                    TipoColaborador.DataValueField = "Codigo";
                    TipoColaborador.DataBind();
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

    private void ObtenerAreas()
    {
        policia.clsaccesodatos servidor = new policia.clsaccesodatos();
        try
        {
            servidor.cadenaconexion = Ruta;
            if (servidor.abrirconexion() == true)
            {
                System.Data.DataTable dt = servidor.consultar("[dbo].[_pa_obtener_areas]").Tables[0];
                if (dt.Rows.Count == 0)
                {
                    servidor.cerrarconexion();
                    __mensaje.Value = "No hay areas.";
                    __pagina.Value = "";
                }
                else
                {
                    Area.DataSource = dt;
                    Area.DataTextField = "Nombre";
                    Area.DataValueField = "Codigo";
                    Area.DataBind();
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


    private void listarticketsincidentes()
    {


        __mensaje.Value = "";
        __pagina.Value = "";


        string[] ResaltarFilaColor = { "active", "success", "warning", "danger" };
        int k = 0;

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
                DataTable dt = servidor.consultar("[dbo].[_pa_lista_Colaboradores]").Tables[0];
                if (dt.Rows.Count == 0)
                {
                    servidor.cerrarconexion();
                    __mensaje.Value = "No hay colaboradores para mostrar";
                    __pagina.Value = "";
                    Nombre.Text = "";
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

                        for (int j = 0; j < 14; j++)//Cabecera de la tabla
                        {
                            TableCell tCell = new TableCell();
                            switch (j)
                            {
                                case 0:
                                    encriptar en = new encriptar();

                                    string strTextoEncriptado = en.DesEncriptarCadena(dt.Rows[i]["CONATRASEÑA"].ToString());

                                    System.Web.UI.WebControls.ImageButton hl = new System.Web.UI.WebControls.ImageButton();
                                    hl.CssClass = "media-object";
                                    hl.ImageUrl = "~/imagenes/editar.png";
                                    hl.ForeColor = Color.Blue;
                                    //hl.NavigateUrl = "#";
                                    //hl.Text = "EDITAR";
                                    hl.CausesValidation = false;
                                    hl.OnClientClick = "Colaborador('" + dt.Rows[i]["CODIGO"].ToString().Trim() + "','" + dt.Rows[i]["AREA"].ToString().Trim() + "','" + dt.Rows[i]["TIPO COLABORADOR"].ToString().Trim() + "','" + dt.Rows[i]["DNI"].ToString().Trim() + "','" + dt.Rows[i]["APELLIDO PATERNO"].ToString().Trim() + "','" + dt.Rows[i]["APELLIDO MATERNO"].ToString().Trim() + "','" + dt.Rows[i]["NOMBRE"].ToString().Trim() + "','" + dt.Rows[i]["DIRECCION"].ToString() + "','" + dt.Rows[i]["TELEFONO"].ToString() + "','" + dt.Rows[i]["CELULAR"].ToString() + "','" + dt.Rows[i]["USUARIO"].ToString() + "','" + strTextoEncriptado + "','" + dt.Rows[i]["EMAIL"].ToString() + "','" + dt.Rows[i]["FECEBOOCK"].ToString() + "','" + dt.Rows[i]["TWITER"].ToString() + "','" + dt.Rows[i]["ESTADO"].ToString() + "')";
                                    tCell.ForeColor = System.Drawing.Color.Black;
                                    tCell.Controls.Add(hl);
                                    tCell.HorizontalAlign = HorizontalAlign.Center;
                                    tRow.Cells.Add(tCell);
                                    //tCell.Text = dt.Rows[i]["CODIGO"].ToString();
                                    //tCell.Visible = true;
                                    //tRow.Cells.Add(tCell);
                                    break;

                                case 1:
                                    tCell.Text = dt.Rows[i]["AREA"].ToString();
                                    tCell.ForeColor = System.Drawing.Color.Black;
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 2:
                                    tCell.Text = dt.Rows[i]["TIPO COLABORADOR"].ToString();
                                    tCell.ForeColor = System.Drawing.Color.Black;
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 3:
                                    tCell.Text = dt.Rows[i]["DNI"].ToString();
                                    tCell.ForeColor = System.Drawing.Color.Black;
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 4:
                                    tCell.Text = dt.Rows[i]["NOMBRE"].ToString() + " " + dt.Rows[i]["APELLIDO PATERNO"].ToString() + " " + dt.Rows[i]["APELLIDO MATERNO"].ToString();
                                    tCell.ForeColor = System.Drawing.Color.Black;
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                //case 4:
                                //    tCell.Text = dt.Rows[i]["APELLIDO PATERNO"].ToString();
                                //    tCell.ForeColor = System.Drawing.Color.Black;
                                //    tCell.Visible = true;
                                //    tRow.Cells.Add(tCell);
                                //    break;

                                //case 5:
                                //    tCell.Text = dt.Rows[i]["APELLIDO MATERNO"].ToString();
                                //    tCell.ForeColor = System.Drawing.Color.Black;
                                //    tCell.Visible = true;
                                //    tRow.Cells.Add(tCell);
                                //    break;

                                //case 6:
                                //    tCell.Text = dt.Rows[i]["NOMBRE"].ToString();
                                //    tCell.ForeColor = System.Drawing.Color.Black;
                                //    tCell.Visible = true;
                                //    tRow.Cells.Add(tCell);
                                //    break;

                                case 5:
                                    tCell.Text = dt.Rows[i]["DIRECCION"].ToString();
                                    tCell.ForeColor = System.Drawing.Color.Black;
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 6:
                                    tCell.Text = dt.Rows[i]["TELEFONO"].ToString();
                                    tCell.ForeColor = System.Drawing.Color.Black;
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 7:
                                    tCell.Text = dt.Rows[i]["CELULAR"].ToString();
                                    tCell.ForeColor = System.Drawing.Color.Black;
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 8:
                                    tCell.Text = dt.Rows[i]["USUARIO"].ToString();
                                    tCell.ForeColor = System.Drawing.Color.Black;
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 9:
                                    tCell.Text = dt.Rows[i]["CONATRASEÑA"].ToString();
                                    tCell.ForeColor = System.Drawing.Color.Black;
                                    //tCell.Font.Bold = true;
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 10:
                                    tCell.Text = dt.Rows[i]["EMAIL"].ToString();
                                    tCell.ForeColor = System.Drawing.Color.Black;
                                    //tCell.Font.Bold = true;
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 11:
                                    tCell.Text = dt.Rows[i]["FECEBOOCK"].ToString();
                                    tCell.ForeColor = System.Drawing.Color.Black;
                                    //tCell.Font.Bold = true;
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;


                                case 12:
                                    tCell.Text = dt.Rows[i]["TWITER"].ToString();
                                    tCell.ForeColor = System.Drawing.Color.Black;
                                    //tCell.Font.Bold = true;
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
                                    break;

                                case 13:
                                    tCell.Text = dt.Rows[i]["ESTADO"].ToString();
                                    tCell.ForeColor = System.Drawing.Color.Black;
                                    //tCell.Font.Bold = true;
                                    tCell.Visible = true;
                                    tRow.Cells.Add(tCell);
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

        if (Convert.ToInt32(ID_PERSONAL.Value.Trim()) > 0)
        {
            btnRegistrar.Visible = false;
            btnCancelar.Visible = true;
            oculta(true);

        }
        if (Convert.ToInt32(ID_PERSONAL.Value.Trim()) == 0)
        {
            btnRegistrar.Visible = true;
            btnCancelar.Visible = true;
            oculta(false);
        }

       
        
    }

    protected void Page_init(object sender, EventArgs e)
    {
        ObtenerColaboradores();
        ObtenerAreas();
        listarticketsincidentes();

        //for (int i = 1; i < this.Table_.Rows.Count; i++)
        //{
        //    for (int j = 0; j < this.Table_.Rows[i].Cells.Count; j++)
        //    {
        //        this.Table_.Rows[i].Cells[j].HorizontalAlign = HorizontalAlign.Left;
        //    }

        //}

    }


    protected void btnRegistrar_Click(object sender, EventArgs e)
    {
        Boolean ok;
        ok = rvArea.IsValid;
        ok = ok && rfvArea.IsValid;
        ok = ok && rvTipoColaborador.IsValid;
        ok = ok && rfvTipoColaborador.IsValid;
        ok = ok && rfvNroDNI.IsValid;
        ok = ok && revNroDNI.IsValid;
        ok = ok && rfvApellidoPaterno.IsValid;
        ok = ok && rfvApellidoMaterno.IsValid;
        ok = ok && rfvNombre.IsValid;
        ok = ok && rfvDireccion.IsValid;
        ok = ok && revTelefonoFijo.IsValid;
        ok = ok && rfvTelefonoMovil.IsValid;
        ok = ok && revTelefonoMovil.IsValid;
        ok = ok && rfvLogin.IsValid;
        ok = ok && rfvPassword.IsValid;
        ok = ok && revEmail.IsValid;
        if (ok == false)
        {
            return;
        }

        encriptar en = new encriptar();

        string strTextoEncriptado = en.EncriptarCadena(Password.Text.Trim());

        mantenimiento_colaborador(Convert.ToInt32(ID_PERSONAL.Value.Trim()),
           Convert.ToString(NroDNI.Text.Trim()),
           Convert.ToString(ApellidoPaterno.Text.Trim()),
           Convert.ToString(ApellidoMaterno.Text.Trim()),
           Convert.ToString(Nombre.Text.Trim()),
           Convert.ToString(Direccion.Text.Trim()),
           Convert.ToString(TelefonoFijo.Text.Trim()),
           Convert.ToString(TelefonoMovil.Text.Trim()),
           Convert.ToString(Login.Text.Trim()),
           strTextoEncriptado.Trim(),
           Convert.ToString(Email.Text.Trim()),
           Convert.ToString(Faceboock.Text.Trim()),
           Convert.ToString(Twiter.Text.Trim()),
           Estado.Checked,
           Convert.ToInt32(TipoColaborador.SelectedValue),
           Convert.ToInt32(Area.SelectedValue),
           'N');
        Page.RegisterStartupScript("", "<script> Limpiar_Datos_Colaborador(); </script>}");     
    }
    protected void btnModificar_Click(object sender, EventArgs e)
    {
        Boolean ok;
        ok = rvArea.IsValid;
        ok = ok && rfvArea.IsValid;
        ok = ok && rvTipoColaborador.IsValid;
        ok = ok && rfvTipoColaborador.IsValid;
        ok = ok && rfvNroDNI.IsValid;
        ok = ok && revNroDNI.IsValid;
        ok = ok && rfvApellidoPaterno.IsValid;
        ok = ok && rfvApellidoMaterno.IsValid;
        ok = ok && rfvNombre.IsValid;
        ok = ok && rfvDireccion.IsValid;
        ok = ok && revTelefonoFijo.IsValid;
        ok = ok && rfvTelefonoMovil.IsValid;
        ok = ok && revTelefonoMovil.IsValid;
        ok = ok && rfvLogin.IsValid;
        ok = ok && rfvPassword.IsValid;
        ok = ok && revEmail.IsValid;
        if (ok == false)
        {
            return;
        }

        encriptar en = new encriptar();

        string strTextoEncriptado = en.EncriptarCadena(Password.Text.Trim());

        mantenimiento_colaborador(Convert.ToInt32(ID_PERSONAL.Value.Trim()),
           Convert.ToString(NroDNI.Text.Trim()),
           Convert.ToString(ApellidoPaterno.Text.Trim()),
           Convert.ToString(ApellidoMaterno.Text.Trim()),
           Convert.ToString(Nombre.Text.Trim()),
           Convert.ToString(Direccion.Text.Trim()),
           Convert.ToString(TelefonoFijo.Text.Trim()),
           Convert.ToString(TelefonoMovil.Text.Trim()),
           Convert.ToString(Login.Text.Trim()),
           strTextoEncriptado,
           Convert.ToString(Email.Text.Trim()),
           Convert.ToString(Faceboock.Text.Trim()),
           Convert.ToString(Twiter.Text.Trim()),
           Estado.Checked,
           Convert.ToInt32(TipoColaborador.SelectedValue),
           Convert.ToInt32(Area.SelectedValue),
           'M');
        Page.RegisterStartupScript("", "<script> Limpiar_Datos_Colaborador(); </script>}");        
    }
    protected void btnEliminar_Click(object sender, EventArgs e)
    {
        Boolean ok;
        ok = rvArea.IsValid;
        ok = ok && rfvArea.IsValid;
        ok = ok && rvTipoColaborador.IsValid;
        ok = ok && rfvTipoColaborador.IsValid;
        ok = ok && rfvNroDNI.IsValid;
        ok = ok && revNroDNI.IsValid;
        ok = ok && rfvApellidoPaterno.IsValid;
        ok = ok && rfvApellidoMaterno.IsValid;
        ok = ok && rfvNombre.IsValid;
        ok = ok && rfvDireccion.IsValid;
        ok = ok && revTelefonoFijo.IsValid;
        ok = ok && rfvTelefonoMovil.IsValid;
        ok = ok && revTelefonoMovil.IsValid;
        ok = ok && rfvLogin.IsValid;
        ok = ok && rfvPassword.IsValid;
        ok = ok && revEmail.IsValid;
        if (ok == false)
        {
            return;
        }

        mantenimiento_colaborador(Convert.ToInt32(ID_PERSONAL.Value.Trim()),
           Convert.ToString(NroDNI.Text.Trim()),
           Convert.ToString(ApellidoPaterno.Text.Trim()),
           Convert.ToString(ApellidoMaterno.Text.Trim()),
           Convert.ToString(Nombre.Text.Trim()),
           Convert.ToString(Direccion.Text.Trim()),
           Convert.ToString(TelefonoFijo.Text.Trim()),
           Convert.ToString(TelefonoMovil.Text.Trim()),
           Convert.ToString(Login.Text.Trim()),
           Convert.ToString(Password.Text.Trim()),
           Convert.ToString(Email.Text.Trim()),
           Convert.ToString(Faceboock.Text.Trim()),
           Convert.ToString(Twiter.Text.Trim()),
           Estado.Checked,
           Convert.ToInt32(TipoColaborador.SelectedValue),
           Convert.ToInt32(Area.SelectedValue),
           'E');
        Page.RegisterStartupScript("", "<script> Limpiar_Datos_Colaborador(); </script>}"); 
    }
    protected void btnCancelar_Click(object sender, EventArgs e)
    {

    }
}