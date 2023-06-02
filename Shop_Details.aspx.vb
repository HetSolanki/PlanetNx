
Partial Class Shop_Details
    Inherits System.Web.UI.Page
    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        If (Session("User_id") Is Nothing) Then
            Response.Redirect("Sign_In.aspx")
        Else
            Dim d As New DAO
            Dim flag As Integer = d.validate("Select * from Cart_Master where pid = '" & Session("pid") & "' and User_id = '" & Session("User_id") & "'")
            Dim ds As Data.DataSet = d.getData("Select Cart_id from User_Master where uid = " & Session("User_id") & "")
            If flag = 0 Then
                d.insertData("Insert into Cart_Master (User_id, pid, Quantity, Discount, Cart_id) values ('" & Session("User_id") & "', '" & Session("pid") & "','" & qty.Value & "', 0, " & ds.Tables(0).Rows(0).Item("Cart_id") & ")")
                flag = 1
            Else
                d.insertData("update Cart_Master set Quantity += '" & qty.Value & "' where pid = '" & Session("pid") & "' and user_id = '" & Session("User_id") & "'")
                flag = 0
            End If
        End If
    End Sub

    Dim price1 As Integer = 0
    Private Sub Shop_Details_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim d As New DAO
        Dim ds As Data.DataSet = d.getData("Select * from Product_Master where pid = '" & Session("pid") & "'")
        If ds.Tables(0).Rows.Count > 0 Then
            p_name.InnerText = ds.Tables(0).Rows(0).Item("pname")
            price.InnerHtml = "₹" & ds.Tables(0).Rows(0).Item("pprice") & "<span>70.00</span>"
            price1 = ds.Tables(0).Rows(0).Item("pprice")
            psku.InnerHtml = "<span>SKU:</span> " & ds.Tables(0).Rows(0).Item("psku")
            pcategory.InnerHtml = "<span>Categories:</span> " & ds.Tables(0).Rows(0).Item("pcttype")
            pdesc.InnerText = ds.Tables(0).Rows(0).Item("pdesc")
        End If

        ds = d.getData("Select * from Image_Master where pid = '" & Session("pid") & "'")
        If ds.Tables(0).Rows.Count > 0 Then
            Session("Sub_pid") = ds.Tables(0).Rows(0).Item("imgid")
        End If
    End Sub
    Protected Sub LinkButton5_Click(sender As Object, e As EventArgs)
        Dim lnk As LinkButton = CType(sender, LinkButton)
        If lnk.CommandName = "View" Then
            Session("pid") = lnk.CommandArgument
            Response.Redirect("Shop_details.aspx")
        End If
    End Sub
    Protected Sub Button2_Click(sender As Object, e As EventArgs)
        If (Session("User_id") Is Nothing) Then
            Response.Redirect("Sign_In.aspx")
        Else
            Session("buy_pid") = Session("pid")
            Session("buy_qty") = qty.Value
            Session("Discount") = 0
            Session("buy_btn") = 1
            Session("buy_price") = qty.Value * price1
            Response.Redirect("Checkout.aspx")
        End If

    End Sub
    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs)
        Dim d As New DAO
        If (Session("User_id") Is Nothing) Then
            Response.Redirect("Sign_In.aspx")
        Else
            d.insertData("insert into Wishlist_Master (pid, uid) values ('" & Session("pid") & "', '" & Session("User_id") & "')")
        End If
    End Sub
End Class
