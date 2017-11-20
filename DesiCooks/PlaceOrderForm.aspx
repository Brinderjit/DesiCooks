<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/DesiCooksM.Master" CodeBehind="PlaceOrderForm.aspx.cs" Inherits="DesiCooks.PlaceOrderForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="Content/restaurant.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Content/style.css" rel="stylesheet" />
   
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
        .rememberBtn {
            color: #fff;
            border-color: #c46232;
            background-color: #c46232;
        }
    
        
        .h1, .h2, .h3, h1, h2, h3 {
            color:black !important;
   
}
      

        .control-label
        {
            font-size: 15px !important;
            color: black !important;
        }
.chkbxlst {
    margin-left: 137px;
}</style> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      
     <div class="panel panel-default">
         <div class="panel-body"><h2>Place an order</h2></div>
           
    <div class="panel-body">
        <div class="form-group">
            <asp:Label ID="lblFirstName" runat="server" class="control-label col-sm-2" Text="First Name:"></asp:Label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="firstNameValidator" ControlToValidate="txtFirstName" ForeColor="Red" runat="server" ErrorMessage="Enter First Name"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <asp:Label ID="lblLastName" runat="server" class="control-label col-sm-2" Text="Last Name:"></asp:Label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="lastNameValidator" ControlToValidate="txtLastName" runat="server" ForeColor="Red" ErrorMessage="Enter Last Name"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <asp:Button ID="rememberBtn" runat="server" Text="Remember me" CssClass="btn btn-sm rememberBtn" OnClick="rememberBtn_Click" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label ID="lblCity" runat="server" class="control-label col-sm-2" Text="City:"></asp:Label>

            <div class="col-sm-4">
                <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <asp:Label ID="lblPostalCode" runat="server" class="control-label col-sm-2" Text="Postal Code:"></asp:Label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtPostalCode" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <asp:Label ID="lbPhoneNumber" runat="server" CssClass="control-label col-sm-2" Text="Phone number:"></asp:Label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control" MaxLength="12"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <asp:Label ID="lblProvince" runat="server" CssClass="control-label col-sm-2" Text="Province:"></asp:Label>

            <div class="col-sm-4">
                <asp:DropDownList ID="lstProvince" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="provinceId">
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
            </div>
        </div>
        <div class="form-group">
            <asp:Label ID="lblFood" runat="server" CssClass="control-label col-sm-2" Text="Select Food and Drinks:"></asp:Label>
            <a href="~/addImage.aspx" class="btn btn-primary" style="float: right;margin-right:2px;margin-left:12px" runat="server">Add food</a>
            <asp:Button ID="menuDownlodBtn" runat="server" class="btn btn-primary btn-md " Style="float: right" Text="Download Menu" CausesValidation="false" OnClick="menuDownlodBtn_Click" />
        </div>
        <div class="form-group">
            <div class="col-sm-12">
                <asp:Repeater ID="repeaterFoodItems" runat="server" DataSourceID="SqlDataSource3">
                    <HeaderTemplate>
                        <div class="recommended-grids ">
                    </HeaderTemplate>
                    <ItemTemplate>

                        <div class="col-md-2 resent-grid recommended-grid sports-recommended-grid">
                            <div class="resent-grid-img recommended-grid-img">
                                <img src='<%# Eval("imagePath") %>' alt="" style="width: 163px; height: 107px;">
                            </div>
                            <div class="resent-grid-info recommended-grid-info">
                                <h5><%# Eval("name") %></h5>
                                <asp:CheckBox ID="foodItem" runat="server" />

                            </div>
                        </div>

                    </ItemTemplate>
                    <FooterTemplate>
                        <div class="clearfix"></div>
                        </div>
                    </FooterTemplate>
                </asp:Repeater>

                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DesiCooksConnectionString %>" SelectCommand="SELECT * FROM [Foods]"></asp:SqlDataSource>
            </div>

        </div>
        <div class="form-group">

            <asp:Label ID="Label1" runat="server" CssClass="control-label col-sm-2" Text="Delivery type:"></asp:Label>
            <div class="col-sm-4">
                <div class="radio">
                    <asp:RadioButton ID="rdoPickup" runat="server" GroupName="delivery" Text="Pickup" />
                </div>
                <div class="radio">
                    <asp:RadioButton ID="rdoDeliver" GroupName="delivery" runat="server" Text="Delivery" />
                </div>


            </div>
        </div>
        <div class="form-group">
            <asp:Label ID="lblcomments" runat="server" CssClass="control-label col-sm-2" Text="Comments:"></asp:Label>
            <div class="col-sm-6">
                <asp:TextBox ID="txtcomments" runat="server" TextMode="multiline" Rows="5" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-8">
                <asp:Button ID="btnPlace" runat="server" Text="Place Order" CssClass="btn btn-lg btn-primary" OnClick="btnPlace_Click" />

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
    </div>
         </div>

</asp:Content>