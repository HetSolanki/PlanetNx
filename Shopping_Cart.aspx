<%@ Page Title="" Language="VB" MasterPageFile="~/Masterpage.master" AutoEventWireup="false" CodeFile="Shopping_Cart.aspx.vb" Inherits="Shopping_Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Male-Fashion | Template</title>

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
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Shopping Cart</h4>
                        <div class="breadcrumb__links">
                            <a href="./Default.aspx">Home</a>
                            <a href="Shop.aspx">Shop</a>
                            <span>Shopping Cart</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shopping Cart Section Begin -->
    <section class="shopping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="shopping__cart__table">
                        <table>
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
                 <td class="product__cart__item">
                     <div class="product__cart__item__pic">
                         <img src='<%# "img/product/" + Eval("pimg") %>' alt="" height="90" width="90">
                     </div>
                     <div class="product__cart__item__text">
                         <h6><%# Eval("pname") %></h6>
                         <h5>₹<%# Eval("pprice") %></h5>
                     </div>
                 </td>
                 <td class="quantity__item">
                     <div class="quantity">
                         <div class="pro-qty-2" id="qty">
                             <input type="text" id="quantity" value='<%# Eval("Quantity") %>' readonly>
                         </div>
                     </div>
                 </td>
                
                 <td class="cart__price" id="price">₹<%#Eval("Quantity") * Eval("pprice") %></td>

                 <td class="cart__close" runat="server" id="Cancel" >
                     <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Order_id" OnClick="LinkButton1_Click" CommandArgument='<%# Eval("id") %>'>
                        <i class="fa fa-close"></i>
                     </asp:LinkButton>
                 </td>
                </tr>

             </ItemTemplate>
         </asp:Repeater>
         <asp:HiddenField ID="qty_hidden" runat="server" />
                 <asp:HiddenField ID="HiddenField1" runat="server" value ='<%#Eval("Quantity") * Eval("pprice") %>'/>

         <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:data_stu6ConnectionString %>' SelectCommand="SELECT * FROM [Cart_Master], [Product_Master] WHERE ([User_id] = @User_id) and Cart_Master.pid = Product_Master.pid">
             <SelectParameters>
                 <asp:SessionParameter SessionField="User_id" DefaultValue="0" Name="User_id" Type="Int32"></asp:SessionParameter>
             </SelectParameters>
         </asp:SqlDataSource>
                            </tbody>
                        </table>


     </div>
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="continue__btn">
                                <a href="Shop.aspx">Continue Shopping</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="cart__discount">
                        <h6>Discount codes</h6>
                        <%--<form action="#">--%>
                            <input type="text" placeholder="Coupon code" runat="server" id="coupanCode">
                            <asp:Button ID="Apply" runat="server" Text="Apply" />
                            
                        <%--</form>--%>
                    </div>
                    <div class="cart__total">
                        <h6>Cart total</h6>
                        <ul>
                            <li>Subtotal <span id="subtotal">₹0</span></li>
                            <li>Total <span id="total">₹0</span></li>
                        </ul>
                        <a href="Checkout.aspx" class="primary-btn" onclick="fun1()" id="checkout">Proceed to checkout</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shopping Cart Section End -->

    <script>
        document.getElementById("cart_item").innerText = "<%= qty_hidden.Value %>"
        document.getElementById("subtotal").innerHTML = "₹<%= HiddenField1.Value %>"
        document.getElementById("total").innerHTML = "₹<%= HiddenField1.Value %>"

        function fun1() {
            if (document.getElementById("total").innerText == "₹0") {
                alert("Your Cart is Empty")
                document.getElementById("checkout").setAttribute("href", "#")
            }
        }
       
    </script>
    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery.nicescroll.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <%--<script src="js/jquery.countdown.min.js"></script>--%>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
</asp:Content>

