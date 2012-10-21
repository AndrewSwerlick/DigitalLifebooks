<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/Site.Master" AutoEventWireup="true" CodeBehind="SearchForUser.aspx.cs" Inherits="DigitalLifeBooks.Admin.UserManagement.SearchForUser" %>
<%@ Import Namespace="DigitalLifeBooks.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <label>Search For User</label><asp:TextBox ID="Search" runat="server"></asp:TextBox>
    <div>
        <asp:Repeater runat="server" ID="SearchResults">
            <HeaderTemplate>
                
            </HeaderTemplate>
            <ItemTemplate>
                <div class="search-result">
                    <a href='<%# ""(Container.DataItem as User) %>'>
                        <%# (Container.DataItem as User).FirstName + " " + (Container.DataItem as User).LastName%>
                    </a>    
                </div>
            </ItemTemplate>
            <FooterTemplate>
            
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
