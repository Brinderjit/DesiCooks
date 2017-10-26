<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/DesiCooksM.Master" CodeBehind="addImage.aspx.cs" Inherits="DesiCooks.addImage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <link href="Content/restaurant.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Content/style.css" rel="stylesheet" />
    <style>   .h1, .h2, .h3, h1, h2, h3 {
            color:black !important;
   
}
      

        .control-label
        {
            font-size: 15px !important;
            color: black !important;
        }</style>
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
      <div class="panel panel-default">
         <div class="panel-body"><h2>Add new food</h2></div>
           
    <div class="panel-body">
        <div class="form-group">
             <asp:Label ID="lblFoodTitle" runat="server" CssClass="control-label col-sm-2"  Text="Food title:"></asp:Label>
         
            <div class="col-sm-4"> <asp:TextBox ID="txtFoodTitle" runat="server" CssClass="form-control"></asp:TextBox>
            
            </div>
             </div>
          <div class="form-group">
          <asp:Label ID="lblFoodDescription" runat="server" CssClass="control-label col-sm-2" Text="Food description:"></asp:Label>
            <div class="col-sm-4"> 
               <asp:TextBox ID="txtFoodDescription" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
             </div>
              
      <div class="form-group">
         
           <asp:Label ID="Image" runat="server" CssClass="control-label col-sm-2" Text="Select image:"></asp:Label>
            <div class="col-sm-4"> 
                  <asp:FileUpload ID="imageUpload" runat="server" CssClass="form-control"/>
            </div>
             </div>
              
              <div class="form-group">
            <div class="col-sm-offset-2 col-sm-8">
                  <asp:Button ID="insertNewFood" runat="server" CssClass="btn btn-lg btn-primary" Text="Insert food" OnClick="insertNewFood_Click" />
               

            </div>
        </div> 
            
           
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