
Partial Class profile
    Inherits System.Web.UI.Page

    Private Sub profile_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then

            loaddata()
        End If

    End Sub

    Private Sub loaddata()
        Dim d As New DAO

        Dim ds As Data.DataSet = d.getData("select * from user_master where uid= '" & Session("User_id") & "'")


        If (ds.Tables(0).Rows.Count > 0) Then

            inputUsername.Text = ds.Tables(0).Rows(0).Item("uname")
            inputPhone.Text = ds.Tables(0).Rows(0).Item("uphone")
            inputEmailAddress.Text = ds.Tables(0).Rows(0).Item("uaddress")
            inputState.Text = ds.Tables(0).Rows(0).Item("ustate")
            inputCity.Text = ds.Tables(0).Rows(0).Item("ucity")
            inputpincode.Text = ds.Tables(0).Rows(0).Item("upincode")
            inputEmailAddress.Text = ds.Tables(0).Rows(0).Item("uemail")
            inputPhone.Text = ds.Tables(0).Rows(0).Item("uphone")


        Else
        End If
    End Sub

    Private Sub save_Click(sender As Object, e As EventArgs) Handles save.Click

        Dim d As New DAO

        d.insertData("update user_master set uname='" & inputUsername.Text & "',uphone='" & inputPhone.Text & "' , uemail='" & inputEmailAddress.Text & "', upincode='" & inputpincode.Text & "', ustate='" & inputState.Text & "', ucity='" & inputCity.Text & "' where uid=" & Session("User_id") & "")
        MsgBox("Data Updated")

        loaddata()
    End Sub

    Private Sub btnimg_Click(sender As Object, e As EventArgs) Handles btnimg.Click
        Dim fname As String = FileUpload1.FileName
        Dim d As New DAO
        If FileUpload1.HasFile Then

            If System.IO.File.Exists(Server.MapPath("img/profiles/") & fname) Then
                System.IO.File.Delete(Server.MapPath("img/profiles/") & fname)

            End If
            fname = FileUpload1.FileName
            If fname.EndsWith("jpg") Or fname.EndsWith("png") Or fname.EndsWith("jpeg") Then
                FileUpload1.SaveAs(Server.MapPath("img/profiles/") & fname)
                Session("proimg") = fname
            End If
            d.insertData("update user_master set uimg='" & fname & "' where uid=" & Session("User_id") & "")
        End If
    End Sub
End Class
