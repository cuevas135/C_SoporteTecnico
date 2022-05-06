using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EnvioCorreoPrueba : System.Web.UI.Page
{
    Utilitarios _Utilitarios = new Utilitarios();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        _Utilitarios.EnvioCorreoRecuperacionCuenta("Recuperacion de cuenta", "transchiclayo2018@gmail.com", "Hola");
    }
}