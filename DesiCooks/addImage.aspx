<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/DesiCooksM.Master" CodeBehind="addImage.aspx.cs" Inherits="DesiCooks.addImage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <link href="Content/restaurant.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Content/style.css" rel="stylesheet" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
      <script type="text/javascript">
        $(document).ready(function () {
          
            var val = $('#ContentPlaceHolder1_HiddenField1').val();
            if(val=="1")
            {
                $('.modal-title').html("Add food");
                $('.modal-body').html("error occurred");
                $('#myModal').modal('show');
            }
            else if(val=="2")
            {
                $('.modal-title').html("Add food");
                $('.modal-body').html("food added succesfully");
                $('#myModal').modal('show');
            }
        })

    </script>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="container1"><h2 style="padding-left: 20px;font-family:sans-serif">Add food image and metadata</h2>
         <div style="padding-top: 20px;padding-left: 20px;">
              <asp:Label ID="lblFoodTitle" runat="server" CssClass="label" Width="100px" Text="Food title:"></asp:Label>
         <asp:TextBox ID="txtFoodTitle" runat="server" CssClass="textres"></asp:TextBox>   <br /><br />
               <asp:Label ID="lblFoodDescription" runat="server" CssClass="label" Width="100px" Text="Food description:"></asp:Label>
         <asp:TextBox ID="txtFoodDescription" runat="server" CssClass="textres"></asp:TextBox><br /><br />
              
               <asp:Label ID="Image" runat="server" CssClass="label" Width="100px" Text="Select image:"></asp:Label>
             <asp:FileUpload ID="imageUpload" runat="server" /><br />
             <asp:Button ID="insertNewFood" runat="server" Text="Insert food" OnClick="insertNewFood_Click" />
             <br /><br />
             <asp:HiddenField ID="HiddenField1" runat="server" />

             </div>
          </div>
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