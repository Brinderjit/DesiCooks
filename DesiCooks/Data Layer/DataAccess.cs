using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DesiCooks.Models;
using System.Data.SqlClient;
using System.Data;

namespace DesiCooks.Data_Layer
{
    public class DataAccess
    {
        SqlConnection conn;
        private static String conString = System.Configuration.ConfigurationManager.ConnectionStrings["DesiCooksConnectionString"].ToString();
        public int insertFood(string title,string path,string description)
        {
            int error = 0;
            try
            {


                conn = new SqlConnection(conString);
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = "proc_insertNewFood";
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@title", SqlDbType.VarChar).Value = title;
                cmd.Parameters.Add("@path", SqlDbType.VarChar).Value = path;
                cmd.Parameters.Add("@description", SqlDbType.VarChar).Value = description;
                conn.Open();
                cmd.ExecuteNonQuery();
                
            }
            catch (Exception e)
            {
                ExceptionLogging.SendExcepToDB(e);
                error = 1;

            }
            finally
            {
                
                conn.Close();

            }
            return 1;
        }
        public int insertOrder(OrderModel order)
        {
            int error=0;
            try
            {


                conn = new SqlConnection(conString);
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = "insertOrder";
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add("@firstName", SqlDbType.VarChar).Value = order.firstName;
                cmd.Parameters.Add("@lastName", SqlDbType.VarChar).Value = order.lastName;
                cmd.Parameters.Add("@city", SqlDbType.VarChar).Value = order.city;
                cmd.Parameters.Add("@postalCode", SqlDbType.VarChar).Value = order.postalCode;
                cmd.Parameters.Add("@phoneNumber", SqlDbType.BigInt).Value = order.phoneNumber;
                cmd.Parameters.Add("@comments", SqlDbType.VarChar).Value = order.comments;
                cmd.Parameters.Add("@deliveryType", SqlDbType.VarChar).Value = order.deliveryType;
                cmd.Parameters.Add("@province", SqlDbType.Int).Value = order.province;
                cmd.Parameters.Add("@orderId", SqlDbType.BigInt).Direction = System.Data.ParameterDirection.Output;
                conn.Open();
                cmd.ExecuteNonQuery();
                long orderid = Convert.ToInt64(cmd.Parameters["@orderId"].Value);
                foreach (int foodid in order.food)
                {
                    SqlCommand cmd1 = new SqlCommand();
                    cmd1.Connection = conn;
                    cmd1.CommandText = "insertFood";
                    cmd1.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd1.Parameters.Add("@orderId", SqlDbType.BigInt).Value = orderid;
                    cmd1.Parameters.Add("@foodId", SqlDbType.Int).Value = foodid;
                    cmd1.ExecuteNonQuery();
                }
            }
            catch(Exception e)
            {
                ExceptionLogging.SendExcepToDB(e);
                error = 1;

            }
            finally
            {
                conn.Close();
                
            }
            return 1;
        }
        public OrderModel checkUser(String firstName,string lastName)
        {
            OrderModel order = new OrderModel();
            int error = 0;
            try
            {

                SqlDataReader rdr;
           
            conn = new SqlConnection(conString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = "userCheck";
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add("@firstname",SqlDbType.VarChar).Value = firstName;
            cmd.Parameters.Add("@lastname", SqlDbType.VarChar).Value = lastName;
            cmd.Parameters.Add("@flag", SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;
            conn.Open();

            // open connection and execute stored procedure
            cmd.ExecuteNonQuery();
          
           
            int flag = Convert.ToInt32(cmd.Parameters["@flag"].Value);
            if (flag == 1)
            {
                rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    // get the results of each column
                    order.orderId = Convert.ToInt64(rdr["id"]);
                    order.firstName = (string)rdr["Firstname"];
                    order.lastName = (string)rdr["lastname"];
                    order.city = (string)rdr["city"];
                    order.postalCode = (string)rdr["postalcode"];
                    order.phoneNumber = Convert.ToInt64(rdr["phoneNumber"]);
                    order.province = Convert.ToInt32(rdr["provinceId"]);
                    order.deliveryType = (string)rdr["deliveryType"];
                    order.comments = (string)rdr["comments"];
                }
                rdr.Close(); 
                SqlCommand cmd1 = new SqlCommand();
                cmd1.Connection = conn;
                cmd1.CommandText = "select * from orderFoodMapping where orderId=@orderId";
                cmd1.CommandType = System.Data.CommandType.Text;
                cmd1.Parameters.Add("@orderId", SqlDbType.VarChar).Value = order.orderId;
                rdr = cmd1.ExecuteReader();
                    while (rdr.Read())
                    {
                        
                        order.food.Add( Convert.ToInt32( rdr["foodId"]));
                       
                    }
                }

            }
            catch (Exception e)
            {
                ExceptionLogging.SendExcepToDB(e);
                error = 1;

            }
            finally
            {
                conn.Close();

            }

            return order;
        }

    }
}