<%@ Page Title="" Language="VB" MasterPageFile="Admin.master" AutoEventWireup="false" CodeFile="User_Master1.aspx.vb" Inherits="General" %>

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
              <h1>User Master</h1>
            </div>
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="Home_Page.aspx">Home</a></li>
                <li class="breadcrumb-item active">User-Master</li>
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
                          <label>Username</label>
                          <input id="uname" runat="server" type="text" class="form-control" placeholder="Enter Username" />
                            <asp:HiddenField ID="uid" runat="server" />
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="uname" runat="server"  ErrorMessage="Enter Username" Display="Dynamic" ForeColor="#FF9933"></asp:RequiredFieldValidator>
              
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Username (Spaces and special characters except '_' and '.' are not allowed and these characters shouldn't be the starting or ending characters plus they can't be next to each other and the username should have 6-18 characters)" ValidationExpression="(?:[a-zA-Z0-9]|([.])(?!\1)){5,20}$" ControlToValidate="uname" Display="Dynamic" ForeColor="#FF9933"></asp:RegularExpressionValidator>
                        </div>
                      </div>

                      <div class="col-sm-3">
                        <div class="form-group">
                          <label>Password</label>
                          <input id="upass" runat="server" type="text" class="form-control" placeholder="Enter Password" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="upass" runat="server" ErrorMessage="Enter Password" Display="Dynamic" ForeColor="#FF9933"></asp:RequiredFieldValidator>
                  
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Password (Minimum eight characters, at least one uppercase letter, one lowercase letter, one number and one special character)" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$" ControlToValidate="upass" Display="Dynamic" ForeColor="#FF9933"></asp:RegularExpressionValidator>
                        </div>
                      </div>

                      <div class="col-sm-3">
                        <div class="form-group">
                          <label>Mobile Number</label>
                          <input id="uphone" runat="server" type="text" maxlength="10" class="form-control" placeholder="Enter Mobile Number" min="0000000000" max="9999999999"  />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="uphone" runat="server" ErrorMessage="Enter Mobile Number" Display="Dynamic" ForeColor="#FF9933"></asp:RequiredFieldValidator>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Enter Valid Mobile Number (Only Numberic value in allowed)" ValidationExpression="^\d{10}$" ControlToValidate="uphone" Display="Dynamic" ForeColor="#FF9933"></asp:RegularExpressionValidator>
                           
                        </div>
                      </div>

                        
                      <div class="col-sm-3">
                        <div class="form-group">
                          <label>Email Id</label>
                          <input id="uemail" runat="server" type="text" class="form-control" placeholder="Enter Email Id" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="uemail" runat="server" ErrorMessage="Enter Email ID" Display="Dynamic" ForeColor="#FF9933"></asp:RequiredFieldValidator>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Enter Valid Email id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="uemail" Display="Dynamic" ForeColor="#FF9933"></asp:RegularExpressionValidator>
                   
                            </div>
                      </div>

                      <div class="col-sm-3">
                        <div class="form-group">
                          <label>PinCode</label>
                          <input id="upincode" runat="server" type="text" class="form-control" placeholder="Enter PinCode" max="999999" maxlength="6" min="000000" />
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="upincode" runat="server" ErrorMessage="Enter Pincode" Display="Dynamic" ForeColor="#FF9933"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Enter Valid Pincode" ValidationExpression="^\d{6}$" ControlToValidate="upincode" Display="Dynamic" ForeColor="#FF9933"></asp:RegularExpressionValidator>
                        </div>
                      </div>

                        <div class="col-sm-3">
                            <div class="form-group">
                                <label>State</label>
                                <input id="ustate" runat="server" type="text" class="form-control" placeholder="Enter State" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="ustate" runat="server" ErrorMessage="Enter State Name" Display="Dynamic" ForeColor="#FF9933"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server"
                                    ErrorMessage="Enter Valid State Name" Display="Dynamic"
                                    ControlToValidate="ustate"
                                    ValidationExpression="^[A-Za-z\s]+$" ForeColor="#FF9933"></asp:RegularExpressionValidator>
                            </div>
                      </div>

                      <div class="col-sm-3">
                        <div class="form-group">
                          <label>City</label>
                          <input id="ucity" runat="server" type="text" class="form-control" placeholder="Enter City" />
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="ucity" runat="server" ErrorMessage="Enter Cityname" Display="Dynamic" ForeColor="#FF9933"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ErrorMessage="Enter Cityname" ControlToValidate="ucity" Display="Dynamic" ValidationExpression="^[a-zA-Z]{1,28}$" ForeColor="#FF9933"></asp:RegularExpressionValidator>
                        </div>
                      </div>

                      <div class="col-sm-3">
                        <div class="form-group">
                          <label>Address</label>
                          <input id="uaddress" runat="server" type="text" class="form-control" placeholder="Enter Address" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="uaddress" runat="server" ErrorMessage="Enter  Address" Display="dynamic" ForeColor="#FF9933"></asp:RequiredFieldValidator>
                        </div>
                      </div>

                       <div class="col-sm-8">
                        <div class="form-group">
                          <label>Select Image</label></br>
                            <asp:fileupload id="upic" runat="server" />      
                            <asp:Label ID="Label1" ForeColor="#FF9933" Visible="true" runat="server" Text=""></asp:Label>
                            <asp:Label runat="server" ID="lblimg" Text=""></asp:Label>
                             <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="upic" runat="server" ErrorMessage="Select User Image" Display="Static" ></asp:RequiredFieldValidator>--%>
                        </div>
                      </div>
                                                                
                     <div class="col-sm-2 mt-4" style="display: block">
                         <div class="form-group">
                          <asp:Button Text="New" runat="server" id="new" CssClass="btn btn-block btn-primary font-weight-bold" CausesValidation="false" />                           
                        </div>

                    </div>
                     <div class="col-sm-2 mt-4" style="display: block">
                        <div class="form-group">
                          <asp:Button Text="Save" runat="server" id="Save" CssClass="btn btn-block btn-primary font-weight-bold" />
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
                <h3 class="card-title">User Master</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                 <table id="example1" class="table table-bordered table-hover">
                    <asp:GridView ID="User_Table" runat="server" AutoGenerateColumns="False" DataKeyNames="uid" DataSourceID="SqlDataSource1" CssClass="table table-bordered table-hover" ShowHeaderWhenEmpty="true">
                        <Columns>
                            
                            <asp:BoundField DataField="uid" HeaderText="ID" ReadOnly="True"  SortExpression="uid" InsertVisible="False"></asp:BoundField>
                            <asp:BoundField DataField="uname" HeaderText="User Name" SortExpression="uname"></asp:BoundField>
                            <asp:BoundField DataField="upass" HeaderText="Password" SortExpression="upass"></asp:BoundField>
                            <asp:BoundField DataField="uphone" HeaderText="Phone No." SortExpression="uphone"></asp:BoundField>
                            <asp:BoundField DataField="uemail" HeaderText="Email" SortExpression="uemail"></asp:BoundField>
                            <asp:BoundField DataField="upincode" HeaderText="Pincode" SortExpression="upincode"></asp:BoundField>
                            <asp:BoundField DataField="ustate" HeaderText="State" SortExpression="ustate"></asp:BoundField>
                            <asp:BoundField DataField="ucity" HeaderText="City" SortExpression="ucity"></asp:BoundField>
                            <asp:BoundField DataField="uaddress" HeaderText="Address" SortExpression="uaddress"></asp:BoundField>
                            <asp:BoundField DataField="uimg" HeaderText="Image" SortExpression="uimg"></asp:BoundField>
                            
                            <asp:TemplateField HeaderText="Profile">
                                <ItemTemplate>
                            <asp:image runat="server" ID="pimg" ImageUrl='<%# "../img/profiles/" + Eval("uimg") %>' Width="100px" Height="100px" AlternateText="No Image" EnableTheming="true">
                            </asp:image>

                                </ItemTemplate>
                            </asp:TemplateField> 
                           
             <asp:TemplateField HeaderText="Action">
                         <ItemTemplate>
                            <%-- Delete Button [Start] --%>
                      <asp:TemplateField HeaderText="Action">
                          <ItemTemplate>
                            <asp:Button Text="Delete" runat="server" CssClass="btn btn-danger font-weight-bold" CommandName="Delete1" CausesValidation="false" OnClientClick="javascript: return confirm('Do You Want To Delete it');" ID="delete1" CommandArgument='<%# Eval("uid") %>' />
                          </ItemTemplate>
                      </asp:TemplateField>
                      <%-- Delete Button [End] --%>

                             <%--Edit button--%>
                        <asp:TemplateField HeaderText="Action">
                           <ItemTemplate>
                            <asp:Button runat="server" ID="btnedit" CssClass="btn btn-primary font-weight-bold"  Text="Edit" CommandArgument='<% # Eval("uid") %>' CommandName="Edit1" CauseValidation="false" Tooltip="Edit User" OnClick="btnedit_Click" CausesValidation="False"></asp:Button>
                             </ItemTemplate>
                          </asp:TemplateField>
                         </ItemTemplate>
                 </asp:TemplateField>
              <%--Edit [end]--%>

                        </Columns>
                    </asp:GridView>  
                 
                     <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Data_stu6ConnectionString %>' DeleteCommand="DELETE FROM [user_master] WHERE [uid] = @uid" InsertCommand="INSERT INTO [user_master] ([uname], [upass], [uphone], [uemail], [upincode], [ustate], [ucity], [uaddress], [uimg]) VALUES (@uname, @upass, @uphone, @uemail, @upincode, @ustate, @ucity, @uaddress, @uimg)" SelectCommand="SELECT * FROM [user_master] ORDER BY [uname]" UpdateCommand="UPDATE [user_master] SET [uname] = @uname, [upass] = @upass, [uphone] = @uphone, [uemail] = @uemail, [upincode] = @upincode, [ustate] = @ustate, [ucity] = @ucity, [uaddress] = @uaddress, [uimg] = @uimg WHERE [uid] = @uid">
                         <DeleteParameters>
                             <asp:Parameter Name="uid" Type="Int32"></asp:Parameter>
                         </DeleteParameters>
                         <InsertParameters>
                             <asp:Parameter Name="uname" Type="String"></asp:Parameter>
                             <asp:Parameter Name="upass" Type="String"></asp:Parameter>
                             <asp:Parameter Name="uphone" Type="Int64"></asp:Parameter>
                             <asp:Parameter Name="uemail" Type="String"></asp:Parameter>
                             <asp:Parameter Name="upincode" Type="String"></asp:Parameter>
                             <asp:Parameter Name="ustate" Type="String"></asp:Parameter>
                             <asp:Parameter Name="ucity" Type="String"></asp:Parameter>
                             <asp:Parameter Name="uaddress" Type="String"></asp:Parameter>
                             <asp:Parameter Name="uimg" Type="String"></asp:Parameter>
                         </InsertParameters>
                         <UpdateParameters>
                             <asp:Parameter Name="uname" Type="String"></asp:Parameter>
                             <asp:Parameter Name="upass" Type="String"></asp:Parameter>
                             <asp:Parameter Name="uphone" Type="Int64"></asp:Parameter>
                             <asp:Parameter Name="uemail" Type="String"></asp:Parameter>
                             <asp:Parameter Name="upincode" Type="String"></asp:Parameter>
                             <asp:Parameter Name="ustate" Type="String"></asp:Parameter>
                             <asp:Parameter Name="ucity" Type="String"></asp:Parameter>
                             <asp:Parameter Name="uaddress" Type="String"></asp:Parameter>
                             <asp:Parameter Name="uimg" Type="String"></asp:Parameter>
                             <asp:Parameter Name="uid" Type="Int32"></asp:Parameter>
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

<</ContentTemplate>
        </asp:UpdatePanel>





<script>
     function BindControls() {
        Sys.Application.add_init(function () {
    $("#ContentPlaceHolder1_User_Table").DataTable({
        "responsive": true, "lengthChange": false, "autoWidth": true, "paging": true, "searching": true, "iDisplayLength": 5,"ordering": true, "info": true,
      "buttons": ["copy", "csv", "excel", "pdf", "print"]
    }).buttons().container().appendTo('#ContentPlaceHolder1_User_Table_wrapper .col-md-6:eq(0)');
  
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

  
</script>

    <script>
        var img = '<%=Session("Image")%>'
        document.getElementById("Profile_pic").src = "dist/img/" + img;
    </script>
<%--      <script type="text/javascript">
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
</script>--%>
  </asp:Content>