<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Sign_Up.aspx.vb" Inherits="Sign_Up" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />


    <!-- Font Icon -->
    <link rel="stylesheet" href="colorlib-regform-7/fonts/material-icon/css/material-design-iconic-font.min.css" />

    <!-- Main css -->
    <link rel="stylesheet" href="colorlib-regform-7/css/style.css" />
</head>
<body>

    <div class="main">

        <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Sign up</h2>
                        <form method="POST" class="register-form" id="quickForm" runat="server">
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="name" id="name" placeholder="Your Name" runat="server" onblur="required1(this, 'Enter Valid Name', 'your_name')"/>
                            </div>
                            <h4 id="your_name"></h4>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <asp:TextBox ID="email" name="email" runat="server" placeholder="Your Email" onblur="required1(this, 'Enter Valid Email', 'your_email')"></asp:TextBox>
                            </div>
                            <h4 id="your_email"></h4>
                            <div class="form-group">
                                <label for="your_phone"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="your_name" id="your_phone" placeholder="Your Phone" runat="server" onblur="required1(this, 'Enter Valid Phone-No', 'your_phone1')"/>
                            </div>
                            <h4 id="your_phone1"></h4>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="pass" id="pass" placeholder="Password" runat="server" onblur="required1(this, 'Enter Valid Password', 'your_pass')"/>
                            </div>
                            <h4 id="your_pass"></h4>
                            <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" name="re_pass" id="re_pass" placeholder="Repeat your password" runat="server" onblur="required1(this, 'Enter Valid Confirm Password', 'cpass')"/>
                            </div>
                            <h4 id="cpass"></h4>
                            <div class="form-group">
                                <input type="checkbox" name="agree-term" id="agree_term" class="agree-term" runat="server" />
                                <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>
                            </div>
                            <div class="form-group form-button">
                                <asp:Button Text="Register" runat="server" ID="Register"  />
                            </div>
                        </form>
                    </div>
                    <div class="signup-image">
                        <figure>
                            <img src="colorlib-regform-7/images/signup-image.jpg" alt="sing up image" /></figure>
                        <a href="Sign_In.aspx" class="signup-image-link">I am already member</a>
                    </div>
                </div>
            </div>
        </section>

    </div>

    <!-- JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
    <script src="ValidationJs.js"></script>
</body>
</html>
