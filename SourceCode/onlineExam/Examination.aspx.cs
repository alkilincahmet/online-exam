using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace onlineExam
{
    public partial class Examination : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userId"] != null)
                {
                    DisplayQuestion();
                }
                else
                {
                    Response.Redirect("loginStudent.aspx");
                }

            }
        }


        public void DisplayQuestion()
        {

            Examinationn e = (Examinationn)Session["questions"];

            lblSubject.Text = e.examName;
            lblQuestionNo.Text = e.curpos + 1 + "/" + e.SIZE;
            lblCurrentTime.Text = DateTime.Now.ToString();
            lblStartTime.Text = e.StartTime.ToString();

            Question q = e.questions[e.curpos];

            question.InnerHtml = q.question;
            ans1.InnerHtml = q.ans1;
            ans2.InnerHtml = q.ans2;
            ans3.InnerHtml = q.ans3;
            ans4.InnerHtml = q.ans4;
            ans5.InnerHtml = q.ans5;

            rbAns1.Checked = false;
            rbAns2.Checked = false;
            rbAns3.Checked = false;
            rbAns4.Checked = false;
            rbAns5.Checked = false;


            if (e.curpos == 0)
                btnPrev.Enabled = false;
            else
                btnPrev.Enabled = true;

            if (e.curpos == e.SIZE - 1)
                btnNext.Text = "Finish";
            else
                btnNext.Text = "Next";
        }

        public void ProcessQuestion()
        {
            Examinationn exam = (Examinationn)Session["questions"];
            Question q = exam.questions[exam.curpos];
            String answer;

            if (rbAns1.Checked)
                answer = "1";
            else
                if (rbAns2.Checked)
                    answer = "2";
                else
                    if (rbAns3.Checked)
                        answer = "3";
                    else
                        if (rbAns4.Checked)
                            answer = "4";
                        else
                            if (rbAns5.Checked)
                                answer = "5";
                            else
                                answer = "0";
            q.answer = answer;
            exam.questions[exam.curpos] = q;
            Session.Add("questions", exam);
        }


        protected void btnPrev_Click(object sender, EventArgs e)
        {
            Examinationn exam = (Examinationn)Session["questions"];
            exam.curpos--;
            Session.Add("questions", exam);
            DisplayQuestion();
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            ProcessQuestion();
            Examinationn exam = (Examinationn)Session["questions"];
            if (exam.curpos == exam.SIZE - 1)
                Response.Redirect("ExamResult.aspx");
            else
            {
                exam.curpos++;
                Session.Add("questions", exam);
                DisplayQuestion();
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Session.Remove("questions");
            Response.Redirect("default.aspx");
        }
    }
}