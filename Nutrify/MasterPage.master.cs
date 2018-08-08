using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    int admin;
    protected void Page_Load(object sender, EventArgs e)
    {
        admin = Convert.ToInt32(Session["sIsAdmin"]);
        if(admin == 1)
        {
            homeNav.HRef = "admin.aspx";
        }
    }
}
