<%@ Page Language="VB" AutoEventWireup="false" CodeFile="28jQuery_GridView.aspx.vb" Inherits="_28jQuery_GridView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        span{
            width:50px; height:50px;
            border:1px solid;
            cursor:pointer;
        }
        #pink{
            background-color:pink;
        }
        #yellow{
            background-color:lemonchiffon;
        }
        #blue{
            background-color:lightblue;
        }

        .pink{
            background-color:pink;
        }
        .yellow{
            background-color:lemonchiffon;
        }
       .blue{
            background-color:lightblue;
        }
       #GridView1{
           width:90%;
           border:0;
           margin:auto;
       }
       #GridView1 td,th{
         
           border:0;
     
       }
         #GridView1 tr{
         
          height:40px;
     
       }
       #GridView1 tr:hover{
           background-color:#7dff58;
       }
       #GridView1 tr:first-child{
           background-color:brown;
           color:white;
       }


    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div id="btn">
            <span id="pink">　</span><span id="yellow">　</span><span id="blue">　</span>

        </div>
        <hr />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ScoresConnectionString %>" SelectCommand="SELECT * FROM [StudentScores]"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="StudentNo" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="StudentNo" HeaderText="StudentNo" ReadOnly="True" SortExpression="StudentNo" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="Chinese" HeaderText="Chinese" SortExpression="Chinese" />
                <asp:BoundField DataField="English" HeaderText="English" SortExpression="English" />
                <asp:BoundField DataField="Mathematics" HeaderText="Mathematics" SortExpression="Mathematics" />
                <asp:BoundField DataField="Class" HeaderText="Class" SortExpression="Class" />
            </Columns>
        </asp:GridView>

    </div>
    </form>

    <script src="Scripts/jquery-3.2.1.min.js"></script>
    <script>

        $('#btn span').click(function () {
            var id = event.target.id;
            $('#GridView1 tr:nth-child(2n+1)').removeClass().addClass(id);

        });

    </script>
</body>
</html>
