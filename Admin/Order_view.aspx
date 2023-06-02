<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="false" CodeFile="Order_view.aspx.vb" Inherits="Admin_Order_view" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Order Details</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="Home_Page.aspx">Home</a></li>
                            <li class="breadcrumb-item"><a href="Order_master.aspx">Orders</a></li>
                            <li class="breadcrumb-item active">Order</li>
                        </ol>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid  ">
                <div class="row  ">
                    <!-- left column -->
                    <div class="col-md-4">
                        <!-- general form elements -->
                        <div class="card card-default" style="height:190px">
                            <div class="card-header  bg-secondary">

                                <h3 class="card-title">
                                    <img src="dist/img/Icons/shopping-cart.png" width="19px" height="19px" />
                                    &nbsp Order Details</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <table>
                                            <tr>
                                                <td>
                                                    <img src="dist/img/Icons/id.png" width="19px" height="19px" />
                                                     &nbsp
                                                    <asp:Label ID="orderid" runat="server" Text="Order ID"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                   <img src="dist/img/Icons/timetable.png" width="19px" height="19px" />
                                                    &nbsp
                                                    <asp:Label ID="orderdate" runat="server" Text="Order date"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <img src="dist/img/Icons/shopping-cart.png" width="19px" height="19px" />
                                                    &nbsp                                       
                                                    <asp:Label ID="orderpayment" runat="server" Text="Order Payment"></asp:Label>
                                                </td>
                                            </tr>
                                            


                                        </table>

                                    </div>
                                </div>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <div class="col-md-4">
                        <!-- general form elements -->
                        <div class="card card-default" style="height:190px">
                            <div class="card-header  bg-secondary">
                                <h3 class="card-title">
                                    <img src="dist/img/Icons/customer.png" width="21px" height="21px" />
                                    &nbsp Customer Details</h3>
                            </div>

                            <!-- /.card-header -->
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <asp:HiddenField ID="u_id" runat="server" />
                                        <table>
                                            <tr>
                                                <td>
                                                  
                                                    <img src="dist/img/Icons/specialist-user.png"  width="19" height="19"/>
                                                </td>
                                                <td>
                                                    <asp:Label ID="cusname" runat="server" Text="Customer Name"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="35px">
                                                      <img src="dist/img/Icons/customer.png"  width="19px" height="19px"/>
                                                </td>
                                                <td>
                                                    <asp:Label ID="custype" runat="server" Text="Customer type"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <img src="dist/img/Icons/email.png"  width="19px" height="19px"/>
                                                </td>
                                                <td>
                                                    <asp:Label ID="email" runat="server" Text="Customer email address"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <img src="dist/img/Icons/phone.png"  width="19px" height="19px"/>
                                                </td>
                                                <td>
                                                    <asp:Label ID="cusmobileno" runat="server" Text="Customer Mobile Number"></asp:Label>
                                                </td>
                                            </tr>


                                        </table>
                                    </div>
                                </div>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <div class="col-md-4">
                        <!-- general form elements -->
                        <div class="card card-default" style="height:190px">
                            <div class="card-header  bg-secondary">
                                <h3 class="card-title">
                                    <img src="dist/img/Icons/location.png" width="21px" height="21px" />
                                    &nbsp Address</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-12">
                                            <asp:Label ID="add" runat="server" Text="Address"></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!--/.col (left) -->

                    <!-- right column -->
                    <div class="col-md-6" >
                        <!-- Form Element sizes -->


                        <div class="wrapper" >

                            <!-- Main content -->
                            <section class="content" >
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="card">
                                                <div class="card-header bg-secondary">
                                                    <h3 class="card-title">Assign To Order</h3>
                                                </div>
                                                <!-- /.card-header -->
                                                <div class="card-body">

                                                     <div class="col-sm-6"  style="display: inline-block;">
                                                <div class="form-group">
                                                    <label>Select Delivery Boy</label>
                                                    <br />
                                                    <asp:DropDownList ID="delverydrop" runat="server" class="form-control" DataSourceID="SqlDataSource1" DataTextField="u_name" DataValueField="u_name">
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:data_stu6ConnectionString %>' SelectCommand="SELECT [u_name], [id] FROM [delivery_master] ORDER BY [d_name]"></asp:SqlDataSource>
                                                </div>
                                            </div>
                                                     <div class="col-sm-4 mt-2" style="display: inline-block;padding-top:17px">
                                                <div class="form-group">
                                                                                                   

                                                    <asp:Button Text="Assign To Order" runat="server" ID="assign" CssClass="btn btn-inline-block col-sm-12 btn-primary font-weight-bold ml-4" CausesValidation="true" />   
                                                    
                                                
                                            </div>


                                        </div>
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

                      <div class="col-md-6" style="display:inline-block">
                        <!-- Form Element sizes -->


                        <div class="wrapper">

                            <!-- Main content -->
                            <section class="content">
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="card">
                                                <div class="card-header bg-secondary">
                                                    <h3 class="card-title">Order Status</h3>
                                                </div>
                                                <!-- /.card-header -->
                                                <div class="card-body">

                                                     <div class="col-sm-6"  style="display: inline-block;">
                                                <div class="form-group">
                                                    <label>Select Status</label>
                                                    <br />
                                                    <asp:DropDownList ID="statusdrop" runat="server" class="form-control" > <asp:ListItem Text="Ordered"  />
                                                        <asp:ListItem Text="Dispached"  />
                                                        <asp:ListItem Text="Delivered"  />
                                                    </asp:DropDownList>                                               
                                                </div>
                                            </div>
                                                     <div class="col-sm-4 mt-2" style="display: inline-block;padding-top:17px">
                                                <div class="form-group">
                                                                                                   

                                                    <asp:Button Text="Set Status" runat="server" ID="status" CssClass="btn btn-inline-block col-sm-12 btn-primary font-weight-bold ml-4" CausesValidation="true" />   
                                                    
                                                
                                            </div>


                                        </div>
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



    </div>
    <!-- /.container-fluid -->
    <!-- /.content -->
    <!-- /.content-wrapper -->




    <script>
        function BindControls() {
            Sys.Application.add_init(function () {
                $("#ContentPlaceHolder1_Admin_Table").DataTable({
                    "responsive": true, "lengthChange": false, "autoWidth": true, "paging": true, "searching": true, "ordering": true, "info": true,
                    "buttons": ["copy", "csv", "excel", "pdf", "print"]
                }).buttons().container().appendTo('#ContentPlaceHolder1_Admin_Table_wrapper .col-md-6:eq(0)');

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
</asp:Content>

