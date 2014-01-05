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
    public partial class ExamQuestions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Session["userId"] != null)
                {
                    if (Session["auth"].ToString() == "1" || Session["auth"].ToString() == "0")
                    {
                        GetExamQuestions();
                        GetExam();
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


        void GetExam()
        {
            SqlCommand cmd;
            SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
            try
            {
                con.Open();

                if (Session["auth"].ToString() != "0")
                {
                    cmd = new SqlCommand("select * from tbl_Exams where UserID=" + Session["userId"].ToString() + " order by ExamName", con);

                }
                else
                {
                    cmd = new SqlCommand("select * from tbl_Exams order by ExamName", con);

                }
                SqlDataAdapter a = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                a.Fill(dt);



                dropExams.DataSource = dt;
                dropExams.DataBind();

                dropExams.Items.Insert(0, new ListItem("All", "0"));
                dropExams.SelectedIndex = 0;

            }
            catch { }

        }



        void GetExamQuestions()
        {
            SqlCommand cmd;
            SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
            try
            {
                con.Open();

                if (Session["auth"].ToString() != "0")
                {
                    cmd = new SqlCommand("select q.QuestionID as QID,e.ExamName,q.Question,q.Answer1 as Ans1,q.Answer2 as Ans2,q.Answer3 as Ans3 ,q.Answer4 as Ans4,q.Answer5 as Ans5,q.CorrectAnswer as CAns from tbl_Questions q,tbl_Exams e where q.ExamID=e.ExamID and q.UserID=" + Session["userId"].ToString() + " order by e.ExamName,q.QuestionID desc", con);

                }
                else
                {
                    cmd = new SqlCommand("select q.QuestionID as QID,e.ExamName,q.Question,q.Answer1 as Ans1,q.Answer2 as Ans2,q.Answer3 as Ans3 ,q.Answer4 as Ans4,q.Answer5 as Ans5,q.CorrectAnswer as CAns from tbl_Questions q,tbl_Exams e where q.ExamID=e.ExamID order by e.ExamName,q.QuestionID desc", con);

                }
                SqlDataAdapter a = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                a.Fill(dt);

                gridExamQuestions.DataSource = dt;
                gridExamQuestions.DataBind();


            }
            catch { }

        }


        protected void karaktersinirla(object sender, GridViewRowEventArgs e)
        {
            int i = 0;

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                foreach (TableCell cell in e.Row.Cells)
                {
                    i++;
                    string encoded = cell.Text;
                    string s = Context.Server.HtmlDecode(encoded);
                    if (s.Length > 10)
                        cell.Text = s.Substring(0, 10) + "....";
                    cell.ToolTip = s;
                }
            }
        }

        protected void gridExam_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridExamQuestions.PageIndex = e.NewPageIndex;
            GetExamQuestions();
        }

        protected void gridExamQuestions_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow || e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[1].Visible = false;
            }
        }

        protected void dropExams_SelectedIndexChanged(object sender, EventArgs e)
        {
            string examid = dropExams.SelectedValue;

            SqlCommand cmd;
            SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
            try
            {
                con.Open();

                if (examid != "0")
                {
                    if (Session["auth"].ToString() != "0")
                    {
                        cmd = new SqlCommand("select q.QuestionID as QID,e.ExamName,q.Question,q.Answer1 as Ans1,q.Answer2 as Ans2,q.Answer3 as Ans3 ,q.Answer4 as Ans4,q.Answer5 as Ans5,q.CorrectAnswer as CAns from tbl_Questions q,tbl_Exams e where q.ExamID=e.ExamID and q.UserID=" + Session["userId"].ToString() + " and q.ExamID=" + examid + " order by e.ExamName,q.QuestionID desc", con);

                    }
                    else
                    {
                        cmd = new SqlCommand("select q.QuestionID as QID,e.ExamName,q.Question,q.Answer1 as Ans1,q.Answer2 as Ans2,q.Answer3 as Ans3 ,q.Answer4 as Ans4,q.Answer5 as Ans5,q.CorrectAnswer as CAns from tbl_Questions q,tbl_Exams e where q.ExamID=e.ExamID  and q.ExamID=" + examid + "  order by e.ExamName,q.QuestionID desc", con);

                    }

                }
                else
                {
                    if (Session["auth"].ToString() != "0")
                    {
                        cmd = new SqlCommand("select q.QuestionID as QID,e.ExamName,q.Question,q.Answer1 as Ans1,q.Answer2 as Ans2,q.Answer3 as Ans3 ,q.Answer4 as Ans4,q.Answer5 as Ans5,q.CorrectAnswer as CAns from tbl_Questions q,tbl_Exams e where q.ExamID=e.ExamID and q.UserID=" + Session["userId"].ToString() + "  order by e.ExamName,q.QuestionID desc", con);

                    }
                    else
                    {
                        cmd = new SqlCommand("select q.QuestionID as QID,e.ExamName,q.Question,q.Answer1 as Ans1,q.Answer2 as Ans2,q.Answer3 as Ans3 ,q.Answer4 as Ans4,q.Answer5 as Ans5,q.CorrectAnswer as CAns from tbl_Questions q,tbl_Exams e where q.ExamID=e.ExamID order by e.ExamName,q.QuestionID desc", con);

                    }
                }

                SqlDataAdapter a = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                a.Fill(dt);

                gridExamQuestions.DataSource = dt;
                gridExamQuestions.DataBind();


            }
            catch { }
        }

    }
}