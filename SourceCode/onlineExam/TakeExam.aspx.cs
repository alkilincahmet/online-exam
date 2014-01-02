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
    public partial class TakeExam : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetExamCategory();
                GetExam();

                if (Request.QueryString["cid"] != null)
                {
                    dropCategory.SelectedValue = Request.QueryString["cid"];
                }

                if (Request.QueryString["eid"] != null)
                {
                    dropExams.SelectedValue = Request.QueryString["eid"];
                }
            }

        }

        void GetExamCategory()
        {
            SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from tbl_Categories order by CategoryName", con);


                SqlDataAdapter a = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                a.Fill(dt);


                dropCategory.DataTextField = "CategoryName";
                dropCategory.DataValueField = "CategoryID";

                dropCategory.DataSource = dt;
                dropCategory.DataBind();
                dropCategory.Items.Insert(0, new ListItem("All", "0"));

            }
            catch { }


        }

        void GetExam()
        {
            SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select DISTINCT e.* from tbl_Exams e,tbl_Questions q WHERE e.ExamID=q.ExamID order by e.ExamName", con);


                SqlDataAdapter a = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                a.Fill(dt);


                dropExams.DataTextField = "ExamName";
                dropExams.DataValueField = "ExamID";

                dropExams.DataSource = dt;
                dropExams.DataBind();
                dropExams.Items.Insert(0, new ListItem("All", "0"));

            }
            catch (Exception) { }


        }

        protected void dropCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            string catID = dropCategory.SelectedValue;
            SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
            SqlCommand cmd = new SqlCommand();

            try
            {
                con.Open();
                if (catID != "0")
                {
                    cmd = new SqlCommand("select DISTINCT e.* from tbl_Exams e,tbl_Questions q WHERE e.ExamID=q.ExamID and CategoryID=" + catID + " order by ExamName", con);

                }
                else
                {
                    cmd = new SqlCommand("select DISTINCT e.* from tbl_Exams e,tbl_Questions q WHERE e.ExamID=q.ExamID order by e.ExamName", con);

                }


                SqlDataAdapter a = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                a.Fill(dt);


                dropExams.DataTextField = "ExamName";
                dropExams.DataValueField = "ExamID";

                dropExams.DataSource = dt;
                dropExams.DataBind();


            }
            catch (Exception) { }



        }

        protected void btnStart_Click(object sender, EventArgs e)
        {
            string catID = dropCategory.SelectedValue;
            string examID = dropExams.SelectedValue;
            string examName = dropExams.SelectedItem.Text;

            if (Session["userId"] != null)
            {

                Examinationn exam = new Examinationn(Int32.Parse(Session["userId"].ToString()), Int32.Parse(examID), examName);
                exam.GetQuestions();
                Session.Add("questions", exam);
                Response.Redirect("examination.aspx");
            }
            else
            {
                Response.Redirect("loginStudent.aspx");
            }


        }



    }
}