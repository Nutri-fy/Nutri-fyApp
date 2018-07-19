using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    User one = new User();
    CalorieCalculator cc = new CalorieCalculator();
    protected void Page_Load(object sender, EventArgs e)
    {
        pnlMain.Enabled = true;
        pnlMain.Visible = true;
        pnlLogin.Enabled = false;
        pnlLogin.Visible = false;
        pnlRegister.Enabled = false;
        pnlRegister.Visible = false;
        pnlRegister2.Enabled = false;
        pnlRegister2.Visible = false;
        pnlCalculateCal.Enabled = false;
        pnlCalculateCal.Visible = false;
        pnlEnterCal.Enabled = false;
        pnlEnterCal.Visible = false;
        pnlRegister2FormControl.Enabled = false;
        pnlRegister2FormControl.Visible = false;
        pnlCalculateValues.Enabled = false;
        pnlCalculateValues.Visible = false;
        pnlCalculateResults.Enabled = false;
        pnlCalculateResults.Visible = false;
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
        pnlLogin.Enabled = false;
        pnlLogin.Visible = false;
        pnlMain.Enabled = true;
        pnlMain.Visible = true;
    }

    protected void btnRegisterBack_Click(object sender, EventArgs e)
    {
        pnlMain.Enabled = true;
        pnlMain.Visible = true;
        pnlRegister.Enabled = false;
        pnlRegister.Visible = false;
    }

    protected void btnContinue_Click(object sender, EventArgs e)
    {
        one.userName = txtRegUsername.Text;
        one.firstName = txtFirstname.Text;
        one.lastName = txtLastname.Text;
        one.password = txtRegPassword.Text;
        one.email = txtEmail.Text;
        one.isAdmin = 0;

        pnlMain.Enabled = false;
        pnlMain.Visible = false;
        pnlRegister.Enabled = false;
        pnlRegister.Visible = false;
        pnlRegister2.Enabled = true;
        pnlRegister2.Visible = true;
    }

    protected void refreshLogin()
    {
        pnlMain.Enabled = false;
        pnlMain.Visible = false;
        pnlLogin.Enabled = true;
        pnlLogin.Visible = true;
        txtUsername.BorderColor = System.Drawing.Color.Red;
        txtUsername.BorderWidth = 2;
    }



    protected void btnLoginSubmit_Click(object sender, EventArgs e)
    {
        Login userLog = new Login();
        bool loginSuccess = userLog.isLogin(txtUsername.Text, txtPassword.Text);
        if (loginSuccess)
        {
           Response.Redirect("Test.aspx");
        }
        else
        {
           
           Response.Write("<script>alert('Login Unsuccessful!');</script>");
           refreshLogin();
        }
    }

    protected void btnRegisterSubmit_Click(object sender, EventArgs e)
    {

        if(RadioButtonList1.SelectedValue == "0")
        {
            one.age = Convert.ToInt32(txtAge.Text);
            one.gender = Convert.ToInt32(ddGender.SelectedValue);
            one.height = Convert.ToInt32(txtHeight.Text);
            one.weight = Convert.ToDouble(txtWeight.Text);
            one.activity = Convert.ToDouble(ddActivity.SelectedValue);
            one.goal = Convert.ToInt32(ddGoal.SelectedValue);

        }


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

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        pnlMain.Enabled = false;
        pnlMain.Visible = false;
        pnlRegister2.Enabled = true;
        pnlRegister2.Visible = true;
        pnlRegister2FormControl.Enabled = true;
        pnlRegister2FormControl.Visible = true;
        if(RadioButtonList1.SelectedValue == "0")
        {
            pnlCalculateCal.Enabled = true;
            pnlCalculateCal.Visible = true;
            pnlEnterCal.Enabled = false;
            pnlEnterCal.Visible = false;
            pnlRegister2FormControl.Enabled = false;
            pnlRegister2FormControl.Visible = false;
            register2Form.Attributes.Add("style", "height:500px");
            pnlCalculateValues.Enabled = true;
            pnlCalculateValues.Visible = true;
        }
        else
        {
            pnlCalculateCal.Enabled = false;
            pnlCalculateCal.Visible = false;
            pnlEnterCal.Enabled = true;
            pnlEnterCal.Visible = true;
            pnlRegister2FormControl.Enabled = true;
            pnlRegister2FormControl.Visible = true;
            register2Form.Attributes.Add("style", "height:500px");
            pnlCalculateValues.Enabled = false;
            pnlCalculateValues.Visible = false;
            pnlCalculateResults.Enabled = false;
            pnlCalculateResults.Visible = false;
        }
    }



    protected void btnCalculateCaloriesMacros_Click(object sender, EventArgs e)
    {
        pnlMain.Enabled = false;
        pnlMain.Visible = false;
        pnlRegister2.Enabled = true;
        pnlRegister2.Visible = true;
        pnlRegister2FormControl.Enabled = true;
        pnlRegister2FormControl.Visible = true;
        register2Form.Attributes.Add("style", "height:700px");
        pnlCalculateCal.Enabled = true;
        pnlCalculateCal.Visible = true;
        pnlEnterCal.Enabled = false;
        pnlEnterCal.Visible = false;
        pnlRegister2FormControl.Enabled = true;
        pnlRegister2FormControl.Visible = true;
        pnlCalculateValues.Enabled = true;
        pnlCalculateValues.Visible = true;
        pnlCalculateResults.Enabled = true;
        pnlCalculateResults.Visible = true;

        cc.age = Convert.ToInt32(txtAge.Text);
        cc.gender = Convert.ToInt32(ddGender.SelectedValue);
        cc.height = Convert.ToInt32(txtHeight.Text);
        cc.weight = Convert.ToDouble(txtWeight.Text);
        cc.activity = Convert.ToDouble(ddActivity.SelectedValue);
        cc.goal = Convert.ToInt32(ddGoal.SelectedValue);

        txtCaloriesResults.Text = cc.calculateCalories().ToString();
        double[] macros = cc.calculateMacros();
        txtPrProResults.Text = macros[0].ToString();
        txtPrCarbResults.Text = macros[1].ToString();
        txtPrFatResults.Text = macros[2].ToString();
 
    }
} 
        

      