
Partial Class Order_details
    Inherits System.Web.UI.Page

    Private Sub Order_details_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim d As New DAO
        Dim ds As Data.DataSet = d.getData("Select * from User_Master, Order_table, Product_Master where User_Master.uid = '" & Session("User_id") & "' and Order_Table.uid = '" & Session("User_id") & "' and Order_Table.pid = Product_Master.pid and User_Master.uid = Order_Table.uid and Order_Table.Cart_id = '" & Session("Cart_id") & "'")

        Dim i As Integer = ds.Tables(0).Rows.Count - 1
        Dim totals As Double = 0
        Dim qty As Integer = 0
        While i >= 0
            totals += ((ds.Tables(0).Rows(i).Item("pprice") * ds.Tables(0).Rows(i).Item("Quantity")))
            qty += ds.Tables(0).Rows(i).Item("Quantity")
            i -= 1
        End While

        address.InnerHtml = "<strong>" & ds.Tables(0).Rows(0).Item("uname") & "</strong><br>" & ds.Tables(0).Rows(0).Item("uaddress") & "<br><abbr title=Phone>P:</abbr>" & ds.Tables(0).Rows(0).Item("uphone") & ""
            address2.InnerHtml = "<strong>" & ds.Tables(0).Rows(0).Item("uname") & "</strong><br>" & ds.Tables(0).Rows(0).Item("uaddress") & "<br><abbr title=Phone>P:</abbr>" & ds.Tables(0).Rows(0).Item("uphone") & ""

        subtotal.InnerText = "₹" & totals
        totals += 70
        Total.InnerText = "₹" & totals - Session("Discount")
        payment_totals.InnerText = Total.InnerText

        ds = d.getData("Select * from Order_Table where uid = '" & Session("User_id") & "' and cart_id = '" & Session("Cart_id") & "'")
        Order_status.InnerText = ds.Tables(0).Rows(0).Item("status")
        Session("className") = ds.Tables(0).Rows(0).Item("className")
        date1.InnerText = ds.Tables(0).Rows(0).Item("Order_Date")
        order_id.InnerText = "#1612322" & ds.Tables(0).Rows(0).Item("id")
        discount.InnerText = "Discount (Code: " & Session("Discount_Code")
        If Session("Discount") Is Nothing Then
            Discount_Value.InnerText = "-₹0"
        Else
            Discount_Value.InnerText = "-₹" & Session("Discount")

        End If
    End Sub
End Class
