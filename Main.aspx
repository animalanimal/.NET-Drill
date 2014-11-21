<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="ASP.NET_Drill1.Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <div id="category">
            Choose a category<br />
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="CategoryDataSource" 
                DataTextField="CategoryName" DataValueField="CategoryID" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">

            </asp:DropDownList>
            <asp:Button ID="Button1" runat="server" Height="25px" Text="List All Products" Width="190px"
                OnClick="Button1_Click" />
        </div>
        
        <asp:GridView ID="MyGrid" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
            DataKeyNames="ProductID" DataSourceID="LinqDataSource1" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="ProductID" HeaderText="ProductID" InsertVisible="False" ReadOnly="True" SortExpression="ProductID" />
                <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
                <asp:BoundField DataField="Category.CategoryName" HeaderText="Category" SortExpression="Category" />
                <asp:BoundField DataField="Supplier.CompanyName" HeaderText="Supplier" SortExpression="Supplier" />
                <asp:CheckBoxField DataField="Discontinued" HeaderText="Discontinued" SortExpression="Discontinued" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
    
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="ASP.NET_Drill1.NorthwindsDataContext" EntityTypeName="" 
            TableName="Products" EnableDelete="True" EnableInsert="True" EnableUpdate="True" Where="CategoryID == @CategoryID">
            <WhereParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="CategoryID" PropertyName="SelectedValue" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="CategoryDataSource" runat="server" ContextTypeName="ASP.NET_Drill1.NorthwindsDataContext" EntityTypeName="" 
            Select="new (CategoryID, CategoryName)" TableName="Categories" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
        </asp:LinqDataSource>
                <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="ASP.NET_Drill1.NorthwindsDataContext" EntityTypeName="" 
            TableName="Products" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
        </asp:LinqDataSource>

    
    </div>
    </form>
</body>
</html>
