
Partial Class product_description_master
  Inherits System.Web.UI.Page

  Private Sub Save_Click(sender As Object, e As EventArgs) Handles Save.Click
    Try
            If Session("Flag") = 0 Then
                SqlDataSource1.InsertParameters("pd_title").DefaultValue = txttitle.Value
                SqlDataSource1.InsertParameters("pd_desc").DefaultValue = txtdesc.Value
                SqlDataSource1.InsertParameters("pid").DefaultValue = Session("pds_id")
                SqlDataSource1.Insert()
                txttitle.Value = ""
                txtdesc.Value = ""
                txttitle.Focus()


            Else
                SqlDataSource1.UpdateParameters("pd_title").DefaultValue = txttitle.Value
                SqlDataSource1.UpdateParameters("pd_desc").DefaultValue = txtdesc.Value
                SqlDataSource1.UpdateParameters("pid").DefaultValue = Session("pds_id")
                SqlDataSource1.UpdateParameters("pd_id").DefaultValue = pd_id.Value
                SqlDataSource1.Update()
                Session("Flag") = 0
                txttitle.Value = ""
                txtdesc.Value = ""
                txttitle.Focus()
            End If
            PD_Table.DataBind()
        Catch ex As Exception
      MsgBox(ex.Message)
    End Try
  End Sub


    Private Sub Admin_Master_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles PD_Table.RowCommand
        If e.CommandName = "Delete1" Then
            SqlDataSource1.DeleteParameters("pd_id").DefaultValue = e.CommandArgument
            SqlDataSource1.Delete()
            PD_Table.DataBind()
        End If
    End Sub

    Private Sub Admin_Table_Load(sender As Object, e As EventArgs) Handles PD_Table.Load
        If Not Page.IsPostBack Then
            Session.Add("Flag", 0)
        End If
    End Sub
    Protected Sub btnedit_Click(sender As Object, e As EventArgs)
    Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
    Dim index As Integer = gvRow.RowIndex
        pd_id.Value = PD_Table.Rows(index).Cells(0).Text
        txttitle.Value = PD_Table.Rows(index).Cells(2).Text
        txtdesc.Value = PD_Table.Rows(index).Cells(3).Text

        Session("Flag") = 1
        txttitle.Focus()
  End Sub

    Private Sub Admin_Table_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles PD_Table.RowDataBound
        If (e.Row.RowType = DataControlRowType.Header) Then
            e.Row.TableSection = TableRowSection.TableHeader
        End If
    End Sub
    Private Sub PD_Table_Prerender(sender As Object, e As EventArgs) Handles PD_Table.PreRender
        PD_Table.UseAccessibleHeader = True
        PD_Table.HeaderRow.TableSection = TableRowSection.TableHeader
    End Sub

    Private Sub product_description_master_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Session.Add("Flag", 0)
            If Session("pds_id") <> "" Then
                Dim d As New DAO
                Dim ds As New Data.DataSet

                ds = d.getData("Select * from product_master where pid = " & Session("pds_id"))

                If ds.Tables(0).Rows.Count > 0 Then
                    Lb.Text = ds.Tables(0).Rows(0).Item("pname")
                End If
            Else
                MsgBox("Session Not Set")
            End If
        End If
    End Sub

    Private Sub New_Click(sender As Object, e As EventArgs) Handles [New].Click
        txttitle.Value = ""
        txtdesc.Value = ""
        Session("Flag") = 0
    End Sub
End Class
