using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SEGURIDAD;
using System.Drawing;

public partial class Cliente_usuario : System.Web.UI.Page
{
    private String Ruta = System.Configuration.ConfigurationManager.AppSettings.Get("CadenaConeccion");
    policia.clsaccesodatos servidor = new policia.clsaccesodatos();
    System.Web.UI.WebControls.TableRow tRow;
    Lista _Lista = new Lista();

    private void oculta(bool ok)
    {
        this.btnModificar.Visible = ok;
        //this.btnEliminar.Visible = ok;
        //this.btnCancelar.Visible = ok;
    }

    private void listarusuarios(int ID_COLOLABORADOR)
    {
        this.__mensaje.Value = "";

        this.__pagina.Value = "";

        for (int i = 1; i < this.TableUsuario.Rows.Count; i++)
        {
            this.TableUsuario.Rows[i].Cells.Clear();
        }

        try
        {
            policia.clsaccesodatos servidor = new policia.clsaccesodatos();

            servidor.cadenaconexion = Ruta;

            if (servidor.abrirconexion() == true)
            {
                System.Data.DataTable dt = servidor.consultar("[dbo].[listarusuarios]",
                                    ID_COLOLABORADOR).Tables[0];

                if (dt.Rows.Count == 0)
                {
                    servidor.cerrarconexion();

                    ShowMessage("No hay datos Usuario para mostrar.", "");
                }
                else
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        tRow = new TableRow();

                        for (int j = 0; j < 6; j++)//Cabecera de la tabla
                        {
                            TableCell tCell = new TableCell();

                            switch (j)
                            {
                                case 0:

                                    System.Web.UI.WebControls.HyperLink hl = new System.Web.UI.WebControls.HyperLink();
                                    hl.ImageUrl = "~/imagenes/editar.png";
                                    hl.ForeColor = Color.Blue;
                                    hl.NavigateUrl = "usuario.aspx?Codigo=" + dt.Rows[i]["ID"].ToString().Trim() + "&Operacion=M";
                                    hl.Text = "EDITAR";
                                    tCell.Controls.Add(hl);
                                    tCell.HorizontalAlign = HorizontalAlign.Center;
                                    tRow.Cells.Add(tCell);

                                    tRow.Cells.Add(tCell);

                                    break;

                                case 1:

                                    tCell.Text = dt.Rows[i]["TIPO"].ToString().Trim();

                                    tCell.Visible = true;

                                    tRow.Cells.Add(tCell);

                                    break;

                                case 2:

                                    tCell.Text = dt.Rows[i]["COLABORADOR"].ToString().Trim();

                                    tCell.Visible = true;

                                    tRow.Cells.Add(tCell);

                                    break;

                                case 3:

                                    tCell.Text = dt.Rows[i]["LOGIN"].ToString().Trim();

                                    tCell.Visible = true;

                                    tRow.Cells.Add(tCell);

                                    break;

                                case 4:

                                    //encriptar en = new encriptar();

                                    //String strTextoEncriptado = en.DesEncriptarCadena(dt.Rows[i]["PASSWORD"].ToString());

                                    tCell.Text = dt.Rows[i]["PASSWORD"].ToString();

                                    tCell.Visible = true;

                                    tRow.Cells.Add(tCell);

                                    break;

                                case 5:

                                    if (dt.Rows[i]["ESTADO"].ToString().Equals("ACTIVO"))
                                    {
                                        tCell.ForeColor = System.Drawing.Color.Blue;
                                    }
                                    else
                                    {
                                        tCell.ForeColor = System.Drawing.Color.Red;
                                    }

                                    tCell.Text = dt.Rows[i]["ESTADO"].ToString();

                                    tCell.Visible = true;

                                    tRow.Cells.Add(tCell);

                                    break;
                                

                            }
                        }

                        this.TableUsuario.Rows.Add(tRow);
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

    private void ShowMessage(string msg, string paginaweb)
    {
        this.__mensaje.Value = msg;

        this.__pagina.Value = paginaweb;
    }

    private void mantenimientousuario(int ID_USUA_, string LOGIN_, string PASSWORD_, bool ESTADO_, string OPERACION_)
    {
        try
        {
            policia.clsaccesodatos servidor = new policia.clsaccesodatos();
            servidor.cadenaconexion = Ruta;
            if (servidor.abrirconexiontrans() == true)
            {
                servidor.ejecutar("[dbo].[mantenimientousuario]",
                                    false,
                                    ID_USUA_,
                                    LOGIN_.Trim(),
                                    PASSWORD_.Trim(),
                                    ESTADO_,
                                    OPERACION_,
                                    0, "");
                if (servidor.getRespuesta() == 1)
                {
                    servidor.cerrarconexiontrans();
                    this.__mensaje.Value = servidor.getMensaje();
                    if (OPERACION_.Equals("M") || OPERACION_.Equals("E"))
                    {
                        this.__pagina.Value = "usuario.aspx?Codigo=" + ID_USUA_.ToString() + "&Operacion=N";
                    }
                    else
                    {
                        this.__pagina.Value = "usuario.aspx?Codigo=" + ID_USUA_.ToString() + "&Operacion=" + OPERACION_;
                    }
                }
                else
                {
                    servidor.cancelarconexiontrans();
                    this.__mensaje.Value = servidor.getMensaje();
                    if (OPERACION_.Equals("M") || OPERACION_.Equals("E"))
                    {
                        this.__pagina.Value = "usuario.aspx?Codigo=" + ID_USUA_.ToString() + "&Operacion=N";
                    }
                    else
                    {
                        this.__pagina.Value = "usuario.aspx?Codigo=" + ID_USUA_.ToString() + "&Operacion=" + OPERACION_;
                    }
                }
            }
            else
            {
                servidor.cancelarconexiontrans();
                this.__mensaje.Value = servidor.getMensageError();
                this.__pagina.Value = "CerrarSession.aspx";
            }

        }
        catch (Exception)
        {
            this.__mensaje.Value = "Error inesperado al intentar conectarnos con el servidor.";
            //this.__pagina.Value = "CerrarSession.aspx";
        }
    }

    private void ConsultarColaboradores(int CodigoColaborador)
    {
        try
        {
            policia.clsaccesodatos servidor = new policia.clsaccesodatos();

            servidor.cadenaconexion = Ruta;

            if (servidor.abrirconexion() == true)
            {

                
                    DataTable dt = servidor.consultar("[dbo].[consultarcolaboradores]", CodigoColaborador).Tables[0];

                    if (dt.Rows.Count == 0)
                    {
                        servidor.cerrarconexion();

                        this.__mensaje.Value = "Error, al intentar recuperar datos del Colaborador.";

                        this.__pagina.Value = "CerrarSession.aspx";
                    }
                    else
                    {

                        this.lblColaborador.Text = dt.Rows[0]["NOMBRE"].ToString().Trim();
                        this.lblColaborador.Text += " " + dt.Rows[0]["APELLIDO PATERNO"].ToString().Trim();
                        this.lblColaborador.Text += " " + dt.Rows[0]["APELLIDO MATERNO"].ToString().Trim();
                        this.lblTipoColaborador.Text = dt.Rows[0]["TIPO COLABORADOR"].ToString().Trim();
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

    private void consultarusuarios(int CodigoColaborador)
    {
        try
        {
            policia.clsaccesodatos servidor = new policia.clsaccesodatos();

            servidor.cadenaconexion = Ruta;

            if (servidor.abrirconexion() == true)
            {


                DataTable dt = servidor.consultar("[dbo].[consultarusuarios]", CodigoColaborador).Tables[0];

                if (dt.Rows.Count == 0)
                {
                    servidor.cerrarconexion();

                    this.__mensaje.Value = "Error, al intentar recuperar datos del Colaborador.";

                    this.__pagina.Value = "CerrarSession.aspx";
                }
                else
                {

                    this.LOGIN.Text = dt.Rows[0]["LOGIN"].ToString().Trim();
                    encriptar en = new encriptar();
                    String strTextoEncriptado = en.DesEncriptarCadena(dt.Rows[0]["PASSWORD"].ToString());
                    this.PASSWORD.Text = strTextoEncriptado;
                    this.ESTADO.Checked = dt.Rows[0]["ESTADO"].ToString().Trim().Equals("ACTIVO")?true:false;
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

        int ID_COLOLABORADOR = Convert.ToInt32(Request.QueryString.Get("Codigo").Trim());
        ID_USUA.Value = ID_COLOLABORADOR.ToString();
        ConsultarColaboradores(Convert.ToInt32(ID_USUA.Value));
        string Opreacion = Request.QueryString.Get("Operacion").Trim();
        OPERACION.Value = Opreacion;
        listarusuarios(ID_COLOLABORADOR);
        if (OPERACION.Value.Trim().Equals("M"))
        {
            consultarusuarios(ID_COLOLABORADOR);
        }
        this.LOGIN.Focus();
              
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (OPERACION.Value.Trim().Equals("N"))
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
        ok = lblColaborador.Text.Trim().Length > 0;
        ok = ok && lblTipoColaborador.Text.Trim().Length > 0;
        ok = ok && rfvLOGIN.IsValid;
        ok = ok && rfvPASSWORD.IsValid;
        if (ok == false)
        {
            return;
        }

        encriptar en = new encriptar();
        String strTextoEncriptado = en.EncriptarCadena(this.PASSWORD.Text.Trim());

        mantenimientousuario(Convert.ToInt32(ID_USUA.Value.Trim()),
            Convert.ToString(this.LOGIN.Text.Trim()),
            Convert.ToString(strTextoEncriptado),
            Convert.ToBoolean(this.ESTADO.Checked),
            OPERACION.Value.Trim());
    }
    protected void btnModificar_Click(object sender, EventArgs e)
    {
        Boolean ok;
        ok = lblColaborador.Text.Trim().Length > 0;
        ok = ok && lblTipoColaborador.Text.Trim().Length > 0;
        ok = ok && rfvLOGIN.IsValid;
        ok = ok && rfvPASSWORD.IsValid;
        if (ok == false)
        {
            return;
        }

        encriptar en = new encriptar();
        String strTextoEncriptado = en.EncriptarCadena(this.PASSWORD.Text.Trim());

        mantenimientousuario(Convert.ToInt32(ID_USUA.Value.Trim()),
            Convert.ToString(this.LOGIN.Text.Trim()),
            Convert.ToString(strTextoEncriptado),
            Convert.ToBoolean(this.ESTADO.Checked),
            OPERACION.Value.Trim());
    }
    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        Response.Redirect("usuario.aspx?Codigo=" + ID_USUA.Value + "&Operacion=N");
    }
}