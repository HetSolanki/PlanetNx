    <%@ Page Language="VB" AutoEventWireup="false"  CodeFile="Admin_Login.aspx.vb" Inherits="Admin_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/> 
  <title>Login</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet"
    href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback"/>
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css"/>
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css"/>
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css"/>
</head>
<body style="background-color: #9A616D;">
    <form id="form1" runat="server">
        <%--<section class="vh-100" >--%>
  <div class="container py-2 h-100 mt-4">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col col-xl-10">
          <div class="card" style="border-radius: 1rem;">
              <div class="row g-0">
                  <div class="col-md-6 col-lg-5 d-none d-md-block">
                      <img src="../img/about/team-4.jpg"
                          alt="login form" class="img-fluid" width="400" height="550"  style="border-radius: 1rem 0 0 1rem;" />
                  </div>
                  <div class="col-md-6 col-lg-7 d-flex align-items-center">
                      <div class="card-body p-4 p-lg-5 text-black">
                          <div class="d-flex align-items-center mb-3 pb-1">
                              <i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
                              <span class="h1 fw-bold mb-0">&nbsp PlanetX</span>
                          </div>

                          <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Sign into your account</h5>

                          <div class="form-outline mb-4">
                              <label class="form-label" for="form2Example17">Username</label>
                              <input type="text" id="aname" runat="server" class="form-control form-control-lg" />
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="aname" runat="server" ErrorMessage="Enter Username" Display="Dynamic" ForeColor="Black"></asp:RequiredFieldValidator>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter Valid Username " ValidationExpression="[A-Za-z0-9_]+$" ControlToValidate="aname" Display="Dynamic" ForeColor="Black"></asp:RegularExpressionValidator>
                          </div>

                          <div class="form-outline mb-4">
                              <%--<div class="input-group mb-3">--%>
                              <label class="form-label" for="form2Example27">Password
                              </label>                
                              <input type="password" id="apass" runat="server" class="form-control form-control-lg" />                                                                 
                                          <asp:Label Text="" ID="lb" runat="server" />                                      
                              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="apass" runat="server" ErrorMessage="Enter Password" Display="Dynamic" ForeColor="Black"></asp:RequiredFieldValidator>
                              <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Password " ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$" ControlToValidate="apass" Display="Dynamic" ForeColor="Black"></asp:RegularExpressionValidator>--%>                                  
                          </div>                          
                          <div class="pt-1 mb-4">
                          <%--<asp:Label ID="Label1" ForeColor="Black" Visible="True" runat="server" Text=""></asp:Label>--%>
                              <asp:Button Text="Login" runat="server" CssClass="btn btn-dark btn-lg btn-block" ID="login_btn" />
                          </div>

                          <asp:LinkButton ID="forgot" Visible="false" class="small text-muted"  runat="server" Text="Forgot password?"/>
                          <%--<p class="mb-5 pb-lg-2" style="color: #393f81;">Don't have an account? <a href="s?"
                      style="color: #393f81;">Register here</a></p>
                  <a href="#!" class="small text-muted">Terms of use.</a>
                  <a href="#!" class="small text-muted">Privacy policy</a>--%>
                      </div>
                  </div>
              </div>
          </div>
      </div>
    </div>
  </div>
<%--</section>--%>
    </form>
</body>
</html>
