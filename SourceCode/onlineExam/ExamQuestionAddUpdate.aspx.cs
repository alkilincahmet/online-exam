using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;
using System.Data;
using System.IO;

namespace onlineExam
{
    public partial class ExamQuestionAddUpdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Session["userId"] != null)
                {
                    if (Session["auth"].ToString() == "1" || Session["auth"].ToString() == "0")
                    {
                        GetExam();

                        if (Request.QueryString["id"] != "0")
                        {
                            GetQuestion();
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


            }
            catch { }

        }

        void GetQuestion()
        {

            SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from tbl_Questions where QuestionID=" + Request.QueryString["id"], con);
                SqlDataAdapter a = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                a.Fill(dt);

                dropExams.SelectedValue = dt.Rows[0]["ExamID"].ToString();
                txtQuestion.Value = dt.Rows[0]["Question"].ToString();
                txtAnswer1.Value = dt.Rows[0]["Answer1"].ToString();
                txtAnswer2.Value = dt.Rows[0]["Answer2"].ToString();
                txtAnswer3.Value = dt.Rows[0]["Answer3"].ToString();
                txtAnswer4.Value = dt.Rows[0]["Answer4"].ToString();
                txtAnswer5.Value = dt.Rows[0]["Answer5"].ToString();
                dropCorrectAnswer.SelectedValue = dt.Rows[0]["CorrectAnswer"].ToString();
                ViewState["image"] = dt.Rows[0]["ImageUrl"].ToString();

                btnSave.Text = "UPDATE";


            }
            catch { }

        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            string eid = dropExams.SelectedValue;
            string question = txtQuestion.Value;
            string answer1 = txtAnswer1.Value;
            string answer2 = txtAnswer2.Value;
            string answer3 = txtAnswer3.Value;
            string answer4 = txtAnswer4.Value;
            string answer5 = txtAnswer5.Value;
            string correctAnwer = dropCorrectAnswer.SelectedValue;

            string imgUrl = "";
            string filename = Path.GetRandomFileName().Replace(".", "");

            string userID = Session["userId"].ToString();

            string id = Request.QueryString["id"];

            SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
            try
            {

                if (id == "0")
                {


                    if (FileUpload1.HasFile)
                    {

                        string ex1 = FileUpload1.FileName.Substring(FileUpload1.FileName.LastIndexOf("."), FileUpload1.FileName.Length - FileUpload1.FileName.LastIndexOf("."));
                        FileUpload1.SaveAs(MapPath("Images/QuestionImage/") + filename + ex1);
                        imgUrl = "Images/QuestionImage/" + filename + ex1;

                    }


                    con.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO [dbo].[tbl_Questions] ([ExamID],[UserID],[Question],[Answer1],[Answer2],[Answer3],[Answer4],[Answer5],[CorrectAnswer],[ImageUrl])"
                    + " values(" + eid + "," + userID + ",'" + question + "','" + answer1 + "','" + answer2 + "','" + answer3 + "','" + answer4 + "','" + answer5 + "','" + correctAnwer + "','" + imgUrl + "')", con);
                    cmd.ExecuteNonQuery();
                    con.Close();

                    lblAlert.ForeColor = Color.Green;
                    lblAlert.Text = "Succesfully Added.";
                    lblAlert1.ForeColor = Color.Green;
                    lblAlert1.Text = "Succesfully Updated.";
                }
                else
                {

                    if (FileUpload1.HasFile)
                    {

                        string ex1 = FileUpload1.FileName.Substring(FileUpload1.FileName.LastIndexOf("."), FileUpload1.FileName.Length - FileUpload1.FileName.LastIndexOf("."));
                        FileUpload1.SaveAs(MapPath("Images/QuestionImage/") + filename + ex1);
                        imgUrl = "Images/QuestionImage/" + filename + ex1;

                    }
                    else
                    {
                        imgUrl = ViewState["image"].ToString();
                    }

                    con.Open();
                    SqlCommand cmd = new SqlCommand("UPDATE [dbo].[tbl_Questions] SET ExamID=" + eid + ",Question='" + question + "',Answer1='" + answer1 + "'," +
                    " Answer2='" + answer2 + "',Answer3='" + answer3 + "',Answer4='" + answer4 + "',Answer5='" + answer5 + "',CorrectAnswer='" + correctAnwer + "'," +
                    " ImageUrl='" + imgUrl + "' where QuestionID=" + Request.QueryString["id"], con);
                    cmd.ExecuteNonQuery();
                    con.Close();

                    lblAlert.ForeColor = Color.Green;
                    lblAlert.Text = "Succesfully Updated.";
                    lblAlert1.ForeColor = Color.Green;
                    lblAlert1.Text = "Succesfully Updated.";
                }



            }
            catch { }
        }
    }
}