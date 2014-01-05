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
    public partial class Exams : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Session["userId"] != null)
                {
                    if (Session["auth"].ToString() == "1")
                    {
                        GetExams();
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


        void GetExams()
        {
            SqlCommand cmd;
            SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
            try
            {
                con.Open();
                if (Session["auth"].ToString() != "0")
                {
                    cmd = new SqlCommand("select e.ExamID,c.CategoryName,e.ExamName,e.ExamTime,e.NumberOfQuestion from tbl_Exams e,tbl_Categories c where e.CategoryID=c.CategoryID and UserID=" + Session["userId"].ToString() + "  order by e.CategoryID,e.ExamName", con);

                }
                else
                {
                    cmd = new SqlCommand("select e.ExamID,c.CategoryName,e.ExamName,e.ExamTime,e.NumberOfQuestion from tbl_Exams e,tbl_Categories c where e.CategoryID=c.CategoryID  order by e.CategoryID,e.ExamName", con);

                }
                SqlDataAdapter a = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                a.Fill(dt);

                gridExams.DataSource = dt;
                gridExams.DataBind();
            }
            catch { }

        }

        protected void gridExam_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridExams.PageIndex = e.NewPageIndex;
            GetExams();
        }

        protected void gridExams_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow || e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[1].Visible = false;
            }
        }

    }
}