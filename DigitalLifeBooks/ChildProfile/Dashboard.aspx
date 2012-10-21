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
            <div class="col-7 alpha">
                <h1 id="foster-child-name" class="header-1"><%= Child.FirstName + " " + Child.LastName %></h1>
                 <dlb:SecurityTrimmedPanel CssClass="childDelete" ID="SecurityTrimmedPanel1" runat="server" RoleToShowFor="Admin">
                    <a class="btn big-button delete" data-entityId="<%= Child.Id %>" data-entityType="Child" href="#">Delete</a>            
                </dlb:SecurityTrimmedPanel>
            </div>
            <div class="col-2 omega">
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
                        <p><%= Child.Age %></p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-7 alpha omega">
                        <p>Born on <%= Child.DateOfBirth.ToLongDateString() %></p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-7 alpha omega">
                        <p><%= Child.City + ", " + Child.State %></p>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <div id="main">
        <div id="important-documents" class="album row" data-albumId='<%= (ImportantDocuments != null) ? ImportantDocuments.ID : -1 %>'>     
            <div class="row">
                <div class="col-7 alpha">
                    <h2 class="header-2">Important Documents</h2><a class="btn big-button upload" href="#">Add Document</a>
                </div>
                <div class="col-2 omega">
                </div>
            </div>      
            <dlb:AlbumRender runat="server" ID="ImportantDocumentsRender" />
        </div>
        <div id="albums">
        <div class="col-7 alpha">
                    <h2 class="header-2">Albums</h2><a class="btn big-button newAlbum" data-childid=<%= Child.Id %> href="#">Add Album</a>
                </div>
                <div class="col-2 omega">      
                </div>
        </div>
            <asp:Repeater runat="server" ID="Albums"  OnItemCreated="On_AlbumRender_Created">
                <ItemTemplate>
                    <div runat ="server" class="album row" data-albumId='<%# (Container.DataItem as Album).ID %>'>
                        <div class="row">
                            <div class="col-9 alpha">
                                <h3 class="header-3"><%# (Container.DataItem as Album).Title %></h3><dlb:SecurityTrimmedPanel CssClass="albumDelete" ID="SecurityTrimmedPanel1" runat="server" RoleToShowFor="Admin">
                                <a class="btn big-button delete" data-entityId="<%# (Container.DataItem as Album).ID %>" data-entityType="Album" href="#">Delete</a>
                            </dlb:SecurityTrimmedPanel>
                                <a class="btn big-button upload" href="#">Upload</a>
                            </div>
                            <div class="col-2 omega">   
                            </div>
                        </div>                                             
                        <dlb:AlbumRender runat="server" ID="AlbumRender"></dlb:AlbumRender>
<%--                        <div class="pagingButtons">
                            <a href="#" class="next">Next</a>
                            <a href="#" class="prev">Prev</a>
                        </div>--%>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
</asp:Content>
