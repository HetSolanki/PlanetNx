
Partial Class Order_List
    Inherits System.Web.UI.Page


    Private Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView1.RowCommand
        If e.CommandName = "order_id" Then
            Session("Cart_id") = e.CommandArgument
            'Dim d As New DAO
            'Dim ds As Data.DataSet = d.getData("Select * from Order_Summary where card_id = '" & Session("Cart_id") & "'")
            'Session("Order_id") = ds.Tables(0).Rows(0).Item("id")
            Response.Redirect("Order_details.aspx")
        ElseIf e.CommandName = "Cancel" Then
            Dim d As New DAO
            d.insertData("Delete From Order_Summary where Cart_id = " & e.CommandArgument & " and uid = " & Session("User_id") & "")
            d.insertData("Delete From Order_Table where Cart_id = " & e.CommandArgument & " and uid = " & Session("User_id") & "")
            GridView1.DataBind()
        End If
    End Sub

    Private Sub SqlDataSource1_Selected(sender As Object, e As SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Selected
        If e.AffectedRows < 1 Then
            empty_orders.Visible = True
        End If
    End Sub
End Class
