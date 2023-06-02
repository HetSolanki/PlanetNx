
Partial Class Admin_Master
    Inherits System.Web.UI.Page
    Dim d As New DAO
    Private Sub Save_Click(sender As Object, e As EventArgs) Handles Save.Click
        Try
            Dim fname As String = upic.FileName
            Dim check As Integer = d.validate("select * from Admin_master where aname='" & aname.Value & "' AND apass='" & apass.Value & "' AND aimg ='" & fname & "' ")

            If check = 1 Then
                ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "showDisplay();", True)
                Session("Flag") = 0
            Else

                If Session("Flag") = 0 Then

                    If upic.HasFile Then


                        If fname.EndsWith("jpg") Or fname.EndsWith("png") Then
                            upic.SaveAs(Server.MapPath("dist/img/Admin_Profile/") & fname)
                        End If


                        SqlDataSource1.InsertParameters("aname").DefaultValue = aname.Value
                        SqlDataSource1.InsertParameters("apass").DefaultValue = apass.Value
                        SqlDataSource1.InsertParameters("aimg").DefaultValue = fname
                        SqlDataSource1.InsertParameters("atype").DefaultValue = typedrop.SelectedValue

                        SqlDataSource1.Insert()

                        If typedrop.SelectedItem.Text = "Delivery" Then

                            Dim d1 As New DAO
                            d1.insertData("INSERT INTO delivery_master (u_name) VALUES ('" & aname.Value & "')")

                        End If

                        aname.Value = ""
                        apass.Value = ""
                        acpass.Value = ""
                        lblimg.Text = ""
                        aname.Focus()
                        Session("Flag") = 1
                    Else
                        Label1.Text = "Select Valid Profile Image"

                    End If

                Else

                    fname = lblimg.Text
                    If upic.HasFile Then

                        If System.IO.File.Exists(Server.MapPath("dist/img/Admin_Profile/") & fname) Then
                            System.IO.File.Delete(Server.MapPath("dist/img/Admin_Profile/") & fname)
                            lblimg.Text = ""
                            fname = upic.FileName
                            If fname.EndsWith("jpg") Or fname.EndsWith("png") Then
                                upic.SaveAs(Server.MapPath("dist/img/Admin_Profile/") & fname)
                            End If
                        End If

                    End If
                    SqlDataSource1.UpdateParameters("aname").DefaultValue = aname.Value
                    SqlDataSource1.UpdateParameters("apass").DefaultValue = apass.Value
                    SqlDataSource1.UpdateParameters("aid").DefaultValue = aid.Value
                    SqlDataSource1.UpdateParameters("aimg").DefaultValue = fname
                    SqlDataSource1.UpdateParameters("atype").DefaultValue = typedrop.SelectedValue
                    SqlDataSource1.Update()
                    Session("Flag") = 0

                    If typedrop.SelectedItem.Text = "Delivery" Then
                        Dim d1 As New DAO
                        'd1.insertData("update delivery_master set u_name = '" & aname.Value & "' where ")
                    End If

                    If Session("aid1") = aid.Value Then
                        Session("Image") = fname
                        Session("aname") = aname.Value
                    End If

                    aid.Value = ""
                    aname.Value = ""
                    apass.Value = ""
                    acpass.Value = ""
                    lblimg.Text = ""
                    aname.Focus()


                End If
            End If
            Admin_Table.DataBind()

        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub Admin_Table_Prerender(sender As Object, e As EventArgs) Handles Admin_Table.PreRender
        Admin_Table.UseAccessibleHeader = True
        Admin_Table.HeaderRow.TableSection = TableRowSection.TableHeader
    End Sub

    Private Sub Admin_Table_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles Admin_Table.RowDataBound
        If (e.Row.RowType = DataControlRowType.Header) Then
            e.Row.TableSection = TableRowSection.TableHeader
        End If
    End Sub

    Private Sub Admin_Master_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles Admin_Table.RowCommand
        If e.CommandName = "Delete1" Then
            SqlDataSource1.DeleteParameters("aid").DefaultValue = e.CommandArgument
            SqlDataSource1.Delete()
            Admin_Table.DataBind()
        End If
    End Sub

    Private Sub Admin_Table_Load(sender As Object, e As EventArgs) Handles Admin_Table.Load
        If Not Page.IsPostBack Then
            Session.Add("Flag", 0)
        End If
    End Sub
    Protected Sub btnedit_Click(sender As Object, e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
        Dim index As Integer = gvRow.RowIndex
        aid.Value = Admin_Table.Rows(index).Cells(0).Text
        aname.Value = Admin_Table.Rows(index).Cells(1).Text
        apass.Value = Admin_Table.Rows(index).Cells(2).Text
        acpass.Value = Admin_Table.Rows(index).Cells(2).Text
        lblimg.Text = Admin_Table.Rows(index).Cells(4).Text
        typedrop.SelectedIndex = typedrop.Items.IndexOf(typedrop.Items.FindByValue(Admin_Table.Rows(index).Cells(3).Text))
        Session("Flag") = 1
        aname.Focus()
    End Sub

    Private Sub New_Click(sender As Object, e As EventArgs) Handles [New].Click
        aname.Value = ""
        apass.Value = ""
        acpass.Value = ""
        Session("Flag") = 0
    End Sub


End Class
