using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Timers;


public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = DateTime.Now.ToLongDateString();
        Label2.Text = DateTime.Now.Hour.ToString();
        Label2.Text += ":" + DateTime.Now.Minute.ToString();
        Label2.Text += ":" + DateTime.Now.Second.ToString();
    }



    protected void btnStat_Click(object sender, EventArgs e)
    {
        Response.Redirect("CalCount.aspx");
    }
}








    