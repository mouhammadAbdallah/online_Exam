using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace tp6
{
    public partial class sign_in : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {



            if (Request.QueryString["Email"] != null)
            {
                txtEmail.Text = Request.QueryString["Email"].ToString().Trim();
                txtPassword.Attributes.Add("value", Request.QueryString["Password"].ToString().Trim());
            }
            else
            {
                HttpCookie userIdCooky = Request.Cookies["userId"];
                if (userIdCooky != null)
                {

                    Response.Redirect("profile.aspx");
                }

            }
        }
        String SQLCommand;
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
            DataSet ds;
            ds = new DataSet();

            SQLCommand = "select * from person where email='"+ email + "' and password='"+ password+"'";
            ds = test.GetDataSet(SQLCommand);
            try
            {

                ds.Tables[0].Rows[0][0].ToString();
                EmailUQ.Text = "";
                HttpCookie userIdCooky = new HttpCookie("userId");
                userIdCooky.Value = ds.Tables[0].Rows[0][0].ToString().Trim();
                userIdCooky.Expires = DateTime.Now.AddYears(1);
                Response.Cookies.Add(userIdCooky);
                Response.Redirect("profile.aspx");

            }
            catch
            {
                EmailUQ.Text = "Invalid Email Or Password!";
            }
        }
    }
}