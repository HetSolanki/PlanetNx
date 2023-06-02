<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="false" CodeFile="Delivery.aspx.vb" Inherits="Admin_Delivery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
       <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Delivery Boy Master</title>

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
            <asp:ScriptReference Path="plugins/jquery/jquery.min.js" />
            <asp:ScriptReference Path="plugins/bootstrap/js/bootstrap.bundle.min.js" />
            <asp:ScriptReference Path="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js" />
            <asp:ScriptReference Path="dist/js/adminlte.js" />
            <asp:ScriptReference Path="plugins/jquery-mousewheel/jquery.mousewheel.js" />
            <asp:ScriptReference Path="plugins/raphael/raphael.min.js" />
            <asp:ScriptReference Path="plugins/jquery-mapael/jquery.mapael.min.js" />
            <asp:ScriptReference Path="plugins/jquery-mapael/maps/usa_states.min.js" />
            <asp:ScriptReference Path="plugins/chart.js/Chart.min.js" />
            <asp:ScriptReference Path="dist/js/demo.js" />
            <asp:ScriptReference Path="dist/js/pages/dashboard2.js" />
        </Scripts>
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="Save" />
        </Triggers>
        <ContentTemplate>
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <h1>Delivery Boy Master</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="Home_Page.aspx">Home</a></li>
                                    <li class="breadcrumb-item active">Delivery Boy Master</li>
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
                                                <div class="form-group">
                                                    <asp:HiddenField ID="id" runat="server" />
                                                    <label>Select Username</label>
                                                    <br />
                                                    <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="u_name" DataValueField="id">
                                                    </asp:DropDownList>                                                 
                                                </div>
                                            </div>
                                            
                                            
                                            
                                            <div class="col-sm-4">
                                                <!-- text input -->
                                                <div class="form-group">
                                                    <label>Name</label>
                                                    <input id="dname" runat="server" type="text" class="form-control" placeholder="Enter Delivery Boy Name" />

                                                    <asp:RequiredFieldValidator ID="rerquler1" runat="server" ControlToValidate="dname"    ErrorMessage="Enter Valid Name" Display="Dynamic" ForeColor="#FF9933"></asp:RequiredFieldValidator>

                                                    <asp:RegularExpressionValidator ID="RegExValid1" runat="server" ErrorMessage="<br>Invalid Username " ControlToValidate="dname"
                                                        ValidationExpression="^[A-Za-z\s]+$"   ForeColor="#FF9933" Display="Dynamic" ></asp:RegularExpressionValidator>
                                                </div>
                                            </div>

                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label>Phone Number</label>
                                                    <input id="phnno" runat="server" type="text" class="form-control" placeholder="Enter Valid Phone Number" />
                                                    <asp:RequiredFieldValidator ID="mobreq" runat="server" ForeColor="#FF9933" ControlToValidate="phnno" ErrorMessage="Enter Mobile Number" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="phnno" ErrorMessage="Enter valid Mobile Number(Only Numbers are allowed and it must have 10 digits)" ValidationExpression="^\d{10}$" Display="Dynamic" ForeColor="#FF9933"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>

                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input id="email" runat="server" type="text" class="form-control" placeholder="Enter Valid Email" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="email" runat="server" ErrorMessage="Enter Email ID" Display="Dynamic" ForeColor="#FF9933"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Enter Valid Email id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="email" Display="Dynamic" ForeColor="#FF9933"></asp:RegularExpressionValidator>

                                                </div>
                                            </div>

                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label>Vehicle Number</label>
                                                    <input id="vehicleno" runat="server" type="text" class="form-control" placeholder="Enter Valid Vehicle Number" />

                                  <asp:RequiredFieldValidator ID="desce" runat="server" ControlToValidate="vehicleno" ErrorMessage="Enter Vehicle" Display="Dynamic" ForeColor="#FF9933"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="REValphaOnly" runat="server" ErrorMessage="Enter valid Vehicle Number in Formate [GJ 11 AA 9999] " ControlToValidate="vehicleno" ValidationExpression="^[A-Z]{2}[ -][0-9]{1,2}(?: [A-Z])?(?: [A-Z]*)? [0-9]{4}$" Display="Dynamic" ForeColor="#FF9933"></asp:RegularExpressionValidator>

                                                </div>
                                            </div>

                                             <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label>Address</label>
                                                    <input id="address" runat="server" type="text" class="form-control" placeholder="Enter Valid Address" />

                                  <asp:RequiredFieldValidator ID="d1" runat="server" ControlToValidate="address" ErrorMessage="Enter Address " Display="Dynamic" ForeColor="#FF9933"></asp:RequiredFieldValidator>
                                                   
                                                </div>
                                            </div>


                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label>Select Status</label>
                                                    <br />
                                                    <asp:DropDownList ID="status" runat="server" class="form-control" AutoPostBack="True" >
                                                        
                               <asp:ListItem>Enabled</asp:ListItem>
                               <asp:ListItem>Disabled</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>

                                       
                                             <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label>Select Vehicle</label></br>
                                                    <asp:DropDownList ID="vehicletype" runat="server" class="form-control" AutoPostBack="True">
                                                         <asp:ListItem>Bike</asp:ListItem>
                                                         <asp:ListItem>Car</asp:ListItem>                                                   
                                                    </asp:DropDownList>

                                                </div>
                                            </div>
                                            <br>                                                                                                      
                                            <div class="col-sm-4 mt-2" style="display: block;padding-top:23px">
                                                <div class="form-group">
                                                    

                                                    <asp:Button Text="New" runat="server" ID="reset" CssClass="btn btn-inline-block col-sm-5 btn-primary font-weight-bold ml-2" CausesValidation="false" />                                                                                              
                                                  
                                                    <asp:Button Text="Save" runat="server" ID="Save" CssClass="btn btn-inline-block col-sm-5 btn-primary font-weight-bold ml-4" CausesValidation="true" />   
                                                    
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
                                                            <h3 class="card-title">Delivery Boy Master</h3>
                                                        </div>
                                                        <!-- /.card-header -->
                                                        <div class="card-body">
                                                            <table id="example1" class="table table-bordered table-hover">
                                                                <asp:GridView ID="Delivery" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="table table-bordered table-hover" ShowHeaderWhenEmpty="true" DataKeyNames="id">
                                                                    <Columns>
                                                                        <asp:BoundField DataField="id" HeaderText="Id" SortExpression="id" InsertVisible="true" ReadOnly="True"></asp:BoundField>
                                                                        <asp:BoundField DataField="u_name" HeaderText="Username" SortExpression="u_name"></asp:BoundField>
                                                                        <asp:BoundField DataField="d_name" HeaderText="Name" SortExpression="d_name"></asp:BoundField>
                                                                        <asp:BoundField DataField="phn_no" HeaderText="Mobile No." SortExpression="phn_no"></asp:BoundField>
                                                                        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email"></asp:BoundField>
                                                                        <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address"></asp:BoundField>
                                                                        <asp:BoundField DataField="vehicle_no" HeaderText="Vehicle No." SortExpression="vehicle_no"></asp:BoundField>
                                                                        <asp:BoundField DataField="vehicle_type" HeaderText="Vehicle Type" SortExpression="vehicle_type"></asp:BoundField>
                                                                        <asp:BoundField DataField="d_status" HeaderText="Status" SortExpression="d_status"></asp:BoundField>

                                                                          <asp:TemplateField HeaderText="Action" ControlStyle-Width="100px">
                                                                            <ItemTemplate>
                                                                                <%-- Delete Button [Start] --%>
                                                                                <asp:TemplateField HeaderText="Action">
                                                                                    <itemtemplate>
                            <asp:Button Text="Delete" runat="server" CssClass="btn btn-danger font-weight-bold" CommandName="Delete1" CausesValidation="false" OnClientClick="javascript: return confirm('Do You Want To Delete it');" ID="delete1" CommandArgument='<%# Eval("id") %>' />
                          </itemtemplate>
                                                                                </asp:TemplateField>
                                                                                <%-- Delete Button [End] --%>                                                                                
                                                                                <%--Edit button--%>
                                                                           <asp:TemplateField HeaderText="Action">
                                                                                    <itemtemplate>
                                                 <asp:Button runat="server" ID="btnedit" CssClass="btn btn-primary font-weight-bold" Text="Edit" CommandArgument='<%# Eval("id") %>' CommandName="Edit1" CauseValidation="false" Tooltip="Edit User" OnClick="btnedit_Click" CausesValidation="False"></asp:Button>
                                             </itemtemplate>
                                                                                </asp:TemplateField>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <%--Edit [end]--%>

                                                                    </Columns>
                                                                </asp:GridView>

                                                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:data_stu6ConnectionString %>' SelectCommand="SELECT * FROM [delivery_master] ORDER BY [id]" DeleteCommand="DELETE FROM [delivery_master] WHERE [id] = @id" InsertCommand="INSERT INTO [delivery_master] ([u_name], [d_name], [phn_no], [email], [vehicle_no], [address], [d_status], [vehicle_type]) VALUES (@u_name, @d_name, @phn_no, @email, @vehicle_no, @address, @d_status, @vehicle_type)" UpdateCommand="UPDATE [delivery_master] SET  [d_name] = @d_name, [phn_no] = @phn_no, [email] = @email, [vehicle_no] = @vehicle_no, [address] = @address, [d_status] = @d_status, [vehicle_type] = @vehicle_type WHERE [id] = @id ">
                                                                    <DeleteParameters>
                                                                        <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
                                                                    </DeleteParameters>
                                                                    <InsertParameters>
                                                                        <asp:Parameter Name="u_name" Type="String"></asp:Parameter>
                                                                        <asp:Parameter Name="d_name" Type="String"></asp:Parameter>
                                                                        <asp:Parameter Name="phn_no" Type="Int32"></asp:Parameter>
                                                                        <asp:Parameter Name="email" Type="String"></asp:Parameter>
                                                                        <asp:Parameter Name="vehicle_no" Type="String"></asp:Parameter>
                                                                        <asp:Parameter Name="address" Type="String"></asp:Parameter>
                                                                        <asp:Parameter Name="d_status" Type="String"></asp:Parameter>
                                                                        <asp:Parameter Name="vehicle_type" Type="String"></asp:Parameter>
                                                                    </InsertParameters>
                                                                    <UpdateParameters>
                                                                        <asp:Parameter Name="u_name" Type="String"></asp:Parameter>
                                                                        <asp:Parameter Name="d_name" Type="String"></asp:Parameter>
                                                                        <asp:Parameter Name="phn_no" Type="Int32"></asp:Parameter>
                                                                        <asp:Parameter Name="email" Type="String"></asp:Parameter>
                                                                        <asp:Parameter Name="vehicle_no" Type="String"></asp:Parameter>
                                                                        <asp:Parameter Name="address" Type="String"></asp:Parameter>
                                                                        <asp:Parameter Name="d_status" Type="String"></asp:Parameter>
                                                                        <asp:Parameter Name="vehicle_type" Type="String"></asp:Parameter>
                                                                        <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
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
            </div>
            <!-- /.container-fluid -->
            <!-- /.content -->
           
    <!-- /.content-wrapper -->
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
    $("#ContentPlaceHolder1_Delivery").DataTable({
        "responsive": true, "lengthChange": false, "autoWidth": true, "paging": true, "searching": true, "iDisplayLength": 5,"ordering": true, "info": true,
      "buttons": ["copy", "csv", "excel", "pdf", "print"]
    }).buttons().container().appendTo('#ContentPlaceHolder1_Delivery_wrapper .col-md-6:eq(0)');
  
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
 
    <script>
      function showDisplay() {
          alert("Product already created");
      }
    </script>

</asp:Content>

