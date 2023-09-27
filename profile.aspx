<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="medium_clone.Profile" %>

<asp:Content ID="Profile" ContentPlaceHolderID="Content" runat="server">
    <%-- section --%>
    <section id="profile">
        <div class="container">
            <div class="section-title">
                <h2 class="font-large">Profil</h2>
            </div>
            <% for (var i = data_table.Rows.Count - 1; i >= 0; i--)
                { %>
            <div class="post">
                <h3 class="post-title"><a href="/post/?<%= data_table.Rows[i]["id"] %>"><%= data_table.Rows[i]["title"] %> </a></h3>
                <div class="post-meta">
                    <p class="published-at">Published at <%= data_table.Rows[i]["date_name"] %></p>

                    <div class="post-meta-dropdown">

                        <button class="btn btn-icon" onclick="postActions(this); return false;">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down">
                                <polyline points="6 9 12 15 18 9"></polyline></svg>
                        </button>

                        <ul class="post-meta-actions">
                            <li class="post-meta-actions-item">
                                <a href="/story/edit/?<%= data_table.Rows[i]["id"] %>">Gönderiyi Düzenle</a>
                            </li>
                            <li class="post-meta-actions-item">
                                <button id="btn" onclick="delete_post(<%= data_table.Rows[i]["id"] %>);">Gönderiyi Sil</button>
                                <asp:HiddenField ID="id" ClientIDMode="Static" OnValueChanged="delete_post" runat="server" />
                            </li>
                        </ul>

                    </div>
                    <div class="overlay" onclick="closeActions();return false;"></div>
                </div>
            </div>
            <%} %>
        </div>
        <%-- modal --%>
      <%--  <div class="story-modal hide">
            <div class="container">
                <div class="modal">
                    <div class="wrapper">
                        <h1 class="modal-title">Gönderiyi sil</h1>
                        <p class="modal-subtitle">Gönderiyi silmek istediğine emin misin?</p>
                        <div class="btn-group">
                            <button class="btn btn-muted-outline" onclick="call.confirmDelete(false); return false;">Vazgeç</button>
                            <button class="btn btn-danger" onclick="call.confirmDelete(true)">Sil</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>--%>
    </section>
</asp:Content>
