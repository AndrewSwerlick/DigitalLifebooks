﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AssetRender.ascx.cs" Inherits="DigitalLifeBooks.UserControls.AssetRender" %>
<%@ Import Namespace="DigitalLifeBooks.UserControls" %>

<asp:Panel ID="ImageRender" runat="server" Visible="false">
    <img alt="<%= Asset.Title %>" src='<%= "/Assets.ashx?Id=" + Asset.Id %>' />
</asp:Panel>
<asp:Panel ID="DefaultRender" runat="server" Visible="false">
    <a href='<%= "/Assets.ashx?Id=" + Asset.Id %>'><%= Asset.Title %></a>
</asp:Panel>