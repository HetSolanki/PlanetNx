<%@ Page Title="" Language="VB" MasterPageFile="Admin.master" AutoEventWireup="false" CodeFile="Admin_Master.aspx.vb" Inherits="Admin_Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


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
                                <h1>Admin Master</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="Homepage.aspx">Home</a></li>
                                    <li class="breadcrumb-item active">Admin Master</li>
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
                                    <div class="card-header">
                                        <h3 class="card-title">Enter Details</h3>
                                    </div>
                                    <!-- /.card-header -->
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <!-- text input -->
                                                <div class="form-group">
                                                    <label>Username</label>
                                                    <input id="aname" runat="server" type="text" class="form-control" placeholder="Enter Username" maxlength="30" />
                                                    <asp:HiddenField ID="aid" runat="server" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="aname" runat="server" ErrorMessage="Enter Username" Display="Dynamic" ForeColor="#FF9933"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Valid Username(Only contains alphanumeric characters, underscore and dot,Underscore and dot can't be at the end or start of a username,Underscore and dot can't be next to each other,Underscore or dot can't be used multiple times in a row,Number of characters must be between 8 to 20)" ValidationExpression="[A-Za-z0-9_]+$" ControlToValidate="aname" Display="Dynamic" ForeColor="#FF9933"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>

                                            <div class="col-sm-12">
                                                <div class="form-group">
                                                    <label>Password</label>
                                                    <input id="apass" runat="server" type="text" class="form-control" placeholder="Enter Password" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="apass" runat="server" ErrorMessage="Enter Password" Display="Dynamic" ForeColor="#FF9933"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Password (Minimum eight characters, at least one uppercase letter, one lowercase letter, one number and one special character)" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$" ControlToValidate="apass" Display="None" ForeColor="#FF9933"></asp:RegularExpressionValidator>
                                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password doesn't match" ControlToValidate="acpass" ControlToCompare="apass" Display="Dynamic" ForeColor="#FF9933"></asp:CompareValidator>
                                                </div>
                                            </div>

                                            <div class="col-sm-12">
                                                <div class="form-group">
                                                    <label>Confirm Password</label>
                                                    <input id="acpass" runat="server" type="text" class="form-control" placeholder="Enter Confirm Password" ForeColor="#FF9933"/>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="acpass" runat="server" ErrorMessage="Re-Enter Password" Display="Dynamic" ForeColor="#FF9933"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>

                                            <div class="col-sm-12">
                                                <div class="form-group">
                                                    <label>Select Type:</label>
                                                    <asp:DropDownList ID="typedrop" runat="server" class="form-control" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="role_name" DataValueField="role_id">
                                                    </asp:DropDownList>

                                                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:data_stu6ConnectionString %>' SelectCommand="SELECT [role_id], [role_name] FROM [role_master] ORDER BY [role_name]"></asp:SqlDataSource>
                                                </div>
                                            </div>

                                            <div class="col-sm-12">
                                                <div class="form-group">
                                                    <label>Select Image</label></br>
                            <asp:FileUpload ID="upic" runat="server" />
                                                    <asp:Label runat="server" ID="lblimg" Text=""></asp:Label>
                                                </div>
                                            </div>
                                            <div class="col-sm-4 mt-2" style="display: block">
                                                    <asp:Label ID="Label1" ForeColor="red" Visible="false" runat="server" Text=""></asp:Label>
                                                <div class="form-group">
                                                    <asp:Button Text="Save" runat="server" ID="Save" CssClass="btn btn-block btn-primary font-weight-bold" CausesValidation="false" />
                                                </div>
                                            </div>
                                            <div class="col-sm-4 mt-2" style="display: block">
                        <div class="form-group">
                          <asp:Button Text="New" runat="server" id="New" CssClass="btn btn-block btn-primary font-weight-bold" CausesValidation="False" />
                           
                        </div>
                      </div>


                                                    <%--<asp:ValidationSummary ID="ValidationSummary1" Class="mt-4 text-justify" runat="server" DisplayMode="BulletList" Width="250px" />--%>

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
                                                            <h3 class="card-title">Admin Master</h3>
                                                        </div>
                                                        <!-- /.card-header -->
                                                        <div class="card-body">
                                                            <table id="example1" class="table table-bordered table-hover">
                                                                <asp:GridView ID="Admin_Table" runat="server" AutoGenerateColumns="False" DataKeyNames="aid" DataSourceID="SqlDataSource1" CssClass="table table-bordered table-hover" ShowHeaderWhenEmpty="true">
                                                                    <Columns>

                                                                        <asp:BoundField DataField="aid" HeaderText="aid" ReadOnly="True" SortExpression="aid" InsertVisible="False"></asp:BoundField>
                                                                        <asp:BoundField DataField="aname" HeaderText="Admin Name" SortExpression="aname"></asp:BoundField>
                                                                        <asp:BoundField DataField="apass" HeaderText="Password" SortExpression="apass"></asp:BoundField> 
                                                                        <asp:BoundField DataField="atype" HeaderText="Type" SortExpression="atype"></asp:BoundField>
                                                                        <asp:BoundField DataField="aimg" HeaderText="Image" SortExpression="aid"></asp:BoundField>

                                                                        <asp:TemplateField HeaderText="Profile">
                                                                            <ItemTemplate>
                                                                                <asp:Image runat="server" ID="pimg" ImageUrl='<%# "dist/img/Admin_Profile/" + Eval("aimg") %>' Width="70px"></asp:Image>

                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>



                                                                        <asp:TemplateField HeaderText="Action" ControlStyle-Width="100px">
                                                                            <ItemTemplate>
                                                                                <%-- Delete Button [Start] --%>
                                                                                <asp:TemplateField HeaderText="Action">
                                                                                    <itemtemplate>
                            <asp:Button Text="Delete" runat="server" CssClass="btn btn-danger font-weight-bold" CommandName="Delete1" CausesValidation="false" OnClientClick="javascript: return confirm('Do You Want To Delete it');" ID="delete1" CommandArgument='<%# Eval("aid") %>' />
                          </itemtemplate>
                                                                                </asp:TemplateField>
                                                                                <%-- Delete Button [End] --%>                                                                                
                                                                                <%--Edit button--%>
                                                                                <asp:TemplateField  HeaderText="Action">
                                                                                    <itemtemplate>
                            <asp:Button runat="server" ID="btnedit" CssClass="btn btn-primary font-weight-bold"  Text="Edit" CommandArgument='<% # Eval("aid") %>' CommandName="Edit1" CauseValidation="false" Tooltip="Edit User" OnClick="btnedit_Click" CausesValidation="False"></asp:Button>
                             </itemtemplate>
                                                                                </asp:TemplateField>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <%--Edit [end]--%>
                                                                    </Columns>
                                                                </asp:GridView>

                                                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Data_stu6ConnectionString %>' DeleteCommand="DELETE FROM [admin_master] WHERE [aid] = @aid" InsertCommand="INSERT INTO [admin_master] ([aname], [apass], [aimg],[atype]) VALUES (@aname, @apass, @aimg,@atype)" SelectCommand="SELECT * FROM [admin_master] ORDER BY [aname]" UpdateCommand="UPDATE [admin_master] SET [aname] = @aname, [apass] = @apass, [aimg] = @aimg, [atype]=@atype WHERE [aid] = @aid">
                                                                    <DeleteParameters>
                                                                        <asp:Parameter Name="aid" Type="Int32"></asp:Parameter>
                                                                    </DeleteParameters>
                                                                    <InsertParameters>
                                                                        <asp:Parameter Name="aname" Type="String"></asp:Parameter>
                                                                        <asp:Parameter Name="apass" Type="String"></asp:Parameter>
                                                                        <asp:Parameter Name="aimg" Type="String"></asp:Parameter>
                                                                        <asp:Parameter Name="atype" Type="String"></asp:Parameter>
                                                                    </InsertParameters>
                                                                    <UpdateParameters>
                                                                        <asp:Parameter Name="aname" Type="String"></asp:Parameter>
                                                                        <asp:Parameter Name="apass" Type="String"></asp:Parameter>
                                                                        <asp:Parameter Name="aimg" Type="String"></asp:Parameter>
                                                                        <asp:Parameter Name="atype" Type="String"></asp:Parameter>
                                                                        <asp:Parameter Name="aid" Type="Int32"></asp:Parameter>
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
            <%--</div>--%>
    <!-- /.content-wrapper -->
        </ContentTemplate>
    </asp:UpdatePanel>


    <script>
 function BindControls() {
        Sys.Application.add_init(function () {
                    $("#ContentPlaceHolder1_Admin_Table").DataTable({
                       "responsive": true, "lengthChange": false, "autoWidth": false, "paging": true, "searching": true, "ordering": true,  "iDisplayLength": 5, "info": true,"buttons": ["copy", "csv", "excel", "pdf", "print"]
                    }).buttons().container().appendTo('#ContentPlaceHolder1_Admin_Table_wrapper .col-md-6:eq(0)');
    
        });
    }                
        var req = Sys.WebForms.PageRequestManager.getInstance();        
        if (typeof (Sys) !== 'undefined') {
            if (req != null) {

                req.add_endRequest(function () {
                    BindControls();
                });
            }
        }
        else {
            alert("hii")
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
        var img = '<%=Session("Image")%>'
        document.getElementById("Profile_pic").src = "~/Admin/dist/img/Admin_Profile/" + img;
    
      function showDisplay() {
          alert("Category is already created");
      }
  </script>
</asp:Content>

