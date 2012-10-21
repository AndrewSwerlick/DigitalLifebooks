<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/Site.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="DigitalLifeBooks.Users.UserProfile" %>
<%@ Register Src="~/UserControls/UserChildren.ascx" TagName="UserChildren" TagPrefix="dlb" %>
<%@ Register Assembly="DigitalLifeBooks"  Namespace="DigitalLifeBooks.ServerControls" TagPrefix="dlb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript" src="../Scripts/albumControls.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="userProfile">            
    <asp:Panel runat="server" ID="ProfileRead">           
        <div>
            <div><h1><%= User.DisplayName %></h1><asp:LinkButton CssClass="editSettings" runat="server" OnClick="On_Edit_Click">edit data</asp:LinkButton></div>
             <dlb:SecurityTrimmedPanel CssClass="childDelete" ID="SecurityTrimmedPanel1" runat="server" RoleToShowFor="Admin">
                    <a class="btn big-button delete" data-entityId="<%= User.ID %>" data-entityType="User" href="#">Delete</a>            
            </dlb:SecurityTrimmedPanel>
        </div>
        <div id="profile-data">
            <div>
                <asp:Label ID="Label1" runat="server">First Name:</asp:Label>
                <span><%= User.FirstName %></asp:Literal></span>
            </div>
            <div>
                <asp:Label ID="Label2" runat="server">Last Name:</asp:Label>
                <span><%= User.LastName %></asp:Literal></span>
            </div>            
            <div>
                <asp:Label ID="Label4" runat="server">Email:</asp:Label>
                <span><%= User.Email %></span>
            </div>
            <div>
                <asp:Label ID="Label5" runat="server">Phone Number:</asp:Label>
                <span><%= User.PhoneNumber %></span>
            </div>
            <div>
                <asp:Label ID="Label6" runat="server">City:</asp:Label>
                <span><%= User.City %></span>
            </div>
            <div>
                <asp:Label ID="Label7" runat="server">State:</asp:Label>
                <span><%= User.State %></span>
            </div>
        </div>
        <dlb:SecurityTrimmedPanel runat="server" RoleToShowFor="Admin">
            <div id="children">
                <h3><%=User.DisplayName + "'s Children" %></h3>
                <dlb:UserChildren runat="server" UseCurrentUser="false" Id="UserChildren"></dlb:UserChildren>
                <a href="<%= "/Admin/UserManagement/AddChildToUser.aspx?UserId=" + User.LoginName  %>"  id="addNewChild">Add new child to this User</a>
            </div>
        </dlb:SecurityTrimmedPanel>
    </asp:Panel>
    <asp:Panel runat="server" ID="ProfileEdit" Visible="false">
        <h1><%= User.DisplayName %></h1><asp:LinkButton ID="LinkButton1" CssClass="editSettings" runat="server" OnClick="On_Edit_Click"></asp:LinkButton>
        <div>
            <div>
                <div><asp:Label ID="Label10" runat="server">First Name</asp:Label></div>
                <div><asp:TextBox runat="server" ID="txtFirstName"></asp:TextBox></div>
            </div>
            <div>
                <div><asp:Label ID="Label11" runat="server">Last Name</asp:Label></div>
                <div><asp:TextBox runat="server" ID="txtLastName"></asp:TextBox></div>
            </div>          
            <div>
                <div><asp:Label ID="Label13" runat="server">Email</asp:Label></div>
                <div><asp:TextBox runat="server" ID="txtEmail"></asp:TextBox></div>
            </div>
            <div>
                <div><asp:Label ID="Label14" runat="server">Phone Number</asp:Label></div>
                <div><asp:TextBox runat="server" ID="txtPhone"></asp:TextBox></div>
            </div>
            <div>
                <div><asp:Label ID="Label15" runat="server">City</asp:Label></div>
                <div><asp:TextBox runat="server" ID="txtCity"></asp:TextBox></div>
            </div>
            <div>
                <div><asp:Label ID="Label16" runat="server">State</asp:Label></div>
                <div><asp:TextBox runat="server" ID="txtState"></asp:TextBox></div>
            </div>
            <asp:LinkButton Text="Save" runat="server" ID="Save" OnClick="On_Save_Click"></asp:LinkButton>
        </div>
    </asp:Panel>
</div>

</asp:Content>
