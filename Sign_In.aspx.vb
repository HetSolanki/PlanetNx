
Partial Class Sign_In
    Inherits System.Web.UI.Page

    Protected Sub signin_Click(sender As Object, e As EventArgs) Handles signin.Click
        Dim d As New DAO

        If (your_name.Value <> "" AndAlso your_pass.Value <> "") Then

            Dim ds As Data.DataSet = d.getData("select uname, upass, uid, uimg from user_master where uname= '" & your_name.Value & "' and upass= '" & your_pass.Value & "' ")


            If (ds.Tables(0).Rows.Count > 0) Then
                Session("Cart_id") = 0
                Session("flag") = 1
                Session("uname") = ds.Tables(0).Rows(0).Item("uname")
                Session("User_id") = ds.Tables(0).Rows(0).Item("uid")
                Session("proimg") = ds.Tables(0).Rows(0).Item("uimg")
                Session("Coupon_Flag") = 0
                Session("Discount") = 0
                Response.Redirect("default.aspx")
            Else
                Session("flag") = 0
                cancel.Visible = True
            End If
        Else
            cancel.Visible = True
        End If

    End Sub

    'Private Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
    '    Session("stat") = "show"
    '    Response.Redirect("Default.aspx")
    'End Sub

End Class
