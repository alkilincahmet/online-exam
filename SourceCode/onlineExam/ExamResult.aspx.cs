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
    public partial class ExamResult : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Session["questions"] != null)
                {
                    ShowResult();

                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }

        }


        void ShowResult()
        {


            Examinationn exam = (Examinationn)Session["questions"];
            lblSubject.Text = exam.examName;
            lblStartTime.Text = exam.StartTime.ToString();
            TimeSpan ts = DateTime.Now.Subtract(exam.StartTime);
            lblMin.Text = ts.Minutes.ToString();
            lblNumberQuestions.Text = exam.SIZE.ToString();


            int cnt = 0;
            foreach (Question q in exam.questions)
            {
                if (q.IsCorrect())
                    cnt++;
            }

            lblNumberCorrectAns.Text = cnt.ToString();
            exam.ncans = cnt;
            Session.Add("questions", exam);

            if (cnt > 3)
                lblGrade.Text = "Excellent";
            else
                if (cnt > 1)
                    lblGrade.Text = "Average";
                else
                    lblGrade.Text = "Poor";


            SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into tbl_ExamResult (UserID,ExamID,NumberOfCorrect,NumberOfQuestion,StartDate,EndDate) values(@userid,@examid,@numberofquestion,@numbercorrectans,@startdate,getdate())", con);

            cmd.Parameters.Add("@userid", SqlDbType.Int).Value = exam.userId;
            cmd.Parameters.Add("@examid", SqlDbType.Int).Value = exam.examId;
            cmd.Parameters.Add("@numberofquestion", SqlDbType.Int).Value = exam.SIZE;
            cmd.Parameters.Add("@numbercorrectans", SqlDbType.Int).Value = exam.ncans;
            cmd.Parameters.Add("@startdate", SqlDbType.DateTime).Value = exam.StartTime;
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}