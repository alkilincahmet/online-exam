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
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetExam();
            }
        }



        void GetExam()
        {
            SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select  DISTINCT top 10 e.* from tbl_Exams e,tbl_Questions q WHERE e.ExamID=q.ExamID order by e.ExamID desc", con);
                SqlDataAdapter a = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                a.Fill(dt);

                repSoru.DataSource = dt;
                repSoru.DataBind();
            }
            catch { }


        }
    }
}