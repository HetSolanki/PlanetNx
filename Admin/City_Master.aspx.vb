
Partial Class City_master
    Inherits System.Web.UI.Page
    Dim dao As New DAO
    Private Sub Save_Click(sender As Object, e As EventArgs) Handles Save.Click
        Try
            Dim category_id As Integer = Session("p_cat")
            Dim check As Integer = dao.validate("select * from city_master where State_id=" & Session("p_city") & " AND city_name='" & cityname.Value & "' AND city_pincode=" & pincode.Value & "")
            If check = 1 Then
                ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "showDisplay();", True)
            Else
                If Session("Flag") = 0 Then
                    SqlDataSource1.InsertParameters("city_name").DefaultValue = cityname.Value
                    SqlDataSource1.InsertParameters("city_pincode").DefaultValue = pincode.Value
                    SqlDataSource1.InsertParameters("State_id").DefaultValue = Session("p_city")

                    SqlDataSource1.Insert()
                    cityname.Value = ""
                    pincode.Value = ""

                    cityname.Focus()
                Else
                    SqlDataSource1.UpdateParameters("city_id").DefaultValue = uid.Value
                    SqlDataSource1.UpdateParameters("city_name").DefaultValue = cityname.Value
                    SqlDataSource1.UpdateParameters("city_pincode").DefaultValue = pincode.Value
                    SqlDataSource1.UpdateParameters("State_id").DefaultValue = Session("p_city")
                    SqlDataSource1.Update()
                    Session("Flag") = 0
                    uid.Value = ""
                    cityname.Value = ""
                    pincode.Value = ""
                    cityname.Focus()
                End If
            End If
            City_table.DataBind()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub User_Master_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles City_table.RowDataBound
        If (e.Row.RowType = DataControlRowType.Header) Then
            e.Row.TableSection = TableRowSection.TableHeader
        End If
    End Sub

    Private Sub User_Master1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles City_table.RowCommand
        If e.CommandName = "Delete1" Then
            SqlDataSource1.DeleteParameters("city_id").DefaultValue = e.CommandArgument
            SqlDataSource1.Delete()
            City_table.DataBind()
        End If
    End Sub

    Private Sub User_Master_Load(sender As Object, e As EventArgs) Handles City_table.Load
        If Not Page.IsPostBack Then
            Session.Add("Flag", 0)
        End If
    End Sub
    Protected Sub btnedit_Click(sender As Object, e As EventArgs)
        Dim gvRow As GridViewRow = CType(CType(sender, Control).Parent.Parent, GridViewRow)
        Dim index As Integer = gvRow.RowIndex
        uid.Value = City_table.Rows(index).Cells(0).Text
        pincode.Value = City_table.Rows(index).Cells(3).Text
        cityname.Value = City_table.Rows(index).Cells(2).Text
        Session("Flag") = 1
        cityname.Focus()
    End Sub


    Private Sub City_Master_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Session.Add("Flag", 0)
            If Session("p_city") <> "" Then
                Dim d As New DAO
                Dim ds As New Data.DataSet

                ds = d.getData("Select * from States_Master where state_id = " & Session("p_city"))

                If ds.Tables(0).Rows.Count > 0 Then
                    Lb.Text = ds.Tables(0).Rows(0).Item("state_name")
                    state_name.Value = ds.Tables(0).Rows(0).Item("state_name")
                End If
            Else
                MsgBox("Session Not Set")
            End If

        End If
    End Sub

    Private Sub New_Click(sender As Object, e As EventArgs) Handles [New].Click
        cityname.Value = ""
        pincode.Value = ""
        Session("Flag") = 0
    End Sub
End Class
