<%@ Page Title="" Language="VB" MasterPageFile="Admin.master" AutoEventWireup="false" CodeFile="Home_Page.aspx.vb" Inherits="Home_Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback"/>
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css"/>
    <!-- DataTables -->
    <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css"/>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <div class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1 class="m-0">Dashboard</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="Home_Page.aspx">Home</a></li>
                <li class="breadcrumb-item active">Dashboard v2</li>
              </ol>
            </div><!-- /.col -->
          </div><!-- /.row -->
        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content-header -->

          <!-- Main content -->
      <section class="content">
        <div class="container-fluid">
          <!-- Info boxes -->
          <div class="row">
            <div class="col-12 col-sm-6 col-md-3">
              <div class="info-box">
                <span class="info-box-icon bg-info elevation-1"><i class="fas fa-cog"></i></span>

                <div class="info-box-content">
                  <span class="info-box-text">Orders</span>
                  <span class="info-box-number" id="order_no" runat="server">0</span>
                </div>
                <!-- /.info-box-content -->
              </div>
              <!-- /.info-box -->
            </div>
            <!-- /.col -->
            <div class="col-12 col-sm-6 col-md-3">
              <div class="info-box mb-3">
                <span class="info-box-icon bg-danger elevation-1"><i class="fas fa-thumbs-up"></i></span>

                <div class="info-box-content">
                  <span class="info-box-text" >Likes</span>
                  <span class="info-box-number" id="likes" runat="server">41,410</span>
                </div>
                <!-- /.info-box-content -->
              </div>
              <!-- /.info-box -->
            </div>
            <!-- /.col -->

            <!-- fix for small devices only -->
            <div class="clearfix hidden-md-up"></div>

            <div class="col-12 col-sm-6 col-md-3">
              <div class="info-box mb-3">
                <span class="info-box-icon bg-success elevation-1"><i class="fas fa-shopping-cart"></i></span>

                <div class="info-box-content">
                  <span class="info-box-text">Products</span>
                  <span class="info-box-number" id="product" runat="server">760</span>
                </div>
                <!-- /.info-box-content -->
              </div>
              <!-- /.info-box -->
            </div>
            <!-- /.col -->
            <div class="col-12 col-sm-6 col-md-3">
              <div class="info-box mb-3">
                <span class="info-box-icon bg-warning elevation-1"><i class="fas fa-users"></i></span>

                <div class="info-box-content">
                  <span class="info-box-text">Total Users</span>
                  
        <span class="info-box-number" id="c_name" runat="server">2,000</span>
                </div>
                <!-- /.info-box-content -->
              </div>
              <!-- /.info-box -->
            </div>
            <!-- /.col -->
          </div>
          <!-- /.row -->      
          <!-- /.row -->

          <!-- Main row -->
          <div class="row">
            <!-- Left col -->
                <div class="col-md-8">
                    <div class="card">
                <div class="card-header border-transparent">
                  <h3 class="card-title">Latest Orders</h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body p-0">
                  <div class="table-responsive">
                    <table class="table m-0">
                      <thead>
                        <tr>
                          <th>Order ID</th>
                            <th>Item</th>
                            <th>Status</th>
                            <th>Order Date</th>
                        </tr>
                      </thead>
                          <tbody>
                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <asp:LinkButton runat="server" id="LinkButton1" onClick="LinkButton1_Click" CommandName="Cart_id" CommandArgument='<%# Eval("id") %>'>
                                                OR<%# Eval("id") %>
                                            </asp:LinkButton>
                                        </td>
                                        <td><%# Eval("uname") %></td>
                                        <td><span class='<%# eval("className") %>'><%#Eval("status") %></span></td>
                                        <td>
                                            <div class="sparkbar" data-color="#00a65a" data-height="20"><%# Eval("Order_Date") %></div>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                             </asp:Repeater>

            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:data_stu6ConnectionString %>' SelectCommand="SELECT top 10 * FROM [Order_Table], User_Master where Order_Table.uid = User_Master.uid order by Order_Date desc"></asp:SqlDataSource>
                       
                          </tbody>
                    </table>
                  </div>
                  <!-- /.table-responsive -->
                </div>
                <!-- /.card-body -->
                <div class="card-footer clearfix">
                  <a href="Order_master.aspx" class="btn btn-sm btn-info float-left">View All Orders</a>    
                </div>
                <!-- /.card-footer -->
              </div>
                  </div>
                <div class="col-md-4">
                  <!-- USERS LIST -->
                  <!--/.card -->
              <div class="info-box mb-3 bg-warning">
                <span class="info-box-icon"><i class="fas fa-tag"></i></span>

                <div class="info-box-content">
                  <span class="info-box-text">Total Sales</span>
                  <span class="info-box-number" id="total_sale" runat="server">0</span>
                </div>
                <!-- /.info-box-content -->
              </div>

              <div class="info-box mb-3 bg-success">
                <span class="info-box-icon"><i class="far fa-heart"></i></span>

                <div class="info-box-content">
                  <span class="info-box-text">Total Visiters</span>
                  <span class="info-box-number" id="total_Visiters" runat="server">0</span>
                </div>
                <!-- /.info-box-content -->
              </div>
                  <br />
                  <br />
                  <br />
                  <div class="card">
                    <div class="card-header">
                      <h3 class="card-title">Latest Members</h3>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body p-0">
                      <ul class="users-list clearfix">
                          <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                              <ItemTemplate>
                                  <li>
                                  <img src='<%# "../img/profiles/" + Eval("uimg") %>' alt="User Image">
                                  <a class="users-list-name" href="#"><%#Eval("uname") %></a>
                                </li>
                              </ItemTemplate>
                        </asp:Repeater>
                      <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:data_stu6ConnectionString %>' SelectCommand="SELECT top 8 * FROM [user_master]"></asp:SqlDataSource>
                      </ul>
                      <!-- /.users-list -->
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer text-center">
                      <a href="user_master1.aspx">View All Users</a>
                    </div>
                    <!-- /.card-footer -->
                  </div>
                </div>

              <!-- /.info-box -->       
              <!-- /.card -->
            </div>

             <!-- PRODUCT LIST -->
              <div class="card">
                <div class="card-header">
                  <h3 class="card-title">Recently Added Products</h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body p-0">
                  <ul class="products-list product-list-in-card pl-2 pr-2">
                      <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource3">
                          <ItemTemplate>
                              <li class="item">
                              <div class="product-img">
                                <img src='<%# "../img/product/" + Eval("pimg") %>' alt="Product Image" class="img-size-50">
                              </div>
                              <div class="product-info">
                                <a href="Product.aspx" class="product-title"><%# Eval("pname") %>
                                  <span class="badge badge-warning float-right">₹<%# eval("pprice") %></span></a>
                                <span class="product-description">
                                  <%# Eval("pdesc") %>
                                </span>
                              </div>
                            </li>
                          </ItemTemplate>
                      </asp:Repeater>
                      <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:data_stu6ConnectionString %>' SelectCommand="SELECT top 4 * FROM [product_master]"></asp:SqlDataSource>
                  </ul>
                </div>
                <!-- /.card-body -->
                <div class="card-footer text-center">
                  <a href="product.aspx" class="uppercase">View All Products</a>
                </div>
                <!-- /.card-footer -->
              </div>
              <!-- /.card -->
            <!-- /.col -->
            
            <!-- /.col -->
          </div>
          

          <!-- /.row -->
        </section>


        </div><!--/. container-fluid -->

    <%--<script>
        let startNum = 0;
        let endVisiters = <%= Application("Count")%>;
        let endSales = <%= Session("total_sales")%>;
        alert(endSales)
        const duration =  10; // 1000 milliseconds 

        $(document).ready(function () {
            setInterval(() => {
                countUp();  
            }, duration);
            //startNum = 0;
            //setInterval(() => {
            //    countUp1();  
            //}, duration);
            
        });

        function countUp(){ 
         if (startNum <= endVisiters ){   
                document.getElementById('total_Visiters').innerText =  startNum.toLocaleString().toString();
                startNum++;
            }
        }
        function countUp1() { 
         if (startNum <= endSales ){   
                document.getElementById('total_sales').innerText =  startNum.toLocaleString().toString();
                startNum++;
            }
        }
    </script>--%>


</asp:Content>

