
Partial Class Admin_Delivery
    Inherits System.Web.UI.Page
    'jyare edit uper click kari tyare combobox ma gand kuchai khabr padi jase je koike kari he @gajjar
    Private Sub Save_Click(sender As Object, e As EventArgs) Handles Save.Click
        Dim d As New DAO
        d.insertData("update delivery_master set d_name='" & dname.Value & "' , phn_no='" & phnno.Value & "' , email='" & email.Value & "' , vehicle_no='" & vehicleno.Value & "' , address='" & address.Value & "' , d_status='" & status.SelectedValue & "', vehicle_type='" & vehicletype.SelectedValue & "'   where u_name = '" & DropDownList1.SelectedItem.ToString() & "'")

        Session("Flag") = 0

        DropDownList1.SelectedIndex = 0
        dname.Value = ""
        phnno.Value = ""
        email.Value = ""
        vehicleno.Value = ""
        address.Value = ""
        status.SelectedIndex = 0
        vehicletype.SelectedIndex = 0

        DropDownList1.Focus()
        Delivery.DataBind()

    End Sub
    Private Sub Delivery_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles Delivery.RowDataBound
        If (e.Row.RowType = DataControlRowType.Header) Then
            e.Row.TableSection = TableRowSection.TableHeader
        End If
    End Sub

    Private Sub Delivery_Prerender(sender As Object, e As EventArgs) Handles Delivery.PreRender
        Delivery.UseAccessibleHeader = True
        Delivery.HeaderRow.TableSection = TableRowSection.TableHeader
    End Sub
    Protected Sub btnedit_Click(sender As Object, e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
        Dim index As Integer = gvRow.RowIndex

        'Dim x As Integer = DropDownList1.Items.IndexOf(DropDownList1.Items.FindByValue(Delivery.Rows(index).Cells(1).Text))
        'DropDownList1.SelectedIndex = x



        DropDownList1.SelectedIndex = DropDownList1.Items.IndexOf(DropDownList1.Items.FindByText(Delivery.Rows(index).Cells(1).Text))
        dname.Value = Delivery.Rows(index).Cells(2).Text
        phnno.Value = Delivery.Rows(index).Cells(3).Text
        email.Value = Delivery.Rows(index).Cells(4).Text
        vehicleno.Value = Delivery.Rows(index).Cells(6).Text
        address.Value = Delivery.Rows(index).Cells(5).Text


        If dname.Value = "&nbsp;" Then
            dname.Value = ""
        End If
        If phnno.Value = "&nbsp;" Then
            phnno.Value = ""
        End If
        If email.Value = "&nbsp;" Then
            email.Value = ""
        End If
        If vehicleno.Value = "&nbsp;" Then
            vehicleno.Value = ""
        End If
        If address.Value = "&nbsp;" Then
            address.Value = ""
        End If
        If status.SelectedItem.Value = "&nbsp;" Then
            status.SelectedIndex = 0
        Else
            status.SelectedIndex = status.Items.IndexOf(status.Items.FindByValue(Delivery.Rows(index).Cells(7).Text))
        End If
        If vehicletype.SelectedItem.Value = "&nbsp;" Then
            vehicletype.SelectedIndex = 0
        Else
            vehicletype.SelectedIndex = vehicletype.Items.IndexOf(vehicletype.Items.FindByValue(Delivery.Rows(index).Cells(8).Text))
        End If


        Session("Flag") = 1
        DropDownList1.Focus()


    End Sub
    Private Sub resetfilled()
        DropDownList1.SelectedIndex = 0
        dname.Value = ""
        phnno.Value = ""
        email.Value = ""
        vehicleno.Value = ""
        address.Value = ""
        status.SelectedIndex = 0
        vehicletype.SelectedIndex = 0
    End Sub
    Private Sub Delivery_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles Delivery.RowCommand
        Dim d As New DAO
        If e.CommandName = "Delete1" Then

            d.insertData("delete from admin_master where aname = '" & DropDownList1.SelectedItem.ToString() & "'")
            SqlDataSource1.DeleteParameters("id").DefaultValue = e.CommandArgument
            SqlDataSource1.Delete()
            Delivery.DataBind()
        End If
    End Sub
    Private Sub reset_Click(sender As Object, e As EventArgs) Handles reset.Click
        resetfilled()
    End Sub
End Class
