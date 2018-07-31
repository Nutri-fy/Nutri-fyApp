﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for MealPlanner
/// </summary>
public class MealPlanner
{
    int userID;
    double calories;
    int meals;
    double prPro;
    double prFat;
    double prCarb;
    double calcPro;
    double calcCarb;
    double calcFat;
    double calcSnacks;
    int sqlLimit;
    int servingSize = 100;
    List<Protein> proList = new List<Protein>();
    List<Carbs> carbList = new List<Carbs>();
    List<Fats> fatList = new List<Fats>();
    Dictionary<int, List<Protein>> dictionaryProtein;
    Dictionary<int, List<Carbs>> dictionaryCarbs;
    Dictionary<int, List<Fats>> dictionaryFats;
    Dictionary<int, List<Snacks>> dictionarySnacks;
    Dictionary<int, List<Vegs>> dictionaryVeg;

    SqlConnection UserConnect = new SqlConnection();
    string connString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["Nutri-fyConnectionString"].ConnectionString;
    SqlCommand cmd;
    SqlDataReader reader;

    public MealPlanner(int uID)
    {
        this.userID = uID;
        UserConnect.ConnectionString = connString;
        cmd = UserConnect.CreateCommand();

        try
        {
            string query = "SELECT calories, numOfMeals, prPro, prCarb, prFats from UserInfo where userID like @uID;";

            cmd.CommandText = query;
            cmd.Parameters.AddWithValue("@uID", userID);
            UserConnect.Open();

            var reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    calories = Convert.ToDouble(reader[0]);
                    meals = Convert.ToInt32(reader[1]);
                    prPro = Convert.ToDouble(reader[2]);
                    prCarb = Convert.ToDouble(reader[3]);
                    prFat = Convert.ToDouble(reader[4]);
                   
                }
            }
        }
        catch (Exception e)
        {

        }
        finally
        {
            cmd.Dispose();
            UserConnect.Close();

            calcPro = (calories * prPro) / meals;
            calcCarb = (calories * prCarb * 0.75) /meals;
            calcSnacks = (calories * prCarb * 0.25) / meals;
            calcFat = (calories * prFat) / meals;
            sqlLimit = 7 * meals;
        }
    }

    public void makeProteinMeals()
    {
        dictionaryProtein = new Dictionary<int, List<Protein>>();
        UserConnect.ConnectionString = connString;
        cmd = UserConnect.CreateCommand();

        try
        {
            string query = "SELECT TOP @limit foodGroup, name, protein, fat, Carbohydrates, calories from Ingredients where foodgroup like '%Poultry%'" +
                "OR foodGroup like '%Sausages%' OR foodGroup like '%Pork%' or foodGroup like '%Beef%' or foodGroup like '%Finfish%' or foodGroup like '%Lamb%' " +
                "ORDER BY NEWID();";

            cmd.Parameters.AddWithValue("@limit", sqlLimit);

           

            cmd.CommandText = query;
            

            UserConnect.Open();
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Protein protein = new Protein()
                    {
                        name = reader["name"].ToString(),
                        protein = (int)reader["protein"],
                        fat = (double)reader["fat"],
                        carbohydrates = (double)reader["carbohyrdates"],
                        calories = (int)reader["calories"],
                        servingSize = 100
                        
                    };
                    double factor = calcPro / protein.calories;
                    protein.protein = (int)(protein.protein * factor);
                    protein.fat = protein.fat * factor;
                    protein.carbohydrates = protein.carbohydrates * factor;
                    protein.calories = (int)(protein.calories * factor);
                    protein.servingSize = (int)(protein.servingSize * factor);
                    proList.Add(protein);
                }
            }
            for(int i = 0; i < 7; i++)
            {
                List<Protein> proMeal = new List<Protein>();
                for (int j=0; j< meals; j++)
                {
                    Random rdm = new Random();

                    int num = rdm.Next(0, proList.Count - 1);
                    proMeal.Add(proList[num]);
                    proList.RemoveAt(num);
                }
                dictionaryProtein.Add(i, proMeal);
            }
        }
        finally
        {
            cmd.Dispose();
            UserConnect.Close();
        }

    }

    public void makeCarbMeals()
    {
        dictionaryCarbs = new Dictionary<int, List<Carbs>>();
        UserConnect.ConnectionString = connString;
        cmd = UserConnect.CreateCommand();

        try
        {
            string query = "SELECT TOP @limit name, protein, fat, Carbohydrates, calories from Ingredients where (name like '%potato%'" +
                "OR name like '%pasta%' OR name like '%rice%' or name like '%macaroni%' or name like '%noodles%' or name like '%spaghetti%') and name NOT LIKE '%snack%'" +
                "ORDER BY NEWID();";

            cmd.Parameters.AddWithValue("@limit", sqlLimit);
            cmd.CommandText = query;


            UserConnect.Open();
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Carbs carbs = new Carbs()
                    {
                        name = reader["name"].ToString(),
                        protein = (int)reader["protein"],
                        fat = (double)reader["fat"],
                        carbohydrates = (double)reader["carbohyrdates"],
                        calories = (int)reader["calories"],
                        servingSize = 100

                    };
                    double factor = calcCarb / carbs.calories;
                    carbs.protein = (int)(carbs.protein * factor);
                    carbs.fat = carbs.fat * factor;
                    carbs.carbohydrates = carbs.carbohydrates * factor;
                    carbs.calories = (int)(carbs.calories * factor);
                    carbs.servingSize = (int)(carbs.servingSize * factor);
                    carbList.Add(carbs);
                }
            }
            for (int i = 0; i < 7; i++)
            {
                List<Carbs> carbMeal = new List<Carbs>();
                for (int j = 0; j < meals; j++)
                {
                    Random rdm = new Random();

                    int num = rdm.Next(0, proList.Count - 1);
                    carbMeal.Add(carbList[num]);
                    carbList.RemoveAt(num);
                }
                dictionaryCarbs.Add(i, carbMeal);
            }
        }
        finally
        {
            cmd.Dispose();
            UserConnect.Close();
        }
    }

    public void makeFatMeals()
    {
        dictionaryFats = new Dictionary<int, List<Fats>>();
        UserConnect.ConnectionString = connString;
        cmd = UserConnect.CreateCommand();

        try
        {
            string query = "SELECT TOP @limit name, protein, fat, Carbohydrates, calories from Ingredients where foodGroup like 'Fats and Oils' ORDER BY NEWID();";

            cmd.Parameters.AddWithValue("@limit", sqlLimit);
            cmd.CommandText = query;


            UserConnect.Open();
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Carbs carbs = new Carbs()
                    {
                        name = reader["name"].ToString(),
                        protein = (int)reader["protein"],
                        fat = (double)reader["fat"],
                        carbohydrates = (double)reader["carbohyrdates"],
                        calories = (int)reader["calories"],
                        servingSize = 100

                    };
                    double factor = calcCarb / carbs.calories;
                    carbs.protein = (int)(carbs.protein * factor);
                    carbs.fat = carbs.fat * factor;
                    carbs.carbohydrates = carbs.carbohydrates * factor;
                    carbs.calories = (int)(carbs.calories * factor);
                    carbs.servingSize = (int)(carbs.servingSize * factor);
                    carbList.Add(carbs);
                }
            }
            for (int i = 0; i < 7; i++)
            {
                List<Carbs> carbMeal = new List<Carbs>();
                for (int j = 0; j < meals; j++)
                {
                    Random rdm = new Random();

                    int num = rdm.Next(0, proList.Count - 1);
                    carbMeal.Add(carbList[num]);
                    carbList.RemoveAt(num);
                }
                dictionaryCarbs.Add(i, carbMeal);
            }
        }
        finally
        {
            cmd.Dispose();
            UserConnect.Close();
        }
    }
}

public class Protein
{
    public string name { get; set; }
    public int protein { get; set; }
    public double fat { get; set; }
    public double carbohydrates { get; set; }
    public int calories { get; set; }
    public double sugar { get; set; }
    public double fiber { get; set; }
    public double servingSize { get; set; }

}

public class Fats
{
    public string name { get; set; }
    public int protein { get; set; }
    public double fat { get; set; }
    public double carbohydrates { get; set; }
    public int calories { get; set; }
    public double sugar { get; set; }
    public double fiber { get; set; }
    public double servingSize { get; set; }
}

public class Carbs
{
    public string name { get; set; }
    public int protein { get; set; }
    public double fat { get; set; }
    public double carbohydrates { get; set; }
    public int calories { get; set; }
    public double sugar { get; set; }
    public double fiber { get; set; }
    public double servingSize { get; set; }
}

public class Snacks
{
    public string name { get; set; }
    public int protein { get; set; }
    public double fat { get; set; }
    public double carbohydrates { get; set; }
    public int calories { get; set; }
    public double sugar { get; set; }
    public double fiber { get; set; }
    public double servingSize { get; set; }
}

public class Vegs
{
    public string name { get; set; }
    public int protein { get; set; }
    public double fat { get; set; }
    public double carbohydrates { get; set; }
    public int calories { get; set; }
    public double sugar { get; set; }
    public double fiber { get; set; }
    public double servingSize { get; set; }
}