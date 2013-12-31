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
    public partial class Previousexams : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userId"] != null)
                {
                    GetExamHistory(Session["userId"].ToString());
                }
                else
                {
                    Response.Redirect("loginStudent.aspx");
                }

            }
        }


        void GetExamHistory(string userId)
        {

            SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select  e.ExamName,e.NumberOfQuestion,r.NumberOfCorrect,"
                + "e.NumberOfQuestion - r.NumberOfCorrect NumberOfWrong, StartDate=convert(varchar(10),r.StartDate,104),"
                + "NumberOfMinute = datediff(mi,r.StartDate,r.EndDate) from tbl_ExamResult r,tbl_Exams e where r.ExamID=e.ExamID "
                + "and r.UserID=" + userId, con);
                SqlDataAdapter a = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                a.Fill(dt);

                gridExamHistory.DataSource = dt;
                gridExamHistory.DataBind();
            }
            catch { }

        }

        protected void gridExamHistory_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridExamHistory.PageIndex = e.NewPageIndex;
            GetExamHistory(Session["userId"].ToString());
        }

    }
}