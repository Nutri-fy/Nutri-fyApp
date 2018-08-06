using System;
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
    List<Snacks> snackList = new List<Snacks>();
    List<Vegs> vegList = new List<Vegs>();
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
                    prPro = (Convert.ToDouble(reader[2])) / 100;
                    prCarb = (Convert.ToDouble(reader[3])) / 100;
                    prFat = (Convert.ToDouble(reader[4])) / 100;

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
            calcCarb = (calories * prCarb * 0.75) / meals;
            calcSnacks = (calories * prCarb * 0.25) / 3;
            calcFat = (calories * prFat) / meals;
            sqlLimit = 7 * meals;
            makeProteinMeals();
            makeCarbMeals();
            makeFatMeals();
            makeSnackMeals();
            makeVegMeals();
        }
    }

    public void makeProteinMeals()
    {
        dictionaryProtein = new Dictionary<int, List<Protein>>();
        UserConnect.ConnectionString = connString;
        cmd = UserConnect.CreateCommand();

        try
        {
            string query = "SELECT TOP " + sqlLimit + " foodGroup, name, protein, fat, Carbohydrates, calories from Ingredients where foodgroup like '%Poultry%'" +
                "OR foodGroup like '%Sausages%' OR foodGroup like '%Pork%' or foodGroup like '%Beef%' or foodGroup like '%Finfish%' or foodGroup like '%Lamb%' " +
                "ORDER BY NEWID();";

            cmd.CommandText = query;

            UserConnect.Open();
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Protein protein = new Protein();

                    protein.name = reader["name"].ToString();
                    protein.protein = (int)reader["protein"];
                    protein.fat = Convert.ToDouble(reader["fat"]);
                    protein.carbohydrates = Convert.ToDouble(reader["carbohydrates"]);
                    protein.calories = (int)reader["calories"];
                    protein.servingSize = 100;


                    double factor = calcPro / protein.calories;
                    protein.protein = (int)(protein.protein * factor);
                    protein.fat = protein.fat * factor;
                    protein.carbohydrates = protein.carbohydrates * factor;
                    protein.calories = (int)(protein.calories * factor);
                    protein.servingSize = (int)(protein.servingSize * factor);
                    proList.Add(protein);
                }
            }
            for (int i = 0; i < 7; i++)
            {
                List<Protein> proMeal = new List<Protein>();
                for (int j = 0; j < meals; j++)
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
            string query = "SELECT TOP " + sqlLimit + " name, protein, fat, Carbohydrates, calories from Ingredients where (name like '%potato%'" +
                "OR name like '%pasta%' OR name like '%rice%' or name like '%macaroni%' or name like '%noodles%' or name like '%spaghetti%') and name NOT LIKE '%snack%'" +
                "ORDER BY NEWID();";

            cmd.CommandText = query;

            UserConnect.Open();
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Carbs carbs = new Carbs();

                    carbs.name = reader["name"].ToString();
                    carbs.protein = (int)reader["protein"];
                    carbs.fat = Convert.ToDouble(reader["fat"]);
                    carbs.carbohydrates = Convert.ToDouble(reader["carbohydrates"]);
                    carbs.calories = (int)reader["calories"];
                    carbs.servingSize = 100;


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

                    int num = rdm.Next(0, carbList.Count - 1);
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
            string query = "SELECT TOP " + sqlLimit + " name, protein, fat, Carbohydrates, calories from Ingredients where foodGroup like 'Fats and Oils' ORDER BY NEWID();";

            cmd.CommandText = query;


            UserConnect.Open();
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Fats fats = new Fats();

                    fats.name = reader["name"].ToString();
                    fats.protein = (int)reader["protein"];
                    fats.fat = Convert.ToDouble(reader["fat"]);
                    fats.carbohydrates = Convert.ToDouble(reader["carbohydrates"]);
                    fats.calories = (int)reader["calories"];
                    fats.servingSize = 100;


                    double factor = calcFat / fats.calories;
                    fats.protein = (int)(fats.protein * factor);
                    fats.fat = fats.fat * factor;
                    fats.carbohydrates = fats.carbohydrates * factor;
                    fats.calories = (int)(fats.calories * factor);
                    fats.servingSize = (int)(fats.servingSize * factor);
                    fatList.Add(fats);
                }
            }
            for (int i = 0; i < 7; i++)
            {
                List<Fats> fatMeal = new List<Fats>();
                for (int j = 0; j < meals; j++)
                {
                    Random rdm = new Random();

                    int num = rdm.Next(0, fatList.Count - 1);
                    fatMeal.Add(fatList[num]);
                    fatList.RemoveAt(num);
                }
                dictionaryFats.Add(i, fatMeal);
            }
        }
        finally
        {
            cmd.Dispose();
            UserConnect.Close();
        }
    }

    public void makeSnackMeals()
    {
        dictionarySnacks = new Dictionary<int, List<Snacks>>();
        UserConnect.ConnectionString = connString;
        cmd = UserConnect.CreateCommand();

        try
        {
            string query = "SELECT TOP " + 21 + " name, protein, fat, Carbohydrates, calories from Ingredients where foodGroup like 'Snacks' ORDER BY NEWID();";

            cmd.CommandText = query;


            UserConnect.Open();
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Snacks snacks = new Snacks();

                    snacks.name = reader["name"].ToString();
                    snacks.protein = (int)reader["protein"];
                    snacks.fat = Convert.ToDouble(reader["fat"]);
                    snacks.carbohydrates = Convert.ToDouble(reader["carbohydrates"]);
                    snacks.calories = (int)reader["calories"];
                    snacks.servingSize = 100;


                    double factor = calcSnacks / snacks.calories;
                    snacks.protein = (int)(snacks.protein * factor);
                    snacks.fat = snacks.fat * factor;
                    snacks.carbohydrates = snacks.carbohydrates * factor;
                    snacks.calories = (int)(snacks.calories * factor);
                    snacks.servingSize = (int)(snacks.servingSize * factor);
                    snackList.Add(snacks);
                }
            }
            for (int i = 0; i < 7; i++)
            {
                List<Snacks> snackMeal = new List<Snacks>();
                for (int j = 0; j < 3; j++)
                {
                    Random rdm = new Random();

                    int num = rdm.Next(0, snackList.Count - 1);
                    snackMeal.Add(snackList[num]);
                    snackList.RemoveAt(num);
                }
                dictionarySnacks.Add(i, snackMeal);
            }
        }
        finally
        {
            cmd.Dispose();
            UserConnect.Close();
        }
    }

    public void makeVegMeals()
    {
        dictionaryVeg = new Dictionary<int, List<Vegs>>();
        UserConnect.ConnectionString = connString;
        cmd = UserConnect.CreateCommand();

        try
        {
            string query = "SELECT TOP " + sqlLimit + " name, fiber from Ingredients where foodGroup like '%Vegetables%' and foodGroup NOT LIKE '%potato%' ORDER BY NEWID();";

            cmd.CommandText = query;


            UserConnect.Open();
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Vegs vegs = new Vegs();

                    vegs.name = reader["name"].ToString();
                    vegs.fiber = Convert.ToDouble(reader["fiber"].ToString());
                    vegs.servingSize = 100;


                    vegList.Add(vegs);
                }
            }
            for (int i = 0; i < 7; i++)
            {
                List<Vegs> vegMeal = new List<Vegs>();
                for (int j = 0; j < meals; j++)
                {
                    Random rdm = new Random();

                    int num = rdm.Next(0, vegList.Count - 1);
                    vegMeal.Add(vegList[num]);
                    vegList.RemoveAt(num);
                }
                dictionaryVeg.Add(i, vegMeal);
            }
        }
        finally
        {
            cmd.Dispose();
            UserConnect.Close();
        }
    }

    public Dictionary<int, List<Protein>> getProteins()
    {
        return dictionaryProtein;
    }

    public Dictionary<int, List<Carbs>> getCarbs()
    {
        return dictionaryCarbs;
    }

    public Dictionary<int, List<Fats>> getFats()
    {
        return dictionaryFats;
    }

    public Dictionary<int, List<Snacks>> getSnacks()
    {
        return dictionarySnacks;
    }

    public Dictionary<int, List<Vegs>> getVegs()
    {
        return dictionaryVeg;
    }

    public int getMeals()
    {
        return this.meals;
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