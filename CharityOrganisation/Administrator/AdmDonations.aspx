<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdmDonations.aspx.cs" Inherits="CharityOrganisation.Administrator.AdmDonations" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Manage Donations</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <h1 class="text-center">Manage Donations</h1>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idDonation" DataSourceID="SqlDataSource1" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:TemplateField HeaderText="ID Donation" InsertVisible="False" SortExpression="idDonation">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("idDonation") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("idDonation") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ID User" SortExpression="idUser">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("idUser") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqTextBox1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="User ID is a required field." Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="Wrong User ID format." Text="*" ForeColor="Red" ValidationExpression="^[1-9]{1}[0-9]{0,4}$"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("idUser") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Amount" SortExpression="amount">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("amount") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqTextBox2" runat="server" ControlToValidate="TextBox2" EnableClientScript="False" ErrorMessage="Amount is a required field." Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox2" EnableClientScript="False" ErrorMessage="Wrong Amount format." Text="*" ForeColor="Red" ValidationExpression="^[0-9]{1,6}\.[0-9]{2}$"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("amount") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Time Donated" SortExpression="timeDonated">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("timeDonated") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqTextBox3" runat="server" ControlToValidate="TextBox3" EnableClientScript="False" ErrorMessage="Time is a required field." Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox3" EnableClientScript="False" ErrorMessage="Wrong Time format." Text="*" ForeColor="Red" ValidationExpression="^[0123]{1}[0-9]{1}-(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sept|Oct|Nov|Dec)-[01]{1}[0-9]{1}\s[012]{1}[0-9]{1}:[012345]{1}[0-9]{1}:[012345]{1}[0-9]{1}$"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("timeDonated") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Charitable Cause" SortExpression="charitableCauseId">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="causeName" DataValueField="idCharitableCause" SelectedValue='<%# Bind("charitableCauseId") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("charitableCauseId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="First Name" SortExpression="firstName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("firstName") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqTextBox5" runat="server" ControlToValidate="TextBox5" EnableClientScript="False" ErrorMessage="First name is a required field." Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="TextBox5" EnableClientScript="False" ErrorMessage="Wrong First Name format." Text="*" ForeColor="Red" ValidationExpression="^([A-Z]{1}[a-z]{1,40}){1}(\s[A-Z]{1}[a-z]{1,10})*$"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("firstName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Last Name" SortExpression="lastName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("lastName") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqTextBox6" runat="server" ControlToValidate="TextBox6" EnableClientScript="False" ErrorMessage="Last name is a required field." Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="TextBox6" EnableClientScript="False" ErrorMessage="Wrong Last Name format." Text="*" ForeColor="Red" ValidationExpression="^([A-Z]{1}[a-z]{1,40}){1}(\s[A-Z]{1}[a-z]{1,10})*$"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("lastName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Anonymous Donation" SortExpression="anonymous">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("anonymous") %>'>
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                        <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList3" runat="server" SelectedValue='<%# Bind("anonymous") %>' Enabled="false">
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                        <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Credit Card Number" SortExpression="creditCard">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("creditCard") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqTextBox8" runat="server" ControlToValidate="TextBox8" EnableClientScript="False" ErrorMessage="Credit card number is a required field." Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="TextBox8" EnableClientScript="False" ErrorMessage="Wrong Credit card number format." Text="*" ForeColor="Red" ValidationExpression="^[0-9]{16}$"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("creditCard") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CSC" SortExpression="csc">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("csc") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqTextBox9" runat="server" ControlToValidate="TextBox9" EnableClientScript="False" ErrorMessage="CSC is a required field." Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="TextBox9" EnableClientScript="False" ErrorMessage="Wrong Credit card number format." Text="*" ForeColor="Red" ValidationExpression="^[0-9]{3}$"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("csc") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Donations] WHERE [idDonation] = @idDonation" InsertCommand="INSERT INTO [Donations] ([idUser], [amount], [timeDonated], [charitableCauseId], [firstName], [lastName], [anonymous], [creditCard], [csc]) VALUES (@idUser, @amount, @timeDonated, @charitableCauseId, @firstName, @lastName, @anonymous, @creditCard, @csc)" SelectCommand="SELECT * FROM [Donations]" UpdateCommand="UPDATE [Donations] SET [idUser] = @idUser, [amount] = @amount, [timeDonated] = @timeDonated, [charitableCauseId] = @charitableCauseId, [firstName] = @firstName, [lastName] = @lastName, [anonymous] = @anonymous, [creditCard] = @creditCard, [csc] = @csc WHERE [idDonation] = @idDonation">
        <DeleteParameters>
            <asp:Parameter Name="idDonation" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="idUser" Type="Int32" />
            <asp:Parameter Name="amount" Type="Decimal" />
            <asp:Parameter Name="timeDonated" Type="DateTime" />
            <asp:Parameter Name="charitableCauseId" Type="Int32" />
            <asp:Parameter Name="firstName" Type="String" />
            <asp:Parameter Name="lastName" Type="String" />
            <asp:Parameter Name="anonymous" Type="Int32" />
            <asp:Parameter Name="creditCard" Type="Int64" />
            <asp:Parameter Name="csc" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="idUser" Type="Int32" />
            <asp:Parameter Name="amount" Type="Decimal" />
            <asp:Parameter Name="timeDonated" Type="DateTime" />
            <asp:Parameter Name="charitableCauseId" Type="Int32" />
            <asp:Parameter Name="firstName" Type="String" />
            <asp:Parameter Name="lastName" Type="String" />
            <asp:Parameter Name="anonymous" Type="Int32" />
            <asp:Parameter Name="creditCard" Type="Int64" />
            <asp:Parameter Name="csc" Type="Int32" />
            <asp:Parameter Name="idDonation" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red"/>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [CharitableCauses]"></asp:SqlDataSource>
    </form>
</asp:Content>
