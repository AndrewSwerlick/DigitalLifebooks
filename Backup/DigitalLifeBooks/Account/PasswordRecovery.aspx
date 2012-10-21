<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/OldSite.Master" AutoEventWireup="true" CodeBehind="PasswordRecovery.aspx.cs" Inherits="DigitalLifeBooks.Account.PasswordRecovery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:PasswordRecovery OnVerifyingUser="validateUserEmail" 
      SuccessText="Your password was successfully reset and emailed to you."
      QuestionFailureText="Incorrect answer. Please try again." 
      runat="server" ID="PWRecovery" 
      UserNameFailureText="Username not found.">
    <MailDefinition IsBodyHtml="true" BodyFileName="email.txt" 
           From="YourEmailAddress@YourDomain.com" 
           Subject="Password Reset" 
           Priority="High">
    </MailDefinition>    
</asp:PasswordRecovery>
</asp:Content>
