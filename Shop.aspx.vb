
Partial Class Shop
    Inherits System.Web.UI.Page


    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs)
        Dim lnk As LinkButton = CType(sender, LinkButton)
        If lnk.CommandName = "Category" Then
            SqlDataSource1.SelectCommand = "select * from Product_master where pcttype = '" & lnk.CommandArgument & "'"
        ElseIf lnk.CommandName = "filter" Then
            If lnk.CommandArgument = "500" Then
                SqlDataSource1.SelectCommand = "select * from Product_master where pprice >= 0 and pprice <= '" & lnk.CommandArgument & "'"
            ElseIf lnk.CommandArgument = "1000" Then
                SqlDataSource1.SelectCommand = "select * from Product_master where pprice >= 500 and pprice <= '" & lnk.CommandArgument & "'"
            ElseIf lnk.CommandArgument = "5000" Then
                SqlDataSource1.SelectCommand = "select * from Product_master where pprice >= 1000 and pprice <= '" & lnk.CommandArgument & "'"
            ElseIf lnk.CommandArgument = "10000" Then
                SqlDataSource1.SelectCommand = "select * from Product_master where pprice >= 5000 and pprice <= '" & lnk.CommandArgument & "'"
            End If
        End If
    End Sub

    Private Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton1.Click
        SqlDataSource1.SelectCommand = "select * from Product_master where pname like '%" & txtSearch.value & "%' or psku like '%" & txtSearch.value & "%' or pcttype like '%" & txtSearch.value & "%' or pprice like '%" & txtSearch.value & "%'"
    End Sub

    Private Sub Repeater1_ItemCommand(source As Object, e As RepeaterCommandEventArgs) Handles Repeater1.ItemCommand
        If e.CommandName = "View" Then
            Session("pid") = e.CommandArgument
            Response.Redirect("Shop_details.aspx")
        End If
    End Sub

    Protected Sub add_cart_Click(sender As Object, e As EventArgs)
        If (Session("User_id") Is Nothing) Then
            Response.Redirect("Sign_In.aspx")
        Else
            Dim lnk As LinkButton = CType(sender, LinkButton)
            If lnk.CommandName = "AddToCart" Then
                Session("pid") = lnk.CommandArgument
                Dim d As New DAO
                Dim flag As Integer = d.validate("Select * from Cart_Master where pid = '" & Session("pid") & "' and User_id = '" & Session("User_id") & "'")
                Dim ds As Data.DataSet = d.getData("Select Cart_id from User_Master where uid = " & Session("User_id") & "")
                If flag = 0 Then
                    d.insertData("Insert into Cart_Master (User_id, pid, Quantity, Discount, Cart_id) values ('" & Session("User_id") & "', '" & Session("pid") & "',1, 0, " & ds.Tables(0).Rows(0).Item("Cart_id") & ")")
                    flag = 1
                Else
                    d.insertData("update Cart_Master set Quantity += 1 where pid = '" & Session("pid") & "' and user_id = '" & Session("User_id") & "'")
                    flag = 0
                End If
            End If
        End If
    End Sub

    Private Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        If DropDownList1.SelectedIndex = 0 Then
            SqlDataSource1.SelectCommand = "select * from Product_master order by pprice asc"
        Else
            SqlDataSource1.SelectCommand = "select * from Product_master order  by pprice desc"

        End If
        SqlDataSource1.DataBind()

    End Sub

    Private Sub Shop_Load(sender As Object, e As EventArgs) Handles Me.Load
        SqlDataSource1.SelectCommand = "SELECT * FROM [Product_master]"
        SqlDataSource1.DataBind()
    End Sub
End Class
