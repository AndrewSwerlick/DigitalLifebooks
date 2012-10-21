<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserChildren.ascx.cs" Inherits="DigitalLifeBooks.Controls.UserChildren" %>
<asp:Repeater id="rtChildren" runat="server">

    <HeaderTemplate>
        <ul class="foster-children">
    </HeaderTemplate>

    <ItemTemplate>                            
        <li class="foster-child">
            <a data-childId='<%# Eval("ID") %>' href='<%# "/ChildProfile/Dashboard.aspx?ChildId=" + Eval("ID")%>'> <%# Eval("FirstName") %> <%# Eval("LastName") %></a>
        </li> 
        </ItemTemplate>                             
    <FooterTemplate>
        </ul>
    </FooterTemplate>

</asp:Repeater>
