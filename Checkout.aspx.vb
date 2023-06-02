Imports Razorpay.Api
Imports Newtonsoft.Json

Partial Class Checkout
    Inherits System.Web.UI.Page

    Private Sub Checkout_Load(sender As Object, e As EventArgs) Handles Me.Load
        'rd2.Checked = True
        Dim d As New DAO
        Dim ds As Data.DataSet
        ds = d.getData("Select * From User_Master where uid = '" & Session("User_id") & "'")
        If ds.Tables(0).Rows.Count > 0 Then
            fname.Value = ds.Tables(0).Rows(0).Item("First_Name")
            lname.Value = ds.Tables(0).Rows(0).Item("Last_Name")
            uaddress.Value = ds.Tables(0).Rows(0).Item("uaddress")
            uphone.Value = ds.Tables(0).Rows(0).Item("uphone")
            uemail.Value = ds.Tables(0).Rows(0).Item("uemail")
        End If
        Dim totals As Double = 0
        If (Session("buy_btn") = 1) Then
            totals = Session("buy_price")
            ds = d.getData("Select * from Product_Master where pid = '" & Session("pid") & "'")
            Product_Name.InnerHtml = ds.Tables(0).Rows(0).Item("pname") & "<span>₹" & ds.Tables(0).Rows(0).Item("pprice") & "</span>"
            Product_Name.Visible = True
            charge1.Visible = True
            Repeater1.Visible = False
            HiddenField1.Value = totals + 70
        Else
            ds = d.getData("SELECT * FROM [Cart_Master], [Product_Master] WHERE ([User_id] = '" & Session("User_id") & "') and Cart_Master.pid = Product_Master.pid")

            Dim i As Integer = ds.Tables(0).Rows.Count - 1
            While i >= 0
                totals += ((ds.Tables(0).Rows(i).Item("pprice") * ds.Tables(0).Rows(i).Item("Quantity")))
                i -= 1
            End While
            If totals - Session("Discount") > 0 Then
                HiddenField1.Value = totals - Session("Discount")
            Else
                HiddenField1.Value = totals
            End If
        End If

    End Sub

    Private Sub place_order_ServerClick(sender As Object, e As EventArgs) Handles place_order.Click

        Dim d As New DAO
        Dim ds As Data.DataSet = d.getData("Select Cart_id from User_Master where uid = '" & Session("User_id") & "'")
        Dim cart_id As Integer = 0
        If ds.Tables(0).Rows.Count > 0 Then
            cart_id = CType(ds.Tables(0).Rows(0).Item("Cart_id"), Integer) + 1
        End If

        d.insertData("update User_Master set uphone = '" & uphone.Value & "', uemail = '" & uemail.Value & "', upincode = '" & dpincode.SelectedItem.Text & "', ustate = '" & dstate.SelectedItem.Text & "', ucity = '" & dcity.SelectedItem.Text & "', uaddress = '" & uaddress.Value & "', Cart_id = " & cart_id & ", First_Name = '" & fname.Value & "', Last_Name = '" & lname.Value & "' where uid = '" & Session("User_id") & "'")


        ds = d.getData("Select * from Cart_Master where User_id = '" & Session("User_id") & "'")

        If (Session("buy_btn") = 1) Then
            d.insertData("insert into Order_Table (uid, Order_date, Payment_Method, Quantity, pid, Discount, Cart_id, status, className) values ('" & Session("User_id") & "','" & Now.Date & "', 'Cash On Delivery', " & Session("buy_qty") & ", " & Session("buy_pid") & ", " & Session("Discount") & ", " & cart_id & ",'Ordered', 'badge badge-info')")
        Else
            Dim i As Integer = ds.Tables(0).Rows.Count - 1
            While i >= 0
                d.insertData("insert into Order_Table (uid, Order_date, Payment_Method, Quantity, pid, Discount, Cart_id, status, className) values ('" & Session("User_id") & "','" & Now.Date & "', 'Cash On Delivery', " & ds.Tables(0).Rows(i).Item("Quantity") & ", " & ds.Tables(0).Rows(i).Item("pid") & ", " & Session("Discount") & ", " & cart_id & ",'Ordered', 'badge badge-info')")
                i -= 1
            End While
            d.insertData("Delete from Cart_Master where User_id = " & Session("User_id") & "")
            Session("Cart_id") = cart_id
        End If
        d.insertData("insert into Order_Summary (Order_date, Cart_id, uid) values(" & Now.Date & ", " & cart_id & ", " & Session("User_id") & ")")


        If rd1.Checked Then
            Try
                Dim key As String = "rzp_test_6iu4yboXCQ46k1"
                Dim amount As Integer = HiddenField1.Value * 100 ' The amount in paisa, so 100 represents 1 INR
                Dim currency As String = "INR"
                Dim options As New Dictionary(Of String, Object)
                options.Add("amount", amount)
                options.Add("currency", currency)
                options.Add("receipt", "receipt_order_123")
                options.Add("payment_capture", 1)
                Dim client As New RazorpayClient(key, "YYvc28c16jeTyWvgtFSAcyWV")
                Dim order = client.Order.Create(options)
                Dim orderId As String = order("id")
                Dim razorpayOrderId As String = order("id")
                Dim razorpayKeyId As String = key
                Dim razorpayAmount As Integer = amount
                Dim razorpayCurrency As String = currency
                Dim razorpayName As String = "Planet Nx"
                Dim razorpayDescription As String = "Product description"
                Dim razorpayImage As String = "https://yourcompany.com/logo.png"
                '  Dim razorpayCallbackUrl As String = "http://localhost:8080/your-callback-url"
                Dim razorpayNotes As New Dictionary(Of String, Object)
                razorpayNotes.Add("address", "Customer Address")
                Dim razorpayThemeColor As String = "#F37254"
                Dim razorpayOptions As New Dictionary(Of String, Object)
                razorpayOptions.Add("key", razorpayKeyId)
                razorpayOptions.Add("amount", razorpayAmount)
                razorpayOptions.Add("currency", razorpayCurrency)
                razorpayOptions.Add("name", razorpayName)
                razorpayOptions.Add("description", razorpayDescription)
                razorpayOptions.Add("image", razorpayImage)
                razorpayOptions.Add("order_id", razorpayOrderId)
                razorpayOptions.Add("handler", "onPaymentSuccess")
                razorpayOptions.Add("prefill", New Dictionary(Of String, Object) From {{"name", "Customer Name"}, {"email", "customer@email.com"}, {"contact", "9999999999"}})
                razorpayOptions.Add("notes", razorpayNotes)
                razorpayOptions.Add("theme", New Dictionary(Of String, Object) From {{"color", razorpayThemeColor}})
                Dim razorpayScript As String = "var rzp1 = new Razorpay(" & JsonConvert.SerializeObject(razorpayOptions) & "); rzp1.open();"
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "razorpay-script", razorpayScript, True)


                
            Catch ex As Exception
                MsgBox(ex.Message)
            End Try
        End If

        'If rd2.Checked Then
        '    Dim i1 As Integer = ds.Tables(0).Rows.Count - 1
        '    While i1 >= 0
        '        d.insertData("insert into Order_Table (uid, Order_date, Payment_Method, Quantity, pid, Cart_id, status) values ('" & Session("User_id") & "','" & Now.Date & "', 'Cash On Delivery', " & ds.Tables(0).Rows(i1).Item("Quantity") & ", " & ds.Tables(0).Rows(i1).Item("pid") & ", " & cart_id & ",'Ordered')")
        '        i1 -= 1
        '    End While
        '    d.insertData("insert into Order_Summary (Order_date, Cart_id, uid) values(" & Now.Date & ", " & 1 & ", " & Session("User_id") & ")")

        '    d.insertData("Delete from Cart_Master where User_id = " & Session("User_id") & "")
        '    Session("Cart_id") = cart_id
        'End If


    End Sub

    Private Sub dstate_SelectedIndexChanged(sender As Object, e As EventArgs) Handles dstate.SelectedIndexChanged
        dpincode.DataBind()
    End Sub
End Class
