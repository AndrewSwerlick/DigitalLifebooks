<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/Site.Master" AutoEventWireup="true" CodeBehind="NewAlbum.aspx.cs" Inherits="DigitalLifeBooks.Albums.NewAlbum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:TextBox ID="Title" runat="server"></asp:TextBox>
    <asp:Button runat="server" ID="Create" Text="Create" OnClick="On_Create_Clicked" />
</asp:Content>
