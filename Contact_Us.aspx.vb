
Partial Class Contact_Us
    Inherits System.Web.UI.Page

    Private Sub btnsub_Click(sender As Object, e As EventArgs) Handles btnsub.Click
        Dim d As New DAO

        d.insertData("insert into contact_us values('" & c_name.Text & "','" & email.Text & "', '" & msg.Text & "')")
        c_name.Text = ""
        email.Text = ""
        msg.Text = ""
    End Sub
End Class
