<%@ Page Title="" Language="VB" MasterPageFile="~/Masterpage.master" AutoEventWireup="false" CodeFile="profile.aspx.vb" Inherits="profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Male-Fashion | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
        rel="stylesheet">
    <%--<a href="Shop.aspx">Shop.aspx</a>--%>
    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <link rel="stylesheet" href="css/profile.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-xl px-4 mt-4">
    <!-- Account page navigation-->
   <%-- <nav class="nav nav-borders">
        <a class="nav-link active ms-0" href="https://www.bootdey.com/snippets/view/bs5-edit-profile-account-details" target="__blank">Profile</a>
        <a class="nav-link" href="https://www.bootdey.com/snippets/view/bs5-profile-billing-page" target="__blank">Billing</a>
        <a class="nav-link" href="https://www.bootdey.com/snippets/view/bs5-profile-security-page" target="__blank">Security</a>
        <a class="nav-link" href="https://www.bootdey.com/snippets/view/bs5-edit-notifications-page"  target="__blank">Notifications</a>
    </nav>--%>
    <hr class="mt-0 mb-4">
    <div class="row">
        <div class="col-xl-4">
            <!-- Profile picture card-->
            <div class="card mb-4 mb-xl-0">
                <div class="card-header">Profile Picture</div>
                <div class="card-body text-center">
                    <!-- Profile picture image-->
                    <img class="img-account-profile rounded-circle mb-2" id="profile_img" alt="Select Image" src="Admin/dist/img/user_icon2.png" style="cursor: pointer">
                    <!-- Profile picture help block-->
                    <asp:FileUpload ID="FileUpload1" class="col-10" runat="server" Visible="true" />
                    <div class="small font-italic text-muted mb-4">JPG or PNG no larger than 5 MB</div>
                    <!-- Profile picture upload button-->
                    <label class="form-label" id="imgpath" for="customFile">Select New Image</label>
                    <br />
                    <asp:Button class="btn btn-primary" runat="server" ID="btnimg" Text="Upload new image" ></asp:Button>
                </div>
            </div>
        </div>
        <script>
            $(function () {
                var fileupload = $("#FileUpload1");
                var filePath = $("#imgpath");
                var image = $("#profile_img");
                image.click(function () {
                    fileupload.click();
                });
                fileupload.change(function () {
                    var fileName = $(this).val().split('\\')[$(this).val().split('\\').length - 1];
                    filePath.html(fileName);
                });
            });


            if ('<%=Session("flag")%>' == 1) {
                if ('<%=Session("proimg")%>' != "") {

                    var imgpath = "img/profiles/";
                    document.getElementById("profile_img").src = imgpath + '<%=Session("proimg")%>';
                }
                else {
                    document.getElementById("profile_img").src = "Admin/dist/img/user_icon2.png";
                }

            }
        </script>
        <div class="col-xl-8">
            <!-- Account details card-->
            <div class="card mb-4">
                <div class="card-header">Account Details</div>
                <div class="card-body">
                    <form>
                        <!-- Form Group (username)-->
                        <div class="mb-3">
                            <label class="small mb-1" for="inputUsername">Username (how your name will appear to other users on the site)</label>
                            <%--<input class="form-control" id="inputUsername" type="text" placeholder="Enter your username" value="username"   runat="server">--%>
                          <asp:TextBox ID="inputUsername"  class="form-control"  placeholder="Enter your username" runat="server"></asp:TextBox>
                        </div>
                        <!-- Form Row-->
                       <%-- <div class="row gx-3 mb-3">
                            <!-- Form Group (first name)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="inputFirstName">First name</label>
                                <input class="form-control" id="inputFirstName" type="text" placeholder="Enter your first name" value="Valerie">
                            </div>
                            <!-- Form Group (last name)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="inputLastName">Last name</label>
                                <input class="form-control" id="inputLastName" type="text" placeholder="Enter your last name" value="Luna">
                            </div>
                        </div>--%>
                        <!-- Form Row        -->
                        <div class="row gx-3 mb-3">
                            <!-- Form Group (organization name)-->
                            <div class="col-md-4">
                                <label class="small mb-1" for="inputState">State</label>
                                
                              <asp:TextBox ID="inputState"  class="form-control"  placeholder="Enter your State name" runat="server"></asp:TextBox>
                            </div>
                            <!-- Form Group (location)-->
                            <div class="col-md-4">
                                <label class="small mb-1" for="inputCity">City</label>
                               
                                <asp:TextBox ID="inputCity"  class="form-control"  placeholder="Enter your City name" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-md-4">
                                <label class="small mb-1" for="inputCity">Pin-Code  </label>
                               
                                <asp:TextBox ID="inputpincode"  class="form-control"  placeholder="Enter your Pin-code name" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <!-- Form Group (email address)-->
                        <div class="mb-3">
                            <label class="small mb-1" for="inputEmailAddress">Email address</label>
                        
                              <asp:TextBox ID="inputEmailAddress"  class="form-control"  placeholder="Enter your email address" runat="server"></asp:TextBox>
                        </div>
                        <!-- Form Row-->
                        <div class="row gx-3 mb-3">
                            <!-- Form Group (phone number)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="inputPhone">Phone number</label>
                                  <asp:TextBox ID="inputPhone"  class="form-control"  placeholder="Enter your phone number" runat="server"></asp:TextBox>
                            </div>
                       <%--     <!-- Form Group (birthday)-->
                            <div class="col-md-6">
                                <label class="small mb-1" for="inputBirthday">Birthday</label>
                                <input class="form-control" id="inputBirthday" type="text" name="birthday" placeholder="Enter your birthday" runat="server" value="06/10/1988">
                            </div>--%>
                        </div>
                        <!-- Save changes button-->
                        
                        <asp:Button ID="save" runat="server" class="btn btn-primary" Text="Save changes" CausesValidation="False" />
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>

