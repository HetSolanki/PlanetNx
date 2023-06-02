<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="false" CodeFile="coupon_master.aspx.vb" Inherits="Admin_coupon_master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    
   <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">


    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/adminlte.min.css">


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
              <h1>Coupon Master</h1>
            </div>
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="Home_Page.aspx">Home</a></li>
                <li class="breadcrumb-item active">Coupon</li>
              </ol>
            </div>
          </div>
        </div><!-- /.container-fluid -->
      </section>

      <!-- Main content -->
      <section class="content">
        <div class="container-fluid">
          <div class="row">
            <!-- left column -->
            <div class="col-md-12">
              <!-- general form elements -->
              <div class="card card-default">
                <div class="card-header  bg-secondary">
                  <h3 class="card-title">Enter Details</h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                    <div class="row">
                      <div class="col-sm-3">
                        <!-- text input -->
                        <div class="form-group">
                          <label>Coupon Name</label>
                          <input id="cname" runat="server" type="text" class="form-control" placeholder="Enter Coupon name" />
                            <asp:HiddenField ID="cid" runat="server" />
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="cname" runat="server"  ErrorMessage="Enter Coupon Name" Display="Dynamic"></asp:RequiredFieldValidator>
                             <asp:RegularExpressionValidator ID="REValphaOnly" runat="server" ErrorMessage="Enter valid Coupon Name" ControlToValidate="cname" ValidationExpression="^[a-zA-Z0-9\s]+$" Display="Dynamic" ForeColor="#FF9933"></asp:RegularExpressionValidator>           
                        </div>
                      </div>

                      <div class="col-sm-3">
                        <div class="form-group">
                          <label>Code</label>
                          <input id="code" runat="server" type="text" class="form-control" placeholder="Enter Code" maxlength="10" />
                            <asp:RequiredFieldValidator ID="skureq" runat="server" ForeColor="#FF9933" ControlToValidate="code" ErrorMessage="Enter code" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter valid Code" ControlToValidate="code" ValidationExpression="^[a-zA-Z0-9\s]+$" Display="Dynamic" ForeColor="#FF9933"></asp:RegularExpressionValidator>
                        </div>
                      </div>

                        
                      <div class="col-sm-3">
                        <div class="form-group">
                          <label>Discount</label>
                          <input id="discount" runat="server" type="text" class="form-control" placeholder="Enter Discount in Ammount" maxlength="4" />
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="discount" ForeColor="#FF9933" ErrorMessage="Enter Discount" Display="Dynamic"></asp:RequiredFieldValidator>
                                       <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="discount" ForeColor="#FF9933" ErrorMessage="Enter Valid Discount" ValidationExpression="^\d+$"   Display="Dynamic"></asp:RegularExpressionValidator>          
                            </div>
                      </div>


                        <div class="col-sm-3">
                            <div class="form-group">
                                <label>Start Date</label>
                                 <input type="date" class="form-control" id="sdate"  runat="server">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="sdate" runat="server" ErrorMessage="Enter Start Date" Display="Dynamic"></asp:RequiredFieldValidator>
                            
                            </div>
                      </div>

                      <div class="col-sm-3">
                        <div class="form-group">
                          <label>End Date</label>
                         <input type="date" class="form-control" id="edate"  runat="server">
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="edate" runat="server" ErrorMessage="Enter End Date" Display="Dynamic"></asp:RequiredFieldValidator>

                        </div>
                      </div>

                      <div class="col-sm-3">
                        <div class="form-group">
                          <label>Uses Per Coupon</label>
                          <input id="u_per_coupon" runat="server" type="text" class="form-control" placeholder="Enter Uses per Coupon" maxlength="3" />
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="#FF9933" ControlToValidate="u_per_coupon" ErrorMessage="Enter Uses Per Coupon" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="u_per_coupon" ErrorMessage="Enter valid Uses Per Coupon" ValidationExpression="^\d+$" Display="Dynamic" ForeColor="#FF9933"></asp:RegularExpressionValidator> 
                        </div>
                      </div>

                           <div class="col-sm-3" style="display:block;">
                        <div class="form-group">
                          <label>Status</label>
                           <asp:DropDownList ID="status" runat="server" class="form-control" AutoPostBack="True" >

                               <asp:ListItem>Enabled</asp:ListItem>
                               <asp:ListItem>Disabled</asp:ListItem>
                           </asp:DropDownList>

                        </div>
                      </div>
                                                                                    
                            <asp:Label ID="Label1" Forecolor="red" Visible="false" runat="server" Text=""></asp:Label>
                 
                        <div class="col-md-4 mt-4" style="display: inline-block" >
                         <div class="form-group col-sm-4"  style="display: inline-block" >
                          <asp:Button Text="New" runat="server" id="new" CssClass="btn btn-block btn-primary font-weight-bold col-md-12" CausesValidation="false" />                           
                        </div>
                       
                        <div class="form-group col-sm-4" style="display: inline-block" >
                          <asp:Button Text="Save" runat="server" id="Save" CssClass="btn btn-block btn-primary font-weight-bold col-md-12" CausesValidation="true" />
                        </div> 
                      </div>
                </div>
                <!-- /.card-body -->
              </div>
              <!-- /.card -->
            </div>
            <!--/.col (left) -->

            <!-- right column -->
            <div class="col-md-12">
              <!-- Form Element sizes -->
             
                
<div class="wrapper">
  
  <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header  bg-secondary">
                <h3 class="card-title">Coupon Master</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                 <table id="coupon_table1" class="table table-bordered table-hover">
                     <asp:GridView ID="coupon_table" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="table table-bordered table-hover" DataKeyNames="cid">

                         <Columns>
                             <asp:BoundField DataField="cid" HeaderText="ID" SortExpression="cid" InsertVisible="False" ReadOnly="True"></asp:BoundField>
                             <asp:BoundField DataField="coupon_name" HeaderText="Coupon Name" SortExpression="coupon_name"></asp:BoundField>
                             <asp:BoundField DataField="coupon_code" HeaderText="Coupon Code" SortExpression="coupon_code"></asp:BoundField>
                             <asp:BoundField DataField="discount" HeaderText="Discount" SortExpression="discount"></asp:BoundField>
                             <asp:BoundField DataField="start_date" HeaderText="Start Date" SortExpression="start_date"></asp:BoundField>
                             <asp:BoundField DataField="end_date" HeaderText="End Date" SortExpression="end_date"></asp:BoundField>
                             <asp:BoundField DataField="uses_per_coupon" HeaderText="Uses Per Coupon" SortExpression="uses_per_coupon"></asp:BoundField>
                             <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status"></asp:BoundField>

                                <asp:TemplateField HeaderText="Action">
                                 <ItemTemplate>
                                     <%-- Delete Button [Start] --%>
                                     <asp:TemplateField HeaderText="Action">
                                         <itemtemplate>
                            <asp:Button Text="Delete" runat="server" CssClass="btn btn-danger font-weight-bold" CommandName="Delete1" CausesValidation="false" OnClientClick="javascript: return confirm('Do You Want To Delete it');" ID="delete1" CommandArgument='<%# Eval("cid") %>' />
                          </itemtemplate>
                                     </asp:TemplateField>
                                     <%-- Delete Button [End] --%>

                                     <%--Edit button--%>
                                     <asp:TemplateField HeaderText="Action">
                                         <itemtemplate>
                            <asp:Button runat="server" ID="btnedit" CssClass="btn btn-primary font-weight-bold"  Text="Edit" CommandArgument='<%# Eval("cid") %>' CommandName="Edit1" CauseValidation="false" Tooltip="Edit User" OnClick="btnedit_Click" CausesValidation="False"></asp:Button>
                             </itemtemplate>
                                     </asp:TemplateField>
                                 </ItemTemplate>
                             </asp:TemplateField>
              <%--Edit [end]--%>
                          
                         </Columns>
                     </asp:GridView>
                     <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:data_stu6ConnectionString %>' SelectCommand="SELECT [cid], [coupon_name], [coupon_code], [discount], [start_date], [end_date], [uses_per_coupon], [status] FROM [coupon_master] ORDER BY [cid]" DeleteCommand="DELETE FROM [coupon_master] WHERE [cid] = @cid" InsertCommand="INSERT INTO [coupon_master] ([coupon_name], [coupon_code], [discount], [start_date], [end_date], [uses_per_coupon], [status]) VALUES (@coupon_name, @coupon_code, @discount, @start_date, @end_date, @uses_per_coupon, @status)" UpdateCommand="UPDATE [coupon_master] SET [coupon_name] = @coupon_name, [coupon_code] = @coupon_code, [discount] = @discount, [start_date] = @start_date, [end_date] = @end_date, [uses_per_coupon] = @uses_per_coupon, [status] = @status WHERE [cid] = @cid">
                         <DeleteParameters>
                             <asp:Parameter Name="cid" Type="Int32"></asp:Parameter>
                         </DeleteParameters>
                         <InsertParameters>
                             <asp:Parameter Name="coupon_name" Type="String"></asp:Parameter>
                             <asp:Parameter Name="coupon_code" Type="String"></asp:Parameter>
                             <asp:Parameter Name="discount" Type="String"></asp:Parameter>
                             <asp:Parameter Name="start_date" Type="String"></asp:Parameter>
                             <asp:Parameter Name="end_date" Type="String"></asp:Parameter>
                             <asp:Parameter Name="uses_per_coupon" Type="String"></asp:Parameter>
                             <asp:Parameter Name="status" Type="String"></asp:Parameter>
                         </InsertParameters>
                         <UpdateParameters>
                             <asp:Parameter Name="coupon_name" Type="String"></asp:Parameter>
                             <asp:Parameter Name="coupon_code" Type="String"></asp:Parameter>
                             <asp:Parameter Name="discount" Type="String"></asp:Parameter>
                             <asp:Parameter Name="start_date" Type="String"></asp:Parameter>
                             <asp:Parameter Name="end_date" Type="String"></asp:Parameter>
                             <asp:Parameter Name="uses_per_coupon" Type="String"></asp:Parameter>
                             <asp:Parameter Name="status" Type="String"></asp:Parameter>
                             <asp:Parameter Name="cid" Type="Int32"></asp:Parameter>
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
    $("#ContentPlaceHolder1_coupon_table").DataTable({
        "responsive": true, "lengthChange": false, "autoWidth": true, "paging": true, "searching": true, "iDisplayLength": 5,"ordering": true, "info": true,
      "buttons": ["copy", "csv", "excel", "pdf", "print"]
    }).buttons().container().appendTo('#ContentPlaceHolder1_coupon_table_wrapper .col-md-6:eq(0)');
  
  });
    }

        var req = Sys.WebForms.PageRequestManager.getInstance();
    if (req != null) {

        req.add_endRequest(function () {
            BindControls()  ;
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

<%--    //$(function () {
    //  bsCustomFileInput.init();
    //  });

  
  //  $(function () {
  //  $("#ContentPlaceHolder1_User_Table").DataTable({
  //    "responsive": true, "lengthChange": false, "autoWidth": true, "iDisplayLength": 5, "paging": true, "searching": true, "ordering": true, "info": true,
  //    "buttons": ["copy", "csv", "excel", "pdf", "print"]
  //  }).buttons().container().appendTo('#ContentPlaceHolder1_User_Table_wrapper .col-md-6:eq(0)');
  
  //});--%>



</asp:Content>

