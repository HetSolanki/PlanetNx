<%@ Page Title="" Language="VB" MasterPageFile="Admin.master" AutoEventWireup="false" CodeFile="Image_Master.aspx.vb" Inherits="Image_Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Product Master</title>

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
            <%--<asp:ScriptReference Path="dist/js/pages/dashboard2.js" />--%>
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
                                <h1>Product Image Master</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                                    <li class="breadcrumb-item active">General Form</li>
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
                            <div class="col-md-4">
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
                                                    <label>Select Image</label></br>
                                                    <asp:FileUpload ID="ppic" runat="server" />
                                                  <asp:HiddenField ID="imgid" runat="server" />
                                                    <br>
                                                    <asp:Label runat="server" ID="lblimg" Text=""></asp:Label>                                        
                                                </div>
                                                <asp:Label runat="server" ID="lblimage" Text="" Visible="False"></asp:Label>
                                                <br />
                                                <br />
                                                <div class="form-group">
                                                <asp:Label ID="Label1" runat="server" ForeColor="red" Text=""></asp:Label>
                                                    <asp:Button Text="Save" runat="server" ID="Save" CssClass="btn btn-block btn-primary font-weight-bold" CausesValidation="True" />
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
                                                        <div class="card-header  bg-secondary ">
                                                            <h3 class="card-title">Images Of <asp:Label ID="Lb" ForeColor="red" Visible="true" runat="server" Text=""></asp:Label>
                                                            </h3>
                                                        </div>
                                                        <!-- /.card-header -->
                                                        <div class="card-body">
                                                            <table id="example1" class="table table-bordered table-hover">   
                                                                <asp:GridView ID="Image_Table" runat="server" AutoGenerateColumns="False" DataKeyNames="imgid" DataSourceID="SqlDataSource1" class="table table-bordered table-hover" ShowHeaderWhenEmpty="true">
                                                                    <Columns>

                                                                        <asp:BoundField DataField="imgid" HeaderText="Id" ReadOnly="True" SortExpression="imgid" InsertVisible="False"></asp:BoundField>
                                                                        <asp:BoundField DataField="pid" HeaderText="Product Id" SortExpression="pid"></asp:BoundField>
                                                                        <asp:BoundField DataField="img" HeaderText="Image Name" SortExpression="img"></asp:BoundField>
                                                                       <asp:TemplateField HeaderText="Image">
                                                                            <ItemTemplate>
                                                                                <asp:Image runat="server" ID="pimg" ImageUrl='<%# "../img/shop-details/" + Eval("img") %>' Width="100px"></asp:Image>

                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>

                                                                        <asp:TemplateField HeaderText="Action">
                                                                            <ItemTemplate>
                                                                                <%-- Delete Button [Start] --%>
                                                                                <asp:TemplateField HeaderText="Action">
                                                                                    <itemtemplate>
                                         <asp:Button Text="Delete" runat="server" CssClass="btn btn-danger font-weight-bold" CommandName="Delete1" CausesValidation="false" OnClientClick="javascrip: return confirm('Do You Want To Delete it');" ID="delete1" CommandArgument='<%# Eval("imgid") %>' />
                          </itemtemplate>
                                                                                </asp:TemplateField>
                                                                                <%-- Delete Button [End] --%>

                                                                                <%--Edit button--%>
                                                                                <asp:TemplateField HeaderText="Action">
                                                                                    <itemtemplate>
                                                 <asp:Button runat="server" ID="btnedit" CssClass="btn btn-primary font-weight-bold" Text="Edit" CommandArgument='<% # Eval("imgid") %>' CommandName="Edit1" CauseValidation="false" Tooltip="Edit User" OnClick="btnedit_Click" CausesValidation="False"></asp:Button>
                                             </itemtemplate>
                                                                                </asp:TemplateField>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>


                                                                    </Columns>
                                                                </asp:GridView>

                                                                 
                                                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Data_stu6ConnectionString %>' SelectCommand="SELECT * FROM [image_master] WHERE (([pid] = @pid) AND ([pid] = @pid2))" DeleteCommand="DELETE FROM [image_master] WHERE [imgid] = @imgid" InsertCommand="INSERT INTO [image_master] ([pid], [img]) VALUES (@pid, @img)" UpdateCommand="UPDATE [image_master] SET [pid] = @pid, [img] = @img WHERE [imgid] = @imgid">
                                                                    <DeleteParameters>
                                                                        <asp:Parameter Name="imgid" Type="Int32"></asp:Parameter>
                                                                    </DeleteParameters>
                                                                    <InsertParameters>
                                                                        <asp:Parameter Name="pid" Type="Int32"></asp:Parameter>
                                                                        <asp:Parameter Name="img" Type="String"></asp:Parameter>
                                                                    </InsertParameters>
                                                                    <SelectParameters>
                                                                        <asp:SessionParameter SessionField="pid" DefaultValue="0" Name="pid" Type="Int32"></asp:SessionParameter>
                                                                        <asp:SessionParameter SessionField="pid" DefaultValue="0" Name="pid2" Type="Int32"></asp:SessionParameter>
                                                                    </SelectParameters>

                                                                    <UpdateParameters>
                                                                        <asp:Parameter Name="pid" Type="Int32"></asp:Parameter>
                                                                        <asp:Parameter Name="img" Type="String"></asp:Parameter>
                                                                        <asp:Parameter Name="imgid" Type="Int32"></asp:Parameter>
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
            </div>
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
    <script src="   dist/js/demo.js"></script>
    <!-- Page specific script -->
    <script>
   $(function () {
  bsCustomFileInput.init();
});
    </script>
    <script>
    function BindControls() {
        Sys.Application.add_init(function () {
    $("#ContentPlaceHolder1_Image_Table").DataTable({
        "responsive": true, "lengthChange": false, "autoWidth": true, "paging": true, "searching": true, "iDisplayLength": 5,"ordering": true, "info": true,
      "buttons": ["copy", "csv", "excel", "pdf", "print"]
    }).buttons().container().appendTo('#ContentPlaceHolder1_Image_Table_wrapper .col-md-6:eq(0)');
  
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

