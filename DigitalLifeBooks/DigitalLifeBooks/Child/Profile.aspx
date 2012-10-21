<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="DigitalLifeBooks.ChildProfile.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div>
    <h1>Profile</h1>
    <%--<img src="/Assets.ashx"--%>

    <label for="FullName">Name:</label>
    <asp:TextBox ID="FullName" runat="server"></asp:TextBox>

    <label for="BirthDate">Birth Date:</label>
    <asp:TextBox ID="BirthDate" runat="server"></asp:TextBox>

    <label for="BirthCity">Birth City:</label>
    <asp:TextBox ID="BirthCity" runat="server"></asp:TextBox>

    <label for="BirthState">Birth State:</label>
    <asp:TextBox ID="BirthState" runat="server"></asp:TextBox>

    <label for="BirthCountry">Birth Country:</label>
    <asp:TextBox ID="BirthCountry" runat="server"></asp:TextBox>

    <label for="HospitalName">Hospital Name:</label>
    <asp:TextBox ID="HospitalName" runat="server"></asp:TextBox>

    <label for="HospitalAddress">Hospital Address:</label>
    <asp:TextBox ID="HospitalAddress" runat="server"></asp:TextBox>

    <label for="HospitalCity">Hospital City:</label>
    <asp:TextBox ID="HospitalCity" runat="server"></asp:TextBox>

    <label for="HospitalState">Hospital State:</label>
    <asp:TextBox ID="HospitalState" runat="server"></asp:TextBox>

    <label for="HospitalPhone">Hospital Phone:</label>
    <asp:TextBox ID="HospitalPhone" runat="server"></asp:TextBox>

    <label for="BirthWeight">Birth Weight:</label>
    <asp:TextBox ID="BirthWeight" runat="server"></asp:TextBox>

    <label for="BirthLength">Birth Length:</label>
    <asp:TextBox ID="BirthLength" runat="server"></asp:TextBox>

    <label for="BirthMother">Birth Mother:</label>
    <asp:TextBox ID="BirthMother" runat="server"></asp:TextBox>

    <label for="BirthSibling">Birth Sibling:</label>
    <asp:TextBox ID="BirthSibling" runat="server"></asp:TextBox>
    <asp:DropDownList ID="cboRelationship" runat="server">
        <asp:ListItem Text="Relationship" Value=""></asp:ListItem>
        <asp:ListItem Text="brother" Value="brother"></asp:ListItem>
        <asp:ListItem Text="sister" Value="sister"></asp:ListItem>
    </asp:DropDownList>
    <a href="#" id="addsibling">Add Sibling</a>
</div>

<h1>Foster Family Information</h1>
<div>
    <label for="FatherName">Father's Name:</label>
    <asp:TextBox ID="FatherName" runat="server"></asp:TextBox>

    <label for="MotherName">Mother's Name:</label>
    <asp:TextBox ID="MotherName" runat="server"></asp:TextBox>

    <label for="FosterSibling">Foster Sibling:</label>
    <asp:TextBox ID="FosterSibling" runat="server"></asp:TextBox>
    <asp:DropDownList ID="cboFosterSibling" runat="server">
        <asp:ListItem Text="Relationship" Value=""></asp:ListItem>
        <asp:ListItem Text="brother" Value="brother"></asp:ListItem>
        <asp:ListItem Text="sister" Value="sister"></asp:ListItem>
    </asp:DropDownList>
    <a href="#" id="a1">Add Sibling</a>

    <label for="FosterAddress">Address:</label>
    <asp:TextBox ID="FosterAddress" runat="server"></asp:TextBox>

    <label for="FosterCity">City:</label>
    <asp:TextBox ID="FosterCity" runat="server"></asp:TextBox>

    <label for="FosterState">State:</label>
    <asp:TextBox ID="FosterState" runat="server"></asp:TextBox>

    <label for="FosterCountry">Country:</label>
    <asp:TextBox ID="FosterCountry" runat="server"></asp:TextBox>

    <label for="FosterPhone">Phone:</label>
    <asp:TextBox ID="FosterPhone" runat="server"></asp:TextBox>

    <h1>School Information</h1>
    <label for="SchoolName">SchoolName:</label>
    <asp:TextBox ID="SchoolName" runat="server"></asp:TextBox>
    <a href="#" id="schooldetail">See Details</a>

    <label for="SchoolAddress">Address:</label>
    <asp:TextBox ID="SchoolAddress" runat="server"></asp:TextBox>

    <label for="SchoolCity">City:</label>
    <asp:TextBox ID="SchoolCity" runat="server"></asp:TextBox>

    <label for="SchoolState">State:</label>
    <asp:TextBox ID="SchoolState" runat="server"></asp:TextBox>

    <label for="SchoolCountry">Country:</label>
    <asp:TextBox ID="SchoolCountry" runat="server"></asp:TextBox>

    <label for="SchoolPhone">Phone:</label>
    <asp:TextBox ID="SchoolPhone" runat="server"></asp:TextBox>
    <a href="#" id="addschool">Add School</a>
</div>
<div>
    <asp:Button runat="server" ID="save" Text="save" onclick="save_Click" />
    <input type="button" id="cancel" value="cancel" />
    <asp:HiddenField ID="hdnId" runat="server" />
</div>

</asp:Content>
