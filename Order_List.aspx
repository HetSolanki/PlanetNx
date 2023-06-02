
<%@ Page Title="" Language="VB" MasterPageFile="~/Masterpage.master" AutoEventWireup="false" CodeFile="Order_List.aspx.vb" Inherits="Order_List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | DataTables</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="../../plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="../../plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="../../plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <center>

        <!-- Main content -->
                    
                    <div class="col-8" style="margin-top: 5em;">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">Your Order</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <table id="example1" class="table table-bordered table-hover">
                                    <tr id="empty_orders" runat="server" visible="false" style="text-align: center;">
                                     <td>
                                         <h5 style="color: darkred;">You Have No Any Orders</h5>
                                    </td>  
                                     </tr>
                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" CssClass="table table-bordered table-striped">

                                            <Columns>
                                                <asp:BoundField DataField="id" HeaderText="Order-id" ReadOnly="True" SortExpression="id"></asp:BoundField>
                                                <asp:BoundField DataField="uid" HeaderText="uid" SortExpression="uid" Visible="false"></asp:BoundField>
                                                <asp:BoundField DataField="Cart_id" HeaderText="Cart Id" SortExpression="Cart_id" Visible="false"></asp:BoundField>
                                                <asp:BoundField DataField="Order_date" HeaderText="GST" SortExpression="GST" Visible="false"></asp:BoundField>
                                                <asp:TemplateField HeaderText="Order-Detail">
                                                    <ItemTemplate>
                                                        <asp:button text="View Order" runat="server" CssClass="btn primary-btn" CommandName="order_id" CommandArgument='<%#Eval("Cart_id") %>' ID="button1"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Cancel Order">
                                                    <ItemTemplate>
                                                        <asp:button text="Cancel" runat="server" CssClass="btn btn-danger" CommandName="Cancel" CommandArgument='<%#Eval("Cart_id") %>' ID="button2"/>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>

                                        <!-- /.card-header -->
                                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:data_stu6ConnectionString %>' SelectCommand="SELECT * FROM [Order_Summary] where uid = @User_id">
                                         <SelectParameters>
                                           <asp:SessionParameter SessionField="User_id" DefaultValue="0" Name="User_id" Type="Int32"></asp:SessionParameter>
                                        </SelectParameters>
                                        </asp:SqlDataSource>                                                   
                                </table>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
    </center>
</asp:Content>

