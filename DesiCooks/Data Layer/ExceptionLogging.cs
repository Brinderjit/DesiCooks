using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using context = System.Web.HttpContext;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DesiCooks.Data_Layer
{
    public static class ExceptionLogging
    {
        private static String exepurl;
        static SqlConnection con;
        private static void connection()
        {
            string constr = ConfigurationManager.ConnectionStrings["conString"].ToString();
            con = new SqlConnection(constr);
            con.Open();
        }
        public static void SendExcepToDB(Exception exdb)
        {

            connection();
            exepurl = context.Current.Request.Url.ToString();
            SqlCommand com = new SqlCommand("ExceptionLoggingToDataBase", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@ExceptionMsg", exdb.Message.ToString());
            com.Parameters.AddWithValue("@ExceptionType", exdb.GetType().Name.ToString());
            com.Parameters.AddWithValue("@ExceptionURL", exepurl);
            com.Parameters.AddWithValue("@ExceptionSource", exdb.StackTrace.ToString());
            com.ExecuteNonQuery();



        }


    }
}