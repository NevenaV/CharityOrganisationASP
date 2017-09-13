<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Template.Master" CodeBehind="Home.aspx.cs" Inherits="CharityOrganisation.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Home</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <h1 class="text-center">Donate Funds for a Charitable Cause</h1>
    <table class="table-invisible" runat="server" id="donateTable">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="First Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="First name field cannot be empty." ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="Wrong First name format." ForeColor="Red" ValidationExpression="^([A-Z]{1}[a-z]{1,40}){1}(\s[A-Z]{1}[a-z]{1,10})*$" Display="None"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Last Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" EnableClientScript="False" ErrorMessage="Last name field cannot be empty." ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" EnableClientScript="False" ErrorMessage="Wrong last name format." ValidationExpression="^([A-Z]{1}[a-z]{1,40}){1}(\s[A-Z]{1}[a-z]{1,10})*$" ForeColor="Red" Display="None"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Credit Card Number"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
            <td>
                <span class="hintLetters">16 digit number (no spaces)</span>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Credit card number field cannot be empty." ControlToValidate="TextBox3" ForeColor="Red" EnableClientScript="False" Display="None"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox3" EnableClientScript="False" ErrorMessage="Wrong Credit card number format." ForeColor="Red" ValidationExpression="^[0-9]{16}$" Display="None"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Card Security Code (CSC)"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            </td>
            <td>
                <span class="hintLetters">3 digit number (no spaces)</span>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" EnableClientScript="False" ErrorMessage="CSC field cannot be empty." ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox4" EnableClientScript="False" ErrorMessage="Wrong CSC format." ForeColor="Red" ValidationExpression="^[0-9]{3}$" Display="None"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>Amount</td>
            <td>
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            </td>
            <td>
                <span class="hintLetters">US Dollars (#.##)</span>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" EnableClientScript="False" ErrorMessage="Please enter an amount." ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="TextBox5" EnableClientScript="False" ErrorMessage="Wrong amount format." ForeColor="Red" ValidationExpression="^[0-9]{1,6}\.[0-9]{2}$" Display="None"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>Charitable Cause</td>
            <td>
                
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="causeName" DataValueField="idCharitableCause">
                </asp:DropDownList>
                
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [idCharitableCause], [causeName] FROM [CharitableCauses]"></asp:SqlDataSource>
                
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="DropDownList2" EnableClientScript="False" ErrorMessage="Please choose a charitable cause." ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>  
                <asp:CheckBox ID="CheckBox1" runat="server" Text="Anonymous Donation" />
            </td>
        </tr>

        <tr>
            <td>
                &nbsp;</td>
            <td>
                
                <asp:Button ID="Button1" runat="server" Text="Donate!" OnClick="Button1_Click" CausesValidation="true"/>
                
            </td>
        </tr>
    </table>
    <table class="table-invisible">
        <tr>
            <td>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="False" ForeColor="Red" />
            </td>
        </tr>
    </table>
    <table class="table-invisible" runat="server" id="notLogged">
        <tr>
            <td><h4>Please log in to donate funds for a charitable cause.</h4></td>
        </tr>
    </table>
    <table class="table-invisible text-center" runat="server" id="donatedNotification">
        <tr>
            <td><h4>THANK YOU FOR DONATING FUNDS FOR A CHARITABLE CAUSE!</h4></td>
        </tr>
        <tr><td>Your help is very much appreciated.</td></tr>
    </table>
    </form>
    <div class="div-60 margin-auto" id="sliderBox">
        <div id="slider" class="sliderItemBox">
            <ul id="sliderUl" runat="server">

            </ul>
        </div>
    </div>
</asp:Content>

