
Partial Class Admin_coupon_master
    Inherits System.Web.UI.Page

    Private Sub Save_Click(sender As Object, e As EventArgs) Handles Save.Click
        Try
            Dim d As New DAO
            Dim check As Integer = d.validate("select * from coupon_master where coupon_name='" & cname.Value & "' AND coupon_code='" & code.Value & "' AND  discount='" & discount.Value & "' AND uses_per_coupon='" & u_per_coupon.Value & "' AND status='" & status.SelectedValue & "' ")

            If check = 1 Then
                ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "showDisplay();", True)
            Else

                If Session("Flag") = 0 Then

                    SqlDataSource1.InsertParameters("coupon_name").DefaultValue = cname.Value
                    SqlDataSource1.InsertParameters("coupon_code").DefaultValue = code.Value
                    SqlDataSource1.InsertParameters("discount").DefaultValue = discount.Value
                    SqlDataSource1.InsertParameters("start_date").DefaultValue = sdate.Value
                    SqlDataSource1.InsertParameters("end_date").DefaultValue = edate.Value
                    SqlDataSource1.InsertParameters("uses_per_coupon").DefaultValue = u_per_coupon.Value
                    SqlDataSource1.InsertParameters("status").DefaultValue = status.SelectedValue

                    SqlDataSource1.Insert()
                    cname.Value = ""
                    code.Value = ""
                    discount.Value = ""
                    sdate.value = ""
                    edate.value = ""
                    u_per_coupon.Value = ""
                    status.SelectedIndex = 0

                    cname.Focus()
                    Session("Flag") = 1


                Else

                    SqlDataSource1.UpdateParameters("coupon_name").DefaultValue = cname.Value
                    SqlDataSource1.UpdateParameters("coupon_code").DefaultValue = code.Value
                    SqlDataSource1.UpdateParameters("discount").DefaultValue = discount.Value
                    SqlDataSource1.UpdateParameters("start_date").DefaultValue = sdate.Value
                    SqlDataSource1.UpdateParameters("end_date").DefaultValue = edate.Value
                    SqlDataSource1.UpdateParameters("uses_per_coupon").DefaultValue = u_per_coupon.Value
                    SqlDataSource1.UpdateParameters("status").DefaultValue = status.SelectedValue
                    SqlDataSource1.UpdateParameters("cid").DefaultValue = cid.Value

                    SqlDataSource1.Update()
                    Session("Flag") = 0

                    cname.Value = ""
                    code.Value = ""
                    discount.Value = ""

                    sdate.Value = ""
                    edate.Value = ""
                    u_per_coupon.Value = ""
                    status.SelectedIndex = 0

                    cname.Focus()

                End If
            End If
            coupon_table.DataBind()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Protected Sub btnedit_Click(sender As Object, e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
        Dim index As Integer = gvRow.RowIndex
        cname.Value = coupon_table.Rows(index).Cells(1).Text
        code.Value = coupon_table.Rows(index).Cells(2).Text
        discount.Value = coupon_table.Rows(index).Cells(3).Text
        sdate.value = coupon_table.Rows(index).Cells(4).Text
        edate.value = coupon_table.Rows(index).Cells(5).Text
        u_per_coupon.Value = coupon_table.Rows(index).Cells(6).Text
        status.SelectedIndex = status.Items.IndexOf(status.Items.FindByText(coupon_table.Rows(index).Cells(7).Text))
        cid.Value = coupon_table.Rows(index).Cells(0).Text

        Session("Flag") = 1
        cname.Focus()
    End Sub

    Private Sub coupon_table_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles coupon_table.RowDataBound
        If (e.Row.RowType = DataControlRowType.Header) Then
            e.Row.TableSection = TableRowSection.TableHeader
        End If
    End Sub
    Private Sub coupon_table_Prerender(sender As Object, e As EventArgs) Handles coupon_table.PreRender
        coupon_table.UseAccessibleHeader = True
        coupon_table.HeaderRow.TableSection = TableRowSection.TableHeader
    End Sub

    Private Sub new_Click(sender As Object, e As EventArgs) Handles [new].Click
        cname.Value = ""
        code.Value = ""
        discount.Value = ""
        sdate.value = ""
        edate.value = ""
        u_per_coupon.Value = ""
        status.SelectedIndex = 0
    End Sub

    Private Sub coupon_table_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles coupon_table.RowCommand
        If e.CommandName = "Delete1" Then

            Dim d As New DAO
            Dim obj As Data.DataSet = d.getData("Select * from coupon_Master where cid='" & e.CommandArgument & "'")

            SqlDataSource1.DeleteParameters("cid").DefaultValue = e.CommandArgument
            SqlDataSource1.Delete()
            coupon_table.DataBind()
        End If
    End Sub
End Class
