<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="medium_clone.Default" %>

<%@ MasterType VirtualPath="~/User.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    
    <section id="explore">
        <div class="container">
            <div class="row">
                <div class="col">
                    <% var last_post = data_table.Rows.Count - 1; %>
                    <div class="post">
                        <div class="post-img">
                            <a href="post/?<%= data_table.Rows[last_post]["id"].ToString() %>">
                                <div class="post-img-wrapper">
                                    <img src="Content/assets/image_1.png"
                                        alt="">
                                </div>
                            </a>
                        </div>
                        <div class="post-meta">
                            <div class="post-meta-user">
                                <div class="post-meta-user-img">
                                    <a href="/user/?<%= data_table.Rows[last_post]["author_id"].ToString()%>">
                                        <img src="https://images.unsplash.com/photo-1542103749-8ef59b94f47e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80"
                                            alt="">
                                    </a>
                                </div>
                                <div class="post-meta-user-name">
                                    <a href="/user/?<%= data_table.Rows[last_post]["author_id"].ToString()%>"><%= data_table.Rows[last_post]["author"].ToString() %> </a>
                                </div>
                            </div>

                            <div class="post-meta-title">
                                <h3><a href="/post/?<%= data_table.Rows[last_post]["id"].ToString() %>"><%= data_table.Rows[last_post]["title"].ToString() %> </a></h3>
                            </div>
                            <div class="post-meta-subtitle">
                                <h4><a href="/post/?<%= data_table.Rows[last_post]["id"].ToString() %>"><% if(data_table.Rows[last_post]["content"].ToString().Length > 145) { data_table.Rows[last_post]["content"].ToString().Substring(0, 145); }; %>...</a></h4>
                            </div>
                            <div class="post-meta-info">
                                <span><a href="/post/?<%= data_table.Rows[last_post]["id"].ToString() %>">Devamını Oku</a></span>
                                <span>&middot;</span>
                                <span><%= data_table.Rows[last_post]["read_time"] %> dakika</span>
                            </div>
                        </div>
                    </div>
                </div>
                <%var k = data_table.Rows.Count - 2; %>
                <%for (var i = 0; i < 2; i++)
                    {%>
                <div class="col">
                    <% for (var j = 1; j < 5; j++)
                        {%>
                    <div class="post post-m">
                        <div class="post-img">
                            <a href="post/?<%= data_table.Rows[k]["id"].ToString() %>">
                                <div class="post-img-wrapper">
                                    <img src="Content/assets/image_2.png"
                                        alt="">
                                </div>
                            </a>
                        </div>
                        <div class="post-meta">
                            <div class="post-meta-user">
                                <div class="post-meta-user-img">
                                    <a href="/user/?<%= data_table.Rows[k]["author_id"].ToString()%>">
                                        <img src="<%= data_table.Rows[k]["avatar"] %>"
                                            alt="">
                                    </a>
                                </div>
                                <div class="post-meta-user-name">
                                    <a href="/user/?<%= data_table.Rows[k]["author_id"].ToString()%>"><%= data_table.Rows[k]["author"].ToString() %></a>
                                </div>
                            </div>
                            <div class="post-meta-title">
                                <h3><a href="post/?<%= data_table.Rows[k]["id"].ToString() %>"><%= data_table.Rows[k]["title"] %> </a></h3>
                            </div>
                            <div class="post-meta-subtitle">
                                <h4><a href="post/?<%= data_table.Rows[k]["id"].ToString() %>"><%= data_table.Rows[k]["content"] %> </a></h4>
                            </div>
                            <div class="post-meta-info">
                                <span><a href="post/?<%= data_table.Rows[k]["id"].ToString() %>">Devamını Oku</a></span>
                                <span>&middot;</span>
                                <span><%= data_table.Rows[k]["read_time"] %> dakika</span>
                            </div>
                        </div>
                    </div>
                    <%k--;} %>
                </div>
                <%} %>
            </div>
        </div>
    </section>
     <%-- trends --%>
        <section id="trends">
            <div class="container">
                <div class="post-list">
                    <div class="post-list-title">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M23 6L13.5 15.5L8.5 10.5L1 18" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                            <path d="M17 6H23V12" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                        </svg>
                        <h2>Son Yazılanlar</h2>
                    </div>
                    <!-- row -->
                    <% var l = 0; %>
                    <%for (var i = 0; i < 3; i++)
                        { %>
                         <div class="row">
                        <!-- post -->
                        <% for (var j = 0; j < 3; j++)
                            {
                                %>
                        <div class="post post-s">
                            <div class="post-img">
                                <a href="post/?<%= data_table.Rows[l]["id"] %>">
                                    <div class="post-img-wrapper">
                                        <img src="https://images.unsplash.com/photo-1606415264244-51e5301beb8b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=667&q=80"
                                            alt="">
                                    </div>
                                </a>
                            </div>
                            <div class="post-meta">
                                <div class="post-meta-user">
                                    <div class="post-meta-user-img">
                                        <a href="#">
                                            <img src="<%= data_table.Rows[l]["avatar"] %>"
                                                alt="">
                                        </a>
                                    </div>
                                    <div class="post-meta-user-name">
                                        <a href="post/?<%= data_table.Rows[l]["id"] %>"><%= data_table.Rows[l]["author"] %></a>
                                    </div>
                                </div>
                                <div class="post-meta-title">
                                    <h3><a href="post/?<%= data_table.Rows[l]["id"] %>"><%= data_table.Rows[l]["title"] %></a></h3>
                                </div>
                                <div class="post-meta-info">
                                    <span><a href="post/?<%= data_table.Rows[l]["id"] %>">Devamını Oku</a></span>
                                    <span>&middot;</span>
                                    <span><%= data_table.Rows[l]["read_time"] %> dakika</span>
                                </div>
                            </div>
                        </div>
                        <% l++; } %>
                    </div>
                    <%} %>
                </div>
            </div>
        </section>
</asp:Content>
