using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;

namespace onlineExam
{
    public class Examinationn
    {
        public int SIZE;
        public int userId;
        public int examId;
        public String examName;
        public int ncans;
        public List<Question> questions;
        public DateTime StartTime;
        public int curpos = 0;

        public Examinationn(int userId, int examId, String examName)
        {
            this.userId = userId;
            this.examId = examId;
            this.examName = examName;
            StartTime = DateTime.Now;
        }

        public void GetQuestions()
        {

            SqlConnection con = new SqlConnection(DBUtil.ConnectionString);
            SqlDataAdapter da = new SqlDataAdapter("select * from tbl_Questions where ExamID = " + examId, con);
            DataSet ds = new DataSet();
            da.Fill(ds, "questions");


            int nquestions = ds.Tables[0].Rows.Count;
            SIZE = nquestions;

            Random r = new Random();
            int[] positions = new int[SIZE];
            int num;
            for (int pos = 0; pos < SIZE; )
            {
                num = Math.Abs(r.Next(nquestions));

                bool found = false;
                for (int i = 0; i < pos; i++)
                    if (num == positions[i]) { found = true; break; }

                if (!found)
                {
                    positions[pos] = num;
                    pos++;
                }
            }

            questions = new List<Question>();
            DataRow dr;
            Question q;

            foreach (int pos in positions)
            {
                dr = ds.Tables[0].Rows[pos];
                q = new Question(dr["Question"].ToString(), dr["Answer1"].ToString(), dr["Answer2"].ToString(), dr["Answer3"].ToString(), dr["Answer4"].ToString(), dr["Answer5"].ToString(), dr["CorrectAnswer"].ToString(), dr["ImageUrl"].ToString());
                questions.Add(q);
            }

        }
    }
}
