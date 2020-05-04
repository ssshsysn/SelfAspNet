<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PhotoUpload.aspx.cs" Inherits="SelfAspNet.Chap05.PhotoUpload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:FileUpload ID="upfile" runat="server" />
            <asp:Button ID="btnUpload" runat="server" OnClick="btnUpload_Click" Text="アップロード" />
            <br />
            <asp:SqlDataSource ID="sds" runat="server" ConnectionString="<%$ ConnectionStrings:SelfApp %>" InsertCommand="INSERT INTO Photo(type, data) VALUES (@type, @data)" ProviderName="<%$ ConnectionStrings:SelfApp.ProviderName %>">
                <InsertParameters>
                    <asp:ControlParameter ControlID="upfile" Name="data" PropertyName="FileBytes" />
                </InsertParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
