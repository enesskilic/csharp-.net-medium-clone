﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="story.aspx.cs" Inherits="medium_clone.story" ValidateRequest="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="~/Content/css/style.css?t=<%= DateTime.Now.Ticks %>" runat="server" />
</head>

<body>
    <form id="form1" runat="server">
        <%-- nav --%>
        <nav class="navbar navbar-inverse">
            <div class="container">
                <div class="logo">
                    <a href="/">
                        <svg width="230" height="53" viewBox="0 0 230 53" fill="none"
                            xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M16.488 0.0720034C18.984 0.0720034 20.976 0.312003 22.464 0.792003C23.952 1.272 25.464 1.968 27 2.88C27.528 3.168 27.984 3.408 28.368 3.6C28.8 3.792 29.16 3.888 29.448 3.888C29.88 3.888 30.216 3.648 30.456 3.168C30.696 2.64 30.888 1.824 31.032 0.720004H32.688C32.448 3.936 32.328 9.408 32.328 17.136H30.672C30.48 14.544 29.88 12.072 28.872 9.72C27.912 7.368 26.52 5.472 24.696 4.032C22.92 2.544 20.832 1.8 18.432 1.8C16.08 1.8 14.16 2.472 12.672 3.816C11.232 5.112 10.512 6.888 10.512 9.144C10.512 10.824 10.872 12.288 11.592 13.536C12.312 14.784 13.32 15.936 14.616 16.992C15.912 18 17.904 19.392 20.592 21.168L22.896 22.752C25.728 24.624 27.96 26.256 29.592 27.648C31.224 29.04 32.544 30.672 33.552 32.544C34.608 34.368 35.136 36.504 35.136 38.952C35.136 42.024 34.344 44.616 32.76 46.728C31.176 48.792 29.016 50.352 26.28 51.408C23.592 52.464 20.592 52.992 17.28 52.992C14.592 52.992 12.36 52.752 10.584 52.272C8.808 51.792 7.176 51.144 5.688 50.328C4.632 49.656 3.816 49.32 3.24 49.32C2.808 49.32 2.472 49.584 2.232 50.112C1.992 50.592 1.8 51.384 1.656 52.488H0C0.192 49.464 0.288 42.984 0.288 33.048H1.944C2.28 38.424 3.48 42.792 5.544 46.152C7.608 49.464 10.776 51.12 15.048 51.12C17.64 51.12 19.776 50.424 21.456 49.032C23.136 47.64 23.976 45.648 23.976 43.056C23.976 40.368 23.112 38.064 21.384 36.144C19.656 34.224 16.92 32.064 13.176 29.664C10.296 27.792 7.992 26.16 6.264 24.768C4.536 23.376 3.12 21.744 2.016 19.872C0.912 17.952 0.36 15.744 0.36 13.248C0.36 10.368 1.08 7.944 2.52 5.976C4.008 3.96 5.976 2.472 8.424 1.512C10.872 0.552003 13.56 0.0720034 16.488 0.0720034Z"
                                fill="black" />
                            <path
                                d="M54.4309 14.76H62.9269V16.2H54.4309V45.288C54.4309 46.728 54.6709 47.76 55.1509 48.384C55.6789 48.96 56.4949 49.248 57.5989 49.248C59.6629 49.248 61.2949 47.808 62.4949 44.928L63.7189 45.576C61.8949 50.52 58.6069 52.992 53.8549 52.992C50.6869 52.992 48.2869 52.176 46.6549 50.544C45.6469 49.536 44.9509 48.288 44.5669 46.8C44.2309 45.264 44.0629 43.176 44.0629 40.536V16.2H38.0149V14.76H44.0629V5.256C48.0469 5.256 51.5029 4.488 54.4309 2.952V14.76Z"
                                fill="black" />
                            <path
                                d="M83.4221 13.752C88.9421 13.752 93.2621 15.336 96.3821 18.504C99.5021 21.624 101.062 26.592 101.062 33.408C101.062 40.224 99.5021 45.192 96.3821 48.312C93.2621 51.432 88.9421 52.992 83.4221 52.992C77.9501 52.992 73.6301 51.432 70.4621 48.312C67.3421 45.192 65.7821 40.224 65.7821 33.408C65.7821 26.592 67.3421 21.624 70.4621 18.504C73.6301 15.336 77.9501 13.752 83.4221 13.752ZM83.4221 15.192C81.3581 15.192 79.7021 16.704 78.4541 19.728C77.2541 22.704 76.6541 27.264 76.6541 33.408C76.6541 39.552 77.2541 44.112 78.4541 47.088C79.7021 50.064 81.3581 51.552 83.4221 51.552C85.5341 51.552 87.1901 50.088 88.3901 47.16C89.5901 44.184 90.1901 39.6 90.1901 33.408C90.1901 27.216 89.5661 22.632 88.3181 19.656C87.1181 16.68 85.4861 15.192 83.4221 15.192Z"
                                fill="black" />
                            <path
                                d="M130.325 13.752C132.485 13.752 134.117 14.4 135.221 15.696C136.325 16.992 136.877 18.552 136.877 20.376C136.877 22.152 136.349 23.616 135.293 24.768C134.285 25.872 132.941 26.424 131.261 26.424C129.629 26.424 128.333 26.016 127.373 25.2C126.413 24.336 125.933 23.208 125.933 21.816C125.933 19.512 126.989 17.64 129.101 16.2C128.909 16.152 128.621 16.128 128.237 16.128C127.757 16.128 127.373 16.176 127.085 16.272C125.261 16.56 123.701 17.664 122.405 19.584C121.157 21.504 120.533 23.472 120.533 25.488V44.568C120.533 46.776 121.061 48.312 122.117 49.176C123.221 50.04 124.949 50.472 127.301 50.472V51.984C126.629 51.984 126.077 51.96 125.645 51.912C120.749 51.768 117.485 51.696 115.853 51.696C114.557 51.696 111.605 51.768 106.997 51.912C106.613 51.96 106.133 51.984 105.557 51.984V50.472C107.285 50.472 108.485 50.112 109.157 49.392C109.829 48.624 110.165 47.256 110.165 45.288V22.608C110.165 20.4 109.829 18.792 109.157 17.784C108.485 16.776 107.285 16.272 105.557 16.272V14.76C107.093 14.904 108.581 14.976 110.021 14.976C114.293 14.976 117.797 14.64 120.533 13.968V20.664C121.445 18.6 122.765 16.944 124.493 15.696C126.221 14.4 128.165 13.752 130.325 13.752Z"
                                fill="black" />
                            <path
                                d="M146.006 0C148.358 0 150.062 0.840001 151.118 2.52C151.598 3.24 151.982 4.128 152.27 5.184C152.558 6.24 152.702 7.344 152.702 8.496C152.702 10.992 152.054 13.248 150.758 15.264C149.51 17.28 147.638 18.864 145.142 20.016L144.494 18.72C145.886 18.144 147.086 17.256 148.094 16.056C149.15 14.856 149.774 13.632 149.966 12.384C150.11 11.808 150.182 11.256 150.182 10.728C150.182 10.248 150.11 9.792 149.966 9.36C148.91 10.512 147.518 11.088 145.79 11.088C144.11 11.088 142.742 10.608 141.686 9.648C140.63 8.64 140.102 7.272 140.102 5.544C140.102 3.912 140.654 2.592 141.758 1.584C142.862 0.528 144.278 0 146.006 0Z"
                                fill="black" />
                            <path
                                d="M193.233 44.136C193.233 46.344 193.569 47.952 194.241 48.96C194.961 49.968 196.161 50.472 197.841 50.472V51.984C196.353 51.84 194.865 51.768 193.377 51.768C189.201 51.768 185.697 52.104 182.865 52.776V46.296C180.657 50.76 176.793 52.992 171.273 52.992C167.673 52.992 165.057 52.056 163.425 50.184C162.657 49.272 162.081 48.096 161.697 46.656C161.361 45.168 161.193 43.224 161.193 40.824V22.608C161.193 20.4 160.833 18.792 160.113 17.784C159.441 16.776 158.265 16.272 156.585 16.272V14.76C158.073 14.904 159.561 14.976 161.049 14.976C165.225 14.976 168.729 14.64 171.561 13.968V43.776C171.561 45.792 171.849 47.304 172.425 48.312C173.049 49.32 174.201 49.824 175.881 49.824C177.801 49.824 179.433 49.032 180.777 47.448C182.169 45.816 182.865 43.824 182.865 41.472V22.608C182.865 20.4 182.505 18.792 181.785 17.784C181.113 16.776 179.937 16.272 178.257 16.272V14.76C179.793 14.904 181.281 14.976 182.721 14.976C186.897 14.976 190.401 14.64 193.233 13.968V44.136Z"
                                fill="black" />
                            <path
                                d="M215.297 13.752C217.121 13.752 218.801 13.992 220.337 14.472C221.873 14.904 223.049 15.408 223.865 15.984C224.345 16.32 224.777 16.488 225.161 16.488C225.593 16.488 225.953 16.272 226.241 15.84C226.577 15.36 226.793 14.688 226.889 13.824H228.401C228.209 16.272 228.113 20.496 228.113 26.496H226.601C226.169 23.328 225.209 20.688 223.721 18.576C222.281 16.416 220.169 15.336 217.385 15.336C215.945 15.336 214.745 15.744 213.785 16.56C212.873 17.376 212.417 18.504 212.417 19.944C212.417 21.576 212.969 22.992 214.073 24.192C215.177 25.344 216.905 26.76 219.257 28.44L221.345 29.952C224.273 32.16 226.433 34.128 227.825 35.856C229.217 37.584 229.913 39.744 229.913 42.336C229.913 44.448 229.289 46.32 228.041 47.952C226.841 49.584 225.209 50.832 223.145 51.696C221.081 52.56 218.801 52.992 216.305 52.992C213.665 52.992 211.409 52.488 209.537 51.48C208.001 50.712 206.897 50.208 206.225 49.968C205.745 49.824 205.313 49.992 204.929 50.472C204.593 50.904 204.329 51.576 204.137 52.488H202.625C202.817 49.752 202.913 44.952 202.913 38.088H204.425C205.385 46.92 208.625 51.336 214.145 51.336C215.537 51.336 216.713 50.928 217.673 50.112C218.681 49.248 219.185 47.952 219.185 46.224C219.185 44.88 218.873 43.68 218.249 42.624C217.673 41.568 216.929 40.632 216.017 39.816C215.105 39 213.737 37.872 211.913 36.432C209.753 34.704 208.097 33.312 206.945 32.256C205.841 31.2 204.881 29.952 204.065 28.512C203.297 27.072 202.913 25.464 202.913 23.688C202.913 20.616 204.113 18.192 206.513 16.416C208.913 14.64 211.841 13.752 215.297 13.752Z"
                                fill="black" />
                        </svg>
                    </a>
                </div>
                <ul class="nav-list">
                    <li class="nav-item">
                        <asp:Button Text="Vazgeç" ClientIDMode="Static" OnClick="give_up" CssClass="btn btn-muted-outline" Style="margin-right: 10px" runat="server" />
                        <%if (isEdit)
                            { %>

                        <asp:Button class="btn btn-green" OnClick="update_post" OnClientClick="return printText();" runat="server" Text="Güncelle" />
                        <%}
                            else
                            { %>
                        <asp:Button class="btn btn-green" OnClick="send_post" OnClientClick="return printText();" runat="server" Text="Paylaş" />

                        <% }%>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link profile-btn" href="javascript:0" onclick="func_open_dropdown()">
                            <%--<img src=https://images.unsplash.com/photo-1606415264244-51e5301beb8b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=667&q=80" />--%> 
                        </a>
                        <div class="dropdown">
                            <ul class="dropdown-list">
                                <li class="dropdown-list-item">
                                    <asp:HyperLink NavigateUrl="story" CssClass="dropdown-item" runat="server">Hikaye Oluştur</asp:HyperLink>
                                </li>
                                <li class="dropdown-list-item">
                                    <asp:HyperLink NavigateUrl="profile" CssClass="dropdown-item" runat="server">Profil</asp:HyperLink>
                                </li>
                                <li class="dropdown-list-item">
                                    <asp:HyperLink NavigateUrl="settings" CssClass="dropdown-item" runat="server">Ayarlar</asp:HyperLink>
                                </li>
                                <li class="dropdown-list-item">
                                    <a href="javascript:0">
                                        <asp:Button CssClass="dropdown-item" Text="Çıkış Yap" OnClick="func_logout" runat="server" />
                                    </a>
                                </li>
                            </ul>
                            <div class="dropdown-overlay" onclick="func_close_dropdown()"></div>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
        <%-- section --%>
        <main>
            <section id="story">
                <div class="container">
                    <div class="wrapper">
                        <div id="editor">
                            <h1 id="title" contenteditable="true" data-text="Başlık"></h1>

                            <div id="block-list">
                                <div class="block">
                                    <div class="block-settings">
                                        <div class="block-settings-expand" onclick="expand_settings(this)">
                                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                                xmlns="http://www.w3.org/2000/svg">
                                                <path d="M18 6L6 18" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                                    stroke-linejoin="round" />
                                                <path d="M6 6L18 18" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                                    stroke-linejoin="round" />
                                            </svg>
                                        </div>
                                        <div class="block-settings-list">
                                            <button class="block-settings-btn" onclick="setSubTitle(this);return false;">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                                    fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                                    stroke-linejoin="round" class="feather feather-type">
                                                    <polyline points="4 7 4 4 20 4 20 7"></polyline>
                                                    <line x1="9" y1="20" x2="15" y2="20"></line>
                                                    <line x1="12" y1="4" x2="12" y2="20"></line>
                                                </svg>
                                            </button>
                                            <button class="block-settings-btn" onclick="setBold(this);return false;">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                                    fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                                    stroke-linejoin="round" class="feather feather-bold">
                                                    <path d="M6 4h8a4 4 0 0 1 4 4 4 4 0 0 1-4 4H6z"></path>
                                                    <path d="M6 12h9a4 4 0 0 1 4 4 4 4 0 0 1-4 4H6z"></path>
                                                </svg>
                                            </button>
                                            <button class="block-settings-btn" onclick="setItalic(this);return false;">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                                    fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                                    stroke-linejoin="round" class="feather feather-italic">
                                                    <line x1="19" y1="4" x2="10" y2="4"></line>
                                                    <line x1="14" y1="20" x2="5" y2="20"></line>
                                                    <line x1="15" y1="4" x2="9" y2="20"></line>
                                                </svg>
                                            </button>
                                        </div>
                                    </div>
                                    <p class="block-content" contenteditable="true" data-text="Yazmaya başla..." onfocus="removeAttr(this)"
                                        onblur="addAttr(this)">
                                    </p>
                                </div>
                            </div>
                            <asp:HiddenField ID="post_title" ClientIDMode="Static" runat="server"></asp:HiddenField>
                            <asp:HiddenField ID="post_content" ClientIDMode="Static" runat="server"></asp:HiddenField>
                            <%-- for update --%>
                            <asp:HiddenField ID="current_title" ClientIDMode="Static" runat="server" />
                            <asp:HiddenField ID="current_block_list" ClientIDMode="Static" runat="server" />
                        </div>
                    </div>
                </div>
            </section>
        </main>
    </form>
    <script src="<%= ResolveUrl("Scripts/main.js") %>"></script>
    <script src="<%= ResolveUrl("Scripts/editor.js") %>"></script>
</body>
</html>
