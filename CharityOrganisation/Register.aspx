<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Template.Master" CodeBehind="Register.aspx.cs" Inherits="CharityOrganisation.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Register</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <h1 class="text-center">Register Here</h1>
    <table class="table-invisible">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Email"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="Email field is required." ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="Wrong Email format." ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" EnableClientScript="False" ErrorMessage="Password field is required." ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" EnableClientScript="False" ErrorMessage="Wrong Password format." ForeColor="Red" ValidationExpression="^[a-zA-Z0-9\+\._\-!\?]{3,15}$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Confirm Password"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" EnableClientScript="False" ErrorMessage="Password confirmation is required." ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox2" ControlToValidate="TextBox3" EnableClientScript="False" ErrorMessage="Passwords do not match." ForeColor="Red"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Register" CausesValidation="true" OnClick="Button1_Click"/>
            </td>
        </tr>
    </table>
    </form>
</asp:Content>
