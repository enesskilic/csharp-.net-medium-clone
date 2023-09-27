<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="settings.aspx.cs" Inherits="medium_clone.Settings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <section id="settings">
        <div class="container">
            <div class="wrapper">
                <div class="section-title">
                    <h2 class="font-large">Ayarlar</h2>
                </div>
                <!-- option -->
                <div class="option">
                    <div class="option-content">
                        <div class="option-title">
                            <h4>İsim</h4>
                        </div>
                        <div class="option-editable">
                            <input id="edit-name" onfocus="this.selectionStart = this.selectionEnd = this.value.length" type="text" value="<%= user_name %>" readonly />
                            <asp:HiddenField ID="current_name" ClientIDMode="Static" runat="server" />
                            <asp:HiddenField ID="new_name" ClientIDMode="Static" runat="server" />
                        </div>
                    </div>

                    <div class="option-button-group">
                        <asp:Button CssClass="btn btn-muted-outline" Text="Düzenle" OnClientClick="return edit('name', this);" CommandArgument="new_name.Value" CommandName="change_name" OnClick="save_target" runat="server" />
                        <asp:Button Text="Vazgeç" ID="name" ClientIDMode="Static" OnClientClick="cancel(); return false;" CssClass="btn btn-muted-outline hide" runat="server" />
                    </div>
                </div>
                <!-- option -->
                <div class="option">
                    <div class="option-content">
                        <div class="option-title">
                            <h4>Biyografi</h4>
                        </div>
                        <div class="option-editable">
                            <input id="edit-bio" onfocus="this.selectionStart = this.selectionEnd = this.value.length" type="text" value="<%= user_bio %>"  readonly />
                            <asp:HiddenField ID="current_bio" ClientIDMode="Static" runat="server" />
                            <asp:HiddenField ID="new_bio" ClientIDMode="Static" runat="server" />
                        </div>
                    </div>

                    <div class="option-button-group">
                        <asp:Button CssClass="btn btn-muted-outline" Text="Düzenle" OnClientClick="return edit('bio', this);"  CommandName="change_bio" OnClick="save_target" runat="server" />
                        <asp:Button Text="Vazgeç" ID="bio" ClientIDMode="Static" OnClientClick="cancel();return false;" CssClass="btn btn-muted-outline hide" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
