﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Login
/// </summary>
public class Login
{
    private SqlConnection conn = new SqlConnection();
    private string conString = "Server=DEEMANTHA\\SQLEXPRESS; Database=class2018; User=deemantha; Password=deemantha";
    private SqlCommand cmd;
    
    public bool isLogin(string uname, string pass)
    {

        conn.ConnectionString = conString;
        cmd = conn.CreateCommand();

        try
        {
            string query = "SELECT COUNT (*) from UserInfo where userName like '"+uname+"' AND password like '"+pass+"';";
            cmd.CommandText = query;
            conn.Open();
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
            conn.Close();
        }
    }








}