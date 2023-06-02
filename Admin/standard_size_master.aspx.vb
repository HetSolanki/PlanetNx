
Partial Class standard_size_master
    Inherits System.Web.UI.Page
    Dim dao As New DAO
    Dim var As Integer = 0
    Private Sub Save_Click(sender As Object, e As EventArgs) Handles Save.Click
        Try
            Dim check As Integer = dao.validate("select * from standard_size_master where ct_name='" & categorydrop.SelectedItem.Text & "' AND subct_name = '" & subcategorydrop.SelectedItem.Text & "' AND sssize='" & txtsize.Value & "'")
            If check = 1 Then
                ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "showDisplay();", True)
            Else
                If Session("Flag") = 0 Then
                    SqlDataSource1.InsertParameters("ct_name").DefaultValue = categorydrop.SelectedItem.ToString
                    SqlDataSource1.InsertParameters("subct_name").DefaultValue = subcategorydrop.SelectedItem.ToString
                    SqlDataSource1.InsertParameters("sssize").DefaultValue = txtsize.Value
                    SqlDataSource1.Insert()
                    txtsize.Value = ""
                Else
                    SqlDataSource1.UpdateParameters("ct_name").DefaultValue = categorydrop.SelectedItem.ToString
                    SqlDataSource1.UpdateParameters("subct_name").DefaultValue = subcategorydrop.SelectedItem.ToString
                    SqlDataSource1.UpdateParameters("sssize").DefaultValue = txtsize.Value
                    SqlDataSource1.UpdateParameters("ssid").DefaultValue = ssid.Value
                    SqlDataSource1.Update()
                    Session("Flag") = 0
                    txtsize.Value = ""
                End If
            End If
            size_Table.DataBind()
        Catch ex As Exception
            MsgBox(ex.Message)
    End Try
  End Sub


    Private Sub Admin_Master_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles size_Table.RowCommand
        If e.CommandName = "Delete1" Then
            SqlDataSource1.DeleteParameters("ssid").DefaultValue = e.CommandArgument
            SqlDataSource1.Delete()
            size_Table.DataBind()
        End If
    End Sub

    Private Sub Admin_Table_Load(sender As Object, e As EventArgs) Handles size_Table.Load
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
        End If
        var = categorydrop.Text
    End Sub
    Protected Sub btnedit_Click(sender As Object, e As EventArgs)
    Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
    Dim index As Integer = gvRow.RowIndex
        ssid.Value = size_Table.Rows(index).Cells(0).Text
        categorydrop.SelectedItem.Text = size_Table.Rows(index).Cells(1).Text
        categorydrop_SelectedIndexChanged(sender, e)
        subcategorydrop.SelectedItem.Text = size_Table.Rows(index).Cells(2).Text
        txtsize.Value = size_Table.Rows(index).Cells(3).Text
        Session("Flag") = 1
    categorydrop.Focus()
  End Sub

    Private Sub Admin_Table_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles size_Table.RowDataBound
        If (e.Row.RowType = DataControlRowType.Header) Then
            e.Row.TableSection = TableRowSection.TableHeader
        End If
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
        size_Table.DataBind()
    End Sub

    Private Sub standard_size_master_Load(sender As Object, e As EventArgs) Handles Me.Load
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
    End Sub

    Private Sub New_Click(sender As Object, e As EventArgs) Handles [New].Click
        txtsize.Value = ""
        Session("Flag") = 0
        size_Table.DataBind()

    End Sub
End Class
