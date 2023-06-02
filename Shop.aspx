<%@ Page Title="" Language="VB" MasterPageFile="~/Masterpage.master" AutoEventWireup="false" CodeFile="Shop.aspx.vb" Inherits="Shop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Planet Fashion</title>

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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Shop</h4>
                        <div class="breadcrumb__links">
                            <a href="./Default.aspx ">Home</a>
                            <span>Shop</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shop Section Begin -->
    <section class="shop spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="shop__sidebar">
                        <div class="shop__sidebar__search">
                            <form action="#">
                                <input  type="text" placeholder="Search..." id="txtSearch" runat="server" style="width:180px">
                                <asp:ImageButton ID="ImageButton1"  CssClass="btn btn-dark" runat="server"  commandName="Category" CommandArgument='<%# Eval("ct_name") %>' ImageUrl="~/img/icon/search_icon.png" Height="35" Width="50" />
                            </form>
                        </div>
                        <div class="shop__sidebar__accordion">
                            <div class="accordion" id="accordionExample">
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseOne">Categories</a>
                                    </div>
                                    <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__categories">
                                                <ul class="nice-scroll">
                                                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                                                        <ItemTemplate>
                                                            <li><asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" commandName="Category" CommandArgument='<%# Eval("ct_name") %>'><%# Eval("ct_name") %></asp:LinkButton></li>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </ul>

                                                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:data_stu6ConnectionString %>' SelectCommand="SELECT * FROM [category_master]"></asp:SqlDataSource>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseThree">Filter Price</a>
                                    </div>
                                    <div id="collapseThree" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__price">
                                                <ul>
                                                    <li><asp:LinkButton ID="LinkButton6" runat="server" OnClick="LinkButton1_Click" commandName="filter" CommandArgument="500">₹0.00 - ₹500.00</asp:LinkButton></li>
                                                    <li><asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton1_Click" commandName="filter" CommandArgument="1000">₹500.00 - ₹1000.00</asp:LinkButton></li>
                                                    <li><asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton1_Click" commandName="filter" CommandArgument="5000">₹1000.00 - ₹5000.00</asp:LinkButton></li>
                                                    <li><asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton1_Click" commandName="filter" CommandArgument="10000">₹5000.00 - ₹10000.00</asp:LinkButton></li>

                                                   
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%--<div class="card">--%>
                                    <%--<div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseFour">Size</a>
                                    </div>--%>
                                    <%--<div id="collapseFour" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__size">
                                                <label for="xs">
                                                    xs
                                                   
                                                    <input type="radio" id="xs">
                                                </label>
                                                <label for="sm">
                                                    s
                                                   
                                                    <input type="radio" id="sm">
                                                </label>
                                                <label for="md">
                                                    m
                                                   
                                                    <input type="radio" id="md">
                                                </label>
                                                <label for="xl">
                                                    xl
                                                   
                                                    <input type="radio" id="xl">
                                                </label>
                                                <label for="2xl">
                                                    2xl
                                                   
                                                    <input type="radio" id="2xl">
                                                </label>
                                                <label for="xxl">
                                                    xxl
                                                   
                                                    <input type="radio" id="xxl">
                                                </label>
                                                <label for="3xl">
                                                    3xl
                                                   
                                                    <input type="radio" id="3xl">
                                                </label>
                                                <label for="4xl">
                                                    4xl
                                                   
                                                    <input type="radio" id="4xl">
                                                </label>
                                            </div>
                                        </div>
                                    </div>--%>
                               <%-- </div>
                                <div class="card">--%>
                                    <%--<div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseFive">Colors</a>
                                    </div>
                                    <div id="collapseFive" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__color">
                                                <label class="c-1" for="sp-1">
                                                    <input type="radio" id="sp-1">
                                                </label>
                                                <label class="c-2" for="sp-2">
                                                    <input type="radio" id="sp-2">
                                                </label>
                                                <label class="c-3" for="sp-3">
                                                    <input type="radio" id="sp-3">
                                                </label>
                                                <label class="c-4" for="sp-4">
                                                    <input type="radio" id="sp-4">
                                                </label>
                                                <label class="c-5" for="sp-5">
                                                    <input type="radio" id="sp-5">
                                                </label>
                                                <label class="c-6" for="sp-6">
                                                    <input type="radio" id="sp-6">
                                                </label>
                                                <label class="c-7" for="sp-7">
                                                    <input type="radio" id="sp-7">
                                                </label>
                                                <label class="c-8" for="sp-8">
                                                    <input type="radio" id="sp-8">
                                                </label>
                                                <label class="c-9" for="sp-9">
                                                    <input type="radio" id="sp-9">
                                                </label>
                                            </div>
                                        </div>
                                    </div>--%>
                               <%-- </div>--%>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseSix">Tags</a>
                                    </div>
                                    <div id="collapseSix" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__tags">
                                                <a href="#">Shirts</a>
                                                <a href="#">T-Shirts</a>
                                                <a href="#">Formal Shirts</a>
                                                <a href="#">Casual Shirts</a>
                                                <a href="#">Pants</a>
                                                <a href="#">Jeans</a>
                                            
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="shop__product__option">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6">    
                                <div class="shop__product__option__left">
                                    <p onclick="refresh()">Show All Products</p>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="shop__product__option__right">
                                    <p>Sort by Price:</p>
                                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                                        <asp:ListItem>Low to High</asp:ListItem>
                                        <asp:ListItem>High to Low</asp:ListItem>
                                   
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <div class="col-lg-4 col-md-6 col-sm-6">
                                  <div class="product__item">
                                    <asp:LinkButton ID="LinkButton5" runat="server" CommandName="View" CommandArgument='<%# Eval("pid") %>'>
                                        <div  class="product__item__pic set-bg <%# Eval("pcttype") %>" data-setbg='<%# "img/product/" + Eval("pimg") %>' >
                                         <%--   <ul class="product__hover">
                                                <li><img src="img/icon/heart.png" alt=""></li>
                                                <li><img src="img/icon/compare.png" alt=""><span>Compare</span></li>
                                                <li><img src="img/icon/search.png" alt=""></li>
                                            </ul>--%>
                                        </div>
                                    </asp:LinkButton>
                                        
    
                                        <div class="product__item__text">
                                            <h6><%# Eval("pname") %></h6>
                                            <asp:LinkButton OnClick="add_cart_Click" ID="add_cart" CssClass="add-cart" runat="server"  CommandName="AddToCart" CommandArgument='<%# Eval("pid") %>'>+ Add To Cart</asp:LinkButton>
                                           
                                            <div class="rating">
                                                <i class="fa fa-star-o"></i>
                                                <i class="fa fa-star-o"></i>
                                                <i class="fa fa-star-o"></i>
                                                <i class="fa fa-star-o"></i>
                                                <i class="fa fa-star-o"></i>
                                            </div>
                                            <h5>₹<%# Eval("pprice") %></h5>
                                           <%-- <div class="product__color__select">
                                                <label for="pc-4">
                                                    <input type="radio" id="pc-4">
                                                </label>
                                                <label class="active black" for="pc-5">
                                                    <input type="radio" id="pc-5">
                                                </label>
                                                <label class="grey" for="pc-6">
                                                    <input type="radio" id="pc-6">
                                                </label>
                                            </div>--%>
                                        </div>
                                    </div>
                                    

                                    

                                       
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:data_stu6ConnectionString %>' SelectCommand="SELECT * FROM [product_master]"></asp:SqlDataSource>

                    </div>
                   <%-- <div class="row">
                        <div class="col-lg-12">
                            <div class="product__pagination">
                                <a class="active" href="#">1</a>
                                <a href="#">2</a>
                                <a href="#">3</a>
                                <span>...</span>
                                <a href="#">21</a>
                            </div>
                        </div>
                    </div>--%>
                </div>
            </div>
        </div>
    </section>
    <!-- Shop Section End -->
    
    <script>
        function Product_Details(pid) {
            sessionStorage.setItem("pid", pid);
            alert(sessionStorage.getItem("pid"));
            window.location.href = "shop_details.aspx";
        }
        function refresh() {
            window.location.replace("shop.aspx");
        }
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

