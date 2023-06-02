
Partial Class Admin_passwordchange
    Inherits System.Web.UI.Page

    Private Sub check_Click(sender As Object, e As EventArgs) Handles check.Click
        If apass.Text <> "" Then
            If arepass.Text <> "" Then
                If apass.Text = arepass.Text Then
                    Dim d As New DAO
                    d.insertData("Update admin_master set apass= '" & apass.Text & "' where aname = '" & CType(PreviousPage.FindControl("aname"), TextBox).Text & "'")
                    Response.Redirect("Admin_Login.aspx")
                Else
                    MsgBox("Password Dosen't Matched")
                End If
            Else
                MsgBox("Enter Confirmation Password")
            End If
        Else
            MsgBox("Enter New Password")
        End If
    End Sub
End Class
