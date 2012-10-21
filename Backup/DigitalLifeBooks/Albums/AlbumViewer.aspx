<%@ Page Language="C#" MasterPageFile="~/Masterpages/Site.master" AutoEventWireup="true" CodeBehind="AlbumViewer.aspx.cs" Inherits="DigitalLifeBooks.Albums.AlbumViewer"%>
<%@ Register Src="~/UserControls/AlbumRender.ascx" TagName="AlbumRender" TagPrefix="dlb" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div>
        <dlb:AlbumRender runat="server" Id="AlbumRender"></dlb:AlbumRender>
        <a href="#">Next</a>
        <a href="#">Prev</a>
    </div>
</asp:Content>
