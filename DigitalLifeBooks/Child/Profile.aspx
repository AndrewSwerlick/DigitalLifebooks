<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="DigitalLifeBooks.ChildProfile.Profile" %>

<%@ Register Assembly="DigitalLifeBooks" Namespace="DigitalLifeBooks.ServerControls"
    TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript" src="/Scripts/albumControls.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("body").addClass("child-dashboard")
        });
        

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="error">
        <asp:Label ID="lblStatus" runat="server"></asp:Label>
    </div>
    <div>
    <h1>Profile</h1>
    <img src='<%= ProfilePicPath %>' alt=<%= Child.FirstName + Child.LastName %> /> 
    <div class="album root" data-albumid='<%=AlbumId%>'>
        <a href="#" class="upload">update profile pic</a>

    </div>

    <cc1:SecurityTrimmedPanel ID="SecurityTrimmedPanel1" RoleToShowFor="Admin" runat="server">
        <div class="row">
            <div class="col-2"><label for="FullName">Name:</label></div>
            <div class="col-3"><asp:TextBox ID="FullName" runat="server"></asp:TextBox></div>
            
        </div>
        
        <div class="row">
            <div class="col-2"><label for="BirthDate">Birth Date:</label></div>
            <div class="col-3"><asp:TextBox ID="BirthDate" runat="server"></asp:TextBox></div>
            
        </div>

        <div class="row">
            <div class="col-2"><label for="BirthCity">Birth City:</label></div>
            <div class="col-3"><asp:TextBox ID="BirthCity" runat="server"></asp:TextBox></div>
            
        </div>
        
        <div class="row">
            <div class="col-2"><label for="BirthState">Birth State:</label></div>
            <div class="col-3"><asp:TextBox ID="BirthState" runat="server"></asp:TextBox></div>
            
        </div>

        <div class="row">
            <div class="col-2"><label for="BirthCountry">Birth Country:</label></div>
            <div class="col-3"><asp:TextBox ID="BirthCountry" runat="server"></asp:TextBox></div>
            
        </div>
        

        <div class="row">
            <div class="col-2"><label for="HospitalName">Hospital Name:</label></div>
            <div class="col-3"><asp:TextBox ID="HospitalName" runat="server"></asp:TextBox></div>
            
        </div>
        

        <div class="row">
            <div class="col-2"><label for="HospitalAddress">Hospital Address:</label></div>
            <div class="col-3"><asp:TextBox ID="HospitalAddress" runat="server"></asp:TextBox></div>
            
        </div>
        

        <div class="row">
            <div class="col-2"><label for="HospitalCity">Hospital City:</label></div>
            <div class="col-3"><asp:TextBox ID="HospitalCity" runat="server"></asp:TextBox></div>
            
        </div>
        

        <div class="row">
            <div class="col-2"><label for="HospitalState">Hospital State:</label></div>
            <div class="col-3"><asp:TextBox ID="HospitalState" runat="server"></asp:TextBox></div>
            
        </div>
        

        <div class="row">
            <div class="col-2"><label for="HospitalPhone">Hospital Phone:</label></div>
            <div class="col-3"><asp:TextBox ID="HospitalPhone" runat="server"></asp:TextBox></div>
            
        </div>
        

        <div class="row">
            <div class="col-2"><label for="BirthWeight">Birth Weight:</label></div>
            <div class="col-3"><asp:TextBox ID="BirthWeight" runat="server"></asp:TextBox></div>
            
        </div>
        

        <div class="row">
            <div class="col-2"><label for="BirthLength">Birth Length:</label></div>
            <div class="col-3"><asp:TextBox ID="BirthLength" runat="server"></asp:TextBox></div>
            
        </div>
        

        <div class="row">
            <div class="col-2"><label for="BirthMother">Birth Mother:</label></div>
            <div class="col-3"><asp:TextBox ID="BirthMother" runat="server"></asp:TextBox></div>
            
        </div>
        

        <div class="row">
            <div class="col-2"><label for="CaseWorker">Case Worker:</label></div>
            <div class="col-3">
                <asp:TextBox ID="CaseWorker" runat="server"></asp:TextBox>
            </div>
            
        </div>
        

        <div class="row">
            <div class="col-2"><label for="BirthSibling">Birth Sibling:</label></div>
            <div class="col-3">
                <asp:TextBox ID="BirthSibling" runat="server"></asp:TextBox>
                <asp:DropDownList ID="cboRelationship" runat="server">
                    <asp:ListItem Text="Relationship" Value=""></asp:ListItem>
                    <asp:ListItem Text="brother" Value="brother"></asp:ListItem>
                    <asp:ListItem Text="sister" Value="sister"></asp:ListItem>
                </asp:DropDownList>
            </div>
                
        </div>
            
    </cc1:SecurityTrimmedPanel>
        
</div>
    

<h1>Foster Family Information</h1>
<div>
    <div class="row">
        <div class="col-2">
            <label for="FatherName">Father's Name:</label>
        </div>
        <div class="col-3">
            <asp:TextBox ID="FatherName" runat="server"></asp:TextBox>
        </div>
    </div>
    
    

    <div class="row">
        <div class="col-2">
            <label for="MotherName">Mother's Name:</label>
        </div>
        <div class="col-3">
            <asp:TextBox ID="MotherName" runat="server"></asp:TextBox>
        </div>
    </div>
    
    

    <div class="row">
        <div class="col-2">
           <label for="FosterSibling">Foster Sibling:</label> 
        </div>
        <div class="col-3">
            <asp:TextBox ID="FosterSibling" runat="server"></asp:TextBox>
            <asp:DropDownList ID="cboFosterSibling" runat="server">
                <asp:ListItem Text="Relationship" Value=""></asp:ListItem>
                <asp:ListItem Text="brother" Value="brother"></asp:ListItem>
                <asp:ListItem Text="sister" Value="sister"></asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>
    
    
    
    <div class="row">
        <div class="col-2">
            <label for="FosterAddress">Address:</label>
        </div>
        <div class="col-3">
            <asp:TextBox ID="FosterAddress" runat="server"></asp:TextBox>
        </div>
    </div>
    
    

    <div class="row">
        <div class="col-2">
            <label for="FosterCity">City:</label>
        </div>
        <div class="col-3">
            <asp:TextBox ID="FosterCity" runat="server"></asp:TextBox>
        </div>
    </div>
    
    

    <div class="row">
        <div class="col-2">
            <label for="FosterState">State:</label>
        </div>
        <div class="col-3">
          <asp:TextBox ID="FosterState" runat="server"></asp:TextBox>  
        </div>
    </div>
    
    

    <div class="row">
        <div class="col-2">
            <label for="FosterCountry">Country:</label>
        </div>
        <div class="col-3">
           <asp:TextBox ID="FosterCountry" runat="server"></asp:TextBox> 
        </div>
    </div>
    
    

    <div class="row">
        <div class="col-2">
            <label for="FosterPhone">Phone:</label>
        </div>
        <div class="col-3">
            <asp:TextBox ID="FosterPhone" runat="server"></asp:TextBox>
        </div>
    </div>
    
    

    <h1>School Information</h1>
    <div class="row">
        <div class="col-2">
          <label for="SchoolName">SchoolName:</label>  
        </div>
        <div class="col-3">
          <asp:TextBox ID="SchoolName" runat="server"></asp:TextBox>  
        </div>
    </div>
    
    

    <div class="row">
        <div class="col-2">
           <label for="SchoolAddress">Address:</label> 
        </div>
        <div class="col-3">
          <asp:TextBox ID="SchoolAddress" runat="server"></asp:TextBox>  
        </div>
    </div>
    
    

    <div class="row">
        <div class="col-2">
           <label for="SchoolCity">City:</label> 
        </div>
        <div class="col-3">
           <asp:TextBox ID="SchoolCity" runat="server"></asp:TextBox> 
        </div>
    </div>
    
    

    <div class="row">
        <div class="col-2">
            <label for="SchoolState">State:</label>
        </div>
        <div class="col-3">
           <asp:TextBox ID="SchoolState" runat="server"></asp:TextBox> 
        </div>
    </div>
    
    

    <div class="row">
        <div class="col-2">
            <label for="SchoolCountry">Country:</label>
        </div>
        <div class="col-3">
            <asp:TextBox ID="SchoolCountry" runat="server"></asp:TextBox>
        </div>
    </div>
    
    

    <div class="row">
        <div class="col-2">
            <label for="SchoolPhone">Phone:</label>
        </div>
        <div class="col-3">
           <asp:TextBox ID="SchoolPhone" runat="server"></asp:TextBox> 
        </div>
    </div>
    
    
</div>
<div>
    <asp:Button runat="server" ID="save" Text="save" onclick="save_Click" />
    <asp:Button runat="server" ID="cancel" Text="cancel" CausesValidation="false" 
        UseSubmitBehavior="false" onclick="cancel_Click" />
    <asp:HiddenField ID="hdnId" runat="server" />
</div>

</asp:Content>
