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
    double weight;
    string date;
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

            int result = Convert.ToInt32(cmd.ExecuteScalar());
            if (result == 1)
            {
                gender = 1;
            }
            else
            {
                gender = 2;
            }
        }
        catch (Exception e)
        {
           
        }
        finally
        {
            cmd.Dispose();
            UserConnect.Close();
        }


    }

    public double calculateBFat(double weight, double wrist, double waist, double hip, double forearm )
    {
        double bFat = 0;
        date = DateTime.Now.ToString("yyyy-MM-dd");
        if (gender == 1)
        {
            this.weight = weight;
            double factor1 = (weight * 1.082) + 94.42;
            double factor2 = waist * 4.15;
            double lean = factor1 - factor2;
            bFat = ((weight - lean) * 100) / weight;
        }
        else
        {
            this.weight = weight;
            double factor1 = (weight * 0.732) + 8.937;
            double factor2 = wrist / 3.140;
            double factor3 = waist * 0.157;
            double factor4 = hip * 0.249;
            double factor5 = forearm * 0.434;
            double lean = factor1 + factor2 - factor3 - factor4 + factor5;
            bFat = ((weight - lean) * 100) / weight;
        }

        UserConnect.ConnectionString = connString;
        cmd = UserConnect.CreateCommand();

        try
        {
            string query = "INSERT INTO OtherStats (userId, weight, bodyfat, date) values (@uID, @weight, @bFat, @date);";

            cmd.CommandText = query;
            cmd.Parameters.AddWithValue("@uID", userID);
            cmd.Parameters.AddWithValue("@weight", weight);
            cmd.Parameters.AddWithValue("@bFat", bFat);
            cmd.Parameters.AddWithValue("@date", date);

            UserConnect.Open();
            cmd.ExecuteNonQuery();
            
        }
        catch (Exception e)
        {

        }
        finally
        {
            cmd.Dispose();
            UserConnect.Close();
        }

        return bFat;
    }
}