using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace tp6
{
    public partial class sign_up : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public static void ExecuteQuery(string query)
        {
            
            SqlConnection con = new SqlConnection(test.ConnectionString);
            con.Open();
            SqlCommand com = new SqlCommand(query, con);
            com.ExecuteNonQuery();
            con.Close();

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string firstName = txtFirstName.Text.Trim();
            string lastName = txtLastName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
            string query = "INSERT INTO person(firstName,lastName,email,password) " +
                "VALUES('" + firstName + "','" + lastName + "','" + email + "','" + password + "')";
            try
            {
                ExecuteQuery(query);
                EmailUQ.Text = String.Empty;

                Response.Redirect("sign_in.aspx?Email="+email+"&Password="+password);
            }
            catch
            {
                EmailUQ.Text = "there is an account with this Email!";
            }
        }

    }
}