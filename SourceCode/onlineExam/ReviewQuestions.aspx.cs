using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace onlineExam
{
    public partial class ReviewQuestions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["questions"] != null)
                {
                    Examinationn exam = (Examinationn)Session["questions"];
                    datalistQuestion.DataSource = exam.questions;
                    datalistQuestion.DataBind();
                    

                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
        }

    }
}