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
    Register reg = new Register();
    Login userLog = new Login();
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

        Application_BeginRequest();

    }

    protected void Application_BeginRequest()
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
        Response.Cache.SetNoStore();
    }
    protected void Application_BeginRequest1()
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));

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
        txtPassword.Text = "";
        txtUsername.Text = "";
    }

    protected void btnRegisterBack_Click(object sender, EventArgs e)
    {
        pnlMain.Enabled = true;
        pnlMain.Visible = true;
        pnlRegister.Enabled = false;
        pnlRegister.Visible = false;
        Application_BeginRequest1();
    }

    protected void btnContinue_Click(object sender, EventArgs e)
    {

        this.Session.Add("sUsername", txtRegUsername.Text);
        this.Session.Add("sFirstName", txtFirstname.Text);
        this.Session.Add("sLastName", txtLastname.Text);
        this.Session.Add("sPassword", txtRegPassword.Text);
        this.Session.Add("sEmail", txtEmail.Text);

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
    }



    protected void btnLoginSubmit_Click(object sender, EventArgs e)
    {

        bool loginSuccess = userLog.isLogin(txtUsername.Text, txtPassword.Text);
        if (loginSuccess)
        {
            this.Session.Add("sUserId", userLog.getUserId());
            Response.Redirect("Test.aspx");
        }
        else
        {
            refreshLogin();
            txtHiddenUsername.Text = "";
            txtHiddenPassword.Text = "";
            cmpUserName.ValueToCompare = txtHiddenUsername.Text;
            cmpUserName.Validate();
            cmpUserName.ValueToCompare = txtHiddenPassword.Text;
            cmpPassword.Validate();
            txtUsername.Text = string.Empty;
            txtPassword.Text = string.Empty;

        }
        Application_BeginRequest1();
    }

    protected void btnRegisterSubmit_Click(object sender, EventArgs e)
    {
        one.userName = Session["sUsername"].ToString();
        one.firstName = Session["sFirstName"].ToString();
        one.lastName = Session["sLastName"].ToString();
        one.password = Session["sPassword"].ToString();
        one.email = Session["sEmail"].ToString();
        one.isAdmin = 0;

        if (RadioButtonList1.SelectedValue == "0")
        {


            one.age = Convert.ToInt32(txtAge.Text);
            one.gender = Convert.ToInt32(ddGender.SelectedValue);
            one.height = Convert.ToInt32(txtHeight.Text);
            one.weight = Convert.ToDouble(txtWeight.Text);
            one.activity = Convert.ToDouble(ddActivity.SelectedValue);
            one.calories = Convert.ToDouble(txtCaloriesResults.Text);
            one.bFat = 0;
            one.numOfMeals = Convert.ToInt32(ddMeals.SelectedValue);
            one.goal = Convert.ToInt32(ddGoal.SelectedValue);
            one.prPro = Convert.ToDouble(txtPrProResults.Text);
            one.prCarbs = Convert.ToDouble(txtPrCarbResults.Text);
            one.prFats = Convert.ToDouble(txtPrFatResults.Text);
            reg.sendRegister(one);
        }
        else
        {
            one.age = Convert.ToInt32(txtAge.Text);
            one.gender = Convert.ToInt32(ddGender.SelectedValue);
            one.height = Convert.ToInt32(txtHeight.Text);
            one.weight = Convert.ToDouble(txtWeight.Text);
            one.activity = 0;
            one.calories = Convert.ToDouble(txtEnterCalories.Text);
            one.bFat = 0;
            one.numOfMeals = Convert.ToInt32(ddMeals2.SelectedValue);
            one.goal = 0;
            one.prPro = Convert.ToDouble(txtPrPro.Text);
            one.prCarbs = Convert.ToDouble(txtPrCarb.Text);
            one.prFats = Convert.ToDouble(txtPrFat.Text);
            reg.sendRegister(one);
        }
        Application_BeginRequest1();

    }

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        pnlMain.Enabled = false;
        pnlMain.Visible = false;
        pnlRegister2.Enabled = true;
        pnlRegister2.Visible = true;
        pnlRegister2FormControl.Enabled = true;
        pnlRegister2FormControl.Visible = true;

        if (RadioButtonList1.SelectedValue == "0")
        {
            pnlCalculateCal.Enabled = true;
            pnlCalculateCal.Visible = true;
            pnlEnterCal.Enabled = false;
            pnlEnterCal.Visible = false;
            pnlRegister2FormControl.Enabled = false;
            pnlRegister2FormControl.Visible = false;
            pnlRegister2.CssClass = "pnlRegister2Calculate";
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
            pnlRegister2.CssClass = "pnlRegister2Input";
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
        pnlRegister2.CssClass = "pnlRegister2Macros";
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

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        pnlRegister2.CssClass = "pnlRegister2";
        Response.Redirect("default.aspx");
        Application_BeginRequest1();
    }

    protected void btnValidateUsernameReg_Click(object sender, EventArgs e)
    {
        pnlMain.Enabled = false; ;
        pnlMain.Visible = false;
        pnlRegister.Enabled = true;
        pnlRegister.Visible = true;

        bool result = reg.validateUsername(txtRegUsername.Text);
        if (result || txtRegUsername.Text.Length == 0)
        {
            imgUsername.Attributes["src"] = ResolveUrl("img/cancel.png");
            txtRegUsername.Text = string.Empty;
           
        }
        else
        {
            imgUsername.Attributes["src"] = ResolveUrl("img/checked.png");
            btnContinue.Enabled = true;
        }

    }
}


