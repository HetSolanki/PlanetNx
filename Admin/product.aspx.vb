
Partial Class product
  Inherits System.Web.UI.Page
    Private Sub Save_Click(sender As Object, e As EventArgs) Handles Save.Click
        Try
            Dim d As New DAO
            Dim temp_file_name As String = ppic.FileName
            Dim category_id As Integer = Session("p_cat")
            Dim check As Integer = d.validate("select * from product_master where pname = '" & pname.Value & "' AND psku='" & txtsku.Value & "' AND pdesc = '" & txtpdesc.Value & "' AND pcttype='" & categorydrop.SelectedItem.Text & "' AND psubcttype='" & subcategorydrop.SelectedItem.Text & "' AND pprice=" & txtprice.Value & " AND pimg='" & temp_file_name & "' AND Category = '" & dropdowncollection.SelectedItem.Text & "'AND ptrend=NULL AND pviewed=NULL")
            If check = 1 Then
                ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "showDisplay();", True)
            Else
                Dim obj As Data.DataSet = d.getData("Select ct_name from Category_master where ct_id ='" & categorydrop.Text & "'")
                Dim obj1 As Data.DataSet = d.getData("Select subcttype from sub_Category_master where subct_id ='" & subcategorydrop.Text & "'")

                If Session("Flag") = 0 Then


                    If ppic.HasFile Then

                        Dim fname As String = ppic.FileName

                        If fname.EndsWith("jpg") Or fname.EndsWith("png") Or fname.EndsWith("jpeg") Then
                            ppic.SaveAs(Server.MapPath("../img/product/") & fname)
                        End If
                        SqlDataSource1.InsertParameters("pname").DefaultValue = pname.Value
                        SqlDataSource1.InsertParameters("psku").DefaultValue = txtsku.Value
                        SqlDataSource1.InsertParameters("pdesc").DefaultValue = txtpdesc.Value
                        SqlDataSource1.InsertParameters("pcttype").DefaultValue = obj.Tables(0).Rows(0).Item("ct_name")
                        SqlDataSource1.InsertParameters("psubcttype").DefaultValue = obj1.Tables(0).Rows(0).Item("subcttype")
                        SqlDataSource1.InsertParameters("pprice").DefaultValue = txtprice.Value
                        SqlDataSource1.InsertParameters("Category").DefaultValue = dropdowncollection.SelectedValue.ToString
                        SqlDataSource1.InsertParameters("pimg").DefaultValue = fname
                        SqlDataSource1.Insert()

                        Dim objpid As Data.DataSet = d.getData("Select pid from product_Master where pimg ='" & fname & "'")
                        Dim product_id As String = objpid.Tables(0).Rows(0).Item("pid")

                        Dim d1 As New DAO
                        d1.insertData("INSERT INTO image_master (pid, img) VALUES ('" & product_id & "','" & fname & "')")

                        If fname.EndsWith("jpg") Or fname.EndsWith("png") Or fname.EndsWith("jpeg") Then
                            ppic.SaveAs(Server.MapPath("../img/shop-details/") & fname)
                        End If
                        pname.Value = ""
                        txtsku.Value = ""
                        txtpdesc.Value = ""
                        lblimg.Text = ""
                        txtprice.Value = ""

                    Else
                        'Label1.Text = "Select Valid Image"

                    End If

                Else
                    Dim fname As String = lblimg.Text
                    If ppic.HasFile Then

                        If System.IO.File.Exists(Server.MapPath("../img/product/") & fname) Then
                            System.IO.File.Delete(Server.MapPath("../img/product/") & fname)
                            lblimg.Text = ""
                            fname = ppic.FileName
                            If fname.EndsWith("jpg") Or fname.EndsWith("png") Or fname.EndsWith("jpeg") Then
                                ppic.SaveAs(Server.MapPath("../img/product/") & fname)
                            End If
                        End If
                    Else
                        fname = lblimg.Text
                    End If

                    SqlDataSource1.UpdateParameters("pname").DefaultValue = pname.Value
                    SqlDataSource1.UpdateParameters("psku").DefaultValue = txtsku.Value
                    SqlDataSource1.UpdateParameters("pdesc").DefaultValue = txtpdesc.Value
                    SqlDataSource1.UpdateParameters("pcttype").DefaultValue = categorydrop.Text
                    SqlDataSource1.UpdateParameters("psubcttype").DefaultValue = subcategorydrop.Text
                    SqlDataSource1.UpdateParameters("pprice").DefaultValue = txtprice.Value
                    SqlDataSource1.UpdateParameters("pid").DefaultValue = pid.Value
                    SqlDataSource1.UpdateParameters("Category").DefaultValue = dropdowncollection.SelectedValue
                    SqlDataSource1.UpdateParameters("pimg").DefaultValue = fname
                    SqlDataSource1.Update()
                    Session("Flag") = 0

                    pname.Value = ""
                    txtsku.Value = ""
                    txtpdesc.Value = ""
                    lblimg.Text = ""
                    txtprice.Value = ""
                End If
            End If
            Product_Table.DataBind()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub Product_Table_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles Product_Table.RowDataBound
        If (e.Row.RowType = DataControlRowType.Header) Then
            e.Row.TableSection = TableRowSection.TableHeader
        End If
    End Sub


    Private Sub Gridview1_Prerender(sender As Object, e As EventArgs) Handles Product_Table.PreRender
        Product_Table.UseAccessibleHeader = True
        Product_Table.HeaderRow.TableSection = TableRowSection.TableHeader
    End Sub

    Private Sub Admin_Master_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles Product_Table.RowCommand
        If e.CommandName = "Delete1" Then

            Dim d As New DAO
            Dim obj As Data.DataSet = d.getData("Select pimg from Product_Master where pid='" & e.CommandArgument & "'")

            Dim fname As String
            fname = obj.Tables(0).Rows(0).Item("pimg")

            System.IO.File.Delete(Server.MapPath("../img/product/") & fname)

            SqlDataSource1.DeleteParameters("pid").DefaultValue = e.CommandArgument
            SqlDataSource1.Delete()
            Product_Table.DataBind()

            resetfilled()
        ElseIf e.CommandName = "add_sub_description" Then
            Session("pds_id") = e.CommandArgument
            Response.Redirect("product_description_master.aspx")
        End If
    End Sub

    Private Sub resetfilled()
        pid.Value = ""
        pname.Value = ""
        txtsku.Value = ""
        txtpdesc.Value = ""
        categorydrop.SelectedIndex = 0
        dropdowncollection.SelectedIndex = 0
        txtprice.Value = ""
        lblimg.Text = ""
        Session("Flag") = 0
    End Sub

    Protected Sub btnedit_Click(sender As Object, e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
        Dim index As Integer = gvRow.RowIndex
        pid.Value = Product_Table.Rows(index).Cells(0).Text
        pname.Value = Product_Table.Rows(index).Cells(1).Text
        txtsku.Value = Product_Table.Rows(index).Cells(2).Text
        txtpdesc.Value = Product_Table.Rows(index).Cells(3).Text
        categorydrop.SelectedItem.Text = Product_Table.Rows(index).Cells(4).Text
        subcategorydrop.SelectedItem.Text = Product_Table.Rows(index).Cells(5).Text
        dropdowncollection.SelectedItem.Text = Product_Table.Rows(index).Cells(7).Text
        txtprice.Value = Product_Table.Rows(index).Cells(6).Text
        lblimg.Text = Product_Table.Rows(index).Cells(9).Text
        Session("Flag") = 1
        pname.Focus()
    End Sub
    Protected Sub btnImage_Click(sender As Object, e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
        Dim index As Integer = gvRow.RowIndex
        Session("pid") = Product_Table.Rows(index).Cells(0).Text
        Session("pname") = Product_Table.Rows(index).Cells(1).Text
        Session("Category") = Product_Table.Rows(index).Cells(4).Text
        Session("Sub_Category") = Product_Table.Rows(index).Cells(5).Text
        Session("Flag") = 0
        Response.Redirect("Image_Master.aspx")
    End Sub


    Private Sub categorydrop_SelectedIndexChanged(sender As Object, e As EventArgs) Handles categorydrop.SelectedIndexChanged

        Dim d1 As New DAO
        var = categorydrop.Text
        If categorydrop.AutoPostBack = True Then

            Dim ds1 As Data.DataSet = d1.getData("Select * from sub_category_master where ct_id = '" & var & "' ")
            subcategorydrop.DataTextField = "subcttype"
            subcategorydrop.DataValueField = "subct_id"
            subcategorydrop.DataSource = ds1.Tables(0)
            subcategorydrop.DataBind()

        End If
    End Sub

    Private Sub reset_Click(sender As Object, e As EventArgs) Handles reset.Click
        resetfilled()
    End Sub

    Private Sub Product_Table_Load(sender As Object, e As EventArgs) Handles Product_Table.Load
        If Not Page.IsPostBack Then
            Session.Add("Flag", 0)

            Dim d As New DAO

            Dim ds As Data.DataSet = d.getData("Select ct_name,ct_id from category_master")
            categorydrop.DataTextField = "ct_name"
            categorydrop.DataValueField = "ct_id"
            categorydrop.DataSource = ds.Tables(0)
            categorydrop.DataBind()

            Dim ds1 As Data.DataSet = d.getData("Select * from sub_category_master where ct_id = '" & categorydrop.Text & "' ")
            subcategorydrop.DataTextField = "subcttype"
            subcategorydrop.DataValueField = "subct_id"
            subcategorydrop.DataSource = ds1.Tables(0)
            subcategorydrop.DataBind()
        Else


        End If
        var = categorydrop.Text
    End Sub

    Private Sub product_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then
            Dim d As New DAO

            Dim ds As Data.DataSet = d.getData("Select ct_name,ct_id from category_master")
            categorydrop.DataTextField = "ct_name"
            categorydrop.DataValueField = "ct_id"
            categorydrop.DataSource = ds.Tables(0)
            categorydrop.DataBind()

            Dim ds1 As Data.DataSet = d.getData("Select * from sub_category_master where ct_id = '" & categorydrop.Text & "' ")
            subcategorydrop.DataTextField = "subcttype"
            subcategorydrop.DataValueField = "subct_id"
            subcategorydrop.DataSource = ds1.Tables(0)
            subcategorydrop.DataBind()
        End If
        var = categorydrop.Text
    End Sub

    Dim var As Integer = 0
End Class
