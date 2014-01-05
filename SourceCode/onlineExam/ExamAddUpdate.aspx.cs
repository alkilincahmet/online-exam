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
    public partial class ExamAddUpdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Session["userId"] != null)
                {
                    if (Session["auth"].ToString() == "1" || Session["auth"].ToString() == "0")
                    {
                        GetCategory();

                        if (Request.QueryString["id"] != "0")
                        {
                            GetExam();
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
                SqlCommand cmd = new SqlCommand("select * from tbl_Categories order by CategoryName", con);
                SqlDataAdapter a = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                a.Fill(dt);

                dropCategory.DataSource = dt;
                dropCategory.DataBind();


            }
            catch { }

        }

        void GetExam()
        {

            SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from tbl_Exams where ExamID=" + Request.QueryString["id"], con);
                SqlDataAdapter a = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                a.Fill(dt);

                dropCategory.SelectedValue = dt.Rows[0]["CategoryID"].ToString();
                txtExamName.Value = dt.Rows[0]["ExamName"].ToString();
                txtExamTime.Value = dt.Rows[0]["ExamTime"].ToString();
                txtQuestionNumber.Value = dt.Rows[0]["NumberOfQuestion"].ToString();

                btnSave.Text = "UPDATE";


            }
            catch { }

        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            string cid = dropCategory.SelectedValue;
            string examName = txtExamName.Value;
            string examTime = txtExamTime.Value;
            string questionNumber = txtQuestionNumber.Value;
            string userID = Session["userId"].ToString();

            string id = Request.QueryString["id"];

            SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
            try
            {

                if (id == "0")
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO tbl_Exams (UserID,CategoryID,ExamName,ExamTime,NumberOfQuestion) values(" + userID + "," + cid + ",'" + examName + "'," + examTime + "," + questionNumber + ")", con);
                    cmd.ExecuteNonQuery();
                    con.Close();

                    lblAlert.ForeColor = Color.Green;
                    lblAlert.Text = "Succesfully Added.";
                }
                else
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("UPDATE tbl_Exams SET CategoryID=" + cid + ",ExamName='" + examName + "',ExamTime=" + examTime + ",NumberOfQuestion=" + questionNumber + " where ExamID=" + Request.QueryString["id"], con);
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