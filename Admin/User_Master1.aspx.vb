
Partial Class General
  Inherits System.Web.UI.Page

    Private Sub Save_Click(sender As Object, e As EventArgs) Handles Save.Click
        Try
            If Session("Flag") = 0 Then

                If upic.HasFile Then

                    Dim fname As String = upic.FileName

                    If fname.EndsWith("jpg") Or fname.EndsWith("png") Then
                        upic.SaveAs(Server.MapPath("../img/profiles/") & fname)
                    End If


                    SqlDataSource1.InsertParameters("uname").DefaultValue = uname.Value
                    SqlDataSource1.InsertParameters("upass").DefaultValue = upass.Value
                    SqlDataSource1.InsertParameters("uphone").DefaultValue = uphone.Value
                    SqlDataSource1.InsertParameters("uemail").DefaultValue = uemail.Value
                    SqlDataSource1.InsertParameters("upincode").DefaultValue = upincode.Value
                    SqlDataSource1.InsertParameters("ustate").DefaultValue = ustate.Value
                    SqlDataSource1.InsertParameters("ucity").DefaultValue = ucity.Value
                    SqlDataSource1.InsertParameters("uaddress").DefaultValue = uaddress.Value
                    SqlDataSource1.InsertParameters("uimg").DefaultValue = fname
                    SqlDataSource1.Insert()
                    uname.Value = ""
                    upass.Value = ""
                    uphone.Value = ""
                    uemail.Value = ""
                    upincode.Value = ""
                    ustate.Value = ""
                    ucity.Value = ""
                    uaddress.Value = ""
                    lblimg.Text = ""
                    Label1.Text = ""
                    uname.Focus()
                    Session("Flag") = 1
                Else
                    Label1.Text = "Select Valid Profile Image"

                End If

            Else

                Dim fname As String = lblimg.Text
                If upic.HasFile Then

                    If System.IO.File.Exists(Server.MapPath("../img/profiles/") & fname) Then
                        System.IO.File.Delete(Server.MapPath("../img/profiles/") & fname)
                        lblimg.Text = ""
                        fname = upic.FileName
                    End If
                    If fname.EndsWith("jpg") Or fname.EndsWith("png") Then
                        upic.SaveAs(Server.MapPath("../img/profiles/") & fname)
                    End If

                End If
                SqlDataSource1.UpdateParameters("uname").DefaultValue = uname.Value
                SqlDataSource1.UpdateParameters("upass").DefaultValue = upass.Value
                SqlDataSource1.UpdateParameters("uphone").DefaultValue = uphone.Value
                SqlDataSource1.UpdateParameters("uemail").DefaultValue = uemail.Value
                SqlDataSource1.UpdateParameters("upincode").DefaultValue = upincode.Value
                SqlDataSource1.UpdateParameters("ustate").DefaultValue = ustate.Value
                SqlDataSource1.UpdateParameters("ucity").DefaultValue = ucity.Value
                SqlDataSource1.UpdateParameters("uaddress").DefaultValue = uaddress.Value
                SqlDataSource1.UpdateParameters("uid").DefaultValue = uid.Value
                SqlDataSource1.UpdateParameters("uimg").DefaultValue = fname
                SqlDataSource1.Update()
                Session("Flag") = 0
                Label1.Text = ""
                If Session("uname") = uname.Value Then
                    Session("Image") = fname
                End If

                uid.Value = ""
                uname.Value = ""
                upass.Value = ""
                uphone.Value = ""
                uemail.Value = ""
                upincode.Value = ""
                ustate.Value = ""
                ucity.Value = ""
                uaddress.Value = ""
                lblimg.Text = ""
                uname.Focus()


            End If
            User_Table.DataBind()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub Gridview1_Prerender(sender As Object, e As EventArgs) Handles User_Table.PreRender
        User_Table.UseAccessibleHeader = True
        User_Table.HeaderRow.TableSection = TableRowSection.TableHeader
    End Sub

    Private Sub Admin_Master_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles User_Table.RowCommand
        If e.CommandName = "Delete1" Then


            Dim d As New DAO
            Dim obj As Data.DataSet = d.getData("Select uimg from User_Master where uid='" & e.CommandArgument & "'")

            Dim fname As String = lblimg.Text
            If fname <> "" Then
                fname = obj.Tables(0).Rows(0).Item("uimg")
                System.IO.File.Delete(Server.MapPath("../img/profiles/") & fname)
            End If

            SqlDataSource1.DeleteParameters("uid").DefaultValue = e.CommandArgument
            SqlDataSource1.Delete()
            User_Table.DataBind()
        End If
    End Sub

    Private Sub Admin_Table_Load(sender As Object, e As EventArgs) Handles User_Table.Load
        If Not Page.IsPostBack Then
            Session.Add("Flag", 0)
        End If
    End Sub
    Protected Sub btnedit_Click(sender As Object, e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
        Dim index As Integer = gvRow.RowIndex
        uid.Value = User_Table.Rows(index).Cells(0).Text
        uname.Value = User_Table.Rows(index).Cells(1).Text
        upass.Value = User_Table.Rows(index).Cells(2).Text
        uphone.Value = User_Table.Rows(index).Cells(3).Text
        uemail.Value = User_Table.Rows(index).Cells(4).Text
        upincode.Value = User_Table.Rows(index).Cells(5).Text
        ustate.Value = User_Table.Rows(index).Cells(6).Text
        ucity.Value = User_Table.Rows(index).Cells(7).Text
        uaddress.Value = User_Table.Rows(index).Cells(8).Text
        lblimg.Text = User_Table.Rows(index).Cells(9).Text
        'Session("Image") = lblimg.Text

        If upincode.Value = "&nbsp;" Then
            upincode.Value = ""
        End If
        If ustate.Value = "&nbsp;" Then
            ustate.Value = ""
        End If
        If ucity.Value = "&nbsp;" Then
            ucity.Value = ""
        End If
        If uaddress.Value = "&nbsp;" Then
            uaddress.Value = ""
        End If
        Session("Flag") = 1

        uname.Focus()

    End Sub

    Private Sub Admin_Table_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles User_Table.RowDataBound
        If (e.Row.RowType = DataControlRowType.Header) Then
            e.Row.TableSection = TableRowSection.TableHeader
        End If
    End Sub

    Private Sub new_Click(sender As Object, e As EventArgs) Handles [new].Click
        uname.Value = ""
        upass.Value = ""
        uphone.Value = ""
        uemail.Value = ""
        upincode.Value = ""
        ustate.Value = ""
        ucity.Value = ""
        uaddress.Value = ""
        lblimg.Text = ""
        Session("flag") = 0
        uname.Focus()
        Label1.Text = ""
    End Sub
End Class
