
Partial Class Shopping_Cart
    Inherits System.Web.UI.Page

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs)
        Dim lnk As LinkButton = CType(sender, LinkButton)
        Dim d As New DAO
        d.insertData("Delete From Cart_Master where id = '" & lnk.CommandArgument & "'")
        Shopping_Cart_Load(sender, e)
        Repeater1.DataBind()
    End Sub

    Private Sub Shopping_Cart_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim d As New DAO
        Dim ds As Data.DataSet = d.getData("SELECT * FROM [Cart_Master], [Product_Master] WHERE ([User_id] = '" & Session("User_id") & "') and Cart_Master.pid = Product_Master.pid")

        Dim i As Integer = ds.Tables(0).Rows.Count - 1
        Dim totals As Double = 0
        Dim qty As Integer = 0
        While i >= 0
            totals += ((ds.Tables(0).Rows(i).Item("pprice") * ds.Tables(0).Rows(i).Item("Quantity")))
            qty += ds.Tables(0).Rows(i).Item("Quantity")
            i -= 1
        End While
        Session("buy_btn") = 0
        qty_hidden.Value = qty
        HiddenField1.Value = totals
    End Sub

    Private Sub Apply_Click(sender As Object, e As EventArgs) Handles Apply.Click
        Dim d As New DAO
        Dim ds As Data.DataSet = d.getData("Select * from Coupon_Master where coupon_code = '" & coupanCode.Value & "' and Status = 'Enabled'")
        If ds.Tables(0).Rows.Count > 0 Then
            Dim value As Double = HiddenField1.Value
            HiddenField1.Value -= ds.Tables(0).Rows(0).Item("discount")
            If HiddenField1.Value < 0 Then
                HiddenField1.Value = value
            End If
            Session("Discount") = ds.Tables(0).Rows(0).Item("discount")
            Session("Discount_Code") = ds.Tables(0).Rows(0).Item("coupon_code")
            If Session("Coupon_Flag") = 0 Then
                d.insertData("Update Coupon_Master set uses_per_coupon -= 1")
                Session("Coupon_Flag") = 1
            End If
        End If
    End Sub
End Class
