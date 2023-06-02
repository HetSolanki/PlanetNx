
Partial Class Masterpage
    Inherits System.Web.UI.MasterPage

    Private Sub Masterpage_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Session("User_id") Is Nothing Then
            Response.Redirect("Sign_In.aspx")
        Else
            s2.Visible = False
        End If
        'If Session("flag") = 1 Then
        '    ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "remove_login();", True)
        'End If
        'If (Session("uname") <> "") Then
        '    label1.Text = Session("uname")
        'End If

        'If (Session("stat") = "show") Then
        '    s2.Visible = False
        'Else
        '    s2.Visible = True

        'End If


    End Sub
End Class

