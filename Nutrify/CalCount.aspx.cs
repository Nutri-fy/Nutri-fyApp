using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CalCount : System.Web.UI.Page
{
    MealPlanner mp;
    int rowCount;
    int cellCount;
    int rCounter;
    int cCounter;
    protected void Page_Load(object sender, EventArgs e)
    {
        Table[] tableList = new Table[] { tbMonday, tbTuesday, tbWednesday, tbThursday, tbFriday, tbSaturday, tbSunday };
        string[] days = new string[] { "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday" };
        mp = new MealPlanner(Convert.ToInt32(Session["sUserId"]));

        Dictionary<int, List<Protein>> prDict = mp.getProteins();
        Dictionary<int, List<Carbs>> cbDict = mp.getCarbs();
        Dictionary<int, List<Fats>> fDict = mp.getFats();
        Dictionary<int, List<Snacks>> skDict = mp.getSnacks();
        Dictionary<int, List<Vegs>> vDict = mp.getVegs();

        for (int t = 0; t < tableList.Length; t++)
        {
            TableRow dRow = new TableRow();
            tableList[t].Rows.Add(dRow);
            TableCell dCell = new TableCell();
            dCell.Text = days[t];
            dCell.Font.Bold = true;
            dCell.ColumnSpan = 6;
            dCell.ForeColor = System.Drawing.Color.White;
            dCell.BackColor = System.Drawing.ColorTranslator.FromHtml("#33b5e5");
            dRow.Cells.Add(dCell);

            for (int m = 0; m < mp.getMeals(); m++)
            {

                TableRow tRow = new TableRow();
                tableList[t].Rows.Add(tRow);
                TableCell tCell = new TableCell();
                tCell.Text = "Meal" + (m + 1).ToString();
                tCell.Font.Bold = true;
                tCell.ColumnSpan = 6;
                tCell.ForeColor = System.Drawing.Color.White;
                tCell.BackColor = System.Drawing.ColorTranslator.FromHtml("#0d47a1");
                tRow.Cells.Add(tCell);

                TableRow tRow2 = new TableRow();
                tableList[t].Rows.Add(tRow2);
                TableCell hCell = new TableCell();
                hCell.Text = "Name";
                TableCell hCell1 = new TableCell();
                hCell1.Text = "Total Calories";
                TableCell hCell2 = new TableCell();
                hCell2.Text = "Protein(g)";
                TableCell hCell3 = new TableCell();
                hCell3.Text = "Carbs(g)";
                TableCell hCell4 = new TableCell();
                hCell4.Text = "Fats(g)";
                TableCell hCell5 = new TableCell();
                hCell5.Text = "Serving Size(g)";
                hCell.Font.Bold = true;
                hCell1.Font.Bold = true;
                hCell2.Font.Bold = true;
                hCell3.Font.Bold = true;
                hCell4.Font.Bold = true;
                hCell5.Font.Bold = true;
                tRow2.Cells.Add(hCell);
                tRow2.Cells.Add(hCell1);
                tRow2.Cells.Add(hCell2);
                tRow2.Cells.Add(hCell3);
                tRow2.Cells.Add(hCell4);
                tRow2.Cells.Add(hCell5);

                TableRow tRow3 = new TableRow();
                tableList[t].Rows.Add(tRow3);
                TableCell pCell = new TableCell();
                TableCell pCell1 = new TableCell();
                TableCell pCell2 = new TableCell();
                TableCell pCell3 = new TableCell();
                TableCell pCell4 = new TableCell();
                TableCell pCell5 = new TableCell();
                Protein p = prDict[t].ElementAt(m);
                pCell.Text = p.name.ToString();
                pCell1.Text = p.calories.ToString();
                pCell2.Text = p.protein.ToString();
                pCell3.Text = Math.Round(p.carbohydrates, 2).ToString();
                pCell4.Text = Math.Round(p.fat,2).ToString();
                pCell5.Text = Math.Round(p.servingSize, 2).ToString();
                tRow3.Cells.Add(pCell);
                tRow3.Cells.Add(pCell1);
                tRow3.Cells.Add(pCell2);
                tRow3.Cells.Add(pCell3);
                tRow3.Cells.Add(pCell4);
                tRow3.Cells.Add(pCell5);

                TableRow tRow4 = new TableRow();
                tableList[t].Rows.Add(tRow4);
                TableCell cCell = new TableCell();
                TableCell cCell1 = new TableCell();
                TableCell cCell2 = new TableCell();
                TableCell cCell3 = new TableCell();
                TableCell cCell4 = new TableCell();
                TableCell cCell5 = new TableCell();
                Carbs c = cbDict[t].ElementAt(m);
                cCell.Text = c.name.ToString();
                cCell1.Text = c.calories.ToString();
                cCell2.Text = c.protein.ToString();
                cCell3.Text = Math.Round(c.carbohydrates, 2).ToString();
                cCell4.Text = Math.Round(c.fat, 2).ToString();
                cCell5.Text = Math.Round(c.servingSize, 2).ToString();
                tRow4.Cells.Add(cCell);
                tRow4.Cells.Add(cCell1);
                tRow4.Cells.Add(cCell2);
                tRow4.Cells.Add(cCell3);
                tRow4.Cells.Add(cCell4);
                tRow4.Cells.Add(cCell5);

                TableRow tRow5 = new TableRow();
                tableList[t].Rows.Add(tRow5);
                TableCell fCell = new TableCell();
                TableCell fCell1 = new TableCell();
                TableCell fCell2 = new TableCell();
                TableCell fCell3 = new TableCell();
                TableCell fCell4 = new TableCell();
                TableCell fCell5 = new TableCell();
                Fats f = fDict[t].ElementAt(m);
                fCell.Text = f.name.ToString();
                fCell1.Text = f.calories.ToString();
                fCell2.Text = f.protein.ToString();
                fCell3.Text = Math.Round(f.carbohydrates, 2).ToString();
                fCell4.Text = Math.Round(f.fat, 2).ToString();
                fCell5.Text = Math.Round(f.servingSize, 2).ToString();
                tRow5.Cells.Add(fCell);
                tRow5.Cells.Add(fCell1);
                tRow5.Cells.Add(fCell2);
                tRow5.Cells.Add(fCell3);
                tRow5.Cells.Add(fCell4);
                tRow5.Cells.Add(fCell5);

                if (m ==2 || m==4)
                {
                    int mm = m - 2;
                    TableRow tRow6 = new TableRow();
                    tableList[t].Rows.Add(tRow6);
                    TableCell sCell = new TableCell();
                    TableCell sCell1 = new TableCell();
                    TableCell sCell2 = new TableCell();
                    TableCell sCell3 = new TableCell();
                    TableCell sCell4 = new TableCell();
                    TableCell sCell5 = new TableCell();
                    Snacks s = skDict[t].ElementAt(mm);
                    sCell.Text = s.name.ToString();
                    sCell1.Text = s.calories.ToString();
                    sCell2.Text = s.protein.ToString();
                    sCell3.Text = Math.Round(s.carbohydrates, 2).ToString();
                    sCell4.Text = Math.Round(s.fat, 2).ToString();
                    sCell5.Text = Math.Round(s.servingSize, 2).ToString();
                    tRow6.Cells.Add(sCell);
                    tRow6.Cells.Add(sCell1);
                    tRow6.Cells.Add(sCell2);
                    tRow6.Cells.Add(sCell3);
                    tRow6.Cells.Add(sCell4);
                    tRow6.Cells.Add(sCell5);

                }

                TableRow tRow7 = new TableRow();
                tableList[t].Rows.Add(tRow7);
                TableCell vCell = new TableCell();
                TableCell vCell1 = new TableCell();
                TableCell vCell2 = new TableCell();
                TableCell vCell3 = new TableCell();
                TableCell vCell4 = new TableCell();
                TableCell vCell5 = new TableCell();
                Vegs v = vDict[t].ElementAt(m);
                vCell.Text = v.name.ToString();
                vCell1.Text = v.calories.ToString();
                vCell2.Text = "<b>Fiber(g):</b>  " + Math.Round(v.fiber, 2).ToString();
                vCell5.Text = Math.Round(v.servingSize, 2).ToString(); 

                vCell2.ColumnSpan = 3;
                vCell2.HorizontalAlign = HorizontalAlign.Center;
                tRow7.Cells.Add(vCell);
                tRow7.Cells.Add(vCell1);
                tRow7.Cells.Add(vCell2);
                tRow7.Cells.Add(vCell5);

            }
        }
    }
}