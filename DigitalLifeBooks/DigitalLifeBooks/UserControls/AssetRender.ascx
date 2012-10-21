﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AssetRender.ascx.cs" Inherits="DigitalLifeBooks.UserControls.AssetRender" %>
<%@ Import Namespace="DigitalLifeBooks.UserControls" %>

<asp:Panel ID="ImageRender" runat="server" Visible="false">
    <a href="#" class="col-album">
        <img class="album-asset" alt="<%= Asset.Caption %>" src='<%= "/Assets.ashx?Id=" + Asset.ID %>' />
    </a>
</asp:Panel>
<asp:Panel ID="DefaultRender" runat="server" Visible="false">
        <a href='<%= "/Assets.ashx?Id=" + Asset.ID %>' class="col-document">
            <div class="important-document-icon"></div>
            <span class="important-document-name"><%= Asset.Caption %></span>
        </a>
</asp:Panel>