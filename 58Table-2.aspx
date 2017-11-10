<%@ Page Language="C#" AutoEventWireup="true" CodeFile="58Table-2.aspx.cs" Inherits="_58Table_2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
    <div class="table-responsive">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:教務系統ConnectionString %>" SelectCommand="SELECT * FROM [view_學生選課明細]"></asp:SqlDataSource>

        <asp:GridView CssClass="table table-bordered table-hover table-striped" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="課程編號" HeaderText="課程編號" SortExpression="課程編號" />
                <asp:BoundField DataField="名稱" HeaderText="名稱" SortExpression="名稱" />
                <asp:BoundField DataField="學分" HeaderText="學分" SortExpression="學分" />
                <asp:BoundField DataField="身份證字號" HeaderText="身份證字號" SortExpression="身份證字號" />
                <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                <asp:BoundField DataField="城市" HeaderText="城市" SortExpression="城市" />
                <asp:BoundField DataField="街道" HeaderText="街道" SortExpression="街道" />
                <asp:BoundField DataField="電話" HeaderText="電話" SortExpression="電話" />
                <asp:BoundField DataField="薪水" HeaderText="薪水" SortExpression="薪水" />
                <asp:BoundField DataField="保險" HeaderText="保險" SortExpression="保險" />
                <asp:BoundField DataField="扣稅" HeaderText="扣稅" SortExpression="扣稅" />
                <asp:BoundField DataField="學生學號" HeaderText="學生學號" SortExpression="學生學號" />
                <asp:BoundField DataField="學生姓名" HeaderText="學生姓名" SortExpression="學生姓名" />
                <asp:BoundField DataField="性別" HeaderText="性別" SortExpression="性別" />
                <asp:BoundField DataField="學生電話" HeaderText="學生電話" SortExpression="學生電話" />
                <asp:BoundField DataField="生日" HeaderText="生日" SortExpression="生日" />
                <asp:BoundField DataField="上課時間" HeaderText="上課時間" SortExpression="上課時間" />
                <asp:BoundField DataField="教室" HeaderText="教室" SortExpression="教室" />
                <asp:BoundField DataField="教授編號" HeaderText="教授編號" SortExpression="教授編號" />
                <asp:BoundField DataField="職稱" HeaderText="職稱" SortExpression="職稱" />
                <asp:BoundField DataField="科系" HeaderText="科系" SortExpression="科系" />
            </Columns>
        </asp:GridView>
    </div>
    </form>
    <script src="Scripts/jquery-3.2.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>

</body>
</html>
