using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Data;

namespace tp6
{
    public partial class Create_Quize : System.Web.UI.Page
    {
        string teacherID;
        ArrayList questionArrayList;
        int nofAllques;
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie userIdCooky = Request.Cookies["userId"];
            if (userIdCooky != null)
            {
                teacherID = userIdCooky.Value.ToString().Trim();
            }
            else
            {
                Response.Redirect("sign_in.aspx");
            }

                if (!Page.IsPostBack)
            {
                finishBtn.Enabled = false;

                questionArrayList = new ArrayList(1);
                Session["questionArrayList"] = questionArrayList;

            }
            else
            {
                questionArrayList = (ArrayList)Session["questionArrayList"];
                nofAllques = questionArrayList.Count;
            }
            for (int i = 0; i < nofAllques; i++)
            {

                Label qnl = new Label();
                qnl.Text = "Q"+(i + 1).ToString()+") "+ ((question)questionArrayList[i]).text;

                RadioButtonList rbl = new RadioButtonList();
                for (int j = 0; j < 3; j++)
                {
                    rbl.Items.Add(new ListItem(((question)questionArrayList[i]).ans[j], j.ToString()));
                }
                rbl.SelectedIndex = ((question)questionArrayList[i]).correctAnsNb;

                Panel p = new Panel();
                p.Controls.Add(qnl);
                p.Controls.Add(new LiteralControl("<hr>"));
                p.Controls.Add(rbl);
                p.Controls.Add(new LiteralControl("<br/>"));
                div.Controls.Add(p);

            }
        }

        protected void addbtn_Click(object sender, EventArgs e)
        {
            finishBtn.Enabled = true;
            string questxt = TBQuest.Text.Trim();
            string choice_0 = choice0.Text.Trim();
            string choice_1 = choice1.Text.Trim();
            string choice_2 = choice2.Text.Trim();
            int correctAns = RadioButtonList1.SelectedIndex;


            questionArrayList = (ArrayList)Session["questionArrayList"];

            question Ques = new question(0, 0, questxt, correctAns, choice_0, choice_1, choice_2);
            questionArrayList.Add(Ques);
            nofAllques = questionArrayList.Count;

            Session["questionArrayList"] = questionArrayList;

            Label qnl = new Label();
            qnl.Text = "Q"+(nofAllques).ToString()+") "+ questxt;

            RadioButtonList rbl = new RadioButtonList();

            rbl.Items.Add(new ListItem(choice_0, "0"));
            rbl.Items.Add(new ListItem(choice_1, "1"));
            rbl.Items.Add(new ListItem(choice_2, "2"));
            rbl.SelectedIndex = correctAns;

            Panel p = new Panel();
            p.Controls.Add(qnl);
            p.Controls.Add(new LiteralControl("<hr>"));
            p.Controls.Add(rbl);
            p.Controls.Add(new LiteralControl("<br/>"));
            div.Controls.Add(p);

            TBQuest.Text = "";
            choice0.Text = "";
            choice1.Text = "";
            choice2.Text = "";
            RadioButtonList1.SelectedIndex = -1;




        }

        protected void finishBtn_Click(object sender, EventArgs e)
        {

            string query = "INSERT INTO test(teacherID,title) " +
                "VALUES('" + teacherID + "','" + title.Text.Trim() + "')";
            sign_up.ExecuteQuery(query);

            query = "select * from test where teacherID = '"+teacherID+"' and title = '"+ title.Text.Trim() + "'";
            DataSet ds;
            ds = new DataSet();
            ds = test.GetDataSet(query);
            ///////
            string testId = ds.Tables[0].Rows[ds.Tables[0].Rows.Count-1][0].ToString().Trim();

            questionArrayList = (ArrayList)Session["questionArrayList"];
            nofAllques = questionArrayList.Count;
            for(int i = 0; i < nofAllques; i++)
            {
                query = "insert into question(testID, questionText, correctAnswerNumber, answer0, answer1, answer2) " +
                " values('" + testId + "', '"+((question)questionArrayList[i]).text+"', '"+ ((question)questionArrayList[i]).correctAnsNb.ToString().Trim()+ "', '"+ ((question)questionArrayList[i]).ans[0]+ "', '" + ((question)questionArrayList[i]).ans[1] + "', '" + ((question)questionArrayList[i]).ans[2] + "')";
                sign_up.ExecuteQuery(query);
            }
            Response.Redirect("profile.aspx");
        }
    }
}