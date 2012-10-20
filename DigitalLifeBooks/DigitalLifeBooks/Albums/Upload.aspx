<%@ Page Language="C#" MasterPageFile="~/Masterpages/Site.master" AutoEventWireup="true" CodeBehind="Upload.aspx.cs" Inherits="DigitalLifeBooks.Albums.Upload" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div>
        <asp:FileUpload runat="server" ID="fileUpload" OnClick="FileUpload_Click" /><asp:Button ID="Button1" Text="Upload" OnClick="FileUpload_Click" runat="server" />
    </div>
</asp:Content>