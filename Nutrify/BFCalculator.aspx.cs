using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BFCalculator : System.Web.UI.Page
{
    private int gender;
    BodyFatCalculator bfc;
    protected void Page_Load(object sender, EventArgs e)
    {
        bfc = new BodyFatCalculator(Convert.ToInt32(Session["sUserId"]));
        if (!IsPostBack)
        {
            pnlMale.Enabled = false;
            pnlMale.Visible = false;
            pnlFemale.Enabled = false;
            pnlFemale.Visible = false;
            txtMBF.Enabled = false;
            txtFBF.Enabled = false;



            gender = bfc.getGenderBFC();
            if (gender == 1)
            {
                pnlMale.Enabled = true;
                pnlMale.Visible = true;
                intro.Style.Add("background-color", "azure");
                intro.Style.Add("position", "relative");
                intro.Style.Add("width", "50%");
                intro.Style.Add("height", "325px");
                intro.Style.Add("margin-left", "25%");
                intro.Style.Add("margin-right", "25%");
                intro.Style.Add(" margin-top", "7%");

            }
            else
            {
                pnlFemale.Enabled = true;
                pnlFemale.Visible = true;
                intro.Style.Add("background-color", "azure");
                intro.Style.Add("position", "relative");
                intro.Style.Add("width", "50%");
                intro.Style.Add("height", "420px");
                intro.Style.Add("margin-left", "25%");
                intro.Style.Add("margin-right", "25%");
                intro.Style.Add(" margin-top", "7%");
            }
        }
    }

    protected void calculateMWeight_Click(object sender, EventArgs e)
    {
        txtMBF.Text = (bfc.calculateBFat(Convert.ToDouble(txtMWeight.Text), 0.0, Convert.ToDouble(txtMWaist.Text), 0.0, 0.0).ToString());
        txtMBF.Enabled = true;
    }

    protected void btnFCalculate_Click(object sender, EventArgs e)
    {
        txtFBF.Text = (bfc.calculateBFat(Convert.ToDouble(txtFWeight.Text), Convert.ToDouble(txtFWrist.Text), Convert.ToDouble(txtFWaist.Text), Convert.ToDouble(txtFHip.Text), Convert.ToDouble(txtFForearm.Text)).ToString());
        txtFBF.Enabled = true;
    }
}