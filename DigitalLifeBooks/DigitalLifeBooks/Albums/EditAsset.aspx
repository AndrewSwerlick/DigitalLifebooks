<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masterpages/Dialog.master" CodeBehind="EditAsset.aspx.cs" Inherits="DigitalLifeBooks.Albums.EditAsset" %>
<%@ Register Src="~/UserControls/AssetRender.ascx" TagPrefix="dlb" TagName="AssetRender" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div>
        <dlb:AssetRender runat="server" ID="AssetRender" />

        <asp:TextBox ID="Caption" runat="server"></asp:TextBox>

        <asp:Button ID="Save"  CssClass="commitButton" runat="server" Text="Save" OnClick="On_Save_Click" />
    </div>
</asp:Content>
