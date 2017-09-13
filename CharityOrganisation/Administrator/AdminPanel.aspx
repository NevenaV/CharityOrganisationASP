<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminPanel.aspx.cs" Inherits="CharityOrganisation.Administrator.AdminPanel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Admin Panel</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center">Administration</h1>
    <ul class="text-center adminUl">
        <li><a href="AdmCharitableCause.aspx">Manage Charitable Causes</a></li>
        <li><a href="AdmContactMessages.aspx">Manage Contact Messages</a></li>
        <li><a href="AdmDonations.aspx">Manage Donations</a></li>
        <li><a href="AdmEvents.aspx">Manage Events</a></li>
        <li><a href="AdmGalleryImages.aspx">Manage Gallery Images</a></li>
        <li><a href="AdmInterestingFacts.aspx">Manage Interesting Facts</a></li>
        <li><a href="AdmMenuLinks.aspx">Manage Menu Links</a></li>
        <li><a href="AdmPolls.aspx">Manage Polls</a></li>
        <li><a href="AdmRoles.aspx">Manage Roles</a></li>
        <li><a href="AdmUsers.aspx">Manage Users</a></li>
    </ul>
</asp:Content>
