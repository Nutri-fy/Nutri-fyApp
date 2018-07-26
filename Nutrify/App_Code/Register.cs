using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Register
/// </summary>
public class Register
{
    SqlConnection UserConnect = new SqlConnection();
    string connString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["Nutri-fyConnectionString"].ConnectionString;
    SqlCommand cmd;

    public Register() { }

    public void sendRegister(User user)
    {


        UserConnect.ConnectionString = connString;
        cmd = UserConnect.CreateCommand();

        try
        {
            string query = "INSERT into UserInfo values" + "(@Username, @Password, @Firstname, @Lastname, @Email, @IsAdmin, @Age, @Gender, @Height, @Weight, @Activity, @Calories," +
                "@NumOfMeals, @Goal, @PrPro, @PrCarbs, @PrFats);";

            SqlParameter userepar = new SqlParameter("@Username", user.userName);

            SqlParameter passpar = new SqlParameter("@Password", user.password);

            SqlParameter firstpar = new SqlParameter("@Firstname", user.firstName);

            SqlParameter lastpar = new SqlParameter("@Lastname", user.lastName);

            SqlParameter emailpar = new SqlParameter("@Email", user.email);

            SqlParameter adminpar = new SqlParameter("@IsAdmin", user.isAdmin);

            SqlParameter agepar = new SqlParameter("@Age", user.age);

            SqlParameter genderpar = new SqlParameter("@Gender", user.gender);

            SqlParameter heightpar = new SqlParameter("@Height", user.height);

            SqlParameter weightpar = new SqlParameter("@Weight", user.weight);

            SqlParameter activitypar = new SqlParameter("@Activity", user.activity);

            SqlParameter calpar = new SqlParameter("@Calories", user.calories);

            SqlParameter numpar = new SqlParameter("@NumOfMeals", user.numOfMeals);

            SqlParameter goalpar = new SqlParameter("@Goal", user.goal);

            SqlParameter propar = new SqlParameter("@PrPro", user.prPro);

            SqlParameter carbspar = new SqlParameter("@PrCarbs", user.prCarbs);

            SqlParameter fatpar = new SqlParameter("@PrFats", user.prFats);

            cmd.CommandText = query;
            cmd.Parameters.Add(userepar);
            cmd.Parameters.Add(passpar);
            cmd.Parameters.Add(firstpar);
            cmd.Parameters.Add(lastpar);
            cmd.Parameters.Add(emailpar);
            cmd.Parameters.Add(adminpar);
            cmd.Parameters.Add(agepar);
            cmd.Parameters.Add(genderpar);
            cmd.Parameters.Add(heightpar);
            cmd.Parameters.Add(weightpar);
            cmd.Parameters.Add(activitypar);
            cmd.Parameters.Add(calpar);
            cmd.Parameters.Add(numpar);
            cmd.Parameters.Add(goalpar);
            cmd.Parameters.Add(propar);
            cmd.Parameters.Add(carbspar);
            cmd.Parameters.Add(fatpar);


            UserConnect.Open();
            cmd.ExecuteNonQuery();
        }
        finally
        {
            cmd.Dispose();
            UserConnect.Close();
        }
    }

    public bool validateUsername(string uname)
    {
        UserConnect.ConnectionString = connString;
        cmd = UserConnect.CreateCommand();
        try
        {
            string query = "SELECT COUNT (*) from UserInfo where userName like @Username;";

            SqlParameter userepar = new SqlParameter("@Username", uname);


            cmd.CommandText = query;
            cmd.Parameters.Add(userepar);

            UserConnect.Open();


            string result = cmd.ExecuteScalar().ToString();

            if (result == "1")
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        finally
        {
            cmd.Dispose();
            UserConnect.Close();
        }
    }
}