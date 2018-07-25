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

        try
        {
            string query = "SELECT COUNT (*) from UserInfo where userName like '@Username' AND password like '@Password';";

            SqlParameter userepar = new SqlParameter("@Username", uname);
            SqlParameter passpar = new SqlParameter("@Password", pass);

            cmd.CommandText = query;
            cmd.Parameters.Add(userepar);
            cmd.Parameters.Add(passpar);

            UserConnect.Open();
            

            string result = cmd.ExecuteScalar().ToString();
            if (result=="1")
            {
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