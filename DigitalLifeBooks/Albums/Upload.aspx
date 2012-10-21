<%@ Page Language="C#" MasterPageFile="~/Masterpages/Dialog.master" AutoEventWireup="true" CodeBehind="Upload.aspx.cs" Inherits="DigitalLifeBooks.Albums.Upload" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div ID="divfileupload">
        <asp:FileUpload runat="server" ID="fileUpload" CssClass="fileUpload" OnClick="FileUpload_Click" /><asp:Button ID="Button1" CssClass="fileUploadbutton" Text="Upload" OnClick="FileUpload_Click" runat="server" />
    </div>
</asp:Content>