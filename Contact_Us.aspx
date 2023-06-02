<%@ Page Title="" Language="VB" MasterPageFile="~/Masterpage.master" AutoEventWireup="false" CodeFile="Contact_Us.aspx.vb" Inherits="Contact_Us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server">
        <Scripts>
            <asp:ScriptReference Path="Admin/plugins/jquery/jquery.min.js" />
            <asp:ScriptReference Path="Admin/plugins/bootstrap/js/bootstrap.bundle.min.js" />
            <asp:ScriptReference Path="Admin/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js" />
            <asp:ScriptReference Path="Admin/dist/js/adminlte.js" />
            <asp:ScriptReference Path="Admin/plugins/jquery-mousewheel/jquery.mousewheel.js" />
            <asp:ScriptReference Path="Admin/plugins/raphael/raphael.min.js" />   
            <asp:ScriptReference Path="Admin/plugins/jquery-mapael/jquery.mapael.min.js" />
            <asp:ScriptReference Path="Admin/plugins/jquery-mapael/maps/usa_states.min.js" />
            <asp:ScriptReference Path="Admin/plugins/chart.js/Chart.min.js" />
            <%--<asp:ScriptReference Path="Admin/dist/js/demo.js" />--%>
            <asp:ScriptReference Path="Admin/dist/js/pages/dashboard2.js" />
        </Scripts>
    </asp:ScriptManager>


                
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">

        <Triggers>
            <asp:asyncPostBackTrigger ControlID="btnsub" />

        </Triggers>


        <ContentTemplate>

      <!-- Map Begin -->
    <div class="map">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3669.883311347486!2d70.02731787298056!3d23.10136706725499!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3950c7414e3b9f85%3A0xc2395fc1b879def6!2sChitrakut%20Society%202%2C%20Anjar%2C%20Gujarat%20370110!5e0!3m2!1sen!2sin!4v1681476759923!5m2!1sen!2sin" height="500" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
    </div>
    <!-- Map End -->

    <!-- Contact Section Begin -->
    <section class="contact spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="contact__text">
                        <div class="section-title">
                            <span>Information</span>
                            <h2>Contact Us</h2>
                            <p>As you might expect of a company that began as a high-end interiors contractor, we pay
                                strict attention.</p>
                        </div>
                        <ul>
                            <li>
                                <h4>Gajjar's Office</h4>
                                <p>Madhuban Complex, Chitrakut Society-1, Anjar, Kutch <br />+43 982-314-0958</p>
                            </li>
                            <li>
                                <h4>France</h4>
                                <p>109 Avenue Léon, 63 Clermont-Ferrand <br />+12 345-423-9893</p>
                            </li>
                        </ul>
                    </div>
                </div>

    
                <div class="col-lg-6 col-md-6">
                    <div class="contact__form">

                            <div class="row">
                                <div class="col-lg-6">                                                                  
                                    <asp:TextBox runat="server" placeholder="Name" id="c_name"/>
                                </div>
                                <div class="col-lg-6">
                                    <asp:TextBox TextMode="Email" runat="server" placeholder="Email" ID="email"></asp:TextBox>
                                </div>
                                <div class="col-lg-12">
                                    <asp:TextBox TextMode="MultiLine" placeholder="Message" runat="server" ID="msg"></asp:TextBox>                                    
                                    <asp:Button Text="Send Message" ID="btnsub"  CssClass="site-btn" runat="server" CausesValidation="false" />                                    
                                </div>
                            </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
                 </ContentTemplate>
    </asp:UpdatePanel>
    <!-- Contact Section End -->
</asp:Content>

