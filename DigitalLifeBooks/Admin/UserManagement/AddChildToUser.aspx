<%@ Page Language="C#" MasterPageFile="~/Masterpages/Site.master" AutoEventWireup="true" CodeBehind="AddChildToUser.aspx.cs" Inherits="DigitalLifeBooks.Admin.UserManagement.AddChildToUser" %>
<%@ Import Namespace="DigitalLifeBooks.Models" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="addChildForm adminForm">
        <asp:Panel ID="EditForm" runat="server">
            <div id="addchildfrm">
            <asp:RadioButtonList CssClass="radiobutton" runat="server" ID="NewOrExistingRadioChoices">
                <asp:ListItem Text="I would like to add a new child" Value="New"></asp:ListItem>
                <asp:ListItem Text="I would like to add an existing child to this user" Value="Existing"></asp:ListItem>
            </asp:RadioButtonList>
            <div>
                <label>Search for user by name or last four of SSN</label>
            </div><asp:TextBox runat="server" ID="ChildSearchBox"></asp:TextBox>
            <asp:RadioButtonList runat="server" ID="ChildSearchResultChoices"></asp:RadioButtonList>
            
            <div><asp:Literal runat="server" ID="NoResultsFound" Visible="false">No Search Results Found</asp:Literal></div>
            <asp:Button runat="server" ID="Next" Text="Next" OnClick="On_Next_Clicked" />
            </div>
        </asp:Panel>
        <asp:Panel ID="ConfirmationDialog" Visible="false" runat="server">
            <asp:Literal ID="ConfirmationMessage" runat="server"></asp:Literal>
            <a href="<%= "/Users/UserProfile.aspx?Id=" + ProfileUser.LoginName %>">Return to user page</a>
        </asp:Panel>
    </div>
</asp:Content>

