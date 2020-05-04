<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SqlParam.aspx.cs" Inherits="SelfAspNet.Chap05.SqlParam" %>

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
            </asp:RadioButtonList>
            <asp:SqlDataSource ID="sds_list" runat="server" ConnectionString="<%$ ConnectionStrings:SelfApp %>" SelectCommand="SELECT DISTINCT [category] FROM [Album] ORDER BY [category]"></asp:SqlDataSource>
            <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="aid" DataSourceID="sds" ForeColor="Black" GridLines="Vertical">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="aid" HeaderText="aid" ReadOnly="True" SortExpression="aid" />
                    <asp:BoundField DataField="category" HeaderText="分類" SortExpression="category" />
                    <asp:BoundField DataField="comment" HeaderText="備考" SortExpression="comment" />
                    <asp:BoundField DataField="updated" DataFormatString="{0:yyyy年MM月dd日(ddd)}" HeaderText="最終更新日" SortExpression="updated" />
                    <asp:CheckBoxField DataField="favorite" HeaderText="お気に入り" SortExpression="favorite" />
                    <asp:HyperLinkField DataNavigateUrlFields="aid" DataNavigateUrlFormatString="https://wings.msn.to/album/{0}" DataTextField="aid" DataTextFormatString="{0}" HeaderText="アルバムコード" />
                    <asp:ImageField DataAlternateTextField="aid" DataImageUrlField="aid" DataImageUrlFormatString="~/Image/{0}.jpg" HeaderText="画像" ReadOnly="True">
                        <ControlStyle Height="40px" Width="40px" />
                    </asp:ImageField>
                    <asp:CommandField ButtonType="Button" HeaderText="編集/削除" ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
            </asp:GridView>
            <asp:SqlDataSource ID="sds" runat="server" ConnectionString="<%$ ConnectionStrings:SelfApp %>" SelectCommand="SELECT [aid], [category], [comment], [updated], [favorite] FROM [Album] WHERE ([category] = @category)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="list" Name="category" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
