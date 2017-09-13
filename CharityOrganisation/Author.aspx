<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Template.Master" CodeBehind="Author.aspx.cs" Inherits="CharityOrganisation.Author" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Author</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
    <h1 class="text-center">Author</h1>
        <div class="div-100">
            <table class="author-table">
                <tr>
                    <td class="author-table-td-img">
                        <img src="/images/author.jpg" class="display-block margin-auto"/>
                    </td>
                    <td class="author-table-td-text">
                        Nevena Vuksanovic, 98/14, IT<br /><br />
                        Web developing career was not initially my first career choice, so after high school, I enrolled to Belgrade's "Faculty of Philology" where I majored in English. Although I finished only one year of university courses, that experience turned out to be very enlightening because it helped me realize my true calling. I now I am very happy with the knowledge I obtained in "ICT College of Vocational Studies" so far, and I am looking forward to spending my life in the programming world.
                    </td>
                </tr>
            </table>
        </div>
        <div class="cleaner"></div>
    <div class="div-60 margin-auto margin-top-30 float-right"> 
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" DataKeyNames="idFact" DataSourceID="SqlDataSource1" PageSize="3" Width="450px">
            <Columns>
                <asp:BoundField DataField="fact" HeaderText="Interesting Environment Facts" SortExpression="fact" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [idFact], [fact] FROM [InterestingFacts]"></asp:SqlDataSource>
    </div>
    <div class="cleaner"></div>
    </form>
</asp:Content>