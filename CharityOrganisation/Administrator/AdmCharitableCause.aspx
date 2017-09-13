<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdmCharitableCause.aspx.cs" Inherits="CharityOrganisation.Administrator.AdmCharitableCause" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Manage Charitable Causes</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center">Manage Charitable Causes</h1>
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idCharitableCause" DataSourceID="SqlDataSource1" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating" ShowFooter="True" >
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:TemplateField HeaderText="Id Charitable Cause" InsertVisible="False" SortExpression="idCharitableCause">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("idCharitableCause") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("idCharitableCause") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ID="lbInsert" runat="server" onClick="lbInsert_Click" ValidationGroup="grpInsert">Insert</asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cause Name" SortExpression="causeName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("causeName") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqCauseNameEdit" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="Name is a required field." Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="Wrong Name format." Text="*" ForeColor="Red" ValidationExpression="^[\w\d\W]{3,200}$"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("causeName") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="tbInsertName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqCauseNameInsert" runat="server" ControlToValidate="tbInsertName" EnableClientScript="False" ErrorMessage="Name is a required field." Text="*" ForeColor="Red" ValidationGroup="grpInsert"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tbInsertName" EnableClientScript="False" ErrorMessage="Wrong Name format." Text="*" ForeColor="Red" ValidationGroup="grpInsert" ValidationExpression="^[\w\d\W]{3,200}$"></asp:RegularExpressionValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Total Funds Donated" SortExpression="totalFundsDonated">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("totalFundsDonated") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqTotalFundsEdit" runat="server" ControlToValidate="TextBox2" EnableClientScript="False" ErrorMessage="Total funds is a required field." Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox2" EnableClientScript="False" ErrorMessage="Wrong Funds format." Text="*" ForeColor="Red" ValidationExpression="^[0-9]{1,6}\.[0-9]{2}$"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("totalFundsDonated") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="tbInsertTotalFunds" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqTotalFundsInsert" runat="server" ControlToValidate="tbInsertTotalFunds" EnableClientScript="False" ErrorMessage="Total funds is a required field." Text="*" ForeColor="Red" ValidationGroup="grpInsert"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="tbInsertTotalFunds" EnableClientScript="False" ErrorMessage="Wrong Funds format." Text="*" ForeColor="Red" ValidationGroup="grpInsert" ValidationExpression="^[0-9]{1,6}\.[0-9]{2}$"></asp:RegularExpressionValidator>
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="grpInsert"/>
        <br />
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red"/>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [CharitableCauses] WHERE [idCharitableCause] = @idCharitableCause" InsertCommand="INSERT INTO [CharitableCauses] ([causeName], [totalFundsDonated]) VALUES (@causeName, @totalFundsDonated)" SelectCommand="SELECT * FROM [CharitableCauses]" UpdateCommand="UPDATE [CharitableCauses] SET [causeName] = @causeName, [totalFundsDonated] = @totalFundsDonated WHERE [idCharitableCause] = @idCharitableCause">
            <DeleteParameters>
                <asp:Parameter Name="idCharitableCause" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="causeName" Type="String" />
                <asp:Parameter Name="totalFundsDonated" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="causeName" Type="String" />
                <asp:Parameter Name="totalFundsDonated" Type="Decimal" />
                <asp:Parameter Name="idCharitableCause" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>

</asp:Content>
