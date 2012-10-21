<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="DigitalLifeBooks.ChildProfile.Dashboard" %>
<%@ Register Src="~/UserControls/AlbumRender.ascx" TagName="AlbumRender" TagPrefix="dlb" %>
<%@ Register Assembly="DigitalLifeBooks"  Namespace="DigitalLifeBooks.ServerControls" TagPrefix="dlb" %>
<%@ Import Namespace="DigitalLifeBooks.Models" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript" src="/Scripts/albumControls.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("body").addClass("child-dashboard")
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <header id="header">
        <div class="row">
            <div class="col-9 alpha omega">
                <h1 id="foster-child-name" class="header-1"><%= Child.FirstName + " " + Child.LastName %><a href="#" class="newAlbum" data-childId='<%= Child.Id %>'>Create New Album</a></h1>            
                
            </div>
        </div>
        <div id="foster-child-information" class="row">
            <div class="col-2 alpha">
                <div id="foster-child-image-container">
                    <img id="foster-child-image" src="<%= ProfilePicLink %>">
                </div>
            </div>
            <div class="col-7 omega">
                <div class="row">
                    <div class="col-7 alpha omega">
                        <p>Age 11</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-7 alpha omega">
                        <p>Born on Augest 1, 1999</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-7 alpha omega">
                        <p>Columbus, Ohio</p>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <div id="main">
        <div id="important-documents">            
            <dlb:AlbumRender runat="server" ID="ImportantDocumentsRender" />
        </div>
        <div id="albums">
            <asp:Repeater runat="server" ID="Albums"  OnItemCreated="On_AlbumRender_Created">
                <ItemTemplate>
                    <div runat ="server" class="album" data-albumId='<%# (Container.DataItem as Album).ID %>'>
                        <div class="row">
                            <div class="col-9 alpha omega">
                                <h2 class="header-2"><%# (Container.DataItem as Album).Title %></h2>
                            </div>
                        </div>
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
        </div>
    </div>
</asp:Content>
