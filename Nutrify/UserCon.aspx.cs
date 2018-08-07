using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class UserCon : System.Web.UI.Page
{
    SqlConnection UserConnect = new SqlConnection();
    string connString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["Nutri-fyConnectionString"].ConnectionString;
    SqlCommand cmd;
    string userName;
    string firstName;
    string lastName;
    string password;
    string email;
    int age;
    int isAdmin;
    int gender;
    double weight;
    double height;
    double activity;
    double calories;
    int numOfMeals;
    int goal;
    double prPro;
    double prCarb;
    double prFats;
    int uId;
    protected void Page_Load(object sender, EventArgs e)
    {
        UserConnect.ConnectionString = connString;
        cmd = UserConnect.CreateCommand();
        UserConnect.Open();
        
        uId = Convert.ToInt32(Session["sUserId"]);
        try
        {
            string query = "SELECT firstName, lastName from UserInfo where userID like'" + 3 + "' ;";
            cmd.CommandText = query;
            var reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    firstName = reader[0].ToString();
                    lastName = reader[1].ToString();
                }
            }
        }
        catch
        {

        }
        finally
        {
            cmd.Dispose();
            UserConnect.Close();
        }
        lblUserName.Text = "Welcome " + firstName + " " + lastName;
        try
        {           
            string query = "SELECT * from UserInfo where userID like'" + 3 + "' ;";
            cmd.CommandText = query;
            var reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    userName = reader[1].ToString();
                    password = reader[2].ToString();
                    firstName = reader[3].ToString();
                    lastName = reader[4].ToString();
                    email = reader[5].ToString();
                    isAdmin = Convert.ToInt32(reader[6]);
                    age = Convert.ToInt32(reader[7]);
                    gender = Convert.ToInt32(reader[8]);
                    height = Convert.ToInt32(reader[9]);
                    weight = Convert.ToDouble(reader[10]);
                    activity = Convert.ToDouble(reader[11]);
                    calories = Convert.ToDouble(reader[12]);
                    numOfMeals = Convert.ToInt32(reader[13]);
                    goal = Convert.ToInt32(reader[14]);
                    prPro = Convert.ToDouble(reader[15]);
                    prCarb = Convert.ToDouble(reader[16]);
                    prFats = Convert.ToDouble(reader[17]);

                }
            }
            tbFirstName.Text = firstName;
            tbLastName.Text = lastName;
            tbPassword1.Text = password;
            tbPassword2.Text = password;
            tbEmail.Text = email;
            tbAge.Text = age.ToString();
        }
        catch
        {

        }
        finally
        {
            cmd.Dispose();
            UserConnect.Close();
        }

    }


    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            string query = "UPDATE FlightInfo set userName=@userName,password=@password,firstName=@firstName,lastName=@lastName,email=@email,isAdmin=@isAdmin," +
            "age=@age,gender=@gender,height=@height,weight=@weight,activity=@activity,calories=@calories,numOfMeals=@numOfMeals,goal=@goal,prPro=@prPro," +
            "prCarb=@prCarb,prFats=@prFats where userID=@userID;";

            SqlParameter userNamepar = new SqlParameter("@userName", userName);
            SqlParameter passpar = new SqlParameter("@password", tbPassword2.Text);
            SqlParameter firstNamepar = new SqlParameter("@firstName", tbFirstName.Text);
            SqlParameter lastNamepar = new SqlParameter("@lastName", tbLastName.Text);
            SqlParameter emailpar = new SqlParameter("@email", tbEmail.Text);
            SqlParameter isAdminpar = new SqlParameter("@isAdmin", isAdmin);
            SqlParameter agepar = new SqlParameter("@age", tbAge.Text);
            SqlParameter genderpar = new SqlParameter("@gender", gender);
            SqlParameter heightpar = new SqlParameter("@height", height);
            SqlParameter weightpar = new SqlParameter("@weight", height);
            SqlParameter activitypar = new SqlParameter("@activity", activity);
            SqlParameter calpar = new SqlParameter("@calories", calories);
            SqlParameter numOfMealspar = new SqlParameter("@numOfMeals", numOfMeals);
            SqlParameter goalpar = new SqlParameter("@goal", goal);
            SqlParameter prPropar = new SqlParameter("@prPro", prPro);
            SqlParameter prCarbpar = new SqlParameter("@prCarb", prCarb);
            SqlParameter prFatspar = new SqlParameter("@prFats", prFats);
            SqlParameter IDpar = new SqlParameter("@userID", uId);

            cmd.CommandText = query;
            cmd.Parameters.Add(userNamepar);
            cmd.Parameters.Add(passpar);
            cmd.Parameters.Add(firstNamepar);
            cmd.Parameters.Add(lastNamepar);
            cmd.Parameters.Add(emailpar);
            cmd.Parameters.Add(isAdminpar);
            cmd.Parameters.Add(agepar);
            cmd.Parameters.Add(genderpar);
            cmd.Parameters.Add(heightpar);
            cmd.Parameters.Add(weightpar);
            cmd.Parameters.Add(activitypar);
            cmd.Parameters.Add(calpar);
            cmd.Parameters.Add(numOfMealspar);
            cmd.Parameters.Add(goalpar);
            cmd.Parameters.Add(prPropar);
            cmd.Parameters.Add(prCarbpar);
            cmd.Parameters.Add(prFatspar);
            cmd.Parameters.Add(IDpar);

            UserConnect.Open();
        }
        catch
        {

        }
        finally
        {
            cmd.Dispose();
            UserConnect.Close();
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        tbAge.Text = "";
        tbEmail.Text = "";
        tbFirstName.Text = "";
        tbLastName.Text = "";
        tbPassword1.Text = "";
        tbPassword2.Text = "";
    }
}