
Partial Class Category_master
    Inherits System.Web.UI.Page
    Dim dao As New DAO
    Private Sub Save_Click(sender As Object, e As EventArgs) Handles Save.Click
        Try
            Dim check As Integer = dao.validate("select * from category_master where ct_name='" & ct_name.Value & "'")
            If check = 1 Then
                ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "showDisplay();", True)
            Else
                If Session("Flag") = 0 Then

                    SqlDataSource1.InsertParameters("ct_name").DefaultValue = ct_name.Value
                    SqlDataSource1.Insert()
                    ct_name.Value = ""
                    ct_name.Focus()
                    Session("Flag") = 1
                Else
                    SqlDataSource1.UpdateParameters("ct_id").DefaultValue = ct_id.Value
                    SqlDataSource1.UpdateParameters("ct_name").DefaultValue = ct_name.Value
                    SqlDataSource1.Update()
                    Session("Flag") = 0
                    ct_id.Value = ""
                    ct_name.Value = ""
                    ct_name.Focus()
                End If
            End If
            Category_table.DataBind()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub Gridview1_Prerender(sender As Object, e As EventArgs) Handles Category_table.PreRender
        Category_table.UseAccessibleHeader = True
        Category_table.HeaderRow.TableSection = TableRowSection.TableHeader
    End Sub

    Private Sub Admin_Master_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles Category_table.RowCommand
        If e.CommandName = "Delete1" Then
            SqlDataSource1.DeleteParameters("ct_id").DefaultValue = e.CommandArgument
            SqlDataSource1.Delete()
            Category_table.DataBind()
        ElseIf e.CommandName = "add_sub_category" Then
            Session("LbText") = e.CommandArgument
            Session("p_cat") = e.CommandArgument
            Response.Redirect("Sub_Category.aspx")
        End If
    End Sub

    Private Sub Admin_Table_Load(sender As Object, e As EventArgs) Handles Category_table.Load
        If Not Page.IsPostBack Then
            Session.Add("Flag", 0)
            If Session("p_cat") Then
                Dim d As New DAO
                Dim ds As New Data.DataSet
                ds = d.getData("Select * from Category_Master where ct_id = " & Session("p_cat"))
            End If
        End If
    End Sub
    Protected Sub btnedit_Click(sender As Object, e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
        Dim index As Integer = gvRow.RowIndex
        ct_id.Value = Category_table.Rows(index).Cells(0).Text
        ct_name.Value = Category_table.Rows(index).Cells(1).Text

        Session("Flag") = 1

        ct_name.Focus()

    End Sub

    Private Sub Admin_Table_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles Category_table.RowDataBound
        If (e.Row.RowType = DataControlRowType.Header) Then
            e.Row.TableSection = TableRowSection.TableHeader
        End If
    End Sub

    Private Sub New_Click(sender As Object, e As EventArgs) Handles [New].Click
        ct_name.Value = ""
        Session("Flag") = 0
    End Sub
End Class
