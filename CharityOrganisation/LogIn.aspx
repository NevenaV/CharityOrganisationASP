<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Template.Master" CodeBehind="LogIn.aspx.cs" Inherits="CharityOrganisation.LogIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Log In</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <h1 class="text-center">Log in</h1>
    <table class="table-invisible">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Email"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ForeColor="Red">Email field cannot be empty.</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Wrong email format.</asp:RegularExpressionValidator>
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
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" EnableClientScript="False" ForeColor="Red">Password field cannot be empty.</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" EnableClientScript="False" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9\+\._\-!\?]{3,15}$">Wrong password format.</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Log In" OnClick="Button1_Click" CausesValidation="true"/>
            </td>
            <td></td>
        </tr>
    </table>
    <table class="table-invisible">
        <tr>
            <td id="unknownUser" runat="server" class="redLetters"></td>
        </tr>
    </table>

    </form>
</asp:Content>