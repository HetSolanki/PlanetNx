
Partial Class Wishlist
    Inherits System.Web.UI.Page


    Public Sub LinkButton1_Click(sender As Object, e As EventArgs)
        Dim lnk As LinkButton = CType(sender, LinkButton)
        Session("pid") = lnk.CommandArgument
        Response.Redirect("Shop_Details.aspx")
    End Sub
    Protected Sub LinkButton2_Click(sender As Object, e As EventArgs)
        Dim lnk As LinkButton = CType(sender, LinkButton)
        Dim d As New DAO
        d.insertData("Delete From Wishlist_Master where id = " & lnk.CommandArgument & "")
        Repeater1.DataBind()
    End Sub

    Private Sub SqlDataSource1_Selected(sender As Object, e As SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Selected
        If e.AffectedRows < 1 Then
            empty_wishlist.Visible = True
        End If
    End Sub
End Class
