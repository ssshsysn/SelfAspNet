<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Text.aspx.cs" Inherits="SelfAspNet.Chap03.Text" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div aria-orientation="vertical" style="height: 50px">
            <asp:Label ID="lblText" runat="server" Text="Labelコントロール"></asp:Label>
            <asp:Literal ID="ltrText" runat="server" Text="Literalコントロール"></asp:Literal>
        </div>
    </form>
</body>
</html>
