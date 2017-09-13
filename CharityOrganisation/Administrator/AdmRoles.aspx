<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdmRoles.aspx.cs" Inherits="CharityOrganisation.Administrator.AdmRoles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Manage Roles</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center">Manage Roles</h1>
    <form id="form1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idRole" DataSourceID="SqlDataSource1" ShowFooter="True" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:TemplateField HeaderText="ID Role" InsertVisible="False" SortExpression="idRole">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("idRole") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("idRole") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:LinkButton ID="insLink" runat="server" ValidationGroup="insertGrp" OnClick="insLink_Click">Insert</asp:LinkButton>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Role Name" SortExpression="roleName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("roleName") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqTextBox1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="Role Name is a required field." Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revTextBox1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="Wrong Role Name format." Text="*" ForeColor="Red" ValidationExpression="^[\w\d\W]{3,100}$"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("roleName") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="tbName" runat="server" Text='<%# Bind("roleName") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqtbName" runat="server" ControlToValidate="tbName" EnableClientScript="False" ErrorMessage="Role Name is a required field." ValidationGroup="insertGrp" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revtbName" runat="server" ControlToValidate="tbName" EnableClientScript="False" ErrorMessage="Wrong Role Name format." Text="*" ValidationGroup="insertGrp" ForeColor="Red" ValidationExpression="^[\w\d\W]{3,100}$"></asp:RegularExpressionValidator>
                </FooterTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Roles] WHERE [idRole] = @idRole" InsertCommand="INSERT INTO [Roles] ([roleName]) VALUES (@roleName)" SelectCommand="SELECT * FROM [Roles]" UpdateCommand="UPDATE [Roles] SET [roleName] = @roleName WHERE [idRole] = @idRole">
        <DeleteParameters>
            <asp:Parameter Name="idRole" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="roleName" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="roleName" Type="String" />
            <asp:Parameter Name="idRole" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red"/>
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" ValidationGroup="insertGrp"/>
        </form>
</asp:Content>
