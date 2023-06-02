Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Public Class DAO
    Private con As SqlConnection

    Public Sub New()
        con = New SqlConnection("Data Source=103.191.208.118;Initial Catalog=Data_stu6;Persist Security Info=True;User ID=Data_stu6;Password=Lovecoding@6750")

        Try
            con.Open()
            con.Close()
        Catch ex As Exception
            MsgBox("Please check database connectivity..!")
        End Try
    End Sub

    Public Function getData(ByVal str As String) As Data.DataSet
        Dim ds As New Data.DataSet
        Dim da As New SqlDataAdapter(str, con)
        con.Close()
        con.Open()
        da.SelectCommand.ExecuteReader()
        con.Close()
        da.Fill(ds)
        Return ds
    End Function



    Public Sub insertData(ByVal str As String)
        Dim cmd As New SqlCommand(str, con)
        con.Close()
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub

    Public Function validate(ByVal str As String) As Integer
        Dim f As Integer = 0
        Dim ds As Data.DataSet
        con.Close()
        con.Open()
        ds = getData(str)
        If ds.Tables(0).Rows.Count > 0 Then
            f = 1
        End If
        con.Close()
        Return f
    End Function
End Class
