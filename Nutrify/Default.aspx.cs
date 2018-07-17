using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
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

    protected void btnRegisterSubmit_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection();
        string conString = "Server=den1.mssql2.gear.host; Database=class2018; User=class2018; Password=c#class";
        SqlCommand cmd;

        conn.ConnectionString = conString;
        cmd = conn.CreateCommand();

        string userName = txtRegUsername.Text;
        string password = txtRegPassword.Text;
        string email = txtEmail.Text;
        int isAdmin = 0;
        int height = 0;
        double weight = 0;
        double calories = 0;
        double bodyFat = 0;
        int numOfMeals = 0;
        int goal = 0;
        double prPro = 0;
        double prCarb = 0;
        double prFat = 0;

        try
        {
            string query = "Insert into UserInfo values ('" + userName + "','" + password + "','" + email + "', '" + isAdmin + "', '" + height + "', '" + weight + "', '" + calories + "', " +
                "'" + bodyFat + "', '" + numOfMeals + "', '" + goal + "', '" + prPro + "', '" + prCarb + "', '" + prFat + "');";
            cmd.CommandText = query;
            conn.Open();
            cmd.ExecuteScalar();
        }
        finally
        {
            cmd.Dispose();
            conn.Close();
        }
    }
} 
        

      