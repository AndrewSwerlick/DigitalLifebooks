<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/Site.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="DigitalLifeBooks.Users.UserProfile" %>
<%@ Register Src="~/UserControls/UserChildren.ascx" TagName="UserChildren" TagPrefix="dlb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:Panel runat="server" ID="ProfileForm">
    <div>
        <h1>User profile</h1>
        <div id="userprofile">
            <div>
                <div><asp:Label ID="Label8" runat="server">User</asp:Label></div>
                <div><asp:TextBox runat="server" ID="txtUserName"></asp:TextBox></div>
            </div>
            <div>
                <div><asp:Label ID="Label1" runat="server">First Name</asp:Label></div>
                <div><asp:TextBox runat="server" ID="txtFirstName"></asp:TextBox></div>
            </div>
            <div>
                <div><asp:Label ID="Label2" runat="server">Last Name</asp:Label></div>
                <div><asp:TextBox runat="server" ID="txtLastName"></asp:TextBox></div>
            </div>
             <div>
                <div><asp:Label ID="Label3" runat="server">User Type</asp:Label></div>
                <div><div><asp:TextBox runat="server" ID="txtusertype"></asp:TextBox></div>
            </div>
            <div>
                <div><asp:Label ID="Label4" runat="server">Email</asp:Label></div>
                <div><div><asp:TextBox runat="server" ID="txtEmail"></asp:TextBox></div>
            </div>
            <div>
                <div><asp:Label ID="Label5" runat="server">Phone Number</asp:Label></div>
                <div><div><asp:TextBox runat="server" ID="txtPhone"></asp:TextBox></div>
            </div>
            <div>
                <div><asp:Label ID="Label6" runat="server">City</asp:Label></div>
                <div><div><asp:TextBox runat="server" ID="txtCity"></asp:TextBox></div>
            </div>
            <div>
                <div><asp:Label ID="Label7" runat="server">State</asp:Label></div>
                <div><div><asp:TextBox runat="server" ID="txtState"></asp:TextBox></div>
            </div>
        </div>
        <div id="children">
            <dlb:UserChildren runat="server" DoNotUseCurrentUser="true" Id="UserChildren"></dlb:UserChildren>
            <a href="<%= "/Admin/UserManagement/AddChildToUser.aspx?UserId=" + User.LoginName  %>"  id="addNewChild">Add new child to this User</a>
        </div>
    </div>
</asp:Panel>
</asp:Content>
