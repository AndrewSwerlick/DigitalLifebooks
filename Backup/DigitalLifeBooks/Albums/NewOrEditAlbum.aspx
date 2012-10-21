<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/Dialog.Master" AutoEventWireup="true" CodeBehind="NewOrEditAlbum.aspx.cs" Inherits="DigitalLifeBooks.Albums.NewOrEditAlbum" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:TextBox ID="AlbumTitle" runat="server"></asp:TextBox>
    <asp:TextBox TextMode="MultiLine" ID="AlbumDescription" runat="server"></asp:TextBox>
    <asp:Button runat="server" CssClass="commitButton" ID="Create" Text="Create" OnClick="On_Create_Clicked" />
</asp:Content>
