<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdmMenuLinks.aspx.cs" Inherits="CharityOrganisation.Administrator.AdmMenuLinks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Manage Menu Links</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center">Manage Menu Links</h1>
    <form id="form1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idMenu" DataSourceID="SqlDataSource1" ShowFooter="True" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:TemplateField HeaderText="ID Menu" InsertVisible="False" SortExpression="idMenu">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("idMenu") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("idMenu") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:LinkButton ID="insLink" runat="server" ValidationGroup="insertGrp" OnClick="insLink_Click">Insert</asp:LinkButton>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Title" SortExpression="title">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("title") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqTextBox1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="Title is a required field." Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revTextBox1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="Wrong Title format." Text="*" ForeColor="Red" ValidationExpression="^[\w\d\W]{3,200}$"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("title") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="tbTitle" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqtbTitle" runat="server" ControlToValidate="tbTitle" EnableClientScript="False" ErrorMessage="Title is a required field." Text="*" ForeColor="Red" ValidationGroup="insertGrp"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revtbTitle" runat="server" ControlToValidate="tbTitle" EnableClientScript="False" ErrorMessage="Wrong Title format." Text="*" ForeColor="Red" ValidationGroup="insertGrp" ValidationExpression="^[\w\d\W]{3,200}$"></asp:RegularExpressionValidator>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Priority" SortExpression="priority">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("priority") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqTextBox2" runat="server" ControlToValidate="TextBox2" EnableClientScript="False" ErrorMessage="Priority is a required field." Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revTextBox2" runat="server" ControlToValidate="TextBox2" EnableClientScript="False" ErrorMessage="Wrong Priority format." Text="*" ForeColor="Red" ValidationExpression="^[0-9]{1,4}$"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("priority") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="tbPriority" runat="server" Text='<%# Bind("priority") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqtbPriority" runat="server" ControlToValidate="tbPriority" EnableClientScript="False" ErrorMessage="Priority is a required field." Text="*" ForeColor="Red" ValidationGroup="insertGrp"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revtbPriority" runat="server" ControlToValidate="tbPriority" EnableClientScript="False" ErrorMessage="Wrong Priority format." Text="*" ForeColor="Red" ValidationGroup="insertGrp" ValidationExpression="^[0-9]{1,4}$"></asp:RegularExpressionValidator>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Link" SortExpression="link">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("link") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqTextBox3" runat="server" ControlToValidate="TextBox3" EnableClientScript="False" ErrorMessage="Link is a required field." Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revTextBox3" runat="server" ControlToValidate="TextBox3" EnableClientScript="False" ErrorMessage="Wrong Link format." Text="*" ForeColor="Red" ValidationExpression="^[\w\d\W]{3,100}$"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("link") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="tbLink" runat="server" Text='<%# Bind("link") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqtbLink" runat="server" ControlToValidate="tbLink" EnableClientScript="False" ErrorMessage="Link is a required field." Text="*" ForeColor="Red" ValidationGroup="insertGrp"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revtbLink" runat="server" ControlToValidate="tbLink" EnableClientScript="False" ErrorMessage="Wrong Link format." Text="*" ForeColor="Red" ValidationGroup="insertGrp" ValidationExpression="^[\w\d\W]{3,100}$"></asp:RegularExpressionValidator>
                </FooterTemplate>
            </asp:TemplateField>
        </Columns>
        </asp:GridView>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Menu] WHERE [idMenu] = @idMenu" InsertCommand="INSERT INTO [Menu] ([title], [priority], [link]) VALUES (@title, @priority, @link)" SelectCommand="SELECT * FROM [Menu]" UpdateCommand="UPDATE [Menu] SET [title] = @title, [priority] = @priority, [link] = @link WHERE [idMenu] = @idMenu">
        <DeleteParameters>
            <asp:Parameter Name="idMenu" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="title" Type="String" />
            <asp:Parameter Name="priority" Type="Int32" />
            <asp:Parameter Name="link" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="title" Type="String" />
            <asp:Parameter Name="priority" Type="Int32" />
            <asp:Parameter Name="link" Type="String" />
            <asp:Parameter Name="idMenu" Type="Int32" />
        </UpdateParameters>
        </asp:SqlDataSource>
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red"/>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" ValidationGroup="insertGrp"/>
    </form>
</asp:Content>
