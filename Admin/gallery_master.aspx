<%@ Page Title="" Language="VB" MasterPageFile="Admin.Master" AutoEventWireup="false" CodeFile="gallery_master.aspx.vb" Inherits="gallery_master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Category Master</title>
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
              <h1>Gallery Master</h1>
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

                            <label>Enter Heading</label>
                            <input id="heading" runat="server" type="text"  class="form-control" placeholder="Enter Heading " />
                              <%--[validation-start]--%>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter heading" ControlToValidate="heading" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Valid Heading" ValidationExpression="^[A-Za-z0-9]+$" Display="Dynamic" ControlToValidate="heading"></asp:RegularExpressionValidator>
                                  <%--[validation-end]--%>

                            <br />
                          <label>Select Type</label>
                        
                            <asp:HiddenField ID="gid" runat="server" />

                            <asp:DropDownList id="typedrop" runat="server" class="form-control">
                                <asp:ListItem Value="Banner">Banner</asp:ListItem>
                            </asp:DropDownList>


                               <%--[validation-start]--%>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please select the type" ControlToValidate="typedrop"></asp:RequiredFieldValidator>
                                  <%--[validation-end]--%>
                            <br />
                             <label>Select Image</label>
                            <asp:FileUpload ID="ppic" runat="server" />
                            <asp:Label runat="server" ID="lblimg" Text=""></asp:Label>
                            
                                   <%--[validation-start]--%>
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please select the image" ControlToValidate="ppic"></asp:RequiredFieldValidator>--%>
                                  <%--[validation-end]--%>
                        </div>
                      </div>

                
                        
                     <div class="col-sm-4 mt-2" style="display: block">
                        <div class="form-group">
                          <asp:Button Text="Save" runat="server" id="Save" CssClass="btn btn-block btn-primary font-weight-bold"/>
                            <asp:Label ID="Label1" Forecolor="red" Visible="false" runat="server" Text=""></asp:Label>
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
            <div class="card ">
              <div class="card-header bg-secondary">
                <h3 class="card-title  ">Gallery Master</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                 <table id="example1" class="table table-bordered table-hover">
                     <asp:GridView ID="Gallery_Table" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="False" DataKeyNames="gid" DataSourceID="SqlDataSource1" ShowHeaderWhenEmpty="true" PageSize="5">
                         <Columns>
                             <asp:BoundField DataField="gid" HeaderText="ID" ReadOnly="True" InsertVisible="False" SortExpression="gid"></asp:BoundField>
                             <asp:BoundField DataField="gheading" HeaderText="Heading" SortExpression="gheading"></asp:BoundField>
                             <asp:BoundField DataField="gtype" HeaderText="Type" SortExpression="gtype"></asp:BoundField>
                             <asp:BoundField DataField="gimg" HeaderText="Image" SortExpression="gimg"></asp:BoundField>


                             <%--Image start--%>
                              <asp:TemplateField HeaderText="Image">
                                   <ItemTemplate>
                                         <asp:Image runat="server" ID="pimg" ImageUrl='<%# "../img/hero/" + Eval("gimg") %>' Width="100px" Height="100px"></asp:Image>

                                   </ItemTemplate>
                              </asp:TemplateField>
                             <%--Image end--%>



                             <asp:TemplateField HeaderText="Action">
                                 <ItemTemplate>
                                     <%-- Delete Button [Start] --%>
                                     <asp:TemplateField HeaderText="Action">
                                         <itemtemplate>
                            <asp:Button Text="Delete" runat="server" CssClass="btn btn-danger font-weight-bold" CommandName="Delete1" CausesValidation="false" OnClientClick="javascript: return confirm('Do You Want To Delete it');" ID="delete1" CommandArgument='<%# Eval("gid") %>' />
                          </itemtemplate>
                                     </asp:TemplateField>
                                     <%-- Delete Button [End] --%>

                                     <%--Edit button--%>
                                     <asp:TemplateField HeaderText="Action">
                                         <itemtemplate>
                            <asp:Button runat="server" ID="btnedit" CssClass="btn btn-primary font-weight-bold"  Text="Edit" CommandArgument='<% # Eval("gid") %>' CommandName="Edit1" CauseValidation="false" Tooltip="Edit User" OnClick="btnedit_Click" CausesValidation="False"></asp:Button>
                             </itemtemplate>
                                     </asp:TemplateField>
                                 </ItemTemplate>
                             </asp:TemplateField>
                             <%--Edit [end]--%>
                         </Columns>
                     </asp:GridView>
                     <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Data_stu6ConnectionString %>' DeleteCommand="DELETE FROM [gallery_master] WHERE [gid] = @gid" InsertCommand="INSERT INTO [gallery_master] ([gheading], [gtype], [gimg]) VALUES (@gheading, @gtype, @gimg)" SelectCommand="SELECT * FROM [gallery_master] ORDER BY [gid]" UpdateCommand="UPDATE [gallery_master] SET [gheading] = @gheading, [gtype] = @gtype, [gimg] = @gimg WHERE [gid] = @gid">
                         <DeleteParameters>
                             <asp:Parameter Name="gid" Type="Int32"></asp:Parameter>
                         </DeleteParameters>
                         <InsertParameters>
                             <asp:Parameter Name="gheading" Type="String"></asp:Parameter>
                             <asp:Parameter Name="gtype" Type="String"></asp:Parameter>
                             <asp:Parameter Name="gimg" Type="String"></asp:Parameter>
                         </InsertParameters>
                         <UpdateParameters>
                             <asp:Parameter Name="gheading" Type="String"></asp:Parameter>
                             <asp:Parameter Name="gtype" Type="String"></asp:Parameter>
                             <asp:Parameter Name="gimg" Type="String"></asp:Parameter>
                             <asp:Parameter Name="gid" Type="Int32"></asp:Parameter>
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
                    $("#ContentPlaceHolder1_Gallery_Table").DataTable({
                       "responsive": true, "lengthChange": false, "iDisplayLength": 5, "autoWidth": false, "buttons": ["copy", "csv", "excel", "pdf", "print"]
                    }).buttons().container().appendTo('#ContentPlaceHolder1_Gallery_Table_wrapper .col-md-6:eq(0)');
    
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
    function BindControls() {
        Sys.Application.add_init(function () {
                    $("#ContentPlaceHolder1_Gallery_Table").DataTable({
                       "responsive": true, "lengthChange": false, "iDisplayLength": 5, "autoWidth": false, "buttons": ["copy", "csv", "excel", "pdf", "print"]
                    }).buttons().container().appendTo('#ContentPlaceHolder1_Gallery_Table_wrapper .col-md-6:eq(0)');
    
        });
    }
  </script>
     <script>
      function showDisplay() {
          alert("Record is already inserted");
      }
  </script>
</asp:Content>

