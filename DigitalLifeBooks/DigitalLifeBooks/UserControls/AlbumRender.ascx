﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AlbumRender.ascx.cs" Inherits="DigitalLifeBooks.UserControls.AlbumRender" %>
<%@ Import Namespace="DigitalLifeBooks.UserControls" %>
<%@ Import Namespace="DigitalLifeBooks.Models" %>
<%@ Register Src="~/UserControls/AssetRender.ascx" TagPrefix="dlb" TagName="AssetRender" %>

<span><%= Title %></span>

<asp:Repeater runat="server" ID="Assets" OnItemCreated="On_AssetsRender_Created">
    <ItemTemplate>
        <dlb:AssetRender runat="server" ID="AssetRender"></dlb:AssetRender>
    </ItemTemplate>
</asp:Repeater>