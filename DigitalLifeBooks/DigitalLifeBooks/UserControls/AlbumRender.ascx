﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AlbumRender.ascx.cs" Inherits="DigitalLifeBooks.UserControls.AlbumRender" %>
<%@ Import Namespace="DigitalLifeBooks.UserControls" %>
<%@ Import Namespace="DigitalLifeBooks.Models" %>
<%@ Register Src="~/UserControls/AssetRender.ascx" TagPrefix="dlb" TagName="AssetRender" %>
<div class="album row">
    <div class="row">
        <div class="col-9 alpha omega">
            <h2 class="header-2"><%= Title %></h2><h2>
        </h2></div>
    </div>

    <asp:Repeater runat="server" ID="Assets" OnItemCreated="On_AssetsRender_Created">
        <ItemTemplate>   
            <dlb:AssetRender runat="server" ID="AssetRender"></dlb:AssetRender>
        </ItemTemplate>
    </asp:Repeater>
 </div>