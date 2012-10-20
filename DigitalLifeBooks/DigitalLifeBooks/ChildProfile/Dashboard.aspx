<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="DigitalLifeBooks.ChildProfile.Dashboard" %>
<%@ Register Src="~/UserControls/AlbumRender.ascx" TagName="AlbumRender" TagPrefix="dlb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <img src='<%= ProfilePicLink %>' alt=<%= Child.FirstName + Child.LastName %> />
    <dlb:AlbumRender runat="server" ID="ImportantDocumentsRender" />

    <asp:Repeater runat="server" ID="Albums"  OnItemCreated="On_AlbumRender_Created">
        <ItemTemplate>
            <dlb:AlbumRender runat="server" ID="AlbumRender"></dlb:AlbumRender>
        </ItemTemplate>
    </asp:Repeater>

</asp:Content>
