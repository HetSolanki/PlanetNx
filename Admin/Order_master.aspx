<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="false" CodeFile="Order_master.aspx.vb" Inherits="Admin_Order_master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Order Master</title>

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
        <asp:PostBackTrigger ControlId ="filter" />
    </Triggers>


    <ContentTemplate>


            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1>Order Master</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="Home_Page.aspx">Home</a></li>
                                    <li class="breadcrumb-item active">Order Master</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <!-- /.container-fluid -->
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
                                            <div class="col-sm-4">
                                                <!-- text input -->
                                                <div class="form-group">
                                                    <asp:HiddenField ID="pid" runat="server" />
                                                    <label>Order ID</label>
                                                    <input id="oid" runat="server" type="text" class="form-control" placeholder="Order id" />

                                                  <%--  <asp:RequiredFieldValidator ID="user" runat="server" ControlToValidate="pname"    ErrorMessage="Enter Valid Product Name" Display="Dynamic" ForeColor="#FF9933"></asp:RequiredFieldValidator>

                                                    <asp:RegularExpressionValidator ID="RegExValid1" runat="server" ErrorMessage="<br>Invalid Username (Spaces and special characters except '_' and '.' are not allowed and these characters shouldn't be the starting or ending characters plus they can't be next to each other and the username should have 6-18 characters)" ControlToValidate="pname"
                                                        ValidationExpression="^[A-Za-z\s]+$"   ForeColor="#FF9933" Display="Dynamic" ></asp:RegularExpressionValidator>--%>
                                                </div>
                                            </div>


                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label>Order Status</label>
                                                    <asp:DropDownList ID="odrstatus" runat="server" class="form-control" AutoPostBack="True" >
                                                        <asp:ListItem Text="Ordered"  />
                                                        <asp:ListItem Text="Dispached"  />
                                                        <asp:ListItem Text="Delivered"  />
                                                    </asp:DropDownList>
                                                    <%--  <asp:RequiredFieldValidator ID="skureq" runat="server" ForeColor="#FF9933" ControlToValidate="txtsku" ErrorMessage="Enter SKU Code" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtsku" ErrorMessage="Enter valid SKU Code(Only Numbers are allowed and it must have 6 digits)" ValidationExpression="^\d{6}$" Display="Dynamic" ForeColor="#FF9933"></asp:RegularExpressionValidator>--%>
                                                </div>
                                            </div>



                                           <%-- <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label>Date Added</label>
                                                    <input type="date" class="form-control" id="adddate"  runat="server">
                                                   <%-- <asp:RequiredFieldValidator ID="desce" runat="server" ControlToValidate="txtpdesc" ErrorMessage="Enter Product Description" Display="Dynamic" ForeColor="#FF9933"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="REValphaOnly" runat="server" ErrorMessage="Enter valid product Description" ControlToValidate="txtpdesc" ValidationExpression="^[a-zA-Z0-9\s]+$" Display="Dynamic" ForeColor="#FF9933"></asp:RegularExpressionValidator>--%>

                                                <%--</div>
                                            </div>--%>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label>Customer</label>
                                                    <br />
                                                    <asp:DropDownList ID="typecustom" runat="server" class="form-control" AutoPostBack="false">
                                                    </asp:DropDownList>                                                 
                                                </div>
                                            </div>




                                            <div class="col-sm-4 mt-2" style="display: block; padding-top: 23px; margin-left:347px">
                                                <div class="form-group">

                                                    <asp:Button Text="Filter" runat="server" ID="filter" CssClass="btn btn-inline-block col-sm-5 btn-primary font-weight-bold ml-2" />


                                                    <asp:Button Text="Clear" runat="server" ID="reset" CssClass="btn btn-inline-block  col-sm-5 btn-primary font-weight-bold ml-4"  />                                                                                                      

                                                </div>
                                            </div>                                            

                                        </div>
                                    </div>
                                    <!-- /.card-body -->
                                </div>
                                <!-- /.card -->
                            </div>
                            <!--/.col (left) -->

</section>



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
                                                            <h3 class="card-title">Order Master</h3>
                                                        </div>
                                                 
                                                        <div class="card-body">
                                                            <table id="example1" class="table table-bordered table-hover">
                                                                <asp:GridView ID="order_table" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" class="table table-bordered table-hover">
                                                                    <Columns>
                                                                        <asp:BoundField DataField="id" HeaderText="Id" ReadOnly="True" InsertVisible="False" SortExpression="id"></asp:BoundField>
                                                                        <asp:BoundField DataField="uid" HeaderText="User id" SortExpression="uid"></asp:BoundField>
                                                                        <asp:BoundField DataField="Order_date" HeaderText="Order date" SortExpression="Order_date"></asp:BoundField> 
                                                                        <asp:BoundField DataField="assign_to_db" HeaderText="Assign to Delivery Boy" SortExpression="assign_to_db"></asp:BoundField>
                                                                        <asp:BoundField DataField="Payment_Method" HeaderText="Payment Method" SortExpression="Payment_Method"></asp:BoundField>
                                                                        <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status"></asp:BoundField>
                                                                        <asp:TemplateField HeaderText="Action">
                                                                            <ItemTemplate>
                                                                                <asp:ImageButton ID="btnview" runat="server" ImageUrl="dist/img/Icons/eye%20(1).png" CommandName="goview" CommandArgument='<%# Eval("id") %>' CausesValidation="False" Width="30px" Height="30px" />

                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>

                                                                </asp:GridView>



                                                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:data_stu6ConnectionString %>' SelectCommand="SELECT [id], [uid], [Order_date], [assign_to_db], [Payment_Method], [status], [pid], [Quantity] FROM [Order_Table] ORDER BY [Order_date]"></asp:SqlDataSource>
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

        </ContentTemplate>
    </asp:UpdatePanel>
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
//   $(function () {
//  bsCustomFileInput.init();
//});
    </script>
    <script>
    function BindControls() {
        Sys.Application.add_init(function () {
    $("#ContentPlaceHolder1_order_table").DataTable({
        "responsive": true, "lengthChange": false, "autoWidth": true, "paging": true, "searching": true, "iDisplayLength": 5,"ordering": true, "info": true,
      "buttons": ["copy", "csv", "excel", "pdf", "print"]
    }).buttons().container().appendTo('#ContentPlaceHolder1_order_table_wrapper .col-md-6:eq(0)');
  
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

</asp:Content>

