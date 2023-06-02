<%@ Page Title="" Language="VB" MasterPageFile="~/Masterpage.master" AutoEventWireup="false" CodeFile="Order_details.aspx.vb" Inherits="Order_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="Order_DetailsCss.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/html2canvas@1.0.0-rc.5/dist/html2canvas.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container-fluid">

<div class="container"  runat="server">
  <!-- Title -->
  <div class="d-flex justify-content-between align-items-center py-3">
    <h2 class="h5 mb-0"><a href="#" class="text-muted"></a> Order #16123222</h2>
  </div>

  <!-- Main content -->
  <div class="row" id="div_to_ss">
    <div class="col-lg-8">
      <!-- Details -->
      <div class="card mb-4">
        <div class="card-body">
          <div class="mb-3 d-flex justify-content-between">
            <div>
              <span class="me-3" id="date1" runat="server">22-11-2021</span>
              <span class="me-3" id="order_id" runat="server">#16123222</span>
              <span class="me-3">Visa -1234</span>
              <span class="" id="Order_status" runat="server">SHIPPING</span>
            </div>
            <div class="d-flex">
              <button class="btn btn-link p-0 me-3 d-none d-lg-block btn-icon-text" ><i class="bi bi-download"></i> <Label class="text" onclick="screenshot()">Invoice</Label></button>
               
              <div class="dropdown">
                <button class="btn btn-link p-0 text-muted" type="button" data-bs-toggle="dropdown">
                  <i class="bi bi-three-dots-vertical"></i>
                </button>
                <ul class="dropdown-menu dropdown-menu-end">
                  <li><a class="dropdown-item" href="#"><i class="bi bi-pencil"></i> Edit</a></li>
                  <li><a class="dropdown-item" href="#"><i class="bi bi-printer"></i> Print</a></li>
                </ul>
              </div>
            </div>
          </div>
          <table class="table table-borderless shopping__cart__table">
          <thead>
            <tr>
                    <th>Product</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                <tr>
                <td>
                  <div class="d-flex mb-2">
                    <div class="flex-shrink-0">
                      <img src='<%# "img/product/" + Eval("pimg") %>' alt="" width="90" height="90" class="img-fluid" style="margin-right: 5px; border-radius: 10px" >
                    </div>
                    
                      <div class="flex-lg-grow-1 ms-3" style="padding-top: 1.7em">
                      <h6 class="large mb-0 font-weight-bold"><a href="#" class="text-reset"><%# eval("pname") %></a></h6>
                      <span class="small font-weight-light">₹<%# Eval("pprice") %></span>
                    </div>
                  </div>
                </td>
                <td style="padding-top: 2.9em"><%# Eval("Quantity") %></td>
                <td class="text-end" style="padding-top: 2.9em">₹<%# Eval("Quantity") * Eval("pprice") %></td>
              </tr>
                    </ItemTemplate>
                </asp:Repeater>

                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:data_stu6ConnectionString %>' SelectCommand="Select * from User_Master, Product_Master, Order_Table where User_Master.uid = @User_id and Order_Table.uid = @User_id and Order_Table.pid = Product_Master.pid and Order_Table.Cart_id = @Cart_id">
                <SelectParameters>
                 <asp:SessionParameter SessionField="User_id" DefaultValue="0" Name="User_id" Type="Int32"></asp:SessionParameter>
                 <asp:SessionParameter SessionField="Cart_id" DefaultValue="0" Name="Cart_id" Type="Int32"></asp:SessionParameter>
                 <asp:SessionParameter SessionField="Order_id" DefaultValue="0" Name="Order_id" Type="Int32"></asp:SessionParameter>
             </SelectParameters>
                </asp:SqlDataSource>
            </tbody>
            <tfoot>
              <tr>
                <td colspan="2">Subtotal</td>
                <td class="text-end" id="subtotal" runat="server">$159,98</td>
              </tr>
              <tr>
                <td colspan="2">Shipping</td>
                <td class="text-end">₹70.00</td>
              </tr>
              <tr>
                <td colspan="2" id="discount" runat="server">Discount (Code: NEWYEAR)</td>
                <td class="text-danger text-end" id="Discount_Value" runat="server">-$10.00</td>
              </tr>
              <tr class="fw-bold">
                <td colspan="2">TOTAL</td>
                <td class="text-end" id="Total" runat="server">$169,98</td>
              </tr>
            </tfoot>
          </table>
        </div>
      </div>
      <!-- Payment -->
      <div class="card mb-4">
        <div class="card-body">
          <div class="row">
            <div class="col-lg-6">
              <h3 class="h6">Payment Method</h3>
              <p>Visa -1234 <br>
            Total: <span id="payment_totals" runat="server">$169,98</span><span class="badge bg-success rounded-pill">PAID</span></p>
            </div>
            <div class="col-lg-6">
              <h3 class="h6">Billing address</h3>
              <address id="address" runat="server">
                <strong>John Doe</strong><br>
                1355 Market St, Suite 900<br>
                San Francisco, CA 94103<br>
                <abbr title="Phone">P:</abbr> (123) 456-7890
              </address>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-lg-4">
      <!-- Customer Notes -->
      <div class="card mb-4">
        <div class="card-body">
          <h3 class="h6">Customer Notes</h3>
          <p>Sed enim, faucibus litora velit vestibulum habitasse. Cras lobortis cum sem aliquet mauris rutrum. Sollicitudin. Morbi, sem tellus vestibulum porttitor.</p>
        </div>
      </div>
      <div class="card mb-4">
        <!-- Shipping information -->
        <div class="card-body">
          <h3 class="h6">Shipping Information</h3>
          <strong>FedEx</strong>
          <span><a href="#" class="text-decoration-underline" target="_blank">FF1234567890</a> <i class="bi bi-box-arrow-up-right"></i> </span>
          <hr>
          <h3 class="h6">Address</h3>
          <address id="address2" runat="server">
            <strong>John Doe</strong><br>
            1355 Market St, Suite 900<br>
            San Francisco, CA 94103<br>
            <abbr title="Phone">P:</abbr> (123) 456-7890
          </address>
        </div>
      </div>
    </div>
  </div>
</div>
  </div>
   -
    <script>
       <%--   function printpage() {

           var getpanel = document.getElementById("<%= div_to_ss.ClientID %>");
           var MainWindow = window.open('', '', 'height=500,width=800');
           MainWindow.document.write('<html><head><title>Print Page</title>');
           MainWindow.document.write('<link href="Order_DetailsCss.css" rel="stylesheet" />');
           MainWindow.document.write('</head><body>');
           MainWindow.document.write(getpanel.innerHTML);
           MainWindow.document.write('</body></html>');
           MainWindow.document.close();
           setTimeout(function () {
            MainWindow.print();
           }, 500);
           return false;

          }--%>


            function screenshot() {
            
            var content = document.getElementById("div_to_ss");
            html2canvas(content).then(

                function (canvas) {
                                
                    printDiv("div_to_ss");
                }
               )
             }


             function printDiv(divName) {
             var printContents = document.getElementById(divName).innerHTML;
             var originalContents = document.body.innerHTML;

             document.body.innerHTML = printContents;

             window.print();

             document.body.innerHTML = originalContents;
             }


              document.getElementById("ContentPlaceHolder1_Order_status").classList.add("badge")
        if (document.getElementById("ContentPlaceHolder1_Order_status").innerText == "Ordered") {
            document.getElementById("ContentPlaceHolder1_Order_status").classList.add("badge-info")
        } else if (document.getElementById("ContentPlaceHolder1_Order_status").innerText == "Dispached") {
            document.getElementById("ContentPlaceHolder1_Order_status").classList.add("badge-warning")
        } else if (document.getElementById("ContentPlaceHolder1_Order_status").innerText == "Delivered") {
            document.getElementById("ContentPlaceHolder1_Order_status").classList.add("badge-success")
        }

    </script>
        <script src="js/html2canvas.js"></script>
    <script src="js/html2canvas.min.js"></script>
</asp:Content>

