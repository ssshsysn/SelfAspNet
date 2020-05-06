<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ObjectParam2.aspx.cs" Inherits="SelfAspNet.Chap05.ObjectParam2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:RadioButtonList ID="list" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="sds" DataTextField="category" DataValueField="category" RepeatDirection="Horizontal">
                <asp:ListItem Selected="True">無選択</asp:ListItem>
            </asp:RadioButtonList>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="obj">
            </asp:GridView>
        </div>
    </form>
</body>
</html>
