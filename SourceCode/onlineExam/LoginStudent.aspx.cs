using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Services;
using System.Web.Script.Services;

namespace onlineExam
{
    public partial class LoginStudent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        [WebMethod]
        [ScriptMethod]
        public static void SaveUser(User user)
        {
            SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
            using (SqlCommand cmd = new SqlCommand("INSERT INTO tbl_Users (UserName,Password,FullName,Email,Authory) VALUES(@Username, @Password,@FullName,@Email,@Authory)"))
            {
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@Username", user.Username);
                cmd.Parameters.AddWithValue("@Password", user.Password);
                cmd.Parameters.AddWithValue("@FullName", user.FullName);
                cmd.Parameters.AddWithValue("@Email", user.Email);
                cmd.Parameters.AddWithValue("@Authory", 2);


                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(DBUtil.ConnectionString);

            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from tbl_Users where UserName = @lname and Password = @pwd and Authory=2", con);
                cmd.Parameters.Add("@lname", SqlDbType.VarChar, 10).Value = txtUsername.Value;
                cmd.Parameters.Add("@pwd", SqlDbType.VarChar, 10).Value = txtPassword.Value;

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    Session.Add("userId", dr["UserID"]);
                    Session.Add("fullname", dr["FullName"]);
                    Session.Add("dlv", dr["LastLoginDate"]);
                    Session.Add("auth", 2);


                    dr.Close();
                    cmd.CommandText = "update tbl_Users set LastLoginDate = getdate() where UserName = @lname";
                    cmd.ExecuteNonQuery();
                    Response.Redirect("default.aspx");
                }
                else
                {
                    lblUyari.Text = "<span class=\"fail\">Invalid login. &nbsp;&nbsp; Username or Password Incorrect.</span>";

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