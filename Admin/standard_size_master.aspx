<%@ Page Title="" Language="VB" MasterPageFile="Admin.master" AutoEventWireup="false" CodeFile="standard_size_master.aspx.vb" Inherits="standard_size_master" %>

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
              <h1>Standard Size Master</h1>
            </div>
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item active">General Form</li>
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
                          <asp:HiddenField ID="ssid" runat="server" />
                          <label>Select Category</label>
                            <asp:DropDownList ID="categorydrop" runat="server" Class="form-control" AppendDataBoundItems="False" AutoPostBack="True">
                            </asp:DropDownList>
<%--                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Select Category" ControlToValidate="categorydrop" Display="Dynamic" ForeColor="#FF9933"></asp:RequiredFieldValidator>--%>
                        </div>
                      </div>
                      <div class="col-sm-12">
                        <!-- text input -->
                        <div class="form-group">
                          <label>Select Sub-Category</label>
                            <asp:DropDownList ID="subcategorydrop" runat="server"  Class="form-control" AutoPostBack="False">
                            </asp:DropDownList>
                           <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Select Sub-Category" Display="Dynamic" ControlToValidate="subcategorydrop" ForeColor="#FF9933"> </asp:RequiredFieldValidator>--%>
                        </div>
                      </div>
                      <div class="col-sm-12">
                        <div class="form-group">
                          <label>Enter Size</label>
                          <input id="txtsize" runat="server" type="text" class="form-control" placeholder="Enter Size" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Size" ControlToValidate="txtsize" Display="Dynamic" ForeColor="#FF9933"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Unacceptable Size" ControlToValidate="txtsize" Display="Dynamic" ValidationExpression="^(0|[1-9][0-9]*)$" ForeColor="#FF9933"></asp:RegularExpressionValidator>
                        </div>
                      </div>

                      
                        
                     <div class="col-sm-4 mt-2" style="display: block">
                        <div class="form-group">
                          <asp:Button Text="Save" runat="server" id="Save" CssClass="btn btn-block btn-primary font-weight-bold"/>
                            <asp:Label ID="Label1" ForeColor="#FF9933" Visible="false" runat="server" Text=""></asp:Label>
                   
                        
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
                <h3 class="card-title">Standard Size Master</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                 <table id="example1" class="table table-bordered table-hover">
                     <asp:GridView ID="size_Table" runat="server" AutoGenerateColumns="False" DataKeyNames="ssid" DataSourceID="SqlDataSource1" CssClass="table table-bordered table-hover" ShowHeaderWhenEmpty="true">
                         <Columns>

                             <asp:BoundField DataField="ssid" HeaderText="id" ReadOnly="True" SortExpression="ssid" InsertVisible="False"></asp:BoundField>
                            
                             <asp:BoundField DataField="ct_name" HeaderText="Category Name" SortExpression="ct_name"></asp:BoundField>
                             <asp:BoundField DataField="subct_name" HeaderText="Subcategory Name" SortExpression="subct_name"></asp:BoundField>
                             <%--Edit [end]--%><asp:BoundField DataField="sssize" HeaderText="Size" SortExpression="sssize"></asp:BoundField>
                             <asp:TemplateField HeaderText="Action">
                         <ItemTemplate>
                            <%-- Delete Button [Start] --%>
                      <asp:TemplateField HeaderText="Action">
                          <ItemTemplate>
                            <asp:Button Text="Delete" runat="server" CssClass="btn btn-danger font-weight-bold" CommandName="Delete1" CausesValidation="false" OnClientClick="javascript: return confirm('Do You Want To Delete it');" ID="delete1" CommandArgument='<%# Eval("ssid") %>' />
                          </ItemTemplate>
                      </asp:TemplateField>
                      <%-- Delete Button [End] --%>

                             <%--Edit button--%>
                        <asp:TemplateField HeaderText="Action">
                           <ItemTemplate>
                            <asp:Button runat="server" ID="btnedit" CssClass="btn btn-primary font-weight-bold"  Text="Edit" CommandArgument='<% # Eval("ssid") %>' CommandName="Edit1" CauseValidation="false" Tooltip="Edit User" OnClick="btnedit_Click" CausesValidation="False"></asp:Button>
                             </ItemTemplate>
                          </asp:TemplateField>
                         </ItemTemplate>
                 </asp:TemplateField>

                         </Columns>
                    </asp:GridView>  
                 
                     <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Data_stu6ConnectionString %>' DeleteCommand="DELETE FROM [standard_size_master] WHERE [ssid] = @ssid" InsertCommand="INSERT INTO [standard_size_master] ([ct_name], [subct_name], [sssize]) VALUES (@ct_name, @subct_name, @sssize)" SelectCommand="SELECT * FROM [standard_size_master] ORDER BY [ssid]" UpdateCommand="UPDATE [standard_size_master] SET [ct_name] = @ct_name, [subct_name] = @subct_name, [sssize] = @sssize WHERE [ssid] = @ssid">
                         <DeleteParameters>
                             <asp:Parameter Name="ssid" Type="Int32"></asp:Parameter>
                         </DeleteParameters>
                         <InsertParameters>
                             <asp:Parameter Name="ct_name" Type="String"></asp:Parameter>
                             <asp:Parameter Name="subct_name" Type="String"></asp:Parameter>
                             <asp:Parameter Name="sssize" Type="Single"></asp:Parameter>
                         </InsertParameters>
                         <UpdateParameters>
                             <asp:Parameter Name="ct_name" Type="String"></asp:Parameter>
                             <asp:Parameter Name="subct_name" Type="String"></asp:Parameter>
                             <asp:Parameter Name="sssize" Type="Single"></asp:Parameter>
                             <asp:Parameter Name="ssid" Type="Int32"></asp:Parameter>
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
                    $("#ContentPlaceHolder1_size_Table").DataTable({
                       "responsive": true, "lengthChange": false, "iDisplayLength": 5, "autoWidth": false, "buttons": ["copy", "csv", "excel", "pdf", "print"]
                    }).buttons().container().appendTo('#ContentPlaceHolder1_size_Table_wrapper .col-md-6:eq(0)');
    
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

<%--<script>
    
    $(function () {
            $("#ContentPlaceHolder1_size_Table").DataTable({
                "responsive": true, "lengthChange": false, "iDisplayLength": 5, "autoWidth": false, "buttons": ["copy", "csv", "excel", "pdf", "print"]
            }).buttons().container().appendTo('#ContentPlaceHolder1_size_Table_wrapper .col-md-6:eq(0)');
        });
  </script>--%>

    <script>
        var img = '<%=Session("Image")%>'
        document.getElementById("Profile_pic").src = "dist/img/" + img;
    </script>
   <script>
      function showDisplay() {
          alert("Record is already present");
      }
  </script>
</asp:Content>

