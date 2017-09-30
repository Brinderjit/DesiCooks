<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/DesiCooksM.Master" CodeBehind="PlaceOrderForm.aspx.cs" Inherits="DesiCooks.PlaceOrderForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="Content/restaurant.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
          
            var val = $('#ContentPlaceHolder1_HiddenField1').val();
            if(val=="1")
            {
                $('.modal-title').html("Place order");
                $('.modal-body').html("Your order has been placed successfully");
                $('#myModal').modal('show');
            }
            else if(val=="2")
            {
                $('.modal-title').html("Place order");
                $('.modal-body').html("User has not placed any order yet");
                $('#myModal').modal('show');
            }
        })

    </script>
    <style>
        .rememberBtn{
           display: inline-block;
  box-sizing: content-box;
  cursor: pointer;
  padding: 5px 10px;
  border: 1px solid #c4622f;
  border-radius: 3px;
font-family:sans-serif;
font-size:14px;
  color: rgba(255,255,255,0.9);
  background: #c4622f;
  text-shadow: -1px -1px 0 rgba(15,73,168,0.66) ;
    
        }
.chkbxlst {
    margin-left: 137px;
}</style> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container1"><h2 style="padding-left: 20px;font-family:sans-serif">Place an order</h2>
         <div style="padding-top: 20px;padding-left: 20px;">
              <asp:Label ID="lblFirstName" runat="server" CssClass="label" Width="100px" Text="First Name:"></asp:Label>
         <asp:TextBox ID="txtFirstName" runat="server" CssClass="textres"></asp:TextBox>
              <asp:RequiredFieldValidator ID="firstNameValidator" ControlToValidate="txtFirstName" ForeColor="Red" runat="server" ErrorMessage="Enter First Name"></asp:RequiredFieldValidator>
         <br /><br />
          <asp:Label ID="lblLastName" runat="server" CssClass="label" Width="100px" Text="Last Name:"></asp:Label>
         <asp:TextBox ID="txtLastName" runat="server" CssClass="textres"></asp:TextBox>
              <asp:RequiredFieldValidator ID="lastNameValidator" ControlToValidate="txtLastName" runat="server" ForeColor="Red" ErrorMessage="Enter Last Name"></asp:RequiredFieldValidator>
             <br /> <br />

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="rememberBtn" runat="server" Text="Remember me" CssClass="rememberBtn" OnClick="rememberBtn_Click" Width="139px"/>
         <br /><br />
         <asp:Label ID="lblCity" runat="server" CssClass="label" Width="100px" Text="City:"></asp:Label>
           <asp:TextBox ID="txtCity" runat="server" CssClass="textres"></asp:TextBox>
              <asp:RequiredFieldValidator ID="cityValidator" runat="server" ForeColor="Red" ControlToValidate="txtCity" ErrorMessage="Enter a City"></asp:RequiredFieldValidator>
         <br /><br />
         <asp:Label ID="lblPostalCode" runat="server" CssClass="label" Width="100px" Text="Postal Code:"></asp:Label>
         <asp:TextBox ID="txtPostalCode" runat="server" CssClass="textres"></asp:TextBox>
              <asp:RequiredFieldValidator ID="postalValidator" runat="server" ForeColor="Red" ControlToValidate="txtPostalCode" ErrorMessage="Enter Postal Code"></asp:RequiredFieldValidator>
         <br /><br />
          <asp:Label ID="lbPhoneNumber" runat="server" CssClass="label" Width="100px" Text="Phone number:"></asp:Label>
         <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="textres" MaxLength="12" ></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="txtPhoneNumber" runat="server" ErrorMessage="Enter Postal Code"></asp:RequiredFieldValidator>
             
         <br /><br />
             <asp:Label ID="lblProvince" runat="server" CssClass="label" Width="100px" Text="Province:"></asp:Label>
             <asp:DropDownList ID="lstProvince" runat="server" CssClass="textres" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="provinceId">
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
              <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DesiCooksConnectionString %>" SelectCommand="SELECT * FROM [province]"></asp:SqlDataSource>
<br /><br />
               <asp:Label ID="lblFood" runat="server"  CssClass="label"  Text="Select Food and Drinks:"></asp:Label>
             <asp:CheckBoxList ID="chkbxlstFood" runat="server" CssClass="chkbxlst" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="foodId" >
                 <asp:ListItem>Lemon drizzle cake</asp:ListItem>
                 <asp:ListItem>Chilli con carne</asp:ListItem>
                 <asp:ListItem>Yummy scrummy carrot</asp:ListItem>
                 <asp:ListItem>Chocolate brownies</asp:ListItem>
                 <asp:ListItem>Spiced carrot &amp; lentil soup</asp:ListItem>
                 <asp:ListItem>Raspberry Bakewell cake</asp:ListItem>
              </asp:CheckBoxList>
              <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DesiCooksConnectionString %>" SelectCommand="SELECT * FROM [Foods]"></asp:SqlDataSource>
             <br />
         <asp:Label ID="Label1" runat="server" CssClass="label" Width="100px" Text="Delivery type:"></asp:Label>
            
             <asp:RadioButton ID="rdoPickup" runat="server" text="Pickup"/><asp:RadioButton ID="rdoDeliver" runat="server" text="Delivery"/>
      <br />  <br /> <asp:Label ID="lblcomments" runat="server" CssClass="label" Width="100px" Text="Comments:"></asp:Label>
         <asp:TextBox ID="txtcomments" runat="server" TextMode="multiline" Columns="50" Rows="5" CssClass="textres"></asp:TextBox>
         <br />
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnPlace" runat="server" Text="Place Order" CssClass="button" Width="80px" OnClick="btnPlace_Click" /><br /><br />
             </div>
         </div>
    <asp:HiddenField ID="HiddenField1" runat="server" />
    <!--model popup-->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Place Order</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Ok</button>
      </div>
    </div>
  </div>
</div>

</asp:Content>