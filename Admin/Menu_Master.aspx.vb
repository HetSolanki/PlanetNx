
Partial Class Menu_master
    Inherits System.Web.UI.Page
    Dim dao As New DAO
    Private Sub Save_Click(sender As Object, e As EventArgs) Handles Save.Click
        Try

            Dim check As Integer = dao.validate("select * from menu_master where menu_name='" & txtname.Value & "' AND menu_url='" & txturl.Value & "'")
            If check = 1 Then
                ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "showDisplay();", True)
            Else
                If Session("Flag") = 0 Then
                    SqlDataSource1.InsertParameters("menu_name").DefaultValue = txtname.Value
                    SqlDataSource1.InsertParameters("menu_url").DefaultValue = txturl.Value

                    SqlDataSource1.Insert()
                    txtname.Value = ""

                    txturl.Value = ""
                    txtname.Focus()

                Else
                    SqlDataSource1.UpdateParameters("menu_name").DefaultValue = txtname.Value
                    SqlDataSource1.UpdateParameters("menu_url").DefaultValue = txturl.Value

                    SqlDataSource1.UpdateParameters("original_menu_id").DefaultValue = menu_id.Value
                    SqlDataSource1.Update()
                    Session("Flag") = 0
                    txtname.Value = ""

                    txturl.Value = ""
                    txtname.Focus()
                End If
            End If
            menu_master.DataBind()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub menu_master_Prerender(sender As Object, e As EventArgs) Handles menu_master.PreRender
        menu_master.UseAccessibleHeader = True
        menu_master.HeaderRow.TableSection = TableRowSection.TableHeader
    End Sub

    Private Sub menu_master_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles menu_master.RowCommand
        If e.CommandName = "Delete1" Then
            SqlDataSource1.DeleteParameters("original_menu_id").DefaultValue = e.CommandArgument
            SqlDataSource1.Delete()
            menu_master.DataBind()
        End If
    End Sub



    Protected Sub btnedit_Click(sender As Object, e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
        Dim index As Integer = gvRow.RowIndex
        menu_id.Value = menu_master.Rows(index).Cells(0).Text
        txtname.Value = menu_master.Rows(index).Cells(1).Text
        txturl.Value = menu_master.Rows(index).Cells(2).Text

        Session("Flag") = 1
        txtname.Focus()
    End Sub

    Private Sub menu_master_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles menu_master.RowDataBound
        If (e.Row.RowType = DataControlRowType.Header) Then
            e.Row.TableSection = TableRowSection.TableHeader
        End If
    End Sub

    Private Sub New_Click(sender As Object, e As EventArgs) Handles [New].Click
        txtname.Value = ""

        txturl.Value = ""
        Session("Flag") = 0
    End Sub
End Class
