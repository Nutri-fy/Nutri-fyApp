using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Login
/// </summary>
public class Login
{
    SqlConnection UserConnect = new SqlConnection();
    string connString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["Nutri-fyConnectionString"].ConnectionString;
    SqlCommand cmd;

    public int userID;

    public int isAdmin;
    
    public bool isLogin(string uname, string pass)
    {

        UserConnect.ConnectionString = connString;
        cmd = UserConnect.CreateCommand();
        UserConnect.Open();

        try
        {
            string query = "SELECT COUNT(*) from UserInfo where userName like @Username AND password like @Password;";

            cmd.CommandText = query;
            cmd.Parameters.AddWithValue("@Username", uname);
            cmd.Parameters.AddWithValue("@Password", pass);

            string result = cmd.ExecuteScalar().ToString();
            if (result=="1")
            {
                string queryID = "SELECT userID, isAdmin from UserInfo where userName like @Username AND password like @Password;";
                cmd.CommandText = queryID;
                var reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        userID = Convert.ToInt32(reader[0]);
                        isAdmin = Convert.ToInt32(reader[1]);
                    }
                }
               
                return true;
            }
            else
            {
                return false;
            }
        }catch (Exception e)
        {
            return false;
        }
        finally
        {
            cmd.Dispose();
            UserConnect.Close();
        }
    }

    public int getUserId()
    {

        return userID;
    }

    public int getIsAdmin()
    {
        return isAdmin;
    }

}