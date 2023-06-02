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
        con.Open()
        da.SelectCommand.ExecuteReader()
        con.Close()
        da.Fill(ds)
        Return ds
    End Function

    Public Function validate(ByVal str As String) As Integer
        Dim f As Integer = 0
        Dim obj As SqlDataReader
        con.Open()
        obj = fetchdata(str)
        While obj.Read
            f = 1
        End While
        con.Close()
        Return f
    End Function
    Public Function fetchdata(ByVal str As String) As SqlDataReader 'used to execute any select query
        Try

            Dim obj As SqlDataReader ' connected data object to fetch data from database,need live connection
            Dim cmd As New SqlCommand(str, con) ' need 2 parameter,str for query and conn for connection
            con.Close()
            con.Open() ' opened connection
            obj = cmd.ExecuteReader 'to execute the query
            Return obj
            con.Close()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Function
End Class
