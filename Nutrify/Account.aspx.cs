using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Account : System.Web.UI.Page
{
    string pass;
    protected void Page_Load(object sender, EventArgs e)
    {
        GridView1.BackColor = System.Drawing.Color.GhostWhite;
        GridView1.HeaderRow.BackColor = System.Drawing.ColorTranslator.FromHtml("#33b5e5");
        GridView1.HeaderRow.ForeColor = System.Drawing.Color.White;
        GridView1.BorderColor = System.Drawing.Color.Black;
        GridView1.BorderWidth = 2;

    }
}