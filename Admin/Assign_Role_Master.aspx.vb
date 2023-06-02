
Partial Class Admin_Assign_Role_Master
    Inherits System.Web.UI.Page

    Private Sub New_Click(sender As Object, e As EventArgs) Handles [New].Click
        menucheck.ClearSelection()
    End Sub


    Private Sub Save_Click(sender As Object, e As EventArgs) Handles Save.Click
        Try
            'Threading.Thread.Sleep(3000)
            Dim d As New DAO
            d.insertData("Delete From Assign_role where role_id = " & roledrop.SelectedValue & "")
            If Session("Flag") = 0 Then
                For Each item As ListItem In menucheck.Items
                    Dim flag As Integer = d.validate("Select * from Assign_Role where menu_name = '" & item.Text & "' and role_id = '" & Session("role_id") & "'")
                    If item.Selected Then
                        Dim obj As Data.DataSet = d.getData("select menu_url from menu_master where menu_name = '" & item.Text & "'")
                        SqlDataSource1.InsertParameters("menu_name").DefaultValue = item.Text
                        SqlDataSource1.InsertParameters("menu_url").DefaultValue = obj.Tables(0).Rows(0).Item("menu_url").ToString
                        SqlDataSource1.InsertParameters("role_name").DefaultValue = roledrop.SelectedItem.ToString()
                        SqlDataSource1.InsertParameters("role_id").DefaultValue = roledrop.SelectedValue
                        SqlDataSource1.InsertParameters("menu_id").DefaultValue = menucheck.SelectedValue
                        SqlDataSource1.InsertParameters("menu_allowed").DefaultValue = "true"

                        If item.Text = "Admin Master" Then
                            SqlDataSource1.InsertParameters("className").DefaultValue = "true"
                        ElseIf item.Text = "Catogory Master" Then
                            SqlDataSource1.InsertParameters("className").DefaultValue = "true"
                        ElseIf item.Text = "City Master" Then
                            SqlDataSource1.InsertParameters("className").DefaultValue = "true"
                        ElseIf item.Text = "Coupon Master" Then
                            SqlDataSource1.InsertParameters("className").DefaultValue = "true"
                        ElseIf item.Text = "Gallery Master" Then
                            SqlDataSource1.InsertParameters("className").DefaultValue = "true"
                        ElseIf item.Text = "Home Page" Then
                            SqlDataSource1.InsertParameters("className").DefaultValue = "true"
                        ElseIf item.Text = "Menu Master" Then
                            SqlDataSource1.InsertParameters("className").DefaultValue = "true"
                        ElseIf item.Text = "Order Master" Then
                            SqlDataSource1.InsertParameters("className").DefaultValue = "true"
                        ElseIf item.Text = "Product Master" Then
                            SqlDataSource1.InsertParameters("className").DefaultValue = "true"
                        ElseIf item.Text = "Role Master" Then
                            SqlDataSource1.InsertParameters("className").DefaultValue = "true"
                        ElseIf item.Text = "State Master" Then
                            SqlDataSource1.InsertParameters("className").DefaultValue = "true"
                        ElseIf item.Text = "User Master" Then
                            SqlDataSource1.InsertParameters("className").DefaultValue = "true"
                        ElseIf item.Text = "Assign Role" Then
                            SqlDataSource1.InsertParameters("className").DefaultValue = "true"
                        ElseIf item.Text = "Delivery Master" Then
                            SqlDataSource1.InsertParameters("className").DefaultValue = "true"
                        End If
                        SqlDataSource1.Insert()
                    End If
                Next
            End If

            role_master.DataBind()
            Response.Redirect(HttpContext.Current.Request.Url.AbsoluteUri)
            Me.OnLoad(e)
        Catch ex As Exception
            'MsgBox(ex.Message)
        End Try
    End Sub


    Private Sub Gridview1_Prerender(sender As Object, e As EventArgs) Handles role_master.PreRender
        role_master.UseAccessibleHeader = True
        role_master.HeaderRow.TableSection = TableRowSection.TableHeader
    End Sub

    Private Sub menucheck_DataBound(sender As Object, e As EventArgs) Handles menucheck.DataBound
        Dim d As New DAO
        Dim flag As Integer
        Dim i As Integer = menucheck.Items.Count - 1
        While i >= 0
            flag = d.validate("Select * from Assign_Role where menu_name = '" & menucheck.Items(i).Text & "' and role_id = '" & roledrop.SelectedValue & "'")
            If flag Then
                menucheck.Items(i).Selected = True
            End If
            i -= 1
        End While

    End Sub

    Private Sub roledrop_SelectedIndexChanged(sender As Object, e As EventArgs) Handles roledrop.SelectedIndexChanged
        'Threading.Thread.Sleep(3000)
        SqlDataSource1.DataBind()
        menucheck.DataBind()
        role_master.DataBind()
    End Sub

    Private Sub Admin_Assign_Role_Master_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub
End Class
