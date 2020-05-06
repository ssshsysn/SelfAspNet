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
            <asp:RadioButtonList ID="list" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="sds_list" DataTextField="category" DataValueField="category" RepeatDirection="Horizontal">
                <asp:ListItem Selected="True">無選択</asp:ListItem>
            </asp:RadioButtonList>
            <asp:SqlDataSource ID="sds_list" runat="server" ConnectionString="<%$ ConnectionStrings:SelfApp %>" SelectCommand="SELECT DISTINCT [category] FROM [Album] ORDER BY [category]"></asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="aid" DataSourceID="ObjectDataSource1">
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetAlbumData" TypeName="SelfAspNet.Chap05.AlbumDataSetTableAdapters.AlbumTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="list" Name="category" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:SqlDataSource ID="sds" runat="server" ConnectionString="<%$ ConnectionStrings:SelfApp %>" SelectCommand="SELECT [aid], [category], [comment], [updated], [favorite] FROM [Album] WHERE ([category] = @category)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="list" Name="category" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
