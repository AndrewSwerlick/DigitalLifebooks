<%@ Page Language="C#" MasterPageFile="~/Masterpages/Site.master" AutoEventWireup="true" CodeBehind="NewChild.aspx.cs" Inherits="DigitalLifeBooks.Admin.Create.NewChild" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <script type="text/javascript">
        $(document).ready(function () {
            $(".txtDates").datepick({ showOnFocus: false, showTrigger: "#caltrigger", dateFormat: "mm/d/yyyy" });
        });

    </script>
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
       <asp:Panel runat="server" ID="NewForm">
        <div class="row">
            <div class="col-2 alpha">
                <asp:Label ID="Label1" runat="server">First Name</asp:Label>
            </div>
            <div class="col-4 omega suffix-3">
                <asp:TextBox runat="server" ID="txtFirstName"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-2 alpha">
                <asp:Label ID="Label2" runat="server">Last Name</asp:Label>
            </div>
            <div class="col-4 omega suffix-3">
                <asp:TextBox runat="server" ID="txtLastName"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-2 alpha">
                <asp:Label ID="Label3"  runat="server">Date Of Birth</asp:Label>
            </div>
            <div class="col-4 alpha omega">
                <asp:TextBox runat="server" CssClass="txtDates" ID="txtDateOfBirth"></asp:TextBox>                
            </div>
            <div class="col-1 alpha suffix-2">
                <img id="caltrigger" src="/Styles/Images/calendar.gif" alt="Popup" class="trigger"/>
            </div>
        </div>
        <div class="row">
            <div class="col-2 alpha">
                <asp:Label ID="Label4" runat="server">City</asp:Label>
            </div>
            <div class="col-4 omega suffix-3">
                <asp:TextBox runat="server" ID="txtCity"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-2 alpha">
                <asp:Label ID="Label5" runat="server">State</asp:Label>
            </div>
            <div class="col-4 omega suffix-3">
                <asp:TextBox runat="server" ID="txtState"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-2 alpha">
                <asp:Label ID="Label6" runat="server">Country</asp:Label>
            </div>
            <div class="col-4 omega suffix-3">
                <asp:TextBox runat="server" ID="txtCountry"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-2 alpha">
                <asp:Label ID="Label8" runat="server">BirthWeight(lbs)</asp:Label>
            </div>
            <div class="col-4 omega suffix-3">
                <asp:TextBox runat="server" ID="txtBirthWeight"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtBirthWeight"
        ErrorMessage="Please Enter Only Numbers" Style="color:red;font-size:12px;" ValidationExpression="^\d+$" ValidationGroup="check"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="row">
            <div class="col-2 alpha">
                <asp:Label ID="Label9" runat="server">Birthlength(in)</asp:Label>
            </div>
            <div class="col-4 omega suffix-3">
                 <asp:TextBox runat="server" ID="txtBirthLength"></asp:TextBox>
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtBirthLength"
        ErrorMessage="Please Enter Only Numbers" Style="color:red;font-size:12px;" ValidationExpression="^\d+$" ValidationGroup="check"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="row">
            <div class="col-2 alpha">
                 <asp:Label ID="Label10" runat="server">SSN(Last four)</asp:Label>
            </div>
            <div class="col-4 omega suffix-3">
                <asp:TextBox runat="server" ID="txtLast4SSN" MaxLength="4"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtLast4SSN"
        ErrorMessage="Please Enter Only Numbers" Style="color:red;font-size:12px;" ValidationExpression="^\d+$" ValidationGroup="check"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="row">
            <div class="col-1 alpha omega prefix-5 suffix-3">
                <asp:Button runat="server" ID="Save" Text="Save" OnClick="On_Save_Click" />
            </div>
        </div>
    </asp:Panel>
    <asp:Panel runat="server" ID="ConfirmationDialog" Visible="false">
        <span><asp:Literal runat="server" ID="ConfirmationMessage"></asp:Literal></span>
    </asp:Panel>
</asp:Content>
