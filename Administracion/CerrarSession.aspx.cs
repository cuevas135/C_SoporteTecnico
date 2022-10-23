using System;
using System.Web.UI;

public partial class CerrarSession : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Abandon();
        //FormsAuthentication.SignOut();
        Response.Redirect("acceso.aspx");
    }
    //public CerrarSession()
    //{
    //    Load += Page_Load;
    //}
}
