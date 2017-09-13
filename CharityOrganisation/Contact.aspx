<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Template.Master" CodeBehind="Contact.aspx.cs" Inherits="CharityOrganisation.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Contact</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <h1 class="text-center">Contact Us</h1>
    <table class="table-invisible">
        <tr>
            <td>

                <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>

            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="Please enter your name." ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="Wrong name format." ForeColor="Red" ValidationExpression="^([A-Z]{1}[a-z]{1,10}){1}(\s[A-Z]{1}[a-z]{1,10})+$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>

                <asp:Label ID="Label2" runat="server" Text="Email"></asp:Label>

            </td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" EnableClientScript="False" ErrorMessage="Please enter your email." ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" EnableClientScript="False" ErrorMessage="Wrong email format." ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>

                <asp:Label ID="Label3" runat="server" Text="Message"></asp:Label>

            </td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" EnableClientScript="False" ErrorMessage="Please enter a message." ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox3" EnableClientScript="False" ErrorMessage="Wrong message format." ForeColor="Red" ValidationExpression="^[\w\d\W]{3,200}$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>

                &nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Send Message" OnClick="Button1_Click" />
            </td>
        </tr>
    </table>
    <div class="div-50 text-center green-letters margin-auto" runat="server" id="contactSuccess"></div>
    </form>
</asp:Content>
