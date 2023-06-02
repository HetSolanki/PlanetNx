<%@ Page Title="" Language="VB" MasterPageFile="Admin.Master" AutoEventWireup="false" CodeFile="City_master.aspx.vb" Inherits="City_master" %>

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
              <h1>City Master</h1>
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            </div>
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="Home_Page.aspx">Home</a></li>
                <li class="breadcrumb-item"><a href="State_Master.aspx">State</a></li>
                <li class="breadcrumb-item  active">City</li>
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
                <label>State</label>
                <input id="state_name" readonly="true" runat="server" type="text" class="form-control" disabled /><br>
              <label>City Name</label>
                <input id="cityname" type="text" runat="server" class="form-control" placeholder="Enter Cityname" />
              <asp:HiddenField ID="uid" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="cityname" runat="server"  ErrorMessage="Enter Cityname" Display="Dynamic" EnableClientScript=""></asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"  ErrorMessage="Enter valid Cityname" ControlToValidate="cityname" Display="Dynamic" ValidationExpression="^[a-zA-Z]{1,28}$"></asp:RegularExpressionValidator>

            </div>
                      </div>                      
                      
                     <div class="col-sm-12">
            <div class="form-group" >
              <label>Pincode</label>
            <input id="pincode" type="text" runat="server" class="form-control" placeholder="Enter Pincode"  maxlength="6" max="999999" min="000000" />
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="pincode" runat="server"  ErrorMessage="Enter Pincode" Display="Dynamic"  ></asp:RequiredFieldValidator>
                
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Pincode" ValidationExpression="^\d{6}$" ControlToValidate="pincode" Display="Dynamic" ></asp:RegularExpressionValidator>
            </div>
          </div>
         <div class="row">
          <div class="col-sm-4 mt-1">
            <!-- Button -->
            <div class="form-group">
              <asp:Button Text="Save" runat="server" style="width:100px" id="Save" CssClass="btn btn-block btn-primary font-weight-bold"/>
            </div>
          </div>
             <div class="col-sm-4 mt-1">
            <!-- Button -->
            <div class="form-group">
              <asp:Button Text="New" runat="server" style="width:100px" id="New" CssClass="btn btn-block btn-primary ml-4 font-weight-bold" CausesValidation="False" />
            </div>
          </div>
        </div>

                    </div>
                </div>
                <!-- /.card-body -->
              </div>
              <!-- /.card -->
            </div>
            <!--/.col (left) -->



              <%--Start of Code for making textbox red--%>

            <%--  <script type="text/javascript">
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


                 <%--End of Code for making textbox red--%>


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
                <h3 class="card-title">Cities of <asp:Label ID="Lb" Forecolor="red" Visible="true" runat="server" Text="" ></asp:Label>
</h3>
              
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                 <table id="example1" class="table table-bordered table-hover">
                    
                     <asp:GridView ID="City_table" runat="server" CssClass="table table-bordered table-hover" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="city_id" ShowHeaderWhenEmpty="true" ConflictDetection="CompareAllValues">

                         <Columns>
                             <asp:BoundField DataField="city_id" HeaderText="City ID" Visible="true" InsertVisible="False" SortExpression="city_id" ReadOnly="True"></asp:BoundField>
                             <asp:BoundField DataField="State_id" HeaderText="State ID" SortExpression="State_id"></asp:BoundField>
                             <asp:BoundField DataField="city_name" HeaderText="City Name" SortExpression="city_name"></asp:BoundField>
                             <asp:BoundField DataField="city_pincode" HeaderText="City Pincode" SortExpression="city_pincode"></asp:BoundField>
                               <asp:TemplateField HeaderText="Action">
                                                                                            <ItemTemplate>
                                                                                                <%-- Delete Button [Start] --%>
                                                                                                    <asp:TemplateField HeaderText="Action">
                                                                                                        <ItemTemplate>
                                                                                                            <asp:Button Text="Delete" runat="server" CssClass="btn btn-danger" CommandName="Delete1" CausesValidation="false" OnClientClick="javascript: return confirm('Do You Want To Delete it');" city_id="delete1" CommandArgument='<%# Eval("city_id") %>' />
                                                                                                        </ItemTemplate>

                                                                                                        <%-- Delete Button [End] --%>


                                                                                                            <%--Edit button--%>
                                                                                                                <asp:Button runat="server" state_id="btnedit" CssClass="btn btn-primary" Text="Edit" CommandArgument='<% # Eval("city_id") %>' CommandName="Edit1" CauseValidation="false" Tooltip="Edit User" OnClick="btnedit_Click" CausesValidation="False"></asp:Button>
                                                                                            </ItemTemplate>
                                                                                            </asp:TemplateField>
                             <%--Edit [end]--%>
                         </Columns>
                     </asp:GridView>
                     <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Data_stu6ConnectionString %>' DeleteCommand="DELETE FROM [city_master] WHERE [city_id] = @city_id" InsertCommand="INSERT INTO [city_master] ([State_id], [city_name], [city_pincode]) VALUES (@State_id, @city_name, @city_pincode)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [city_master] WHERE ([State_id] = @State_id)" UpdateCommand="UPDATE [city_master] SET [State_id] = @State_id, [city_name] = @city_name, [city_pincode] = @city_pincode WHERE [city_id] = @city_id">
                         <DeleteParameters>
                                   <asp:Parameter Name="city_id" Type="Int32"></asp:Parameter>
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="State_id" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="city_name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="city_pincode" Type="Int32"></asp:Parameter>
                        </InsertParameters>
                          <SelectParameters>
                            <asp:SessionParameter SessionField="p_city" DefaultValue="0" Name="State_id" Type="Int32"></asp:SessionParameter>
                          </SelectParameters>
                         <UpdateParameters>
                            <asp:Parameter Name="State_id" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="city_name" Type="String"></asp:Parameter>
                            <asp:Parameter Name="city_pincode" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="city_id" Type="Int32"></asp:Parameter>
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
               
         $("#ContentPlaceHolder1_City_table").DataTable({
      "responsive": true, "lengthChange": false, "autoWidth": true, "paging": true, "searching": true, "ordering": true, "info": true,
      "buttons": ["copy", "csv", "excel", "pdf", "print"]
    }).buttons().container().appendTo('#ContentPlaceHolder1_City_table_wrapper .col-md-6:eq(0)');
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
    $(function () {
      bsCustomFileInput.init();
      });

  
 
    </script>
     <script>
      function showDisplay() {
          alert("City is already created");
      }
  </script>

</asp:Content>

