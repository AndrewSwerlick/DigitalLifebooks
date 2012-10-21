<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="DigitalLifeBooks.ChildProfile.Dashboard" %>
<%@ Register Src="~/UserControls/AlbumRender.ascx" TagName="AlbumRender" TagPrefix="dlb" %>
<%@ Register Assembly="DigitalLifeBooks"  Namespace="DigitalLifeBooks.ServerControls" TagPrefix="dlb" %>
<%@ Import Namespace="DigitalLifeBooks.Models" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript" src="/Scripts/albumControls.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <img src='<%= ProfilePicLink %>' alt=<%= Child.FirstName + Child.LastName %> />
    <dlb:AlbumRender runat="server" ID="ImportantDocumentsRender" />

    <a href="#" class="newAlbum" data-childId='<%= Child.Id %>'>Create New Album</a>
    <asp:Repeater runat="server" ID="Albums"  OnItemCreated="On_AlbumRender_Created">
        <ItemTemplate>
            <div runat ="server" class="album" data-albumId='<%# (Container.DataItem as Album).ID %>'>
                <dlb:SecurityTrimmedPanel runat="server" RoleToShowFor="Admin">
                    <a href="#" class="delete" data-entityId='<%# (Container.DataItem as Album).ID%>' data-entityType="Album">Delete</a>
                </dlb:SecurityTrimmedPanel>
                <a href="#" class="upload">Upload</a>
                <dlb:AlbumRender runat="server" ID="AlbumRender"></dlb:AlbumRender>
                <div class="pagingButtons">
                    <a href="#" class="next">Next</a>
                    <a href="#" class="prev">Prev</a>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>

</asp:Content>
