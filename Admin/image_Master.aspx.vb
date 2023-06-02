
Partial Class Image_Master
  Inherits System.Web.UI.Page

  Private Sub Save_Click(sender As Object, e As EventArgs) Handles Save.Click
    Try
            If Session("Flag") = 0 Then

                If ppic.HasFile Then

                    Dim fname As String = ppic.FileName

                    If fname.EndsWith("jpg") Or fname.EndsWith("png") Or fname.EndsWith("jpeg") Then
                        ppic.SaveAs(Server.MapPath("../img/shop-details/") & fname)
                    End If

                    SqlDataSource1.InsertParameters("img").DefaultValue = fname
                    SqlDataSource1.InsertParameters("pid").DefaultValue = Session("pid")
                    SqlDataSource1.Insert()
                    Session("Flag") = 0

                Else
                    Label1.Text = "Select Valid Image"

                End If

            Else
                Dim fname As String = lblimg.Text
                If ppic.HasFile Then

                    If System.IO.File.Exists(Server.MapPath("../img/shop-details/") & fname) Then
                        System.IO.File.Delete(Server.MapPath("../img/shop-details/") & fname)
                        lblimg.Text = ""
                        fname = ppic.FileName
                        If fname.EndsWith("jpg") Or fname.EndsWith("png") Or fname.EndsWith("jpeg") Then
                            ppic.SaveAs(Server.MapPath("../img/shop-details/") & fname)
                        End If
                    End If

                End If

                SqlDataSource1.UpdateParameters("pid").DefaultValue = Session("pid")
                SqlDataSource1.UpdateParameters("imgid").DefaultValue = imgid.Value
                SqlDataSource1.UpdateParameters("img").DefaultValue = fname
                SqlDataSource1.Update()
                Session("Flag") = 0

            End If
            Image_Table.DataBind()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub Product_Table_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles Image_Table.RowDataBound
        If (e.Row.RowType = DataControlRowType.Header) Then
            e.Row.TableSection = TableRowSection.TableHeader
        End If
    End Sub

    Private Sub Admin_Master_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles Image_Table.RowCommand
        If e.CommandName = "Delete1" Then

            Dim d As New DAO
            Dim obj As Data.DataSet = d.getData("Select img from Image_Master where imgid='" & e.CommandArgument & "'")

            Dim fname As String
            fname = obj.Tables(0).Rows(0).Item("img")

            System.IO.File.Delete(Server.MapPath("../img/shop-details/") & fname)

            SqlDataSource1.DeleteParameters("imgid").DefaultValue = e.CommandArgument
      SqlDataSource1.Delete()
      Image_Table.DataBind()
    End If
  End Sub
    Protected Sub btnedit_Click(sender As Object, e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
        Dim index As Integer = gvRow.RowIndex
        imgid.Value = Image_Table.Rows(index).Cells(0).Text
        lblimg.Text = Image_Table.Rows(index).Cells(2).Text
        Session("Flag") = 1
        ppic.Focus()
    End Sub



    Dim var As Integer = 0
    Private Sub product_Load(sender As Object, e As EventArgs) Handles Me.Load
    If Not Page.IsPostBack Then
            Lb.Text = Session("pname").ToString()
        End If

    End Sub
End Class
