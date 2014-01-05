using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;
using System.Data;

namespace onlineExam
{
    public partial class ExamCategoryAddUpdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Session["userId"] != null)
                {
                    if (Session["auth"].ToString() == "1" || Session["auth"].ToString() == "0")
                    {
                        if (Request.QueryString["id"] != "0")
                        {
                            GetCategory();
                        }
                    }

                    else
                    {
                        Response.Redirect("loginTeacher.aspx");
                    }

                }
                else
                {
                    Response.Redirect("loginTeacher.aspx");
                }



            }
        }



        void GetCategory()
        {

            SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from tbl_Categories where CategoryID=" + Request.QueryString["id"], con);
                SqlDataAdapter a = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                a.Fill(dt);

                txtCategoryName.Value = dt.Rows[0]["CategoryName"].ToString();
                btnSave.Text = "UPDATE";


            }
            catch { }

        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            string categoryName = txtCategoryName.Value;
            string id = Request.QueryString["id"];

            SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
            try
            {

                if (id == "0")
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO tbl_Categories (CategoryName) values('" + categoryName + "')", con);
                    cmd.ExecuteNonQuery();
                    con.Close();

                    lblAlert.ForeColor = Color.Green;
                    lblAlert.Text = "Succesfully Added.";
                }
                else
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("UPDATE tbl_Categories SET CategoryName= '" + categoryName + "' where CategoryID=" + Request.QueryString["id"], con);
                    cmd.ExecuteNonQuery();
                    con.Close();

                    lblAlert.ForeColor = Color.Green;
                    lblAlert.Text = "Succesfully Updated.";
                }



            }
            catch { }
        }
    }
}