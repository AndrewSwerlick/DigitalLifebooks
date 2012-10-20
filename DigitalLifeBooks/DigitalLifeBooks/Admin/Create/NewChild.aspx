﻿<%@ Page Language="C#" MasterPageFile="~/Masterpages/Site.master" AutoEventWireup="true" CodeBehind="NewChild.aspx.cs" Inherits="DigitalLifeBooks.Admin.Create.NewChild" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div>
        <asp:Panel runat="server" ID="NewForm">
            <div>
                <asp:Label runat="server">First Name</asp:Label><asp:TextBox runat="server" ID="FirstName"></asp:TextBox>
                <asp:Label ID="Label1" runat="server">Last Name</asp:Label><asp:TextBox runat="server" ID="LastName"></asp:TextBox>
                <asp:Label ID="Label2" runat="server">Date Of Birth</asp:Label><asp:TextBox runat="server" ID="DateOfBirth"></asp:TextBox>
                <asp:Label ID="Label3" runat="server">Last Four Digits of Social Security Number</asp:Label><asp:TextBox runat="server" ID="Last4SSN"></asp:TextBox>
            </div>
            <asp:Button runat="server" ID="Save" Text="Save" OnClick="On_Save_Click" />
        </asp:Panel>
        <asp:Panel runat="server" ID="ConfirmationDialog" Visible="false">
            <span><asp:Literal runat="server" ID="ConfirmationMessage"></asp:Literal></span>
        </asp:Panel>
    </div>
</asp:Content>
