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
    SqlConnection conn = new SqlConnection();
    string conString = "Server=den1.mssql2.gear.host; Database=class2018; User=class2018; Password=c#class";
    SqlCommand cmd;

    public Register() { }

    public void sendRegister(User user)
    {
       

        conn.ConnectionString = conString;
        cmd = conn.CreateCommand();


        try
        {
            string query = "Insert into UserInfo values ('" + user.userName + "','" + user.password + "','" + user.firstName + "','" + user.lastName + "', '" + user.email + "','" + user.isAdmin + "','" + user.age + "','" + user.gender + "', '" + user.height + "'" +
                ", '" + user.weight + "','" + user.activity + "', '" +user.calories + "', " +
                "'" + user.bFat + "', '" + user.numOfMeals + "', '" + user.goal + "', '" + user.prPro + "', '" + user.prCarbs + "', '" + user.prFats + "');";
            cmd.CommandText = query;
            conn.Open();
            cmd.ExecuteScalar();
        }
        finally
        {
            cmd.Dispose();
            conn.Close();
        }
    }

    public bool validateUsername(string uname)
    {
        conn.ConnectionString = conString;
        cmd = conn.CreateCommand();
        conn.Open();
        try
        {
            string query = "SELECT COUNT (*) from UserInfo where userName like '" + uname + "';";
            cmd.CommandText = query;
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
            conn.Close();
        }
    }
}