Imports System.Data.SqlClient
Imports System.Net.Mail
Partial Class Admin_forgot
    Inherits System.Web.UI.Page
    Private Sub verify_Click(sender As Object, e As EventArgs) Handles verify.Click
        If otp.Text = Session("otp") Then
            Response.Redirect("passwordchange.aspx")
        Else
            lb.Text = "OTP Dosen't Matched. "
        End If
    End Sub

    'Public s As String = "dhruvprajapati2722@gmail.com"

End Class
