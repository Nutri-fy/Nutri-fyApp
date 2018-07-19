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
    private SqlConnection conn = new SqlConnection();
    private string conString = "Server=den1.mssql2.gear.host; Database=class2018; User=class2018; Password=c#class";
    private SqlCommand cmd;
    public int userID;
    public string[] loginInfo = new string[2];
    
    public bool isLogin(string uname, string pass)
    {

        conn.ConnectionString = conString;
        cmd = conn.CreateCommand();
        conn.Open();

        try
        {
            string query = "SELECT COUNT (*) from UserInfo where userName like '"+uname+"' AND password like '"+pass+"';";
            cmd.CommandText = query;

            string result = cmd.ExecuteScalar().ToString();
            if (result=="1")
            {
                string queryUserID = "SELECT userID from UserInfo where userName like '" + uname + "' AND password like '" + pass + "';";
                cmd.CommandText = queryUserID;
                userID = Convert.ToInt32(cmd.ExecuteScalar());

                string queryUserName = "SELECT userName from UserInfo where userName like '" + uname + "';";
                cmd.CommandText = queryUserName;
                loginInfo[0] = cmd.ExecuteScalar().ToString();

                string queryPassword = "SELECT password from UserInfo where password like '" + pass + "';";
                cmd.CommandText = queryPassword;
                loginInfo[1] = cmd.ExecuteScalar().ToString();
                return true;
            }
            else
            {
                string queryUserName= "SELECT userName from UserInfo where userName like '" + uname + "';";
                cmd.CommandText = queryUserName;
                loginInfo[0] = cmd.ExecuteScalar().ToString();

                string queryPassword = "SELECT password from UserInfo where password like '" + pass + "';";
                cmd.CommandText = queryPassword;
                loginInfo[1] = cmd.ExecuteScalar().ToString();
                return false;
            }
        }catch (Exception e)
        {
            return false;
        }
        finally
        {
            cmd.Dispose();
            conn.Close();
        }
    }

    public int getUserId()
    {
        return userID;
    }

    public string[] getLoginInfo()
    {
        return loginInfo;
    }






}