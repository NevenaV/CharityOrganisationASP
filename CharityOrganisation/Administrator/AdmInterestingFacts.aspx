<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdmInterestingFacts.aspx.cs" Inherits="CharityOrganisation.Administrator.AdmInterestingFacts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Manage Interesting Facts</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center">Manage Interesting Facts</h1>
    <form name="form1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idFact" DataSourceID="SqlDataSource1" ShowFooter="True" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:TemplateField HeaderText="ID Fact" InsertVisible="False" SortExpression="idFact">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("idFact") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("idFact") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:LinkButton ID="insLink" runat="server" ValidationGroup="grpInsert" OnClick="insLink_Click">Insert</asp:LinkButton>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Fact" SortExpression="fact">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fact") %>' TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqTextBox1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="Fact is a required field." Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revTextBox1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="Wrong Fact format." Text="*" ForeColor="Red" ValidationExpression="^[\w\d\W]{3,200}$"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("fact") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="tbInsertFact" runat="server" Text='<%# Bind("fact") %>' TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqtbInsertFact" runat="server" ControlToValidate="tbInsertFact" EnableClientScript="False" ErrorMessage="Fact is a required field." Text="*" ForeColor="Red" ValidationGroup="grpInsert"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revtbInsertFact" runat="server" ControlToValidate="tbInsertFact" EnableClientScript="False" ErrorMessage="Wrong Fact format." Text="*" ForeColor="Red" ValidationExpression="^[\w\d\W]{3,200}$" ValidationGroup="grpInsert"></asp:RegularExpressionValidator>
                </FooterTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [InterestingFacts] WHERE [idFact] = @idFact" InsertCommand="INSERT INTO [InterestingFacts] ([fact]) VALUES (@fact)" SelectCommand="SELECT * FROM [InterestingFacts]" UpdateCommand="UPDATE [InterestingFacts] SET [fact] = @fact WHERE [idFact] = @idFact">
        <DeleteParameters>
            <asp:Parameter Name="idFact" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="fact" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="fact" Type="String" />
            <asp:Parameter Name="idFact" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red"/>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" ValidationGroup="grpInsert"/>
    </form>
</asp:Content>
