﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AlbumRender.ascx.cs" Inherits="DigitalLifeBooks.UserControls.AlbumRender" %>
<%@ Import Namespace="DigitalLifeBooks.UserControls" %>
<%@ Import Namespace="DigitalLifeBooks.Models" %>
<%@ Register Src="~/UserControls/AssetRender.ascx" TagPrefix="dlb" TagName="AssetRender" %>

<span><%= Album.Name %></span>

<asp:Repeater runat="server" ID="Assets" OnItemDataBound="On_Assets_Databinding">
    <ItemTemplate>
        <dlb:AssetRender runat="server" ID="AssetRender"></dlb:AssetRender>
    </ItemTemplate>
</asp:Repeater>