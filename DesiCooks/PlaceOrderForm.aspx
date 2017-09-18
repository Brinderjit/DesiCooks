<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/DesiCooksM.Master" CodeBehind="PlaceOrderForm.aspx.cs" Inherits="DesiCooks.PlaceOrderForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="Content/restaurant.css" rel="stylesheet" />
    <style>
.chkbxlst {
    margin-left: 137px;
}</style> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container1"><h2 style="padding-left: 20px;font-family:sans-serif">Place an order</h2>
         <div style="padding-top: 20px;padding-left: 20px;">
              <asp:Label ID="lblFirstName" runat="server" CssClass="label" Width="100px" Text="First Name:"></asp:Label>
         <asp:TextBox ID="txtFirstName" runat="server" CssClass="textres"></asp:TextBox>
         <br /><br />
          <asp:Label ID="lblLastName" runat="server" CssClass="label" Width="100px" Text="Last Name:"></asp:Label>
         <asp:TextBox ID="txtLastName" runat="server" CssClass="textres"></asp:TextBox>
         <br /><br />
         <asp:Label ID="lblCity" runat="server" CssClass="label" Width="100px" Text="City:"></asp:Label>
           <asp:TextBox ID="txtCity" runat="server" CssClass="textres"></asp:TextBox>
         <br /><br />
         <asp:Label ID="lblPostalCode" runat="server" CssClass="label" Width="100px" Text="Postal Code:"></asp:Label>
         <asp:TextBox ID="txtPostalCode" runat="server" CssClass="textres"></asp:TextBox>
         <br /><br />
          <asp:Label ID="lbPhoneNumber" runat="server" CssClass="label" Width="100px" Text="Phone number:"></asp:Label>
         <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="textres"></asp:TextBox>
         <br /><br />
             <asp:Label ID="lblProvince" runat="server" CssClass="label" Width="100px" Text="Province:"></asp:Label>
             <asp:DropDownList ID="lstProvince" runat="server" CssClass="textres">
                 <asp:ListItem>Alberta</asp:ListItem>
                 <asp:ListItem>British Columbia</asp:ListItem>
                 <asp:ListItem>Manitoba</asp:ListItem>
                 <asp:ListItem>New Brunswick</asp:ListItem>
                 <asp:ListItem>Newfoundland and Labrador</asp:ListItem>
                 <asp:ListItem>Nova Scotia</asp:ListItem>
                 <asp:ListItem>Ontario</asp:ListItem>
                 <asp:ListItem>Prince Edward Island</asp:ListItem>
                 <asp:ListItem>Quebec</asp:ListItem>
                 <asp:ListItem>Saskatchewan</asp:ListItem>
              </asp:DropDownList>
<br /><br />
               <asp:Label ID="lblFood" runat="server"  CssClass="label"  Text="Select Food and Drinks:"></asp:Label>
             <asp:CheckBoxList ID="chkbxlstFood" runat="server" CssClass="chkbxlst" >
                 <asp:ListItem>Lemon drizzle cake</asp:ListItem>
                 <asp:ListItem>Chilli con carne</asp:ListItem>
                 <asp:ListItem>Yummy scrummy carrot</asp:ListItem>
                 <asp:ListItem>Chocolate brownies</asp:ListItem>
                 <asp:ListItem>Spiced carrot &amp; lentil soup</asp:ListItem>
                 <asp:ListItem>Raspberry Bakewell cake</asp:ListItem>
              </asp:CheckBoxList>
             <br />
         <asp:Label ID="Label1" runat="server" CssClass="label" Width="100px" Text="Delivery type:"></asp:Label>
            
             <asp:RadioButton ID="rdoPickup" runat="server" text="Pickup"/><asp:RadioButton ID="rdoDeliver" runat="server" text="Delivery"/>
      <br />  <br /> <asp:Label ID="lblcomments" runat="server" CssClass="label" Width="100px" Text="Comments:"></asp:Label>
         <asp:TextBox ID="txtcomments" runat="server" TextMode="multiline" Columns="50" Rows="5" CssClass="textres"></asp:TextBox>
         <br />
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnPlace" runat="server" Text="Place Order" CssClass="button" Width="80px" /><br /><br />
             </div>
         </div>
</asp:Content>