using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary> hidfhidfh
/// Summary description for Login
/// </summary>
public class Login
{
    SqlConnection UserConnect = new SqlConnection();
    string connString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["Nutri-fyConnectionString"].ConnectionString;
    SqlCommand cmd;

    public int userID;
    
    public bool isLogin(string uname, string pass)
    {

        UserConnect.ConnectionString = connString;
        cmd = UserConnect.CreateCommand();
        UserConnect.Open();

        try
        {
            string query = "SELECT COUNT(*) from UserInfo where userName like @Username AND password like @Password;";

           // SqlParameter userepar = new SqlParameter();
          //  SqlParameter passpar = new SqlParameter();

            cmd.CommandText = query;
            cmd.Parameters.AddWithValue("@Username", uname);
            cmd.Parameters.AddWithValue("@Password", pass);

            string result = cmd.ExecuteScalar().ToString();
            if (result=="1")
            {
                string queryID = "SELECT userID from UserInfo where userName like @Username AND password like @Password;";
                cmd.CommandText = queryID;
                userID = Convert.ToInt32(cmd.ExecuteScalar());
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

}