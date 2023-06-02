<%@ Page Title="" Language="VB" MasterPageFile="Admin.master" AutoEventWireup="false" CodeFile="Assign_Role_Master.aspx.vb" Inherits="Admin_Assign_Role_Master" %>

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


    <style>
      .cb label
{
    margin-left: 10px;
}
    </style>

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
        <%--<asp:PostBackTrigger ControlId ="Save" />--%>
    </Triggers>


    <ContentTemplate>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>Assign Role Master</h1>
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
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
                <div class="card-header">
                  <h3 class="card-title">Enter Details</h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                    <div class="row">
                      <div class="col-sm-12">
                        <!-- text input -->
                        <div class="form-group">
                          <label>Select Role</label>
                            <asp:DropDownList ID="roledrop" runat="server" class="form-control" AutoPostBack="true" DataSourceID="SqlDataSource4" DataTextField="role_name" DataValueField="role_id">
                            </asp:DropDownList>
                            <br />
                            <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:data_stu6ConnectionString %>' SelectCommand="SELECT [role_id], [role_name] FROM [role_master] ORDER BY [role_name]"></asp:SqlDataSource>


                            <div class="checkbox checkbox-primary">

                            <label>Select Menu</label>
                            <asp:CheckBoxList ID="menucheck" runat="server" DataSourceID="SqlDataSource3" CssClass="cb" DataTextField="menu_name"  DataValueField="menu_id" RepeatLayout="Table" RepeatColumns="2" BorderStyle="None" CellSpacing="-1">
                            </asp:CheckBoxList>

                               
                            <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:data_stu6ConnectionString %>' SelectCommand="SELECT [menu_name], [menu_id] FROM [menu_master] ORDER BY [menu_name]"></asp:SqlDataSource>
                            </div>

                            <asp:HiddenField ID="ar_id" runat="server" />
                        </div>
                      </div>

                        
                             <asp:HiddenField ID="role_id" runat="server" />
                        <div class="col-sm-4 mt-2" style="display: block">
                        <div class="form-group">
                          <asp:Button Text="Save" runat="server" id="Save" CssClass="btn btn-block btn-primary font-weight-bold" CausesValidation="false"/>
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
              <div class="card-header">
                <h3 class="card-title">Assign Role Master

</h3>
              
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                 <table id="example1" class="table table-bordered table-hover">
                    
                     <asp:GridView ID="role_master" runat="server" CssClass="table table-bordered table-hover" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="id" ShowHeaderWhenEmpty="true" ConflictDetection="CompareAllValues">

                         <Columns>
                             <asp:BoundField DataField="id" HeaderText="Id" Visible="true" InsertVisible="False" SortExpression="id" ReadOnly="True"></asp:BoundField>
                             <asp:BoundField DataField="role_id" HeaderText="Role Id" SortExpression="role_id"></asp:BoundField>
                             <asp:BoundField DataField="role_name" HeaderText="Role Name" SortExpression="role_name"></asp:BoundField>
                             <%--Edit [end]--%>
                             <asp:BoundField DataField="menu_id" HeaderText="Menu Id" SortExpression="menu_id"></asp:BoundField>
                             <asp:BoundField DataField="menu_name" HeaderText="Menu Name" SortExpression="menu_name"></asp:BoundField>
                             <asp:BoundField DataField="menu_url" HeaderText="Menu URL" SortExpression="menu_url"></asp:BoundField>
                             <asp:BoundField DataField="menu_allowed" HeaderText="Menu Allowed" SortExpression="menu_allowed"></asp:BoundField>
                        </Columns>
                     </asp:GridView>
                     <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Data_stu6ConnectionString %>' OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Assign_Role] WHERE ([role_id] = @role_id2)" DeleteCommand="DELETE FROM [Assign_Role] WHERE [id] = @original_id" InsertCommand="INSERT INTO [Assign_Role] ([role_id], [role_name], [menu_id], [menu_name], [menu_url], [menu_allowed], [className]) VALUES (@role_id, @role_name, @menu_id, @menu_name, @menu_url, @menu_allowed, @className)" UpdateCommand="UPDATE [Assign_Role] SET [role_id] = @role_id, [role_name] = @role_name, [menu_id] = @menu_id, [menu_name] = @menu_name, [className] = [@className], [menu_url] = @menu_url, [menu_allowed] = @menu_allowed WHERE [id] = @original_id">
                         <DeleteParameters>
                             <asp:Parameter Name="original_id" Type="Int32"></asp:Parameter>
                         </DeleteParameters>

                         <InsertParameters>
                             <asp:Parameter Name="role_id" Type="Int32"></asp:Parameter>
                             <asp:Parameter Name="role_name" Type="String"></asp:Parameter>
                             <asp:Parameter Name="menu_id" Type="Int32"></asp:Parameter>
                             <asp:Parameter Name="menu_name" Type="String"></asp:Parameter>
                             <asp:Parameter Name="menu_url" Type="String"></asp:Parameter>
                             <asp:Parameter Name="menu_allowed" Type="String"></asp:Parameter>
                             <asp:Parameter Name="className" Type="String"></asp:Parameter>
                         </InsertParameters>

                         <SelectParameters>
                             <asp:ControlParameter ControlID="roledrop" PropertyName="SelectedValue" DefaultValue="0" Name="role_id2" Type="Int32"></asp:ControlParameter>
                         </SelectParameters>

                         <UpdateParameters>
                             <asp:Parameter Name="role_id" Type="Int32"></asp:Parameter>
                             <asp:Parameter Name="role_name" Type="String"></asp:Parameter>
                             <asp:Parameter Name="menu_id" Type="Int32"></asp:Parameter>
                             <asp:Parameter Name="menu_name" Type="String"></asp:Parameter>
                             <asp:Parameter Name="menu_url" Type="String"></asp:Parameter>
                             <asp:Parameter Name="menu_allowed" Type="String"></asp:Parameter>
                             <asp:Parameter Name="className" Type="String"></asp:Parameter>
                             <asp:Parameter Name="original_id" Type="Int32"></asp:Parameter>
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
    <div>

    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
        <ProgressTemplate>
            <asp:Image ID="image1" runat="server" Height="100px" style="position:relative;z-index:3;margin-top:-700px;margin-left:920px" Width="100px" ImageUrl="~/img/load.gif"></asp:Image>
        </ProgressTemplate>
    </asp:UpdateProgress>

    </div>

    <script>
          function BindControls() {
             Sys.Application.add_init(function () {
                 $("#ContentPlaceHolder1_role_master").DataTable({
                     "responsive": true, "lengthChange": false, "autoWidth": true, "paging": true, "searching": true, "iDisplayLength": 5, "ordering": true, "info": true,
                     "buttons": ["copy", "csv", "excel", "pdf", "print"]
                 }).buttons().container().appendTo('#ContentPlaceHolder1_role_master_wrapper .col-md-6:eq(0)');

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

       

       



</script>

     <script>
      function showDisplay() {
          alert("Role is already created");
      }
  </script>

</asp:Content>

