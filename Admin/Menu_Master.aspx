<%@ Page Title="" Language="VB" MasterPageFile="Admin.Master" AutoEventWireup="false" CodeFile="Menu_master.aspx.vb" Inherits="Menu_master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
       <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

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

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>Menu Master</h1>
           
            </div>
           
          </div>
        </div><!-- /.container-fluid -->
      </section>

      <!-- Main content -->
      <section class="content">
        <div class="container-fluid">
          <div class="row">
            <!-- left column -->
            <div class="col-md-4">
              <!-- general form elements -->
              <div class="card card-default">
                <div class="card-header bg-secondary">
                  <h3 class="card-title">Enter Details</h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                    <div class="row">
                      <div class="col-sm-12">
                        <!-- text input -->
                        <div class="form-group">
                          <label>Menu Name</label>
                          <input id="txtname"  runat="server" type="text" class="form-control" placeholder="Enter Name" />
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter name" Display="Dynamic" ControlToValidate="txtname"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter valid name" ControlToValidate="txtname" ValidationExpression="^[a-zA-Z0-9\s]+$" Display="Dynamic"></asp:RegularExpressionValidator>

                            <br />

                            <label>Menu URL</label>
                          <input id="txturl" runat="server" type="text" class="form-control" placeholder="Enter URL" />
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter URL" Display="Dynamic" ControlToValidate="txturl"></asp:RequiredFieldValidator>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter valid URL" ControlToValidate="txturl" ValidationExpression="^[a-zA-Z0-9!@#$%^&*()_+=[\]{}|\\;:',./?]+$" Display="Dynamic"></asp:RegularExpressionValidator>
                            
                            <br />
                          
                          

                        </div>
                      </div>

                        
                             <asp:HiddenField ID="menu_id" runat="server" />
                        <div class="col-sm-4 mt-2" style="display: block">
                        <div class="form-group">
                          <asp:Button Text="Save" runat="server" id="Save" CssClass="btn btn-block btn-primary font-weight-bold"/>
                        </div>
                      </div>
                     <div class="col-sm-4 mt-2" style="display: block">
                        <div class="form-group">
                          <asp:Button Text="New" runat="server" id="New" CssClass="btn btn-block btn-primary font-weight-bold" CausesValidation="False" />
                        </div>
                      </div>

                    </div>
                </div>
                <!-- /.card-body -->
              </div>
              <!-- /.card -->
            </div>
            <!--/.col (left) -->

            <!-- right column -->
            <div class="col-md-8">
              <!-- Form Element sizes -->
             
                
<div class="wrapper">
  
    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header bg-secondary">
                <h3 class="card-title">Menu Master

</h3>
              
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                 <table id="example1" class="table table-bordered table-hover">
                    
                     <asp:GridView ID="menu_master" runat="server" CssClass="table table-bordered table-hover" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="menu_id" ShowHeaderWhenEmpty="true" ConflictDetection="CompareAllValues">

                         <Columns>
                             <asp:BoundField DataField="menu_id" HeaderText="ID" Visible="true" InsertVisible="False" SortExpression="menu_id" ReadOnly="True"></asp:BoundField>
                             <asp:BoundField DataField="menu_name" HeaderText="Menu Name" SortExpression="menu_name"></asp:BoundField>
                             <asp:BoundField DataField="menu_url" HeaderText="Menu URL" SortExpression="menu_url"></asp:BoundField>                           
                             <asp:TemplateField HeaderText="Action">
                                                                            <ItemTemplate>
                                                                                <%-- Delete Button [Start] --%>
                                                                                <asp:TemplateField HeaderText="Action">
                                                                                    <itemtemplate>
                                         <asp:Button Text="Delete" runat="server" CssClass="btn btn-danger font-weight-bold" CommandName="Delete1" CausesValidation="false" OnClientClick="javascrip: return confirm('Do You Want To Delete it');" ID="delete1" CommandArgument='<%# Eval("menu_id") %>' />
                          </itemtemplate>
                                                                                </asp:TemplateField>
                                                                                <%-- Delete Button [End] --%>

                                                                                <%--Edit button [start]--%>
                                                                                <asp:TemplateField HeaderText="Action">
                                                                                    <itemtemplate>
                                                 <asp:Button runat="server" ID="btnedit" CssClass="btn btn-primary font-weight-bold" Text="Edit" CommandArgument='<%# Eval("menu_id") %>' CommandName="Edit1" CauseValidation="false" Tooltip="Edit User" OnClick="btnedit_Click" CausesValidation="False"></asp:Button>
                                             </itemtemplate>
                                                                                </asp:TemplateField>
                                                                              <%--Edit button [end]--%>
                                                                               
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                         </Columns>
                     </asp:GridView>
                     <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Data_stu6ConnectionString %>' DeleteCommand="DELETE FROM [menu_master] WHERE [menu_id] = @original_menu_id" InsertCommand="INSERT INTO [menu_master] ([menu_name], [menu_url]) VALUES (@menu_name, @menu_url)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [menu_master]" UpdateCommand="UPDATE [menu_master] SET [menu_name] = @menu_name, [menu_url] = @menu_url WHERE [menu_id] = @original_menu_id">
                         <DeleteParameters>
                             <asp:Parameter Name="original_menu_id" Type="Int32"></asp:Parameter>
                         </DeleteParameters>
                         <InsertParameters>
                             <asp:Parameter Name="menu_name" Type="String"></asp:Parameter>
                             <asp:Parameter Name="menu_url" Type="String"></asp:Parameter>
                         </InsertParameters>
                         <UpdateParameters>
                             <asp:Parameter Name="menu_name" Type="String"></asp:Parameter>
                             <asp:Parameter Name="menu_url" Type="String"></asp:Parameter>
                             <asp:Parameter Name="original_menu_id" Type="Int32"></asp:Parameter>
                         </UpdateParameters>
                     </asp:SqlDataSource>
                 </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </section>
    
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

                </div>
                <!-- ./wrapper -->
         
            </div>
            <!--/.col (right) -->

          </div>
          <!-- /.row -->
      </section>
        </div><!-- /.container-fluid -->
      <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
</ContentTemplate>
    </asp:UpdatePanel>
    

<script>
   function BindControls() {
        Sys.Application.add_init(function () {
                    $("#ContentPlaceHolder1_menu_master").DataTable({
                       "responsive": true, "lengthChange": false, "iDisplayLength": 5, "autoWidth": false, "buttons": ["copy", "csv", "excel", "pdf", "print"]
                    }).buttons().container().appendTo('#ContentPlaceHolder1_menu_master_wrapper .col-md-6:eq(0)');
    
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
  //  $("#ContentPlaceHolder1_sub_category_table").DataTable({
  //    "responsive": true, "lengthChange": false, "autoWidth": true, "paging": true, "searching": true, "ordering": true, "info": true,
  //    "buttons": ["copy", "csv", "excel", "pdf", "print"]
  //  }).buttons().container().appendTo('#ContentPlaceHolder1_sub_category_table_wrapper .col-md-6:eq(0)');
  
  //});
    </script>
     <script>
      function showDisplay() {
          alert("Menu is already added");
      }
  </script>



</asp:Content>

