using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;

namespace tp6
{
    public partial class myQuiz : System.Web.UI.Page
    {
        string userID;
        string testid;
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie userIdCooky = Request.Cookies["userId"];
            if (userIdCooky != null)
            {
                userID = userIdCooky.Value.ToString().Trim();
            }
            else
            {
                Response.Redirect("sign_in.aspx");
            }
            if (Request.QueryString["testid"] == null)
            {
                Response.Redirect("profile.aspx");
            }
            testid = Request.QueryString["testid"];


            DataSet ds;
            ds = new DataSet();
            string SQLCommand = "select * from question where testID= " + testid;
            ds = test.GetDataSet(SQLCommand);
            int nofquest = ds.Tables[0].Rows.Count;

            SQLCommand = "exec getMyQuizByTeacherID " + userID;
            ds = test.GetDataSet(SQLCommand);


            DataTable dt = ds.Tables[0];
            DataView dv1 = dt.DefaultView;
            dv1.RowFilter = " testID = " + testid;
            DataTable dtNew = dv1.ToTable();

            TableRow tRow;
            TableCell tCell;
            int nbOFUser = dtNew.Rows.Count / nofquest;

            for(int user = 0; user < nbOFUser; user++)
            {
                int note = 0;
                Label namelbl = new Label();
                namelbl.Text = "<b>"+dtNew.Rows[user * nofquest][3].ToString().Trim()+ "<b>";

                Table tbl = new Table();
                tbl.BorderColor = Color.Black;
                tbl.BorderStyle = BorderStyle.Solid;
                tbl.GridLines = GridLines.Both;
                tbl.Attributes.Add("style", "text-align: center");

                tRow = new TableRow();
                tCell = new TableCell(); tCell.Text = "<b>Questions</b>"; tRow.Cells.Add(tCell);
                tCell = new TableCell(); tCell.Text = "<b>Choice 0</b>"; tRow.Cells.Add(tCell);
                tCell = new TableCell(); tCell.Text = "<b>Choice 1</b>"; tRow.Cells.Add(tCell);
                tCell = new TableCell(); tCell.Text = "<b>Choice 2</b>"; tRow.Cells.Add(tCell);
                tCell = new TableCell(); tCell.Text = "<b>Correct Choice</b>"; tRow.Cells.Add(tCell);
                tCell = new TableCell(); tCell.Text = "<b>Chosen Choice</b>"; tRow.Cells.Add(tCell);


                tbl.Rows.Add(tRow);

                for (int rowCtr = 0; rowCtr < nofquest; rowCtr++)
                {
                    tRow = new TableRow();
                    for (int cellCtr = 5; cellCtr < 11; cellCtr++)
                    {
                        tCell = new TableCell();
                        tCell.Font.Bold = false;
                        if (rowCtr % 2 == 0) tCell.ForeColor = Color.DarkBlue;
                        else tCell.ForeColor = Color.BlueViolet;

                        tCell.Text = dtNew.Rows[user * nofquest + rowCtr][cellCtr].ToString();
                        if (cellCtr == 10)
                        {
                            if (dtNew.Rows[user * nofquest + rowCtr][cellCtr].ToString() == "-1") tCell.Text = "";
                            else
                            {
                                if (dtNew.Rows[user * nofquest + rowCtr][11].ToString() == "0")
                                {

                                    tCell.ForeColor = Color.Green;
                                    tCell.Font.Bold = true;
                                    note++;
                                }
                                else {
                                    tCell.ForeColor = Color.Red; tCell.Font.Bold = true;
                                }
                            }
                        }
                        tRow.Cells.Add(tCell);
                    }
                    tbl.Rows.Add(tRow);
                }
                note = (note * 100) / nofquest;

                Panel p = new Panel();

                namelbl.Text = namelbl.Text + ": " + note + "/" + "100";
                p.Controls.Add(namelbl);
                p.Controls.Add(new LiteralControl("<hr>"));
                p.Controls.Add(tbl);
                p.Controls.Add(new LiteralControl("<br/><br/>"));
                div.Controls.Add(p);

            }







        }
    }
}