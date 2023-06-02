<%@ Page Title="" Language="VB" MasterPageFile="~/Masterpage.master" AutoEventWireup="false" CodeFile="Shop_Details.aspx.vb" Inherits="Shop_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Planet Fashion</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
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

    <asp:HiddenField ID="HiddenField1" runat="server" />
    <!-- Shop Details Section Begin -->
    <section class="shop-details" onload="sessionset()">
        <div class="product__details__pic">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="product__details__breadcrumb">
                            <a href="./Default.aspx">Home</a>
                            <a href="./shop.aspx">Shop</a>
                            <span>Product Details</span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3 col-md-3">
                        <ul class="nav nav-tabs" role="tablist">
                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                            <li class="nav-item">
                                                <a class="nav-link" data-toggle="tab" id="<%# Eval("imgid") %>" href="#tabs-<%# Eval("imgid") %>" onclick="ClassAdd(<%# eval("imgid")%>)" role="tab">
                                                    <div class="product__thumb__pic set-bg" data-setbg='<%# "img/shop-details/" + Eval("img") %>'></div>
                                                </a>
                                            </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                    <div class="col-lg-6 col-md-9">
                        <div class="tab-content">
                        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <div class="tab-pane" id="tabs-<%# Eval("imgid") %>" role="tabpanel">
                                        <div class="product__details__pic__item">
                                            <img src="<%# "img/shop-details/" + Eval("img") %>"   alt="">
                                        </div> 
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:data_stu6ConnectionString %>' SelectCommand="SELECT * FROM [image_master] WHERE ([pid] = @pid)">

                <SelectParameters>
                    <asp:SessionParameter SessionField="pid" DefaultValue="0" Name="pid" Type="Int32"></asp:SessionParameter>
                </SelectParameters>
            </asp:SqlDataSource>
                        
                </div>
        
            </div>
        </div>
        

        
        <div class="product__details__content">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-8">
                        <div class="product__details__text">
                            <h4 runat="server" id="p_name">Product Name</h4>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o"></i>
                                <span> - 5 Reviews</span>
                            </div>
                            <h3 runat="server" id="price">₹270.00 <span>70.00</span></h3>
                            <p runat="server" id="pdesc">Coat with quilted lining and an adjustable hood. Featuring long sleeves with adjustable
                                cuff tabs, adjustable asymmetric hem with elastic side tabs and a front zip fastening
                            with placket.</p>
                            <div class="product__details__option">
                                <div class="product__details__option__size">
                                    <span>Size:</span>
                                    <label for="xxl">xxl
                                        <input type="radio" id="xxl">
                                    </label>
                                    <label class="active" for="xl">xl
                                        <input type="radio" id="xl">
                                    </label>
                                    <label for="l">l
                                        <input type="radio" id="l">
                                    </label>
                                    <label for="sm">s
                                        <input type="radio" id="sm">
                                    </label>
                                </div>
                            </div>
                            <div class="product__details__cart__option">
                                <div class="quantity">
                                    <div class="pro-qty">
                                        <input type="text" value="1" runat="server" id="qty">
                                    </div>
                                </div>
                                <asp:Button ID="Button1" runat="server" Text="Add To Cart" CssClass="primary-btn" OnClick="Button1_Click" data-toggle="modal" data-target="#success_tic"/>
                                <asp:Button ID="Button2" runat="server" Text="Buy Now" CssClass="primary-btn" OnClick="Button2_Click"/>
                            </div>
                            <div class="product__details__btns__option">
                                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">
                                        <i class="fa fa-heart"></i> add to wishlist
                                </asp:LinkButton>
                                <a href="#"><i class="fa fa-exchange"></i> Add To Compare</a>
                            </div>
                            <div class="product__details__last__option">
                                <h5><span>Guaranteed Safe Checkout</span></h5>
                                <img src="img/shop-details/details-payment.png" alt="">
                                <ul>
                                    <li runat="server" id="psku"><span>SKU:</span> 3812912</li>
                                    <li runat="server" id="pcategory"><span>Categories:</span> Clothes</li>
                                    <li><span>Tag:</span> Clothes, Skin, Body</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="product__details__tab">
                            <h3>Description</h3>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tabs-5" role="tabpanel">
                                    <div class="product__details__tab__content">
                                        <div class="product__details__tab__content__item">
                                            <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource2">
                                                <ItemTemplate>
                                                    <p><b><%# Eval("pd_title") %></b> : <%# Eval("pd_desc") %></p>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:data_stu6ConnectionString %>' SelectCommand="SELECT * FROM [product_description_master] WHERE ([pid] = @pid)">
                                        <SelectParameters>
                                            <asp:SessionParameter SessionField="pid" DefaultValue="0" Name="pid" Type="Int32"></asp:SessionParameter>
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shop Details Section End -->

    <!-- Related Section Begin -->
    <section class="related spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="related-title">Related Product</h3>
                </div>
            </div>
            <div class="row">
                                        <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource3">
                                            <ItemTemplate>
                                                <div class="col-lg-3 col-md-6 col-sm-6 col-sm-6">
                                                    <div class="product__item">
                                                        <asp:LinkButton ID="LinkButton5" runat="server" CommandName="View" CommandArgument='<%# Eval("pid") %>' OnClick="LinkButton5_Click">
                                        <div  class="product__item__pic set-bg <%# Eval("pcttype") %>" data-setbg='<%# "img/product/" + Eval("pimg") %>' >
                                            <ul class="product__hover">
                                                <li><img src="img/icon/heart.png" alt=""></li>
                                                <li><img src="img/icon/compare.png" alt=""><span>Compare</span></li>
                                                <li><img src="img/icon/search.png" alt=""></li>
                                            </ul>
                                        </div>
                                                        </asp:LinkButton>


                                                        <div class="product__item__text">
                                                            <h6><%# Eval("pname") %></h6>
                                                            <a href="#" class="add-cart" data-toggle="modal" data-target="#success_tic">+ Add To Cart</a>
                                                            <div class="rating">
                                                                <i class="fa fa-star-o"></i>
                                                                <i class="fa fa-star-o"></i>
                                                                <i class="fa fa-star-o"></i>
                                                                <i class="fa fa-star-o"></i>
                                                                <i class="fa fa-star-o"></i>
                                                            </div>
                                                            <h5>₹<%# Eval("pprice") %></h5>
                                                            <div class="product__color__select">
                                                                <label for="pc-4">
                                                                    <input type="radio" id="pc-4">
                                                                </label>
                                                                <label class="active black" for="pc-5">
                                                                    <input type="radio" id="pc-5">
                                                                </label>
                                                                <label class="grey" for="pc-6">
                                                                    <input type="radio" id="pc-6">
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>





                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:data_stu6ConnectionString %>' SelectCommand="SELECT top 4 * FROM [product_master] where pid <> @pid">
                                            <SelectParameters>
                                            <asp:SessionParameter SessionField="pid" DefaultValue="0" Name="pid" Type="Int32"></asp:SessionParameter>
                                        </SelectParameters>
                                        </asp:SqlDataSource>
                                        
                                    </div>
        </div>
    </section>
        
    <script>
        document.getElementById("<%= Session("sub_pid")%>").classList.add("active");
        document.getElementById("tabs-<%= Session("sub_pid")%>").classList.add("active");
    </script>
</asp:Content>

