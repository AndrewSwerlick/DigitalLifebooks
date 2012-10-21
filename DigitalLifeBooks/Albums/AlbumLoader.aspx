<%@ Page Language="C#" MasterPageFile="~/Masterpages/Site.master" AutoEventWireup="true" CodeBehind="AlbumLoader.aspx.cs" Inherits="DigitalLifeBooks.Albums.AlbumLoader" %>
<%@ Register Src="~/UserControls/AlbumRender.ascx" TagName="AlbumRender" TagPrefix="dlb" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div>
        <dlb:AlbumRender runat="server" Id="AlbumRender"></dlb:AlbumRender>
    </div>
</asp:Content>