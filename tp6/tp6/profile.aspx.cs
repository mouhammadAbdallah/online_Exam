using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;

namespace tp6
{
    public partial class home : System.Web.UI.Page
    {
        string userID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                enterCodeTB.Text = "";
            }

            HttpCookie userIdCooky = Request.Cookies["userId"];
            if (userIdCooky != null)
            {
                userID = userIdCooky.Value.ToString().Trim();
            }
            else
            {
                Response.Redirect("sign_in.aspx");
            }

            DataSet ds;
            ds = new DataSet();
            string SQLCommand = "select * from person where personID = " + userID;
            ds = test.GetDataSet(SQLCommand);

            namelbl.Text = ds.Tables[0].Rows[0][1].ToString().Trim() + " " + ds.Tables[0].Rows[0][2].ToString().Trim();
            usernamelbl.Text = ds.Tables[0].Rows[0][3].ToString().Trim();

            ds = new DataSet();

             SQLCommand = "exec getMyQuizByTeacherID " + userID;
            ds = test.GetDataSet(SQLCommand);
            DataTable dt = ds.Tables[0];
            int rowCnt;
            try
            {
                dt = dt.AsEnumerable()
                   .GroupBy(col => new { Col1 = col["title"] })
                   .Select(g => g.OrderBy(r => r["testID"]).First())
                   .CopyToDataTable();


                 rowCnt = dt.Rows.Count; //Number of rows

                for (int rowCtr = 0; rowCtr < rowCnt; rowCtr++)
                {
                    TableRow tRow = new TableRow();
                    Table1.Rows.Add(tRow);

                    TableCell tCell = new TableCell();
                    tCell.Text = dt.Rows[rowCtr][1].ToString().Trim();
                    tRow.Cells.Add(tCell);

                    HyperLink link = new HyperLink();
                    link.NavigateUrl = "myQuiz.aspx?testid=" + dt.Rows[rowCtr][0].ToString().Trim();
                    link.Text = dt.Rows[rowCtr][0].ToString().Trim();
                    tCell = new TableCell();
                    tCell.Controls.Add(link);
                    tRow.Cells.Add(tCell);
                }
            }
            catch
            {

            }
            ds = new DataSet();

             SQLCommand = "exec getResultByStudentID " + userID;
            ds = test.GetDataSet(SQLCommand);
            dt = ds.Tables[0];
            try
            {
                rowCnt = dt.Rows.Count; //Number of rows

                for (int rowCtr = 0; rowCtr < rowCnt; rowCtr++)
                {
                    TableRow tRow = new TableRow();
                    Table2.Rows.Add(tRow);

                    TableCell tCell = new TableCell();
                    tCell.Text = dt.Rows[rowCtr][0].ToString().Trim();
                    tRow.Cells.Add(tCell);

                    tCell = new TableCell();
                    tCell.Text = dt.Rows[rowCtr][1].ToString().Trim() + "/100";
                    tRow.Cells.Add(tCell);
                }
            }
            catch { }

        }


        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            HttpCookie userIdCooky = new HttpCookie("userId");
            userIdCooky.Value = string.Empty;
            userIdCooky.Expires = DateTime.Now;
            Response.Cookies.Add(userIdCooky);
            Response.Redirect("sign_in.aspx");
        }

        protected void btnCreateQuiz_Click(object sender, EventArgs e)
        {
            Response.Redirect("Create_Quize.aspx");
        }

        protected void examEnterBtn_Click(object sender, EventArgs e)
        {

            string testId = enterCodeTB.Text.Trim();
            string SQLCommand = "select * from test where testID = '" + testId + "' ";
            DataSet ds = new DataSet();

            try
            {
                ds = test.GetDataSet(SQLCommand);
                ds.Tables[0].Rows[0][0].ToString();
                enterCodeTB.Text = "";
                try
                {

                    SQLCommand = "select * from result where studentID = '" + userID + "' and testID = '" + testId + "'";
                    ds = new DataSet();
                    ds = test.GetDataSet(SQLCommand);
                    ds.Tables[0].Rows[0][0].ToString();

                    validTestIdLbl.Text = "You can't do it again !";
                    validTestIdLbl.Visible = true;
                }
                catch
                {
                    Response.Redirect("test.aspx?testId=" + testId);
                }


            }
            catch
            {
                validTestIdLbl.Text = "Invalid Test Code !";
                validTestIdLbl.Visible = true;
            }


        }
    }
}