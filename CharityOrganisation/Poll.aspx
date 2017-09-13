<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Poll.aspx.cs" Inherits="CharityOrganisation.Poll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Poll</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <h1 class="text-center">Poll</h1>
    <h3 class="text-center">Please take a moment to vote in our active poll.</h3>
        <div class="div-100 margin-auto" id="hidePoll">
            <table class="table-invisible" id="pollTable" runat="server">
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Larger" Text="Question"></asp:Label>
                    <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:RadioButtonList ID="pollRadio" runat="server" DataSourceID="SqlDataSource1" DataTextField="pollAnswer" DataValueField="idPollAnswer"></asp:RadioButtonList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT [idPollAnswer], [pollAnswer] FROM [PollAnswers] WHERE ([idPollQuestion] = @idPollQuestion)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Label1" DefaultValue="1" Name="idPollQuestion" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>

                    <asp:Button ID="btnVote" runat="server" Text="Vote"/>

                </td>
            </tr>
            
        </table>
        </div>
        
        <table class="redLetters table-invisible">
            <tr>
                <td id="pollErrors" class="redLetters" runat="server"></td>
            </tr>
        </table>
        <table id="pollResults" class="hidden table-invisible"></table>
    </form>
</asp:Content>
