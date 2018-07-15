using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        pnlLogin.Enabled = false;
        pnlLogin.Visible = false;
        pnlRegister.Enabled = false;
        pnlRegister.Visible = false;
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        pnlMain.Enabled = false;
        pnlMain.Visible = false;
        pnlLogin.Enabled = true;
        pnlLogin.Visible = true;
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        pnlMain.Enabled = false;
        pnlMain.Visible = false;
        pnlRegister.Enabled = true;
        pnlRegister.Visible = true;
    }

    protected void btnLoginBack_Click1(object sender, EventArgs e)
    {
        pnlMain.Enabled = true;
        pnlMain.Visible = true;
        pnlLogin.Enabled = false;
        pnlLogin.Visible = false;
    }

    protected void btnRegisterBack_Click(object sender, EventArgs e)
    {
        pnlMain.Enabled = true;
        pnlMain.Visible = true;
        pnlRegister.Enabled = false;
        pnlRegister.Visible = false;
    }



    protected void btnLoginSubmit_Click(object sender, EventArgs e)
    {
        Login userLog = new Login();
        bool loginSuccess = userLog.isLogin(txtUsername.Text, txtPassword.Text);
        if (loginSuccess)
        {
            Response.Redirect("Test.aspx");
        }
    }
}