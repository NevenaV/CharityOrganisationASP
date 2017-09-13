<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdmEvents.aspx.cs" Inherits="CharityOrganisation.Administrator.AdmEvents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Manage Events</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center">Manage Events</h1>
    <form id="form1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idEvent" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:BoundField DataField="idEvent" HeaderText="ID Event" InsertVisible="False" ReadOnly="True" SortExpression="idEvent" />
            <asp:BoundField DataField="event" HeaderText="Event" SortExpression="event" />
            <asp:BoundField DataField="idUser" HeaderText="ID User" SortExpression="idUser" />
            <asp:TemplateField HeaderText="User Email">
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="email" DataValueField="idUser" SelectedValue='<%# Bind("idUser") %>' Enabled="false"></asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="eventTime" HeaderText="Event Time" SortExpression="eventTime" />
        </Columns>
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Events] WHERE [idEvent] = @idEvent" InsertCommand="INSERT INTO [Events] ([event], [idUser], [eventTime]) VALUES (@event, @idUser, @eventTime)" SelectCommand="SELECT * FROM [Events]" UpdateCommand="UPDATE [Events] SET [event] = @event, [idUser] = @idUser, [eventTime] = @eventTime WHERE [idEvent] = @idEvent">
        <DeleteParameters>
            <asp:Parameter Name="idEvent" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="event" Type="String" />
            <asp:Parameter Name="idUser" Type="Int32" />
            <asp:Parameter Name="eventTime" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="event" Type="String" />
            <asp:Parameter Name="idUser" Type="Int32" />
            <asp:Parameter Name="eventTime" Type="DateTime" />
            <asp:Parameter Name="idEvent" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [idUser], [email] FROM [User]"></asp:SqlDataSource>
        </form>
</asp:Content>
