using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;

// ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('"+rbl.SelectedValue.ToString().Trim()+"')", true);

namespace tp6
{
    public partial class test : System.Web.UI.Page
    {
        public static String ConnectionString = @"Server=sql.freeasphost.net\MSSQL2016;Database=mohamadrabdallah_OnlineQuiz;uid=mohamadrabdallah;pwd=mohamadrabdallah;";
        //public static String ConnectionString = @"Data Source=(localdb)\ProjectsV13;Initial Catalog=OnlineQuiz;Integrated Security=True";
        public static DataSet GetDataSet(string SQLCommand)
        {
            SqlConnection conn = new SqlConnection(ConnectionString);
            SqlDataAdapter da = new SqlDataAdapter();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = SQLCommand;
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            conn.Open();
            da.Fill(ds);
            conn.Close();
            return ds;
        }

        String SQLCommand;
        question[] questionArray;
        int nofAllques;
        string userID;
        string testid;
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie userIdCooky = Request.Cookies["userId"];
            if (userIdCooky != null )
            {
                userID = userIdCooky.Value.ToString().Trim();
            }
            else
            {
                Response.Redirect("sign_in.aspx");
            }
            if (Request.QueryString["testId"] == null)
            {
                Response.Redirect("profile.aspx");
            }
            testid = Request.QueryString["testId"].ToString().Trim();
            if (!Page.IsPostBack)
            {
                DataSet ds;

                ds = new DataSet();
                
                SQLCommand = "EXEC getQuestionsOfTest " + testid;
                ds = GetDataSet(SQLCommand);

                nofAllques = ds.Tables[0].Rows.Count;
                questionArray = new question[nofAllques];
                int id, testID, correctAnsNb;
                string text, ans0, ans1, ans2;

                for (int j = 0; j < nofAllques; j++)
                {
                    id = int.Parse(ds.Tables[0].Rows[j][0].ToString().Trim());
                    testID = int.Parse(ds.Tables[0].Rows[j][1].ToString().Trim());
                    text = ds.Tables[0].Rows[j][2].ToString().Trim();
                    correctAnsNb = int.Parse(ds.Tables[0].Rows[j][3].ToString().Trim());
                    ans0 = ds.Tables[0].Rows[j][4].ToString().Trim();
                    ans1 = ds.Tables[0].Rows[j][5].ToString().Trim();
                    ans2 = ds.Tables[0].Rows[j][6].ToString().Trim();

                    questionArray[j] = new question(id, testID, text, correctAnsNb, ans0, ans1, ans2);

                }

                Session["questionArray"] = questionArray;

                SQLCommand = "select * from test where testID = '" + testid + "' ";
                ds = new DataSet();
                ds = test.GetDataSet(SQLCommand);
                span.InnerHtml = ds.Tables[0].Rows[ds.Tables[0].Rows.Count - 1][2].ToString().Trim();

            }
            else
            {
                questionArray = (question[])Session["questionArray"];
                nofAllques = questionArray.Length;
            }
            for (int i = 0; i < nofAllques; i++)
            {

                Label qnl = new Label();
                qnl.Text = "Q"+(i + 1).ToString()+") "+ questionArray[i].text;

                RadioButtonList rbl = new RadioButtonList();
                rbl.ID = "rbl" + i.ToString();
                for (int j = 0; j < 3; j++)
                {
                    rbl.Items.Add(new ListItem(questionArray[i].ans[j], j.ToString()));
                }
                Button bval = new Button();
                bval.Text = "validate";
                bval.ID = i.ToString();
                bval.Click += new EventHandler(validateButton_Click);

                Panel p = new Panel();
                p.Controls.Add(qnl);
                p.Controls.Add(new LiteralControl("<hr>"));
                p.Controls.Add(rbl);
                p.Controls.Add(new LiteralControl("<br/>"));
                p.Controls.Add(bval);
                div.Controls.Add(new LiteralControl("<br/>"));
                div.Controls.Add(p);
                

            }

        }


        protected void validateButton_Click(object sender, EventArgs e)
        {
            Button bval = (Button)sender;
            int id = int.Parse(bval.ID);
            String rblID = "rbl" + id.ToString();

            RadioButtonList rbl = (RadioButtonList)div.FindControl(rblID);

            if (rbl.SelectedValue.ToString().Trim() == questionArray[id].correctAnsNb.ToString())
            {
                rbl.SelectedItem.Attributes.Add("style", "color: green");
                rbl.SelectedItem.Text = "<b>" + rbl.SelectedItem.Text + "<b>";
            }
            else
            {
                rbl.Items[questionArray[id].correctAnsNb].Text = "<b>" + rbl.Items[questionArray[id].correctAnsNb].Text + "<b>";
                rbl.Items[questionArray[id].correctAnsNb].Attributes.Add("style", "color: green");
                if(rbl.SelectedItem!=null)rbl.SelectedItem.Attributes.Add("style", "color: red"); 
               
            }
            rbl.Enabled = false;
            bval.Enabled = false;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int id;
            int note = 0;
            for (id = 0; id < nofAllques; id++)
            {
                String rblID = "rbl" + id.ToString();
                
                RadioButtonList rbl = (RadioButtonList)div.FindControl(rblID);
                Button bval = (Button)div.FindControl(id.ToString());
                validateButton_Click(bval, null);
                bval.Enabled = false;
                rbl.Enabled = false;

                if (rbl.SelectedValue.ToString().Trim() == questionArray[id].correctAnsNb.ToString())
                {
                    note++;
                }
                string cmnd = "insert into studentAnswer(questionID, studentID, answerNumber) values('"+questionArray[id].id.ToString().Trim()+"', '"+userID+"', '"+rbl.SelectedIndex.ToString().Trim()+"')";
                sign_up.ExecuteQuery(cmnd);
            }

            lblResult.Text = (note*100/nofAllques).ToString();
            btnEnd.Visible = true;
            btnSubmit.Enabled = false;

            string query = "INSERT INTO result(studentID,testID) " +
                "VALUES('" + userID + "','" + testid + "')";
                sign_up.ExecuteQuery(query);

            
            }

        protected void btnEnd_Click(object sender, EventArgs e)
        {
            Response.Redirect("profile.aspx");
        }
    }
    public class question
    {
        public int id;
        public int testID;
        public string text;
        public int correctAnsNb;
        public string[] ans;

        public question(int id, int testID, string text, int correctAnsNb, string ans0, string ans1, string ans2)
        {
            this.id = id;
            this.testID = testID;
            this.text = text;
            this.correctAnsNb = correctAnsNb;

            ans = new string[3];
            ans[0] = ans0;
            ans[1] = ans1;
            ans[2] = ans2;

        }
        public string getCorrectAnswerText()
        {
            return ans[correctAnsNb];
        }
    }


}