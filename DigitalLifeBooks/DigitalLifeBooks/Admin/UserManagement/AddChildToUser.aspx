<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddChildToUser.aspx.cs" Inherits="DigitalLifeBooks.Admin.UserManagement.AddChildToUser" %>
<%@ Import Namespace="DigitalLifeBooks.Models" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Panel ID="EditForm" runat="server">
            <asp:RadioButtonList runat="server" ID="NewOrExistingRadioChoices">
                <asp:ListItem Text="I would like to add a new child" Value="New"></asp:ListItem>
                <asp:ListItem Text="I would like to add an existing child to this user" Value="Existing"></asp:ListItem>
            </asp:RadioButtonList>
            <asp:TextBox runat="server" ID="ChildSearchBox"></asp:TextBox>
            <asp:RadioButtonList runat="server" ID="ChildSearchResultChoices"></asp:RadioButtonList>
        
            <asp:Button runat="server" ID="Next" Text="Next" OnClick="On_Next_Clicked" />
        </asp:Panel>
        <asp:Panel ID="ConfirmationDialog" Visible="false" runat="server">
            <asp:Literal ID="ConfirmationMessage" runat="server"></asp:Literal>
        </asp:Panel>
    </div>
    </form>
</body>
</html>
