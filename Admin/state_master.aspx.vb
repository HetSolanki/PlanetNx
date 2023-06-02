
Partial Class General
    Inherits System.Web.UI.Page
    Dim dao As New DAO
    Private Sub Save_Click(sender As Object, e As EventArgs) Handles Save.Click
        Try

            Dim check As Integer = dao.validate("select * from states_master where state_name='" & state.Value & "'")
            If check = 1 Then
                ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "showDisplay();", True)

            Else
                If Session("Flag") = 0 Then

                    SqlDataSource2.InsertParameters("state_name").DefaultValue = state.Value
                    SqlDataSource2.Insert()
                    state.Value = ""

                    state.Focus()
                Else
                    SqlDataSource2.UpdateParameters("state_name").DefaultValue = state.Value
                    SqlDataSource2.UpdateParameters("state_id").DefaultValue = sid.Value
                    SqlDataSource2.Update()
                    Session("Flag") = 0
                    sid.Value = ""
                    state.Value = ""
                    state.Focus()
                End If
            End If
            state_Master.DataBind()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub state_Master_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles state_Master.RowDataBound
        If (e.Row.RowType = DataControlRowType.Header) Then
            e.Row.TableSection = TableRowSection.TableHeader
        End If
    End Sub

    Private Sub state_Master1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles state_Master.RowCommand
        If e.CommandName = "Delete1" Then
            SqlDataSource2.DeleteParameters("state_id").DefaultValue = e.CommandArgument

            SqlDataSource2.Delete()
            state_Master.DataBind()
        ElseIf e.CommandName = "add_city" Then
            Session("p_city") = e.CommandArgument
            Response.Redirect("City_Master.aspx")
        End If
        state_Master.DataBind()


    End Sub

    Private Sub state_Master_Load(sender As Object, e As EventArgs) Handles state_Master.Load
        If Not Page.IsPostBack Then
            Session.Add("Flag", 0)
        End If
    End Sub
    Protected Sub btnedit_Click(sender As Object, e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
        Dim index As Integer = gvRow.RowIndex
        sid.Value = state_Master.Rows(index).Cells(0).Text
        state.Value = state_Master.Rows(index).Cells(1).Text
        Session("Flag") = 1
        state.Focus()
    End Sub

    Private Sub New_Click(sender As Object, e As EventArgs) Handles [New].Click
        state.Value = ""
        Session("Flag") = 0
    End Sub


End Class
