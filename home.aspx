<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="medium_clone.Home" %>

<%@ MasterType VirtualPath="~/Site.Master" %>

<asp:Content ID="HomeContent" ContentPlaceHolderID="Content" runat="server">
    <section id="hero">
        <div class="container">
            <div class="slogan">
                <h1 class="font-display text-white font-xl">Curabitur quis maximus</h1>
                <p class="slogan-description text-white">
                    It is a long established fact that a reader will be
                    distracted by the readable
                    content of a page when looking at its layout.The point of using Lorem Ipsum is that it has a
                    more-or-less normal distribution of letters.
                </p>
                <p>
                    <a href="javascript:0" onclick="func_login_modal()" class="btn btn-primary-outline btn-big no-radius">keşfet</a>
                </p>
            </div>
        </div>
        <%-- LOGIN --%>
        <div id="login" class="<%= Request.QueryString.ToString() == "login" ? "show-modal" : ""%>">
            <div class="login-modal">
                <!-- close button -->
                <div class="close">
                    <a href="/home" class="btn-icon">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M18 6L6 18" stroke="#757575" stroke-width="2" stroke-linecap="round"
                                stroke-linejoin="round" />
                            <path d="M6 6L18 18" stroke="#757575" stroke-width="2" stroke-linecap="round"
                                stroke-linejoin="round" />
                        </svg>
                    </a>
                </div>
                <!-- title -->
                <h2 class="title font-display font-large">Tekrar Hoşgeldin.</h2>
                <!-- form -->
                <div class="form-user-control">
                    <div class="form-group">
                        <asp:TextBox ID="email" runat="server" CssClass="form-control" placeholder="e-posta"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="password" runat="server" CssClass="form-control" TextMode="Password" placeholder="şifre"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:CheckBox ID="remember_me" runat="server" />
                        <span>Beni Hatırla</span>
                    </div>
                    <% if (isInvalid)
                        {  %>
                    <div class="form-group">
                        <p class="invalid">Kullanıcı bulunamadı.</p>
                    </div>
                    <%}
                        if (isInvalidLength)
                        { %>
                    <div class="form-group">
                        <p class="invalid">Lütfen alanları doldurun.</p>
                    </div>
                    <%} %>
                    <asp:Button runat="server" class="btn btn-primary" Text="giriş yap" OnClick="func_login"></asp:Button>
                    <!-- route register -->
                    <p class="route">
                        Hesabın yok mu?
                            <span><a href="javascript:0" onclick="func_register_modal()">Kayıt Ol</a></span>
                    </p>
                </div>
            </div>
        </div>
        <%-- REGISTER --%>
        <div id="register"  class="<%= Request.QueryString.ToString() == "register" ? "show-modal" : ""%>">
            <div class="login-modal">
                <!-- close button -->
                <div class="close">
                    <a href="/home" class="btn-icon">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M18 6L6 18" stroke="#757575" stroke-width="2" stroke-linecap="round"
                                stroke-linejoin="round" />
                            <path d="M6 6L18 18" stroke="#757575" stroke-width="2" stroke-linecap="round"
                                stroke-linejoin="round" />
                        </svg>
                    </a>
                </div>
                <!-- title -->
                <h2 class="title font-display font-large">Bize Katıl.</h2>
                <!-- form -->
                <div class="form-user-control">
                    <div class="form-group">
                        <asp:TextBox ID="register_username" CssClass="form-control" autocomplete="off" placeholder="kullanıcı adı" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="register_email" CssClass="form-control" autocomplete="off" placeholder="e-posta" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="password1" CssClass="form-control" TextMode="Password" autocomplete="off" placeholder="şifre" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="password2" CssClass="form-control" TextMode="Password" autocomplete="off" placeholder="şifre" runat="server"></asp:TextBox>
                    </div>
                    <% if (isInvalidLength)
                        { %>
                    <div class="form-group">
                        <p class="invalid">Lütfen alanları doldurun.</p>
                    </div>
                    <%} %>

                    <% if (isInvalidPassword)
                        { %>
                    <div class="form-group">
                        <p class="invalid">Şifreleriniz eşleşmiyor.</p>
                    </div>
                    <%} %>
                    <% if (isExist)
                        { %>
                    <div class="form-group">
                        <p class="invalid">Böyle bir kullanıcı var.</p>
                    </div>
                    <%} %>
                    <asp:Button runat="server" class="btn btn-primary" Text="kayıt ol" OnClick="func_register"></asp:Button>
                    <!-- route register -->
                    <p class="route">
                        Hesabın var mı?
                            <span><a href="javascript:0" onclick="func_login_modal()">Giriş Yap</a></span>
                    </p>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
