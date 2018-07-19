using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CalorieCalculator
/// </summary>
public class CalorieCalculator
{
    public int age { get; set; }
    public int gender { get; set; }
    public int height { get; set; }
    public double weight { get; set; }
    public double activity { get; set; }
    public int goal { get; set; }



    public double calculateCalories()
    {
        double calories;
        if(this.gender == 0)
        {
            calories = (10 * (this.weight) + 6.25 * (this.height) - 5 * (this.age) + 5 )* this.activity;
            if(activity == 2)
            {
                calories = calories - 500;
            }else if( activity == 3)
            {
                calories = calories + 500;
            }
            else
            {

            }
        }
        else
        {
            calories = (10 * (this.weight) + 6.25 * (this.height) - 5 * (this.age) - 161 )* this.activity;
            if (activity == 2)
            {
                calories = calories - 500;
            }
            else if (activity == 3)
            {
                calories = calories + 500;
            }
            else
            {

            }
        }
        return calories;
    }

    public double[] calculateMacros()
    {
        double[] macros = new double[3];
        if(this.goal == 1)
        {
            macros[0] = 35.0;
            macros[1] = 35.0;
            macros[2] = 30.0;
        }
        else if(this.goal == 2){
            macros[0] = 40.0;
            macros[1] = 20.0;
            macros[2] = 40.0;
        }
        else
        {
            macros[0] = 35.0;
            macros[1] = 50.0;
            macros[2] = 15.0;
        }
        return macros;
    }
}