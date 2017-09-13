<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdmContactMessages.aspx.cs" Inherits="CharityOrganisation.Administrator.AdmContactMessages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Manage Contact Messages</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <h1>Manage Contact Messages</h1>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idContact" DataSourceID="SqlDataSource1" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:TemplateField HeaderText="ID Contact" InsertVisible="False" SortExpression="idContact">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("idContact") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("idContact") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name" SortExpression="name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqTextBox1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="Name is a required field." Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="Wrong Name format." Text="*" ForeColor="Red" ValidationExpression="^([A-Z]{1}[a-z]{1,10}){1}(\s[A-Z]{1}[a-z]{1,10})+$"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email" SortExpression="email">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqTextBox2" runat="server" ControlToValidate="TextBox2" EnableClientScript="False" ErrorMessage="Email is a required field." Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" EnableClientScript="False" ErrorMessage="Wrong Email format." Text="*" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Time Sent" SortExpression="timeSent">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("timeSent") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqTextBox3" runat="server" ControlToValidate="TextBox3" EnableClientScript="False" ErrorMessage="Time is a required field." Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox3" EnableClientScript="False" ErrorMessage="Wrong Time format." Text="*" ForeColor="Red" ValidationExpression="^[0123]{1}[0-9]{1}-(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sept|Oct|Nov|Dec)-[01]{1}[0-9]{1}\s[012]{1}[0-9]{1}:[012345]{1}[0-9]{1}:[012345]{1}[0-9]{1}$"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("timeSent") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Message" SortExpression="message">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("message") %>' TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqTextBox4" runat="server" ControlToValidate="TextBox4" EnableClientScript="False" ErrorMessage="Messsage is a required field." Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox4" EnableClientScript="False" ErrorMessage="Wrong Message format." Text="*" ForeColor="Red" ValidationExpression="^[\w\d\W]{3,200}$"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("message") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Contact] WHERE [idContact] = @idContact" InsertCommand="INSERT INTO [Contact] ([name], [email], [timeSent], [message]) VALUES (@name, @email, @timeSent, @message)" SelectCommand="SELECT * FROM [Contact]" UpdateCommand="UPDATE [Contact] SET [name] = @name, [email] = @email, [timeSent] = @timeSent, [message] = @message WHERE [idContact] = @idContact">
            <DeleteParameters>
                <asp:Parameter Name="idContact" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="timeSent" Type="DateTime" />
                <asp:Parameter Name="message" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="timeSent" Type="DateTime" />
                <asp:Parameter Name="message" Type="String" />
                <asp:Parameter Name="idContact" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server"/>
    </form>

</asp:Content>
