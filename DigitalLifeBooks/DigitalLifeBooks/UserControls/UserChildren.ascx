<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserChildren.ascx.cs" Inherits="DigitalLifeBooks.Controls.UserChildren" %>
<div>
        <asp:Repeater id="rtChildren" runat="server">

            <HeaderTemplate>
            <table border="1" width="100%">
            <tr>
            <th>Children</th>
            </tr>
            </HeaderTemplate>

            <ItemTemplate>
            <tr>
            <td><a href="#"><%# Eval("FirstName") %> <%# Eval("LastName") %></a></td>
            </tr>
            </ItemTemplate>

            <AlternatingItemTemplate>
            <tr bgcolor="#e8e8e8">
            <td><a href="#"><%# Eval("FirstName") %> <%# Eval("LastName") %></a></td>
            </tr>
            </AlternatingItemTemplate>

            <FooterTemplate>
            </table>
            </FooterTemplate>

        </asp:Repeater>
</div>
