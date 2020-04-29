<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Esxape.aspx.cs" Inherits="SelfAspNet.Chap03.Esxape" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Literal ID="ltr" runat="server" Text="&lt;script&gt;alert('脆弱性！')&lt;/script&gt;"></asp:Literal>
        </div>
    </form>
</body>
</html>
