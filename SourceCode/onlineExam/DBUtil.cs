using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Web.Configuration;

namespace onlineExam
{
    class DBUtil
    {
        public static String ConnectionString
        {
            get
            {
                ConnectionStringSettings constr = WebConfigurationManager.ConnectionStrings["examConnectionString"];
                return constr.ConnectionString;
            }

        }
    }
}
