<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/Site.Master" AutoEventWireup="true" CodeBehind="AdminChildSearch.aspx.cs" Inherits="DigitalLifeBooks.Admin.AdminChildSearch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:Panel runat="server" ID="NewForm">
        <div>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server">Search Children</asp:Label>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="txtSeachChildren"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button runat="server" ID="Search" Text="Search" OnClick="On_Search_Click" />
                    </td>
                </tr>
            </table>         
        </div>
        <div>
            <asp:Repeater ID="rtChildren" runat="server">            
                <HeaderTemplate>
                    <table>
                        <tr>
                            <th>Children</th>
                        </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                   <a href="#"><%#Eval("FirstName")  %> + " " + <%#Eval("LastName") %></a>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>   
        </div>
    </asp:Panel>
</asp:Content>
