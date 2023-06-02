
Partial Class Sub_Category
    Inherits System.Web.UI.Page
    Dim dao As New DAO
    Private Sub Save_Click(sender As Object, e As EventArgs) Handles Save.Click
        Try
            Dim category_id As Integer = Session("p_cat")
            Dim check As Integer = dao.validate("select * from sub_category_master where ct_id=" & category_id & " AND subcttype='" & subcttype.Value & "'")
            If check = 1 Then
                ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "showDisplay();", True)
            Else
                If Session("Flag") = 0 Then
                    SqlDataSource1.InsertParameters("subcttype").DefaultValue = subcttype.Value
                    SqlDataSource1.InsertParameters("ct_id").DefaultValue = Session("p_cat")
                    SqlDataSource1.Insert()
                    subcttype.Value = ""
                    subcttype.Focus()
                    Session("Flag") = 1
                Else
                    SqlDataSource1.UpdateParameters("subcttype").DefaultValue = subcttype.Value
                    'SqlDataSource1.UpdateParameters("ct_id").DefaultValue = Session("p_cat")
                    SqlDataSource1.UpdateParameters("subct_id").DefaultValue = subct_id.Value
                    SqlDataSource1.Update()
                    Session("Flag") = 0
                    subcttype.Value = ""
                    subcttype.Focus()
                End If
            End If
            sub_category_table.DataBind()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub sub_category_table_Prerender(sender As Object, e As EventArgs) Handles sub_category_table.PreRender
        sub_category_table.UseAccessibleHeader = True
        sub_category_table.HeaderRow.TableSection = TableRowSection.TableHeader
    End Sub

    Private Sub sub_category_Master_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles sub_category_table.RowCommand
        If e.CommandName = "Delete1" Then
            SqlDataSource1.DeleteParameters("subct_id").DefaultValue = e.CommandArgument
            SqlDataSource1.Delete()
            sub_category_table.DataBind()
        End If
    End Sub



    Protected Sub btnedit_Click(sender As Object, e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
        Dim index As Integer = gvRow.RowIndex
        subcttype.Value = sub_category_table.Rows(index).Cells(2).Text
        subct_id.Value = sub_category_table.Rows(index).Cells(0).Text
        Session("Flag") = 1
        subcttype.Focus()
    End Sub

    Private Sub sub_category_Table_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles sub_category_table.RowDataBound
        If (e.Row.RowType = DataControlRowType.Header) Then
            e.Row.TableSection = TableRowSection.TableHeader
        End If
    End Sub

    Private Sub Sub_Category_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Session.Add("Flag", 0)
            If Session("p_cat") <> "" Then
                Dim d As New DAO
                Dim ds As New Data.DataSet

                ds = d.getData("Select * from Category_Master where ct_id = " & Session("p_cat"))

                If ds.Tables(0).Rows.Count > 0 Then
                    Lb.Text = "&nbsp" + ds.Tables(0).Rows(0).Item("ct_name")
                    ct_name.Value = ds.Tables(0).Rows(0).Item("ct_name")
                End If
            Else
                MsgBox("Session Not Set")
            End If

        End If

    End Sub

    Private Sub New_Click(sender As Object, e As EventArgs) Handles [New].Click
        subcttype.Value = ""
        Session("Flag") = 0
    End Sub
End Class
