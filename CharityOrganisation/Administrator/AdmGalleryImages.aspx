<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdmGalleryImages.aspx.cs" Inherits="CharityOrganisation.Administrator.AdmGalleryImages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Manage Gallery Images</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center">Manage Gallery Images</h1>
    <form id="form1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idImage" DataSourceID="SqlDataSource1" ShowFooter="True" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:TemplateField HeaderText="ID Image" InsertVisible="False" SortExpression="idImage">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("idImage") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("idImage") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:LinkButton ID="insLink" ValidationGroup="insGrp" runat="server" OnClick="insLink_Click">Insert</asp:LinkButton>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name" SortExpression="imageName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("imageName") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqTextBox1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="Name is a required field." Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revTextBox1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="Wrong Name format." Text="*" ForeColor="Red" ValidationExpression="^[\w\d\W]{3,200}$"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("imageName") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="tbName" runat="server" Text='<%# Bind("imageName") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqtbName" runat="server" ControlToValidate="tbName" EnableClientScript="False" ErrorMessage="Name is a required field." ValidationGroup="insGrp" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revtbName" runat="server" ControlToValidate="tbName" EnableClientScript="False" ErrorMessage="Wrong Name format." Text="*" ForeColor="Red" ValidationExpression="^[\w\d\W]{3,200}$" ValidationGroup="insGrp"></asp:RegularExpressionValidator>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Image" SortExpression="path">
                <EditItemTemplate>
                    <asp:Label ID="LabelPath" runat="server" Text='<%# Bind("path") %>'></asp:Label>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <asp:CustomValidator ID="CustomValidatorUpdate" runat="server" Text="*" ForeColor="Red" ErrorMessage="Wrong Image format."></asp:CustomValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LabelPathItem" runat="server" Text='<%# Bind("path") %>' Visible="false"></asp:Label>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~" + Eval("path")%>'/>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:FileUpload ID="fileImg" runat="server" ValidationGroup="insGrp"/>
                    <asp:RequiredFieldValidator ID="reqfileImg" runat="server" ControlToValidate="fileImg" EnableClientScript="False" ErrorMessage="Image Upload is a required field." ValidationGroup="insGrp" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" Text="*" ForeColor="Red" ErrorMessage="Wrong Image format."></asp:CustomValidator>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Thumbnail Image" SortExpression="thumbPath">
                <EditItemTemplate>
                    <asp:Label ID="LabelThumbPath" runat="server" Text='<%# Bind("thumbPath") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image2" runat="server" ImageUrl='<%# "~" + Eval("thumbPath")%>'/>
                    <asp:Label ID="LabelThumbPathItem" runat="server" Text='<%# Bind("thumbPath") %>' Visible="false"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Gallery] WHERE [idImage] = @idImage" InsertCommand="INSERT INTO [Gallery] ([imageName], [path], [thumbPath]) VALUES (@imageName, @path, @thumbPath)" SelectCommand="SELECT * FROM [Gallery]" UpdateCommand="UPDATE [Gallery] SET [imageName] = @imageName, [path] = @path, [thumbPath] = @thumbPath WHERE [idImage] = @idImage">
        <DeleteParameters>
            <asp:Parameter Name="idImage" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="imageName" Type="String" />
            <asp:Parameter Name="path" Type="String" />
            <asp:Parameter Name="thumbPath" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="imageName" Type="String" />
            <asp:Parameter Name="path" Type="String" />
            <asp:Parameter Name="thumbPath" Type="String" />
            <asp:Parameter Name="idImage" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red"/>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" ValidationGroup="insGrp"/>
        <asp:Label ID="ErrorsLabel" ForeColor="Red" runat="server" Text=""></asp:Label>
</form>

</asp:Content>
