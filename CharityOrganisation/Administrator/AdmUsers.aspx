<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdmUsers.aspx.cs" Inherits="CharityOrganisation.Administrator.AdmUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Manage Users</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center">Manage Users</h1>
    <form id="form1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idUser" DataSourceID="SqlDataSource1" ShowFooter="True" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:TemplateField HeaderText="ID User" InsertVisible="False" SortExpression="idUser">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("idUser") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("idUser") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:LinkButton ID="insLink" runat="server" ValidationGroup="insertGrp" OnClick="insLink_Click">Insert</asp:LinkButton>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email" SortExpression="email">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqTextBox1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="Email is a required field." Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revTextBox1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="Wrong Email format." Text="*" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="tbEmail" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqtbEmail" runat="server" ControlToValidate="tbEmail" EnableClientScript="False" ErrorMessage="Email is a required field." Text="*" ForeColor="Red" ValidationGroup="insertGrp"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revtbEmail" runat="server" ControlToValidate="tbEmail" EnableClientScript="False" ErrorMessage="Wrong Email format." Text="*" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="insertGrp"></asp:RegularExpressionValidator>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Password" SortExpression="password">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("password") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqTextBox2" runat="server" ControlToValidate="TextBox2" EnableClientScript="False" ErrorMessage="Password is a required field." Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revTextBox2" runat="server" ControlToValidate="TextBox2" EnableClientScript="False" ErrorMessage="Wrong Password format." Text="*" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9\+\._\-!\?]{3,15}$"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='****'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="tbPass" runat="server" Text='<%# Bind("password") %>' TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqtbPass" runat="server" ControlToValidate="tbPass" EnableClientScript="False" ErrorMessage="Password is a required field." Text="*" ForeColor="Red" ValidationGroup="insertGrp"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revtbPass" runat="server" ControlToValidate="tbPass" EnableClientScript="False" ErrorMessage="Wrong Password format." Text="*" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9\+\._\-!\?]{3,15}$" ValidationGroup="insertGrp"></asp:RegularExpressionValidator>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Role" SortExpression="idRole">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("idRole") %>' DataSourceID="SqlDataSource2" DataTextField="roleName" DataValueField="idRole">
                        </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("idRole") %>' DataSourceID="SqlDataSource2" DataTextField="roleName" DataValueField="idRole" Enabled="false">
                        </asp:DropDownList>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:DropDownList ID="ddlRole" runat="server" DataSourceID="SqlDataSource2" DataTextField="roleName" DataValueField="idRole">
                        </asp:DropDownList>
                </FooterTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [User] WHERE [idUser] = @idUser" InsertCommand="INSERT INTO [User] ([email], [password], [idRole]) VALUES (@email, @password, @idRole)" SelectCommand="SELECT * FROM [User]" UpdateCommand="UPDATE [User] SET [email] = @email, [password] = @password, [idRole] = @idRole WHERE [idUser] = @idUser">
        <DeleteParameters>
            <asp:Parameter Name="idUser" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="idRole" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="idRole" Type="Int32" />
            <asp:Parameter Name="idUser" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red"/>
    <br />
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" ValidationGroup="insertGrp"/>
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Roles]"></asp:SqlDataSource>
        </form>
</asp:Content>
