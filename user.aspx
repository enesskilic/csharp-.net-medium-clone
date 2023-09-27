<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="user.aspx.cs" Inherits="medium_clone.user" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <!-- user section-->
    <section id="user">
        <div class="container">
            <div class="wrapper">

                <% for (var i = 0; i < data_table.Rows.Count; i++)
                    { %>
                    <div class="post">
                        <div class="post-meta">
                            <p class="post-meta-user"> <%= data_table.Rows[i]["author"] %> </p>
                            <p class="post-meta-divider">-</p>
                            <p class="post-meta-date"><%= data_table.Rows[i]["date_name"] %></p>
                        </div>
                        <div class="post-title">
                            <h1><a href="/post/?<%= data_table.Rows[i]["id"] %>"> <%= data_table.Rows[i]["title"] %> </a></h1>
                        </div>
                        <div class="post-subtitle">
                            <a href="/post/?<%= data_table.Rows[i]["id"] %>"><%= data_table.Rows[i]["content"].ToString().Substring(0, 80) %>...</a>
                        </div>
                    </div>
                <%} %>

            </div>
        </div>
    </section>
</asp:Content>
