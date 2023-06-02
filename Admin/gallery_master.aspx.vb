
Partial Class gallery_master
    Inherits System.Web.UI.Page
    Dim dao As New DAO
    Private Sub Save_Click(sender As Object, e As EventArgs) Handles Save.Click
        Try

            Dim check As Integer = dao.validate("select * from gallery_master where gheading='" & heading.Value & "' AND  gtype='" & typedrop.SelectedValue.ToString & "' AND gimg='" & ppic.FileName.ToString & "'")
            If check = 1 Then
                ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "showDisplay();", True)
            Else
                If Session("Flag") = 0 Then


                    If ppic.HasFile Then
                        Dim fname As String = ppic.FileName

                        If fname.EndsWith("jpg") Or fname.EndsWith("png") Or fname.EndsWith("jpeg") Then
                            ppic.SaveAs(Server.MapPath("../img/hero/") & fname)
                        End If
                        'SqlDataSource1.InsertParameters("gid").DefaultValue = gid.Value
                        SqlDataSource1.InsertParameters("gheading").DefaultValue = heading.Value
                        SqlDataSource1.InsertParameters("gtype").DefaultValue = typedrop.SelectedValue.ToString
                        SqlDataSource1.InsertParameters("gimg").DefaultValue = fname
                        SqlDataSource1.Insert()
                        typedrop.Focus()
                        Session("Flag") = 1

                    Else
                        'Label1.Text = "Select Valid Image"
                    End If
                Else
                    Dim fname As String = lblimg.Text
                    If ppic.HasFile Then

                        If System.IO.File.Exists(Server.MapPath("../img/hero/") & fname) Then
                            System.IO.File.Delete(Server.MapPath("../img/hero/") & fname)
                            lblimg.Text = ""
                            fname = ppic.FileName
                            If fname.EndsWith("jpg") Or fname.EndsWith("png") Or fname.EndsWith("jpeg") Then
                                ppic.SaveAs(Server.MapPath("../img/hero/") & fname)
                            End If
                        End If

                    End If

                    SqlDataSource1.UpdateParameters("gid").DefaultValue = gid.Value
                    SqlDataSource1.UpdateParameters("gheading").DefaultValue = heading.Value
                    SqlDataSource1.UpdateParameters("gtype").DefaultValue = typedrop.SelectedValue.ToString
                    SqlDataSource1.UpdateParameters("gimg").DefaultValue = fname
                    SqlDataSource1.Update()
                    Session("Flag") = 0
                    gid.Value = ""

                    typedrop.Focus()
                End If
            End If
            Gallery_Table.DataBind()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub Gridview1_Prerender(sender As Object, e As EventArgs) Handles Gallery_Table.PreRender
        Gallery_Table.UseAccessibleHeader = True
        Gallery_Table.HeaderRow.TableSection = TableRowSection.TableHeader
    End Sub

    Private Sub Admin_Master_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles Gallery_Table.RowCommand
        If e.CommandName = "Delete1" Then

            Dim d As New DAO
            Dim obj As Data.DataSet = d.getData("Select gimg from gallery_master where gid='" & e.CommandArgument & "'")

            Dim fname As String
            fname = obj.Tables(0).Rows(0).Item("gimg")

            System.IO.File.Delete(Server.MapPath("../img/hero/") & fname)

            SqlDataSource1.DeleteParameters("gid").DefaultValue = e.CommandArgument
            SqlDataSource1.Delete()
            Gallery_Table.DataBind()
        End If
    End Sub


    Protected Sub btnedit_Click(sender As Object, e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
        Dim index As Integer = gvRow.RowIndex
        gid.Value = Gallery_Table.Rows(index).Cells(0).Text
        heading.Value = Gallery_Table.Rows(index).Cells(1).Text
        typedrop.SelectedValue = Gallery_Table.Rows(index).Cells(2).Text
        lblimg.Text = Gallery_Table.Rows(index).Cells(3).Text
        Session("Flag") = 1
        typedrop.Focus()
    End Sub

    Private Sub Admin_Table_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles Gallery_Table.RowDataBound
        If (e.Row.RowType = DataControlRowType.Header) Then
            e.Row.TableSection = TableRowSection.TableHeader
        End If
    End Sub

    Private Sub New_Click(sender As Object, e As EventArgs) Handles [New].Click
        lblimg.Text = ""
        heading.Value = ""
        Session("Flag") = 0
    End Sub
End Class
