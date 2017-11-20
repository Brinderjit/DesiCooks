using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DesiCooks.Data_Layer;
using DesiCooks.Models;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Text;
using System.Net;

namespace DesiCooks
{
    public partial class PlaceOrderForm : System.Web.UI.Page
    {
       private static DataAccess _dataObject = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void rememberBtn_Click(object sender, EventArgs e)
        {
            OrderModel order = new OrderModel();
           order= _dataObject.checkUser(txtFirstName.Text, txtLastName.Text);
            if(order.firstName!=null)
            {
                
                txtFirstName.Text = order.firstName;
                txtLastName.Text = order.lastName;
                txtCity.Text = order.city;
                txtPostalCode.Text = order.postalCode;
                txtPhoneNumber.Text = order.phoneNumber.ToString();
                txtCity.Text = order.city;
                txtcomments.Text = order.comments;
                //for(int i=0;i<order.food.Count;i++)
                // {
                int i = 1;
                foreach (RepeaterItem item in repeaterFoodItems.Items)
                {
                    CheckBox foodChkBx = (CheckBox)item.FindControl("foodItem");
                    if (order.food.Contains(i))
                    {
                        foodChkBx.Checked = true;
                    }
                    i++;
                }
              /*  for (int i = 0; i <chkbxlstFood.Items.Count; i++)
                    {
                        if (order.food.Contains(Convert.ToInt32(chkbxlstFood.Items[i].Value)))
                        {
                            chkbxlstFood.Items[i].Selected = true;
                        }
                    }
                  
              //  }*/
                if(order.deliveryType=="Pickup")
                {
                    rdoPickup.Checked=true;
                }
                else
                {
                    rdoDeliver.Checked = true;
                }
                lstProvince.SelectedValue= order.province.ToString();

                // chkbxlstFood.SelectedIndex = order.food;\
                HiddenField1.Value = "0";

            }
            else
            {
                HiddenField1.Value = "2";
            }
            

        }

        protected void btnPlace_Click(object sender, EventArgs e)
        {
            OrderModel order = new OrderModel();
            order.firstName = txtFirstName.Text;
            order.lastName = txtLastName.Text;
            order.city = txtCity.Text;
            order.postalCode = txtPostalCode.Text;
            order.phoneNumber =Convert.ToInt64( txtPhoneNumber.Text);
            order.province =Convert.ToInt32( lstProvince.SelectedValue);
            order.comments = txtcomments.Text;
            if (rdoPickup.Checked ==true)
                
            {
                order.deliveryType = "Pickup";
            }
            else
            {
                order.deliveryType = "Delivery";
            }
            int i = 1;
            foreach (RepeaterItem item in repeaterFoodItems.Items)
            {
               CheckBox foodChkBx = (CheckBox)item.FindControl("foodItem");
                if (foodChkBx.Checked)
                {
                    order.food.Add(Convert.ToInt32(i));
                }
                i++;
            }
          /*  for (int i = 0; i < chkbxlstFood.Items.Count; i++)
            {
                if (chkbxlstFood.Items[i].Selected)
                {

                   order.food.Add(Convert.ToInt32(chkbxlstFood.Items[i].Value));
                }

            }*/

            
            // chkbxlstFood.SelectedIndex = order.food;
            _dataObject.insertOrder(order);
            HiddenField1.Value = "1";
        }

        protected void addImageButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("addImage.aspx");
        }
      
        protected void menuDownlodBtn_Click(object sender, EventArgs e)
        {

            //Create a stream for the file
            Stream stream = null;

            //This controls how many bytes to read at a time and send to the client
            int bytesToRead = 10000;

            // Buffer to read bytes in chunk size specified above
            byte[] buffer = new Byte[bytesToRead];

            // The number of bytes read
            try
            {
                //Create a WebRequest to get the file
                HttpWebRequest fileReq = (HttpWebRequest)HttpWebRequest.Create("https://storage.googleapis.com/desicooks_bucket/FoodmenuPdfs/DesiCooksMenu.pdf");

                //Create a response for this request
                HttpWebResponse fileResp = (HttpWebResponse)fileReq.GetResponse();

                if (fileReq.ContentLength > 0)
                    fileResp.ContentLength = fileReq.ContentLength;

                //Get the Stream returned from the response
                stream = fileResp.GetResponseStream();

                // prepare the response to the client. resp is the client Response
                var resp = HttpContext.Current.Response;

                //Indicate the type of data being sent
                resp.ContentType = "application/pdf";

                //Name the file 
                resp.AddHeader("Content-Disposition", "attachment; filename=\"" +"DesiCooksMenu.pdf" + "\"");
                resp.AddHeader("Content-Length", fileResp.ContentLength.ToString());

                int length;
                do
                {
                    // Verify that the client is connected.
                    if (resp.IsClientConnected)
                    {
                        // Read data into the buffer.
                        length = stream.Read(buffer, 0, bytesToRead);

                        // and write it out to the response's output stream
                        resp.OutputStream.Write(buffer, 0, length);

                        // Flush the data
                        resp.Flush();

                        //Clear the buffer
                        buffer = new Byte[bytesToRead];
                    }
                    else
                    {
                        // cancel the download if client has disconnected
                        length = -1;
                    }
                } while (length > 0); //Repeat until no data is read
            }
            finally
            {
                if (stream != null)
                {
                    //Close the input stream
                    stream.Close();
                }
            }
          
        }
    }
    }
