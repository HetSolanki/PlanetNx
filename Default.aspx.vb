
Partial Class _Default
    Inherits System.Web.UI.Page

    Private Sub Repeater2_ItemCommand(source As Object, e As RepeaterCommandEventArgs) Handles Repeater2.ItemCommand
        If e.CommandName = "View" Then
            Session("pid") = e.CommandArgument
            Response.Redirect("Shop_details.aspx")
        End If
    End Sub


End Class
