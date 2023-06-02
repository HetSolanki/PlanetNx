Partial Class Sign_Up
    Inherits System.Web.UI.Page


    Private Sub Register_Click(sender As Object, e As EventArgs) Handles Register.Click
        Dim d As New DAO
        d.insertData("insert into user_master(uname,upass,uphone,uemail) values('" & name.Value & "','" & pass.Value & "' ,'" & your_phone.Value & "','" & email.Text & "' )")
        Response.Redirect("Sign_In.aspx")
    End Sub
End Class
