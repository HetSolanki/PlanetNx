<%@ Page Title="" Language="VB" MasterPageFile="~/Masterpage.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %> 


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

     <!-- Hero Section Begin -->
    <section class="hero">
        <div class="hero__slider owl-carousel">
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                <ItemTemplate> 
                     <div class="hero__items set-bg" data-setbg='<%# "img/hero/" + Eval("Gimg") %>'>
                <div class="container">
                    <div class="row">
                        <div class="col-xl-5 col-lg-7 col-md-8">
                            <div class="hero__text">
                                <h6><%# Eval("GHeading") %></h6>
                                <h2><%# Eval("GHeading") %></h2>
                                <p>A specialist label creating luxury essentials. Ethically crafted with an unwavering
                                commitment to exceptional quality.</p>
                                <a href="Shop.aspx" class="primary-btn">Shop now <span class="arrow_right"></span></a>
                                <div class="hero__social">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

                </ItemTemplate>
         </asp:Repeater>


         <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:data_stu6ConnectionString %>' SelectCommand="SELECT * FROM [Gallery_Master] WHERE ([GType] = @Banner)">
             <SelectParameters>
                 <asp:Parameter DefaultValue="Banner" Name="Banner" Type="String"></asp:Parameter>
             </SelectParameters>
         </asp:SqlDataSource>
        
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Banner Section Begin -->
    <section class="banner spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 offset-lg-4">
                    <div class="banner__item">
                        <div class="banner__item__pic">
                            <img src="img/banner/banner-1.jpg" alt="">
                        </div>
                        <div class="banner__item__text">
                            <h2>Clothing Collections 2023</h2>
                            <a href="Shop.aspx">Shop now</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="banner__item banner__item--middle">
                        <div class="banner__item__pic">
                            <img src="img/dist/pexels-pixabay-264726.jpg" />
                        </div>
                        <div class="banner__item__text">
                            <h2>Accessories</h2>
                            <a href="#">Shop now</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-7">
                    <div class="banner__item banner__item--last">
                        <div class="banner__item__pic">
                           <img src="img/dist/pexels-ron-lach-10558182.jpg"  height="600px" width="500px"/>
                        </div>
                        <div class="banner__item__text">
                            <h2>Shoes Spring 2023</h2>
                            <a href="#">Shop now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Banner Section End -->

    <!-- Product Section Begin -->
    <section class="x`x">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <ul class="filter__controls">
                        <li class="active" data-filter="*">Best Sellers</li>
                        <li data-filter=".new-arrivals">New Arrivals</li>
                        <li data-filter=".hot-sales">Hot Sales</li>
                    </ul>
                </div>
            </div>
            <div class="row product__filter">
                <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                    <ItemTemplate>

                                        <div  class="product__item__pic set-bg <%# Eval("pcttype") %>" data-setbg='<%# "img/product/" + Eval("pimg") %>' >
                                            <ul class="product__hover">
                                                <li><img src="img/icon/heart.png" alt=""></li>
                                                <li><img src="img/icon/compare.png" alt=""><span>Compare</span></li>
                                                <li><img src="img/icon/search.png" alt=""></li>
                                            </ul>
                                        </div>

                        <div class="col-lg-3 col-md-6 col-sm-6 col-md-?6 col-sm-6 mix <%# Eval("Category") %>">
                            <div class="product__item">
                         <asp:LinkButton ID="LinkButton5" runat="server" CommandName="View" CommandArgument='<%# Eval("pid") %>'>
                                <div class="product__item__pic set-bg" data-setbg='<%# "img/product/" + Eval("pimg") %>'>
                                    <span class="label">New</span>
                                    <ul class="product__hover">
                                        <li><img src="img/icon/heart.png" alt=""></li>
                                        <li><img src="img/icon/compare.png" alt="">
                                            <span>Compare</span></li>
                                        <li><img src="img/icon/search.png" alt=""></li>
                                    </ul>
                                </div>
                        </asp:LinkButton>
                                <div class="product__item__text">
                                    <h6><%# Eval("pname") %></h6>
                                    <a href="#" class="add-cart">+ Add To Cart</a>
                                    <div class="rating">
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                    </div>
                                    <h5>₹<%# Eval("pprice") %></h5>
                                    <div class="product__color__select">
                                        <label for="pc-1">
                                            <input type="radio" id="pc-1">
                                        </label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label class="active black" for="pc-2"><input type="radio" id="pc-2">
                                        </label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label class="grey" for="pc-3"><input type="radio" id="pc-3">
                                        </label>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:data_stu6ConnectionString %>' SelectCommand="SELECT top 8 * FROM [product_master]"></asp:SqlDataSource>
            </div>
        </div>
    </section>
    <!-- Product Section End -->


    <!-- Instagram Section Begin -->
    <section class="instagram spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="instagram__pic">
                        <div class="instagram__pic__item set-bg" data-setbg="img/instagram/instagram-1.jpg"></div>
                        <div class="instagram__pic__item set-bg" data-setbg="img/instagram/instagram-2.jpg"></div>
                        <div class="instagram__pic__item set-bg" data-setbg="img/instagram/instagram-3.jpg"></div>
                        <div class="instagram__pic__item set-bg" data-setbg="img/instagram/instagram-4.jpg"></div>
                        <div class="instagram__pic__item set-bg" data-setbg="img/instagram/instagram-5.jpg"></div>
                        <div class="instagram__pic__item set-bg" data-setbg="img/instagram/instagram-6.jpg"></div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div>
                        <h2>Instagram</h2> <br /> <br />
                        <p>Welcome to our shirt shop, where style meets comfort and quality. Step into a world of endless possibilities as you explore our wide range of shirts, meticulously crafted to cater to your fashion needs. From classic and timeless designs to the latest trends, we have a shirt for every occasion and personal style.</p> <br /> 
                        <h3>#Planet_Nx</h3>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Instagram Section End -->

    <!-- Latest Blog Section Begin -->
    <section class="latest spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <span>Latest News</span>
                        <h2>Fashion New Trends</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic set-bg" data-setbg="img/blog/blog-1.jpg"></div>
                        <div class="blog__item__text">
                            <span><img src="img/icon/calendar.png" alt=""> 16 February 2020</span>
                            <h5>What Curling Irons Are The Best Ones</h5>
                            <a href="blog.aspx">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic set-bg" data-setbg="img/blog/blog-2.jpg"></div>
                        <div class="blog__item__text">
                            <span><img src="img/icon/calendar.png" alt=""> 21 February 2020</span>
                            <h5>Eternity Bands Do Last Forever</h5>
                            <a href="blog.aspx">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic set-bg" data-setbg="img/blog/blog-3.jpg"></div>
                        <div class="blog__item__text">
                            <span><img src="img/icon/calendar.png" alt=""> 28 February 2020</span>
                            <h5>The Health Benefits Of Sunglasses</h5>
                            <a href="blog.aspx">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Latest Blog Section End -->
</asp:Content>

