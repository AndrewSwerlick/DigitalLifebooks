<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AssetRender.ascx.cs" Inherits="DigitalLifeBooks.UserControls.AssetRender" %>
<%@ Register Assembly="DigitalLifeBooks"  Namespace="DigitalLifeBooks.ServerControls" TagPrefix="dlb" %>
<%@ Import Namespace="DigitalLifeBooks.UserControls" %>

<asp:Panel ID="ImageRender" runat="server" Visible="false">   
    <a href="#" class="col-album">
        <dlb:SecurityTrimmedPanel CssClass="assetDelete" ID="SecurityTrimmedPanel1" runat="server" RoleToShowFor="Admin">
                <div class="btn small-button delete" data-entityId="<%= Asset.ID %>" data-entityType="Asset" href="#">Delete</div>            
        </dlb:SecurityTrimmedPanel>
        <img class="album-asset" alt="<%= Asset.Caption %>" src='<%= "/Assets.ashx?Id=" + Asset.ID %>' />
    </a>
</asp:Panel>
<asp:Panel ID="DefaultRender" runat="server" Visible="false">    
    <a href='<%= "/Assets.ashx?Id=" + Asset.ID %>' class="col-album">
        <dlb:SecurityTrimmedPanel CssClass="assetDelete" ID="SecurityTrimmedPanel2" runat="server" RoleToShowFor="Admin">
                <div class="btn small-button delete" data-entityId="<%= Asset.ID %>" data-entityType="Asset" href="#">Delete</div>            
        </dlb:SecurityTrimmedPanel>         
        <div class="album-asset"></div>
        <span class="album-caption"><%= Asset.Caption %></span>
    </a>
</asp:Panel>