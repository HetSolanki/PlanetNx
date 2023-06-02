
Partial Class Home_Page
    Inherits System.Web.UI.Page

    Private Sub Home_Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Session("aid") = Session("aid1")

        Dim d As New DAO
        Dim ds As Data.DataSet = d.getData("select count(id) from Order_table")
        order_no.InnerText = ds.Tables(0).Rows(0).Item(0)

        Dim oid As Integer = ds.Tables(0).Rows(0).Item(0)

        ds = d.getData("select count(uid) from user_master")
        c_name.InnerText = ds.Tables(0).Rows(0).Item(0)

        ds = d.getData("select count(pid) from product_master")
        product.InnerText = ds.Tables(0).Rows(0).Item(0)

        ds = d.getData("select count(pid) from wishlist_Master")
        likes.InnerText = ds.Tables(0).Rows(0).Item(0)

        ds = d.getData("select sum(pprice * Quantity) from Order_Table, Product_Master where Order_Table.pid = Product_Master.pid")
        total_sale.InnerText = "₹" & ds.Tables(0).Rows(0).Item(0)

        total_Visiters.InnerText = Application("Count")

    End Sub

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs)
        Dim lnk As LinkButton = CType(sender, LinkButton)
        Session("Order_id") = lnk.CommandArgument
        Response.Redirect("Order_view.aspx")
    End Sub
End Class
