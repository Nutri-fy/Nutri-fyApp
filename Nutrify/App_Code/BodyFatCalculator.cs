using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Calculates and stores a users body fat, and their current weight, according to date
/// </summary>
public class BodyFatCalculator
{
    SqlConnection UserConnect = new SqlConnection();
    string connString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["Nutri-fyConnectionString"].ConnectionString;
    SqlCommand cmd;

    int userID;
    int gender;
    public BodyFatCalculator(int uID)
    {
        UserConnect.ConnectionString = connString;
        cmd = UserConnect.CreateCommand();
        this.userID = uID;

        try
        {
            string query = "SELECT gender from UserInfo where userID like @uID;";

            cmd.CommandText = query;
            cmd.Parameters.AddWithValue("@uID", userID);

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
        catch (Exception e)
        {
            return false;
        }
        finally
        {
            cmd.Dispose();
            UserConnect.Close();
        }


    }

    public double calculateBFat()
    {
        double bFat = 0;


        return bFat;
    }
}