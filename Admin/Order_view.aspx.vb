
Partial Class Admin_Order_view
    Inherits System.Web.UI.Page

    Private Sub Admin_Order_view_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("order_id") <> "" Then
            Dim d As New DAO
            Dim ds As New Data.DataSet

            ds = d.getData("Select * from order_table where id = " & Session("order_id"))

            If ds.Tables(0).Rows.Count > 0 Then
                orderid.Text = ds.Tables(0).Rows(0).Item("id")
                orderdate.Text = ds.Tables(0).Rows(0).Item("Order_date")
                orderpayment.Text = ds.Tables(0).Rows(0).Item("Payment_Method")
                u_id.Value = ds.Tables(0).Rows(0).Item("uid")

            End If
        Else
            MsgBox("Session Not Set")
        End If

        If Session("order_id") <> "" Then
            Dim d As New DAO
            Dim ds As New Data.DataSet

            ds = d.getData("Select * from user_master where uid = " & u_id.Value)

            If ds.Tables(0).Rows.Count > 0 Then
                cusname.Text = ds.Tables(0).Rows(0).Item("uname")
                'orderdate.Text = ds.Tables(0).Rows(0).Item("Order_date")
                email.Text = ds.Tables(0).Rows(0).Item("uemail")
                cusmobileno.Text = ds.Tables(0).Rows(0).Item("uphone")

            End If
        Else
            MsgBox("Session Not Set")
        End If



        If Session("order_id") <> "" Then
            Dim d As New DAO
            Dim ds As New Data.DataSet

            ds = d.getData("Select * from user_master where uid = " & u_id.Value)

            If ds.Tables(0).Rows.Count > 0 Then
                add.Text = ds.Tables(0).Rows(0).Item("uaddress")

            End If
        Else
            MsgBox("Session Not Set")
        End If


    End Sub

    Private Sub assign_Click(sender As Object, e As EventArgs) Handles assign.Click
        Dim d As New DAO

        d.insertData("update order_table set assign_to_db = '" & delverydrop.SelectedItem.Text & "' where id = '" & Session("order_id") & "'")
    End Sub

    Private Sub status_Click(sender As Object, e As EventArgs) Handles status.Click
        Dim d As New DAO
        If statusdrop.SelectedIndex = 0 Then
            d.insertData("update order_table set status = '" & statusdrop.SelectedItem.Text & "', className = 'badge badge-info' where id = '" & Session("order_id") & "'")
        ElseIf statusdrop.SelectedIndex = 1 Then
            d.insertData("update order_table set status = '" & statusdrop.SelectedItem.Text & "', className = 'badge badge-warning' where id = '" & Session("order_id") & "'")
        ElseIf statusdrop.SelectedIndex = 2 Then
            d.insertData("update order_table set status = '" & statusdrop.SelectedItem.Text & "', className = 'badge badge-success' where id = '" & Session("order_id") & "'")
        End If
    End Sub
End Class
