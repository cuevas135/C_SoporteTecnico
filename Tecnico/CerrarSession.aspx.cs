using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Tecnico_CerrarSession : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Abandon();
        //FormsAuthentication.SignOut();
        Response.Redirect("accesoTecnico.aspx");
    }
}