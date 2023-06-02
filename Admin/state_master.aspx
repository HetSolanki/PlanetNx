<%@ Page Title="" Language="VB" MasterPageFile="Admin.master" AutoEventWireup="false" CodeFile="state_master.aspx.vb" Inherits="General" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Master| Dashboard 2</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet"
    href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
    <!-- DataTables -->
  <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  <asp:ScriptManager ID="ScriptManager1" runat="server">
    <Scripts>
      <asp:ScriptReference path="plugins/jquery/jquery.min.js"/>
      <asp:ScriptReference path="plugins/bootstrap/js/bootstrap.bundle.min.js"/>
      <asp:ScriptReference path="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"/>
      <asp:ScriptReference path="dist/js/adminlte.js"/>
      <asp:ScriptReference path="plugins/jquery-mousewheel/jquery.mousewheel.js"/>
      <asp:ScriptReference path="plugins/raphael/raphael.min.js"/>
      <asp:ScriptReference path="plugins/jquery-mapael/jquery.mapael.min.js"/>
      <asp:ScriptReference path="plugins/jquery-mapael/maps/usa_states.min.js"/>
      <asp:ScriptReference path="plugins/chart.js/Chart.min.js"/>
      <asp:ScriptReference path="dist/js/demo.js"/>
      <asp:ScriptReference path="dist/js/pages/dashboard2.js"/>
    </Scripts>
</asp:ScriptManager>


        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
          
                 
    <Triggers>
        <asp:PostBackTrigger ControlId ="Save" />
    </Triggers>
            
            <ContentTemplate>
              
                
                
                
                <%--<section class="content-header">--%>
                           <%-- <div
 class="container-fluid">
          <div class="row">
            <div class="col-sm-6">
              <h1>City Master</h1>
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            </div>
         
          </div>
        </div>--%>
                    <!-- /.container-fluid -->
      <%--</section>--%>
   <section class="content content-wrapper row ">
            <h1 class="container-fluid ">State Master</h1>
      <%--    <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item  active"><a href="City_master.aspx.aspx">City</a></li>
              </ol>
            </div>--%>
  <div class="card card-secondary col-sm-4 mt-2">
    <div class="card-header">
      <h3 class="card-title">Enter Details</h3>
    </div>
    <!-- /.card-header -->
    <div class="card-body ">
    
        <div class="row">
          <div class="col-sm-12">
            <!-- text input -->
            <div class="form-group">
              <label>Enter State</label>
                <input id="state" type="text" runat="server" class="form-control" placeholder="Enter State" />
              <asp:HiddenField ID="sid" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="state" runat="server"  ErrorMessage="Enter State Name" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid State Name(Only Alphabets are allowed)" ControlToValidate="state" ValidationExpression="^[a-zA-Z]{1,28}$"></asp:RegularExpressionValidator>
            </div>
          </div>
       </div>
    

      <%--<asp:ValidationSummary ID="ValidationSummary1" Class="m-2 text-justify" runat="server" />--%>
      <div class="row">
            <!-- Button -->
          <div class="col-sm-4 mt-1">
            <div class="form-group">
              <asp:Button ID="Save" runat="server" Text="Save" CssClass="btn btn-block btn-primary font-weight-bold"/>
            </div>
          </div>
           <div class="col-sm-4 mt-1">
            <div class="form-group">
              <asp:Button ID="New" runat="server" Text="New" CssClass="btn btn-block btn-primary font-weight-bold" CausesValidation="False" />
            </div>
          </div>
          
      </div>
        
        
      </div>
    </div>
 
     <//section>
    <script type="text/javascript">
    function WebForm_OnSubmit() {
        if (typeof (ValidatorOnSubmit) == "function" && ValidatorOnSubmit() == false) {
            for (var i in Page_Validators) {
                try {
                    var control = document.getElementById(Page_Validators[i].controltovalidate);
                    if (!Page_Validators[i].isvalid) {
                        control.className = "form-control is-invalid";
                    } else {
                        control.className = "form-control ";
                    }
                } catch (e) { }
            }
            return false;
        }
        return true;
    }
</script>
  <!-- /.card -->

  
  <%-- Data Table [Start] --%>
  <%--Card Title--%>

<div class="card card-secondary col-sm-8 mt-2 ">
            
  <!-- /.card-header -->
  <div class="card-header">
      <h3 class="card-title">State Details </h3>
  </div>

  <!-- /.card-body -->
  <div class="card-body ">
      <div id="example1_wrapper" class="dataTables_wrapper dt-bootstrap4">
          <div class="row">
           
          </div>
      </div>
  

        <asp:GridView ID="state_Master" runat="server" CssClass="table table-bordered  table-striped mt-2 col-sm-12" AutoGenerateColumns="False" DataKeyNames="state_id" DataSourceID="SqlDataSource2" ShowHeaderWhenEmpty="true" >
            <Columns>
                <asp:BoundField DataField="state_id" HeaderText="ID" ReadOnly="True" SortExpression="state_id" InsertVisible="False"></asp:BoundField>
    <asp:BoundField DataField="state_name" HeaderText="State Name" SortExpression="state_name"></asp:BoundField>
                 <asp:TemplateField HeaderText="City">
                                 <ItemTemplate>
                                     <asp:ImageButton ID="btncity" runat="server" ImageUrl="dist/img/Icons/sub_icon.png" Width="25px" CommandName="add_city" CommandArgument='<%# Eval("state_id") %>' CausesValidation="False" />
                                 </ItemTemplate>
                             </asp:TemplateField>
                <asp:TemplateField HeaderText="Action">
                   <ItemTemplate>
                    <%-- Delete Button [Start] --%>
              <asp:TemplateField HeaderText="Action">
                  <ItemTemplate>
                    <asp:Button Text="Delete" runat="server" CssClass="btn btn-danger" CommandName="Delete1" CausesValidation="false" OnClientClick="javascrip: return confirm('Do You Want To Delete it');" state_id="delete1" CommandArgument='<%# Eval("state_id") %>' />
                  </ItemTemplate>
              
              <%-- Delete Button [End] --%>


                     <%--Edit button--%>
                    <asp:Button runat="server" state_id="btnedit" CssClass="btn btn-primary"  Text="Edit" CommandArgument='<% # Eval("state_id") %>' CommandName="Edit1" CauseValidation="false" Tooltip="Edit User" OnClick="btnedit_Click" CausesValidation="False"></asp:Button>
                   </ItemTemplate>
                 </asp:TemplateField>
              <%--Edit [end]--%>
                
                
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:Data_stu6ConnectionString %>' DeleteCommand="DELETE FROM [states_master] WHERE [state_id] = @state_id " InsertCommand="INSERT INTO [states_master] ([state_name]) VALUES (@state_name)" SelectCommand="SELECT * FROM [states_master]" UpdateCommand="UPDATE [states_master] SET [state_name] = @state_name WHERE [state_id] = @state_id" OldValuesParameterFormatString="original_{0}">
        <DeleteParameters>
            <asp:Parameter Name="state_id" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="state_name" Type="String"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="state_name" Type="String"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="state_name" Type="String"></asp:Parameter>
            <asp:Parameter Name="state_id" Type="Int32"></asp:Parameter>
           
        </UpdateParameters>
        </asp:SqlDataSource>
    </div>

    </div>
              </ContentTemplate>
        </asp:UpdatePanel>

  </div>

  </div>
  <%-- Data Table [End] --%>


  <!-- REQUIRED SCRIPTS -->
<script>
   function BindControls() {
        Sys.Application.add_init(function () {
                    $("#ContentPlaceHolder1_state_Master").DataTable({
                       "responsive": true, "lengthChange": false, "iDisplayLength": 5, "autoWidth": false, "buttons": ["copy", "csv", "excel", "pdf", "print"]
                    }).buttons().container().appendTo('#ContentPlaceHolder1_state_Master_wrapper .col-md-6:eq(0)');
    
        });
    }

    var req = Sys.WebForms.PageRequestManager.getInstance();
    if (req != null) {

        req.add_endRequest(function () {
            BindControls();
        });
    }

    $(document).ready(function () {

        BindControls();
    });



</script>

    <!-- jQuery -->
    <script src="plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- bs-custom-file-input -->
    <script src="plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
    <!-- AdminLTE App -->
    <script src="dist/js/adminlte.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="dist/js/demo.js"></script>
    <!-- DataTables  & Plugins -->
    <script src="plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
    <script src="plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
    <script src="plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
    <script src="plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
    <script src="plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
    <script src="plugins/jszip/jszip.min.js"></script>
    <script src="plugins/pdfmake/pdfmake.min.js"></script>
    <script src="plugins/pdfmake/vfs_fonts.js"></script>
    <script src="plugins/datatables-buttons/js/buttons.html5.min.js"></script>
    <script src="plugins/datatables-buttons/js/buttons.print.min.js"></script>
    <script src="plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
    <!-- AdminLTE App -->
    <script src="dist/js/adminlte.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="dist/js/demo.js"></script>
    <!-- Page specific script -->
    <script>
    //$(function () {
    //  bsCustomFileInput.init();
    //  });

  
  //  $(function () {
  //  $("#ContentPlaceHolder1_state_Master").DataTable({
  //    "responsive": true, "lengthChange": false, "autoWidth": true, "paging": true, "searching": true, "ordering": true, "info": true,
  //    "buttons": ["copy", "csv", "excel", "pdf", "print"]
  //  }).buttons().container().appendTo('#ContentPlaceHolder1_state_Master_wrapper .col-md-6:eq(0)');
  
  //});
    </script>
 
  <script>
      function showDisplay() {
          alert("State is already created");
      }
  </script>
</asp:Content>

