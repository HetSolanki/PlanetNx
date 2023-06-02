<%@ Page Title="" Language="VB" MasterPageFile="Admin.master" AutoEventWireup="false" CodeFile="product.aspx.vb" Inherits="product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
                                <h1>Product Master</h1>
                            </div>
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <li class="breadcrumb-item"><a href="Home_Page.aspx">Home</a></li>
                                    <li class="breadcrumb-item active">Product Master</li>
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
                                                    <label>Product Name</label>
                                                    <input id="pname" runat="server" type="text" class="form-control" placeholder="Enter Product Name" />

                                                    <asp:RequiredFieldValidator ID="user" runat="server" ControlToValidate="pname"    ErrorMessage="Enter Valid Product Name" Display="Dynamic" ForeColor="#FF9933"></asp:RequiredFieldValidator>

                                                    <asp:RegularExpressionValidator ID="RegExValid1" runat="server" ErrorMessage="<br>Invalid Username (Spaces and special characters except '_' and '.' are not allowed and these characters shouldn't be the starting or ending characters plus they can't be next to each other and the username should have 6-18 characters)" ControlToValidate="pname"
                                                        ValidationExpression="^[A-Za-z\s]+$"   ForeColor="#FF9933" Display="Dynamic" ></asp:RegularExpressionValidator>
                                                </div>
                                            </div>

                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label>Enter SKU Code</label>
                                                    <input id="txtsku" runat="server" type="text" class="form-control" placeholder="Enter Valid SKU Code" maxlength="6" max="999999" min="000000" />
                                                    <asp:RequiredFieldValidator ID="skureq" runat="server" ForeColor="#FF9933" ControlToValidate="txtsku" ErrorMessage="Enter SKU Code" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtsku" ErrorMessage="Enter valid SKU Code(Only Numbers are allowed and it must have 6 digits)" ValidationExpression="^\d{6}$" Display="Dynamic" ForeColor="#FF9933"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>

                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label>Product Short Description</label>
                                                    <input id="txtpdesc" runat="server" type="text" class="form-control" placeholder="Enter Valid Short Description" />
                                                    <asp:RequiredFieldValidator ID="desce" runat="server" ControlToValidate="txtpdesc" ErrorMessage="Enter Product Description" Display="Dynamic" ForeColor="#FF9933"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="REValphaOnly" runat="server" ErrorMessage="Enter valid product Description" ControlToValidate="txtpdesc" ValidationExpression="^[a-zA-Z0-9\s]+$" Display="Dynamic" ForeColor="#FF9933"></asp:RegularExpressionValidator>

                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label>Select Category</label>
                                                    <br />
                                                    <asp:DropDownList ID="categorydrop" runat="server" class="form-control" AutoPostBack="True"  DataTextField="ct_name" DataValueField="ct_id">
                                                    </asp:DropDownList>                                                 
                                                </div>
                                            </div>


                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label>Select Sub-Category</label>
                                                    <br />
                                                    <asp:DropDownList ID="subcategorydrop" runat="server" class="form-control" AutoPostBack="True"  DataTextField="subcttype" DataValueField="subct_id">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>

                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label>Enter Price</label>
                                                    <input id="txtprice" runat="server" type="text" class="form-control" maxlength="7" placeholder="Enter Price" />
                                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtprice" ForeColor="#FF9933" ErrorMessage="Enter Price" Display="Dynamic"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtprice" ForeColor="#FF9933" ErrorMessage="Enter Only Numeric value" ValidationExpression="^\d+$"   Display="Dynamic"></asp:RegularExpressionValidator>
                                                </div>
                                            </div>
                                             <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label>Select Collection</label></br>
                                                    <asp:DropDownList ID="dropdowncollection" runat="server" class="form-control" AutoPostBack="True">
                                                        <asp:ListItem Value="new-arrivals">New Arrivals</asp:ListItem>
                                                        <asp:ListItem Value="hot-sales">Hot Sale</asp:ListItem>                                                      
                                                    </asp:DropDownList>

                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label>Select Image</label></br>
                                                        <div class="custom-file">
                                                            <asp:FileUpload ID="ppic" runat="server"/>                                         
                                                        </div>                                                    
                                                    <br>                                                                                                      
                                                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                                      <%--<asp:RequiredFieldValidator ID="imgm" runat="server" ControlToValidate="ppic" ErrorMessage="Please Select Image"   Display="Dynamic" ></asp:RequiredFieldValidator>--%>
                                                    <asp:RegularExpressionValidator ForeColor="#FF9933" ID="RegularExpressionValidator6" runat="server" ErrorMessage="*jpeg,gif,png" ControlToValidate="ppic" ValidationExpression=".*\.([gG][iI][fF]|[jJ][pP][gG]|[jJ][pP][eE][gG]|[bB][mM][pP])$"    Display="Dynamic">
                                                    </asp:RegularExpressionValidator>

                                                    <asp:Label runat="server" ID="lblimg" Text=""></asp:Label>
                                                </div>
                                            </div>
                                           
                                                                                     
                                                <asp:Label runat="server" ID="lblimage" Text="" Visible="False"></asp:Label>
                                            <div class="col-sm-4 mt-2" style="display: block;padding-top:17px">
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
                                                            <h3 class="card-title">Product Master</h3>
                                                        </div>
                                                        <!-- /.card-header -->
                                                        <div class="card-body">
                                                            <table id="example1" class="table table-bordered table-hover">
                                                                <asp:GridView ID="Product_Table"  runat="server" AutoGenerateColumns="False" DataKeyNames="pid" DataSourceID="SqlDataSource1" class="table table-bordered table-hover" ShowHeaderWhenEmpty="true" >
                                                                    <Columns>

                                                                        <asp:BoundField DataField="pid" HeaderText="ID" ReadOnly="True" SortExpression="pid" InsertVisible="False"></asp:BoundField>
                                                                        <asp:BoundField DataField="pname" HeaderText="Product Name" SortExpression="pname">                                                                     
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="psku" HeaderText="SKU Code" SortExpression="psku">
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="pdesc" HeaderText="Product Description" SortExpression="pdesc"></asp:BoundField>
                                                                        <asp:BoundField DataField="pcttype" HeaderText="Category" SortExpression="pcttype"></asp:BoundField>
                                                                        <asp:BoundField DataField="psubcttype" HeaderText="Sub-Category" SortExpression="psubcttype"></asp:BoundField>
                                                                        <asp:BoundField DataField="pprice" HeaderText="Price" SortExpression="pprice"></asp:BoundField> 
                                                                            <asp:BoundField DataField="Category" HeaderText="Collection"
                                                                                SortExpression="Category"></asp:BoundField>
                                                                

                                                                       
                                                                         <asp:TemplateField HeaderText="Sub Description">
                                                                             <ItemTemplate>
                                                                                 <asp:ImageButton ID="btnsubdesc" runat="server" ImageUrl="dist/img/Icons/sub_icon.png"  CommandName="add_sub_description" CommandArgument='<%# Eval("pid") %>' CausesValidation="False" Width="30px" Height="30px" />
                                                                                     
                                                                             </ItemTemplate>
                                                                         </asp:TemplateField>
                                                                        <asp:BoundField DataField="pimg" HeaderText="pimg" SortExpression="pimg" ></asp:BoundField>
                                                                        <%--<asp:BoundField DataField="ptrend" HeaderText="ptrend" SortExpression="ptrend"></asp:BoundField>--%>
                                                                        <asp:TemplateField HeaderText="Image">
                                                                            <ItemTemplate>
                                                                                <asp:Image runat="server" ID="pimg" ImageUrl='<%# "../img/product/" + Eval("pimg") %>' Width="100px" Height="100px" ></asp:Image>

                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>


                                                                        <asp:TemplateField HeaderText="Action">
                                                                            <ItemTemplate>
                                                                                <%-- Delete Button [Start] --%>
                                                                                <asp:TemplateField HeaderText="Action">
                                                                                    <itemtemplate>
                                         <asp:Button Text="Delete" runat="server" CssClass="btn btn-danger font-weight-bold" CommandName="Delete1" CausesValidation="false" OnClientClick="javascrip: return confirm('Do You Want To Delete it');" ID="delete1" CommandArgument='<%# Eval("pid") %>' />
                          </itemtemplate>
                                                                                </asp:TemplateField>
                                                                                <%-- Delete Button [End] --%>

                                                                                <%--Edit button--%>
                                                                                <asp:TemplateField HeaderText="Action">
                                                                                    <itemtemplate>
                                                 <asp:Button runat="server" ID="btnedit" CssClass="btn btn-primary font-weight-bold" Text="Edit" CommandArgument='<%# Eval("pid") %>' CommandName="Edit1" CauseValidation="false" Tooltip="Edit User" OnClick="btnedit_Click" CausesValidation="False"></asp:Button>
                                             </itemtemplate>
                                                                                </asp:TemplateField>
                                                                              <%--Gallery button--%>
                                                                                <asp:TemplateField  HeaderText="Action">
                                                                                    <itemtemplate>
                                                 <asp:Button runat="server" ID="Gallery" width="130px"  
                                                     CssClass="btn btn-primary font-weight-bold" Text="Gallery" CommandArgument='<% # Eval("pid") %>' CommandName="Img1" CauseValidation="false" Tooltip="Gallery"  OnClick="btnImage_Click" CausesValidation="False"></asp:Button>
                                             </itemtemplate>
                                                                                </asp:TemplateField>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>

                                                                    </Columns>
                                                                </asp:GridView>
                                                                   

                                                                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:Data_stu6ConnectionString %>' SelectCommand="SELECT * FROM [sub_category_master] ORDER BY [subct_id]"></asp:SqlDataSource>
                                                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:Data_stu6ConnectionString %>' DeleteCommand="DELETE FROM [product_master] WHERE [pid] = @pid" InsertCommand="INSERT INTO [product_master] ([pname], [psku], [pdesc], [pcttype], [psubcttype], [pprice], [ptrend], [pviewed], [pimg], [Category]) VALUES (@pname, @psku, @pdesc, @pcttype, @psubcttype, @pprice, @ptrend, @pviewed, @pimg, @Category)" SelectCommand="SELECT * FROM [product_master]" UpdateCommand="UPDATE [product_master] SET [pname] = @pname, [psku] = @psku, [pdesc] = @pdesc, [pcttype] = @pcttype, [psubcttype] = @psubcttype, [pprice] = @pprice, [ptrend] = @ptrend, [pviewed] = @pviewed, [pimg] = @pimg, [Category] = @Category WHERE [pid] = @pid">
                                                                    <DeleteParameters>
                                                                        <asp:Parameter Name="pid" Type="Int32"></asp:Parameter>
                                                                    </DeleteParameters>
                                                                    <InsertParameters>
                                                                        <asp:Parameter Name="pname" Type="String"></asp:Parameter>
                                                                        <asp:Parameter Name="psku" Type="String"></asp:Parameter>
                                                                        <asp:Parameter Name="pdesc" Type="String"></asp:Parameter>
                                                                        <asp:Parameter Name="pcttype" Type="String"></asp:Parameter>
                                                                        <asp:Parameter Name="psubcttype" Type="String"></asp:Parameter>
                                                                        <asp:Parameter Name="pprice" Type="Int64"></asp:Parameter>
                                                                        <asp:Parameter Name="ptrend" Type="Int32"></asp:Parameter>
                                                                        <asp:Parameter Name="pviewed" Type="Int64"></asp:Parameter>
                                                                        <asp:Parameter Name="pimg" Type="String"></asp:Parameter>
                                                                        <asp:Parameter Name="Category" Type="String"></asp:Parameter>
                                                                    </InsertParameters>
                                                                    <UpdateParameters>
                                                                        <asp:Parameter Name="pname" Type="String"></asp:Parameter>
                                                                        <asp:Parameter Name="psku" Type="String"></asp:Parameter>
                                                                        <asp:Parameter Name="pdesc" Type="String"></asp:Parameter>
                                                                        <asp:Parameter Name="pcttype" Type="String"></asp:Parameter>
                                                                        <asp:Parameter Name="psubcttype" Type="String"></asp:Parameter>
                                                                        <asp:Parameter Name="pprice" Type="Int64"></asp:Parameter>
                                                                        <asp:Parameter Name="ptrend" Type="Int32"></asp:Parameter>
                                                                        <asp:Parameter Name="pviewed" Type="Int64"></asp:Parameter>
                                                                        <asp:Parameter Name="pimg" Type="String"></asp:Parameter>
                                                                        <asp:Parameter Name="Category" Type="String"></asp:Parameter>
                                                                        <asp:Parameter Name="pid" Type="Int32"></asp:Parameter>
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
    $("#ContentPlaceHolder1_Product_Table").DataTable({
        "responsive": true, "lengthChange": false, "autoWidth": true, "paging": true, "searching": true, "iDisplayLength": 5,"ordering": true, "info": true,
      "buttons": ["copy", "csv", "excel", "pdf", "print"]
    }).buttons().container().appendTo('#ContentPlaceHolder1_Product_Table_wrapper .col-md-6:eq(0)');
  
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
  <%--  <script >
        function f() {
            alert("this")
        }
        function pvalidation() {
            console.log("hoo");
             $(document).ready(function(){
              
            if ($('#pname').val() == '') {
                $('#pname').css('border-color', 'red');
                alert("o")
            }
            else {
                alert("p")
                $('#pname').css('border-color', '');
            }
            })
            alert("  ")  --%>      
   <%-- //var psku =
    //    document.getElementById("psku").value
    //var pdes =
    //    document.getElementById("txtpdesc").value;
    //var pprice =
    //    document.getElementById("txtprice").value;
    //var pimg =
    //    document.getElementById("ppic").value;        
        
    //Javascript reGex for Email Validation.
    //var regEmail=/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/g; 
    // Javascript reGex for Phone Number validation.
    //var regPhone=/^\d{10}$/;                       
    // Javascript reGex for Name validation
    //var regName = /\d+$/g;                         --%>

<%--            //var vprod = "^[A-Za-z\s]+$";
            //var onlynum = "^\d+$";
            //var vimg = ".*\.([gG][iI][fF]|[jJ][pP][gG]|[jJ][pP][eE][gG]|[bB][mM][pP])$"
            
    if (document.getElementById("pname").innerText == "" )  {
            alert("1enter")
                if (pname.test(vprod)) {
                    window.alert("Please enter Product Name in valid format.");
                    pname.focus();
                    pname.classList.add("is-invalid")
                    return false;
                }
                else {
                    pname.classList.remove("is-invalid")
                    pname.classList.add("is-valid")

                }
        window.alert("Please enter Product Name.");
                pname.focus();
         pname.classList.add("is-invalid")

        return false;
    }
            return true;
            alert("enter")--%>

<%--    //else {
    //     pname.classList.add("is-valid")
    //}
 
    //if (address == "") {
    //    window.alert("Please enter your address.");
    //    address.focus();
    //    return false;
    //}
     
    //if (email == "" || !regEmail.test(email)) {
    //    window.alert("Please enter a valid e-mail address.");
    //    email.focus();
    //    return false;
    //}
      
    //if (password == "") {
    //    alert("Please enter your password");
    //    password.focus();
    //    return false;
    //}
 
    //if(password.length <6){
    //    alert("Password should be atleast 6 character long");
    //    password.focus();
    //    return false;
 
    //}
    //if (phone == "" || !regPhone.test(phone)) {
    //    alert("Please enter valid phone number.");
    //    phone.focus();
    //    return false;
    //}
 
    //if (what.selectedIndex == -1) {
    //    alert("Please enter your course.");
    //    what.focus();
    //    return false;
    //}
 
    //return true;
}
    </script>--%>
    <script>
        var img = '<%=Session("Image")%>'
        document.getElementById("Profile_pic").src = "dist/img/" + img;
    </script>
    <script>
      function showDisplay() {
          alert("Product already created");
      }
    </script>
    </asp:Content>

