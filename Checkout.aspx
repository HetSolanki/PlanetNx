<%@ Page Title="" Language="VB" MasterPageFile="~/Masterpage.master" AutoEventWireup="false" CodeFile="Checkout.aspx.vb" Inherits="Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Male-Fashion | Template</title>
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">d
    <link rel="stylesheet" href="css/style.css" type="text/css">

    <style>
        
body{
  background-color: #e6e6e6;
  width: 100%;
  height: 100%;
}
 #success_tic .page-body{
  max-width:300px;
  background-color:#FFFFFF;
  margin:10% auto;
}
 #success_tic .page-body .head{
  text-align:center;
}
/* #success_tic .tic{
  font-size:186px;
} */
#success_tic .close{
      opacity: 1;
    position: absolute;
    right: 0px;
    font-size: 30px;
    padding: 3px 15px;
  margin-bottom: 10px;
}
#success_tic .checkmark-circle {
  width: 150px;
  height: 150px;
  position: relative;
  display: inline-block;
  vertical-align: top;
}
.checkmark-circle .background {
  width: 150px;
  height: 150px;
  border-radius: 50%;
  background: #1ab394;
  position: absolute;
}
#success_tic .checkmark-circle .checkmark {
  border-radius: 5px;
}
#success_tic .checkmark-circle .checkmark.draw:after {
  -webkit-animation-delay: 300ms;
  -moz-animation-delay: 300ms;
  animation-delay: 300ms;
  -webkit-animation-duration: 1s;
  -moz-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-timing-function: ease;
  -moz-animation-timing-function: ease;
  animation-timing-function: ease;
  -webkit-animation-name: checkmark;
  -moz-animation-name: checkmark;
  animation-name: checkmark;
  -webkit-transform: scaleX(-1) rotate(135deg);
  -moz-transform: scaleX(-1) rotate(135deg);
  -ms-transform: scaleX(-1) rotate(135deg);
  -o-transform: scaleX(-1) rotate(135deg);
  transform: scaleX(-1) rotate(135deg);
  -webkit-animation-fill-mode: forwards;
  -moz-animation-fill-mode: forwards;
  animation-fill-mode: forwards;
}
#success_tic .checkmark-circle .checkmark:after {
  opacity: 1;
  height: 75px;
  width: 37.5px;
  -webkit-transform-origin: left top;
  -moz-transform-origin: left top;
  -ms-transform-origin: left top;
  -o-transform-origin: left top;
  transform-origin: left top;
  border-right: 15px solid #fff;
  border-top: 15px solid #fff;
  border-radius: 2.5px !important;
  content: '';
  left: 35px;
  top: 80px;
  position: absolute;
}

@-webkit-keyframes checkmark {
  0% {
    height: 0;
    width: 0;
    opacity: 1;
  }
  20% {
    height: 0;
    width: 37.5px;
    opacity: 1;
  }
  40% {
    height: 75px;
    width: 37.5px;
    opacity: 1;
  }
  100% {
    height: 75px;
    width: 37.5px;
    opacity: 1;
  }
}
@-moz-keyframes checkmark {
  0% {
    height: 0;
    width: 0;
    opacity: 1;
  }
  20% {
    height: 0;
    width: 37.5px;
    opacity: 1;
  }
  40% {
    height: 75px;
    width: 37.5px;
    opacity: 1;
  }
  100% {
    height: 75px;
    width: 37.5px;
    opacity: 1;
  }
}
@keyframes checkmark {
  0% {
    height: 0;
    width: 0;
    opacity: 1;
  }
  20% {
    height: 0;
    width: 37.5px;
    opacity: 1;
  }
  40% {
    height: 75px;
    width: 37.5px;
    opacity: 1;
  }
  100% {
    height: 75px;
    width: 37.5px;
    opacity: 1;
  }
}


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Check Out</h4>
                        <div class="breadcrumb__links">
                            <a href="./Home_Page.aspx">Home</a>
                            <a href="./Shop.aspx">Shop</a>
                            <a href="./Shopping_Cart.aspx">Shopping Cart</a>
                            <span>Check Out</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
                <%--<form action="#" >--%>
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <h6 class="checkout__title">Billing Details</h6>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>First Name<span>*</span></p>
                                        <input type="text" id="fname" runat="server" name="fname" required>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Last Name<span>*</span></p>
                                        <input type="text" id="lname" runat="server" required>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="checkout__input">
                                <p>Address<span>*</span></p>
                                <input type="text" placeholder="Street Address" class="checkout__input__add" id="uaddress" runat="server" required>
                            </div>
                            <div class="checkout__input">
                                <p>State<span>*</span></p>
                              <asp:DropDownList ID="dstate" runat="server" DataSourceID="SqlDataSource3" DataTextField="state_name" DataValueField="state_id" AutoPostBack="True"></asp:DropDownList>
                              <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:data_stu6ConnectionString %>' SelectCommand="SELECT * FROM [states_master]"></asp:SqlDataSource>
                          </div>
                            <br />
                            <br />
                            <br />

                            <div class="checkout__input">
                                <p>City<span>*</span></p>
                              <asp:DropDownList ID="dcity" runat="server" DataSourceID="SqlDataSource2" DataTextField="city_name" DataValueField="city_id" AutoPostBack="True"></asp:DropDownList>
                              <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:data_stu6ConnectionString %>' SelectCommand="SELECT * FROM [city_master] WHERE ([State_id] = @State_id)">
                                  <SelectParameters>
                                      <asp:ControlParameter ControlID="dstate" PropertyName="SelectedValue" DefaultValue="0" Name="State_id" Type="Int32"></asp:ControlParameter>
                                  </SelectParameters>
                              </asp:SqlDataSource>
                          </div>
                               <br />
                               <br />
                            <br />
                            <div  class="checkout__input">
                                    <p>Pincode<span>*</span></p>
                              <asp:DropDownList ID="dpincode" runat="server" DataSourceID="SqlDataSource4" DataTextField="city_pincode" DataValueField="city_id" AutoPostBack="True"></asp:DropDownList>
                              <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:data_stu6ConnectionString %>' SelectCommand="SELECT * FROM [city_master] WHERE ([city_id] = @city_id)">
                                  <SelectParameters>
                                      <asp:ControlParameter ControlID="dcity" PropertyName="SelectedValue" DefaultValue="0" Name="city_id" Type="Int32"></asp:ControlParameter>
                                  </SelectParameters>
                              </asp:SqlDataSource>
                          </div>
                            <br />
                            <br />
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Phone<span>*</span></p>
                                        <input type="tel" id="uphone" runat="server" maxlength="10" required>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Email<span>*</span></p>
                                        <input type="email" id="uemail" runat="server" required>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4 class="order__title">Your order</h4>
                                <div class="checkout__order__products">Product <span>Total</span></div>
                                <ul class="checkout__total__products">
                                    <li id="Product_Name" runat="server" visible="false"></li>
          <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
              <ItemTemplate>
                  <li><%# Eval("pname") %><span>₹<%# eval("pprice") * Eval("Quantity") %></span></li>
              </ItemTemplate>
          </asp:Repeater>
          <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:data_stu6ConnectionString %>' SelectCommand='SELECT * FROM [Cart_Master], [Product_Master] WHERE ([User_id] = @User_id) and Cart_Master.pid = Product_Master.pid'>
              <SelectParameters>
                 <asp:SessionParameter SessionField="User_id" DefaultValue="0" Name="User_id" Type="Int32"></asp:SessionParameter>
                 <asp:SessionParameter SessionField="Cart_id" DefaultValue="0" Name="Cart_id" Type="Int32"></asp:SessionParameter>
             </SelectParameters>

          </asp:SqlDataSource>
      </ul>
                                <ul class="checkout__total__all">
                                    <li id="charge1" runat="server" visible="false">Delivery Charge<span>₹70</span></li>
                                    <li>Subtotal <span id="subtotal">₹0</span></li>
                                    <li>Total <span id="totals">₹0</span></li>
                                </ul>
                                <p>Select Payment Method.</p>
                                <div class="form-check">
                                  <input class="form-check-input" type="radio" name="flexRadioDefault" id="rd1" runat="server">
                                  <label class="form-check-label" for="flexRadioDefault1">
                                    Pay with Debit/Credit/ATM Cards/UPI
                                  </label>
                                </div>
                               <div class="form-check">
                                  <input class="form-check-input" type="radio" name="flexRadioDefault" id="rd2" runat="server">
                                  <label class="form-check-label" for="flexRadioDefault1">
                                    Cash On Delivery
                                  </label>
                                </div>
                                <asp:button class="site-btn" runat="server" id="place_order" Text="PLACE ORDER"/>
                            </div>
                        </div>
                    </div>
          <asp:HiddenField ID="HiddenField1" runat="server"/>
                <%--</form>--%> 
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->

    <%--<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#success_tic">Open Modal</button>--%>





    <script>    
      
        document.getElementById("subtotal").innerHTML = "₹<%= HiddenField1.Value %>"
        document.getElementById("totals").innerHTML = "₹<%= HiddenField1.Value %>"
    </script>
     <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <%--<script src="js/jquery.nice-select.min.js"></script>--%>
    <script src="js/jquery.nicescroll.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/jquery.countdown.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
</asp:Content>

