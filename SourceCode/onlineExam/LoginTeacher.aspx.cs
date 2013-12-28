using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;



namespace onlineExam
{
    public partial class Loginteacher : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(DBUtil.ConnectionString);

            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from tbl_Users where UserName = @lname and Password = @pwd", con);
                cmd.Parameters.Add("@lname", SqlDbType.VarChar, 10).Value = txtUsername.Value;
                cmd.Parameters.Add("@pwd", SqlDbType.VarChar, 10).Value = txtPassword.Value;

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    Session.Add("userId", dr["UserID"]);
                    Session.Add("fullname", dr["FullName"]);
                    Session.Add("dlv", dr["LastLoginDate"]);
                    Session.Add("auth", 1);


                    dr.Close();
                    cmd.CommandText = "update tbl_Users set LastLoginDate = getdate() where UserName = @lname";
                    cmd.ExecuteNonQuery();
                    Response.Redirect("default.aspx");
                }
                else
                {
                    lblUyari.Text = "<span class=\"fail\">Invalid login. &nbsp;&nbsp;<a class=\"page-back\" href=\"#\">Try again?</a></span>";

                    dr.Close();
                }

            }
            catch (Exception ex)
            {

            }
            finally
            {
                con.Close();
            }
        }
    }
}