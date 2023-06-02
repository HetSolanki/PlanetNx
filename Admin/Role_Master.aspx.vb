
Partial Class Role_master
    Inherits System.Web.UI.Page
    Dim dao As New DAO
    Private Sub Save_Click(sender As Object, e As EventArgs) Handles Save.Click
        Try

            Dim check As Integer = dao.validate("select * from role_master where role_name='" & txtname.Value & "' AND role_desc='" & txtdesc.Value & "'")
            If check = 1 Then
                ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "showDisplay();", True)
            Else
                If Session("Flag") = 0 Then
                    SqlDataSource1.InsertParameters("role_name").DefaultValue = txtname.Value
                    SqlDataSource1.InsertParameters("role_type").DefaultValue = typedrop.SelectedValue.ToString()
                    SqlDataSource1.InsertParameters("role_desc").DefaultValue = txtdesc.Value
                    SqlDataSource1.Insert()
                    txtname.Value = ""
                    txtdesc.Value = ""
                    txtname.Focus()

                Else
                    SqlDataSource1.UpdateParameters("role_name").DefaultValue = txtname.Value
                    SqlDataSource1.UpdateParameters("role_type").DefaultValue = typedrop.SelectedValue.ToString()
                    SqlDataSource1.UpdateParameters("role_desc").DefaultValue = txtdesc.Value
                    SqlDataSource1.UpdateParameters("original_role_id").DefaultValue = role_id.Value
                    SqlDataSource1.Update()
                    Session("Flag") = 0
                    txtname.Value = ""
                    txtdesc.Value = ""
                    txtname.Focus()
                End If
            End If
            role_master.DataBind()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub role_master_Prerender(sender As Object, e As EventArgs) Handles role_master.PreRender
        role_master.UseAccessibleHeader = True
        role_master.HeaderRow.TableSection = TableRowSection.TableHeader
    End Sub

    Private Sub sub_category_Master_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles role_master.RowCommand
        If e.CommandName = "Delete1" Then
            SqlDataSource1.DeleteParameters("original_role_id").DefaultValue = e.CommandArgument
            SqlDataSource1.Delete()
            role_master.DataBind()
        End If
    End Sub



    Protected Sub btnedit_Click(sender As Object, e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
        Dim index As Integer = gvRow.RowIndex

        txtname.Value = role_master.Rows(index).Cells(2).Text
        typedrop.SelectedIndex = typedrop.Items.IndexOf(typedrop.Items.FindByText(role_master.Rows(index).Cells(1).Text))
        txtdesc.Value = role_master.Rows(index).Cells(3).Text
        role_id.Value = role_master.Rows(index).Cells(0).Text
        Session("Flag") = 1
        txtname.Focus()
    End Sub

    Private Sub role_master_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles role_master.RowDataBound
        If (e.Row.RowType = DataControlRowType.Header) Then
            e.Row.TableSection = TableRowSection.TableHeader
        End If
    End Sub

    Private Sub New_Click(sender As Object, e As EventArgs) Handles [New].Click
        txtname.Value = ""
        txtdesc.Value = ""
        Session("Flag") = 0
    End Sub

    Private Sub Role_master_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub
End Class
