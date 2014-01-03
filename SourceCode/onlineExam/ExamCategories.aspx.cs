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
    public partial class ExamCategories : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Session["userId"] != null)
                {
                    if (Session["auth"].ToString() == "1" || Session["auth"].ToString() == "0")
                    {
                        GetExamCategory();
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


        void GetExamCategory()
        {

            SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from tbl_Categories order by CategoryName ", con);
                SqlDataAdapter a = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                a.Fill(dt);

                gridExamCategories.DataSource = dt;
                gridExamCategories.DataBind();
            }
            catch { }

        }

        protected void gridExamHistory_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridExamCategories.PageIndex = e.NewPageIndex;
            GetExamCategory();
        }

        protected void gridExamCategories_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow || e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[1].Visible = false;
            }
        }

    }
}