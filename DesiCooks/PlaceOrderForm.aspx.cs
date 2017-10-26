﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DesiCooks.Data_Layer;
using DesiCooks.Models;
using System.Drawing;
using System.Drawing.Imaging;

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
            try
            {
                Response.Clear();
                Response.ContentType = "application/pdf";
               // Response.AddHeader("Content-Disposition",
               //     "attachment;filename=\"DesiCooksMenu.pdf\"");

                Context.Response.WriteFile("http://storage.googleapis.com/desicooks_bucket/FoodmenuPdfs/DesiCooksMenu.pdf");

                Response.Flush();

                Response.End();
            }
            catch(Exception ex)
            {

            }
           
          
        }
    }
    }
