<%@ Page Language="VB" AutoEventWireup="false" CodeFile="forgot.aspx.vb" Inherits="Admin_forgot" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Forgot Password</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css" />
    <!-- icheck bootstrap -->
    <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css" />
    <!-- Theme style -->
    <link rel="stylesheet" href="dist/css/adminlte.min.css" />
</head>
<body style="background-color: #9A616D;">
    <%--<section class="vh-100" >--%>
    <div class="login-box" style="margin-top:150px; margin-left:500px;">
        <div class="card card-outline card-primary">
            <div class="card-header text-center">
                <a href="Admin_Login.aspx" class="h1"><b>Admin</b>Forgot</a>
            </div>
            <div class="card-body">
                <p class="login-box-msg">Send OTP On Registered Email Id.</p>
                <form  runat="server" method="post">
                    <div class="input-group mb-3">
                        <asp:TextBox class="form-control" ID="otp" runat="server" placeholder="Enter Digit OTP" MaxLength="6"></asp:TextBox>
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-info-circle">
                                    <asp:Label Text="" ID="lb" runat="server"  /></span>
                        <br />                       
                        
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <asp:Button runat="server" ID="verify" class="btn btn-primary btn-block" Text="Verify" />
                        </div>
                        <!-- /.col -->
                    </div>
                </form>
                <p class="mt-3 mb-1">
                    <a href="Admin_Login.aspx">Login</a>
                </p>
            </div>
            <!-- /.login-card-body -->
        </div>
    </div>
    <!-- /.login-box -->

    <!-- jQuery -->
    <script src="plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="dist/js/adminlte.min.js"></script>
        <%--</section>--%>
</body>
</html>
