
Partial Class Admin_Order_master
    Inherits System.Web.UI.Page

    Private Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles order_table.RowCommand
        If e.CommandName = "goview" Then
            Session("order_id") = e.CommandArgument
            Response.Redirect("Order_view.aspx")
        End If
    End Sub


    Private Sub Admin_Order_master_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim d As New DAO

        Dim ds As Data.DataSet = d.getData("Select * from order_Summary,user_master where order_Summary.uid = user_master.uid")
        typecustom.DataTextField = "uname"
        typecustom.DataValueField = "uid"
        typecustom.DataSource = ds.Tables(0)
        typecustom.DataBind()
    End Sub

    Private Sub reset_Click(sender As Object, e As EventArgs) Handles reset.Click
        SqlDataSource1.SelectCommand = "SELECT [id], [uid], [Order_date], [assign_to_db], [Payment_Method], [status], [pid], [Quantity] FROM [Order_Table] ORDER BY [Order_date]"
        order_table.DataBind()
        oid.Value = ""
        odrstatus.SelectedIndex = 0
        typecustom.SelectedIndex = 0
    End Sub

    Private Sub filter_Click(sender As Object, e As EventArgs) Handles filter.Click

        If oid.Value <> "" Then
            SqlDataSource1.SelectCommand = ("SELECT [id], [uid], [Order_date], [assign_to_db], [Payment_Method], [status], [pid], [Quantity] FROM [Order_Table] where [id] = " & oid.Value & " and status = '" & odrstatus.SelectedItem.Text & "'")
        Else
            SqlDataSource1.SelectCommand = ("SELECT [id], [uid], [Order_date], [assign_to_db], [Payment_Method], [status], [pid], [Quantity] FROM [Order_Table] where status = '" & odrstatus.SelectedItem.Text & "'")
        End If


        order_table.DataBind()
    End Sub


    Private Sub Order_table_Prerender(sender As Object, e As EventArgs) Handles order_table.PreRender
        order_table.UseAccessibleHeader = True
        order_table.HeaderRow.TableSection = TableRowSection.TableHeader
    End Sub

    Private Sub Order_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles order_table.RowDataBound
        If (e.Row.RowType = DataControlRowType.Header) Then
            e.Row.TableSection = TableRowSection.TableHeader
        End If
    End Sub

End Class
