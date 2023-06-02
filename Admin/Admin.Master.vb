
Partial Class Admin
    Inherits System.Web.UI.MasterPage

    Private Sub Admin_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("aid") Is Nothing Then
            Response.Redirect("Admin_Login.aspx")
        Else
            isAuthentic()
            SqlDataSource1.DataBind()
        End If
    End Sub

    Private Sub isAuthentic()
        Dim url As String = HttpContext.Current.Request.Url.AbsoluteUri
        Dim a As Array = url.Split("/")

        If a(a.Length - 1) = "Order_view.aspx" OrElse a(a.Length - 1) = "Sub_Category.aspx" OrElse a(a.Length - 1) = "Image_Master.aspx" OrElse a(a.Length - 1) = "product_description_master.aspx" OrElse a(a.Length - 1) = "City_Master.aspx" Then

        Else
            Dim d As New DAO
            Dim flag As Integer = d.validate("Select * from Assign_Role where Menu_url = '" & a(a.Length - 1) & "'")
            If flag = 0 Then
                Response.Redirect("Admin_Login.aspx")
            End If
        End If
    End Sub

    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs)
        Session.Remove("User_id")
        Response.Redirect("Sign_In.aspx")
    End Sub
End Class

