<%@ Page Title="" Language="VB" MasterPageFile="~/Masterpage.master" AutoEventWireup="false" CodeFile="Wishlist.aspx.vb" Inherits="Wishlist" %>

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
                        <h4>Wishlist</h4>
                        <div class="breadcrumb__links">
                            <a href="./Default.aspx">Home</a>
                            <span>Wishlist</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shopping Cart Section Begin -->
    <section class="shopping-cart span" style="margin: 5em 0em">
        <div class="container">
            <div class="row" style="display: flex; justify-content: center;">
                <div class="col-lg-8">
                    <div class="shopping__cart__table">
                        <table>
                            <thead>
                                <tr style="text-align: center;">
                                    <td colspan="3">
                                        <h3 style="font-weight: bold">Your Wishlist</h3>
                                    </td>
                                </tr>
                            </thead>
                            <tbody>
                            <tr id="empty_wishlist" runat="server" visible="false" style="text-align: center;">
                                <td>
                                    <h5 style="color: darkred;">No Wishlist Products</h5>
                                </td>  
                            </tr>
         <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
             <ItemTemplate>
                <tr>
                 <td class="product__cart__item">
                     <div class="product__cart__item__pic">
                         <img src='<%# "img/product/" + Eval("pimg") %>' alt="" height="90" width="90">
                     </div>
                     <div class="product__cart__item__text">
                         <h4><%# Eval("pname") %></h4>
                         <h6>Review</h6>
                     </div>
                 </td>
                 <td>
                     <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" CommandName="pid" CommandArgument='<%# Eval("pid") %>'>See All Buying Options</asp:LinkButton>
                 </td>
                 <td class="cart__close" runat="server" id="Cancel" >
                     <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" CommandArgument='<%#Eval("id") %>' CommandName="wishlist_id">
                        <i class="fa fa-close"></i>
                     </asp:LinkButton>
                 </td>
                </tr>

             </ItemTemplate>
         </asp:Repeater>
         <asp:HiddenField ID="qty_hidden" runat="server" />
                 <asp:HiddenField ID="HiddenField1" runat="server" value ='<%#Eval("Quantity") * Eval("pprice") %>'/>

                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:data_stu6ConnectionString %>' SelectCommand="SELECT * FROM [Wishlist_Master], Product_Master WHERE ([uid] = @uid) and Wishlist_Master.pid = Product_Master.pid">
                                    <SelectParameters>
                                        <asp:SessionParameter SessionField="User_id" DefaultValue="0" Name="uid" Type="Int32"></asp:SessionParameter>
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
            </div>
        </div>
    </section>
    <!-- Shopping Cart Section End -->
</asp:Content>

