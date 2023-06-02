Imports System.Data.SqlClient
Imports System.Net.Mail


Partial Class Admin_Login
    Inherits System.Web.UI.Page

    Public s As String
    Private Sub login_btn_Click(sender As Object, e As EventArgs) Handles login_btn.Click
        Try
            Dim d As New DAO
            Dim obj As Data.DataSet = d.getData("Select * from Admin_Master where aname ='" & aname.Value & "'")
            If obj.Tables(0).Rows.Count > 0 Then
                If obj.Tables(0).Rows(0).Item("aname") = aname.Value Then
                    If obj.Tables(0).Rows(0).Item("aname") = "admin" Or obj.Tables(0).Rows(0).Item("aname") = aname.Value Then
                        If obj.Tables(0).Rows(0).Item("apass") = apass.Value Then
                            Session("aname") = aname.Value
                            Session("Image") = obj.Tables(0).Rows(0).Item("aimg")
                            Session("aid1") = obj.Tables(0).Rows(0).Item("aid")
                            Session("role_id") = obj.Tables(0).Rows(0).Item("atype")
                            Response.Redirect("Home_Page.aspx")
                        Else
                            lb.Text = "Enter Valid password"
                        End If
                    Else
                        forgot.Visible = True
                        lb.Text = "Enter Valid password"
                    End If
                Else
                    lb.Text = "Enter Valid Username"
                End If
            End If
        Catch ex As Exception
            'MsgBox(ex.Message)
        End Try
    End Sub

    Private Sub forgot_Click(sender As Object, e As EventArgs) Handles forgot.Click

        Dim val As String = ""
        Dim d As New DAO
        Dim obj As Data.DataSet = d.getData("Select email from Admin_Master where aname='" & aname.Value & "'")

        If obj.Tables(0).Rows.Count > 0 Then
            s = obj.Tables(0).Rows(0).Item("email")
        End If

        Try
            Dim rnd As New Random
            Dim Smtp_Server As New SmtpClient
            Dim e_mail As New MailMessage()
            Smtp_Server.UseDefaultCredentials = False
            Smtp_Server.Credentials = New Net.NetworkCredential("het.solanki721@gmail.com", "weeovkjyoazziimk")
            Smtp_Server.Port = 587
            Smtp_Server.EnableSsl = True
            Smtp_Server.Host = "smtp.gmail.com"
            Smtp_Server.DeliveryMethod = SmtpDeliveryMethod.Network

            e_mail = New MailMessage()
            e_mail.From = New MailAddress("het.solanki721@gmail.com")
            e_mail.To.Add(s)
            e_mail.Subject = "Email Sending"
            e_mail.IsBodyHtml = False
            Val = Convert.ToString(rnd.Next(90000, 99999))
            e_mail.Body = "OTP : " + val
            Smtp_Server.Send(e_mail)
            MsgBox("Mail Sent")

        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try

        Session("otp") = val
        Server.Transfer("forgot.aspx")
        Server.Transfer("passwordchange.aspx")
        Response.Redirect("forgot.aspx")
    End Sub

    Private Sub Admin_Login_Load(sender As Object, e As EventArgs) Handles Me.Load
        Session("aname") = ""
        Session("Image") = ""
        'Session("aid1") = ""
    End Sub
End Class
