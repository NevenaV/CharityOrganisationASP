<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdmPolls.aspx.cs" Inherits="CharityOrganisation.Administrator.AdmPolls" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Manage Polls</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center">Manage Polls</h1>
    <form id="form1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idPollQuestion" DataSourceID="SqlDataSource1" ShowFooter="True" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:TemplateField HeaderText="ID Poll" InsertVisible="False" SortExpression="idPollQuestion">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("idPollQuestion") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("idPollQuestion") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:LinkButton ID="insLink" runat="server" ValidationGroup="grpInsert" OnClick="insLink_Click">Insert</asp:LinkButton>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Question" SortExpression="pollQuestion">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("pollQuestion") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqTextBox1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="Question is a required field." Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revTextBox1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="Wrong Question format." Text="*" ForeColor="Red" ValidationExpression="^[\w\d\W]{3,200}$"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("pollQuestion") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="tbInsertQuestion" runat="server" Text='<%# Bind("pollQuestion") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="reqtbInsertQuestion" runat="server" ControlToValidate="tbInsertQuestion" EnableClientScript="False" ErrorMessage="Question is a required field." Text="*" ValidationGroup="grpInsert" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revtbInsertQuestion" runat="server" ControlToValidate="tbInsertQuestion" EnableClientScript="False" ErrorMessage="Wrong Question format." Text="*" ValidationGroup="grpInsert" ForeColor="Red" ValidationExpression="^[\w\d\W]{3,200}$"></asp:RegularExpressionValidator>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Active Poll" SortExpression="pollActive">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("pollActive") %>'>
	                    <asp:ListItem Value="1">Yes</asp:ListItem>
	                    <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("pollActive") %>' Enabled="false">
	                    <asp:ListItem Value="1">Yes</asp:ListItem>
	                    <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:DropDownList>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:DropDownList ID="insPollActive" runat="server" SelectedValue='<%# Bind("pollActive") %>'>
	                    <asp:ListItem Value="1">Yes</asp:ListItem>
	                    <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:DropDownList>
                </FooterTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [PollQuestions] WHERE [idPollQuestion] = @idPollQuestion" InsertCommand="INSERT INTO [PollQuestions] ([pollQuestion], [pollActive]) VALUES (@pollQuestion, @pollActive)" SelectCommand="SELECT * FROM [PollQuestions]" UpdateCommand="UPDATE [PollQuestions] SET [pollQuestion] = @pollQuestion, [pollActive] = @pollActive WHERE [idPollQuestion] = @idPollQuestion">
        <DeleteParameters>
            <asp:Parameter Name="idPollQuestion" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="pollQuestion" Type="String" />
            <asp:Parameter Name="pollActive" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="pollQuestion" Type="String" />
            <asp:Parameter Name="pollActive" Type="Int32" />
            <asp:Parameter Name="idPollQuestion" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red"/>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" ValidationGroup="grpInsert"/>



    <br /><br />
    <h1 class="text-center">Manage Poll Answers</h1>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="idPollAnswer" DataSourceID="SqlDataSource2" ShowFooter="True" OnRowDeleting="GridView2_RowDeleting" OnRowUpdating="GridView2_RowUpdating">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ValidationGroup="AnswerGrp" />
                <asp:TemplateField HeaderText="ID Answer" InsertVisible="False" SortExpression="idPollAnswer">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("idPollAnswer") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("idPollAnswer") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ID="insLink2" runat="server" ValidationGroup="grpInsert2" OnClick="insLink2_Click">Insert</asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Answer" SortExpression="pollAnswer">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("pollAnswer") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqTextBox1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="Answer is a required field." Text="*" ForeColor="Red"  ValidationGroup="AnswerGrp"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revTextBox1" runat="server" ControlToValidate="TextBox1" EnableClientScript="False" ErrorMessage="Wrong Answer format." Text="*" ForeColor="Red" ValidationExpression="^[\w\d\W]{3,200}$"  ValidationGroup="AnswerGrp"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("pollAnswer") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="tbAnswer" runat="server" Text='<%# Bind("pollAnswer") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqtbAnswer" runat="server" ControlToValidate="tbAnswer" EnableClientScript="False" ErrorMessage="Answer is a required field." Text="*" ForeColor="Red"  ValidationGroup="grpInsert2"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revtbAnswer" runat="server" ControlToValidate="tbAnswer" EnableClientScript="False" ErrorMessage="Wrong Answer format." Text="*" ForeColor="Red" ValidationExpression="^[\w\d\W]{3,200}$"  ValidationGroup="grpInsert2"></asp:RegularExpressionValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Score" SortExpression="answerScore">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("answerScore") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqTextBox2" runat="server" ControlToValidate="TextBox2" EnableClientScript="False" ErrorMessage="Score is a required field." Text="*" ForeColor="Red"  ValidationGroup="AnswerGrp"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revTextBox2" runat="server" ControlToValidate="TextBox2" EnableClientScript="False" ErrorMessage="Wrong Score format." Text="*" ForeColor="Red" ValidationExpression="^[0-9]{1,4}$"  ValidationGroup="AnswerGrp"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("answerScore") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="tbScore" runat="server" Text='<%# Bind("answerScore") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqtbScore" runat="server" ControlToValidate="tbScore" EnableClientScript="False" ErrorMessage="Score is a required field." Text="*" ForeColor="Red"  ValidationGroup="grpInsert2"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revtbScore" runat="server" ControlToValidate="tbScore" EnableClientScript="False" ErrorMessage="Wrong Score format." Text="*" ForeColor="Red" ValidationExpression="^[0-9]{1,4}$"  ValidationGroup="grpInsert2"></asp:RegularExpressionValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Poll" SortExpression="idPollQuestion">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("idPollQuestion") %>' DataSourceID="SqlDataSource3" DataTextField="pollQuestion" DataValueField="idPollQuestion">
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("idPollQuestion") %>' Enabled="false" DataSourceID="SqlDataSource3" DataTextField="pollQuestion" DataValueField="idPollQuestion">
                        </asp:DropDownList>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="insPollId" runat="server" DataSourceID="SqlDataSource3" DataTextField="pollQuestion" DataValueField="idPollQuestion">
                        </asp:DropDownList>
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [PollAnswers] WHERE [idPollAnswer] = @idPollAnswer" InsertCommand="INSERT INTO [PollAnswers] ([pollAnswer], [answerScore], [idPollQuestion]) VALUES (@pollAnswer, @answerScore, @idPollQuestion)" SelectCommand="SELECT * FROM [PollAnswers]" UpdateCommand="UPDATE [PollAnswers] SET [pollAnswer] = @pollAnswer, [answerScore] = @answerScore, [idPollQuestion] = @idPollQuestion WHERE [idPollAnswer] = @idPollAnswer">
            <DeleteParameters>
                <asp:Parameter Name="idPollAnswer" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="pollAnswer" Type="String" />
                <asp:Parameter Name="answerScore" Type="Int32" />
                <asp:Parameter Name="idPollQuestion" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="pollAnswer" Type="String" />
                <asp:Parameter Name="answerScore" Type="Int32" />
                <asp:Parameter Name="idPollQuestion" Type="Int32" />
                <asp:Parameter Name="idPollAnswer" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:ValidationSummary ID="ValidationSummary3" runat="server" ForeColor="Red" ValidationGroup="AnswerGrp"/>
        <asp:ValidationSummary ID="ValidationSummary4" runat="server" ForeColor="Red" ValidationGroup="grpInsert2"/>
        <br />
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [PollQuestions]"></asp:SqlDataSource>
    </form>
</asp:Content>
