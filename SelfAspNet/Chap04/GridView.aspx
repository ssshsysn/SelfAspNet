﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GridView.aspx.cs" Inherits="SelfAspNet.Chap04.GridView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>検証</title>
    <link href="../Site.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="grid" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="aid" DataSourceID="sds" ForeColor="Black" GridLines="Vertical" PageSize="3" OnRowCreated="grid_rowCreated" OnRowUpdated="grid_RowUpdated" OnRowUpdating="grid_RowUpdating" OnSelectedIndexChanged="grid_SelectedIndexChanged" ShowFooter="True">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:HyperLinkField DataNavigateUrlFields="aid" DataNavigateUrlFormatString="https://wings.msn.to/album/{0}" DataTextField="aid" DataTextFormatString="{0}" HeaderText="アルバムコード" />
                    <asp:ImageField DataAlternateTextField="aid" DataImageUrlField="aid" DataImageUrlFormatString="~/Image/{0}.jpg" HeaderText="画像" ReadOnly="True">
                        <ControlStyle Height="40px" Width="40px" />
                    </asp:ImageField>
                    <asp:TemplateField HeaderText="分類" SortExpression="category">
                        <EditItemTemplate>
                            <asp:DropDownList ID="list" runat="server" DataSourceID="sds_list" DataTextField="category" DataValueField="category" SelectedValue='<%# Bind("category") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sds_list" runat="server" ConnectionString="<%$ ConnectionStrings:SelfApp %>" SelectCommand="SELECT DISTINCT [category] FROM [Album]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("category") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="備考" SortExpression="comment">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("comment") %>' Columns="60"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("comment") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="最終更新日" SortExpression="updated">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtUpdated" runat="server" Text='<%# Bind("updated", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                            <asp:CompareValidator ID="cmpUpdated" runat="server" ControlToValidate="txtUpdated" CssClass="valid" ErrorMessage="最終更新日は日付形式で入力してください。" Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("updated", "{0:yyyy年MM月dd日(ddd)}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CheckBoxField DataField="favorite" HeaderText="お気に入り" SortExpression="favorite" />
                    <asp:TemplateField HeaderText="編集/削除" ShowHeader="False">
                        <EditItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                            &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="キャンセル" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit" Text="編集" />
                            &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Delete" Text="削除" OnClientClick="return confirm('本当に削除しますか？')" />
                        </ItemTemplate>
                    </asp:TemplateField>
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
            <asp:SqlDataSource ID="sds" runat="server" ConnectionString="<%$ ConnectionStrings:SelfApp %>" DeleteCommand="DELETE FROM [Album] WHERE [aid] = @aid" InsertCommand="INSERT INTO [Album] ([aid], [category], [comment], [updated], [favorite]) VALUES (@aid, @category, @comment, @updated, @favorite)" SelectCommand="SELECT [aid], [category], [comment], [updated], [favorite] FROM [Album]" UpdateCommand="UPDATE [Album] SET [category] = @category, [comment] = @comment, [updated] = @updated, [favorite] = @favorite WHERE [aid] = @aid">
                <DeleteParameters>
                    <asp:Parameter Name="aid" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="aid" Type="String" />
                    <asp:Parameter Name="category" Type="String" />
                    <asp:Parameter Name="comment" Type="String" />
                    <asp:Parameter DbType="Date" Name="updated" />
                    <asp:Parameter Name="favorite" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="category" Type="String" />
                    <asp:Parameter Name="comment" Type="String" />
                    <asp:Parameter DbType="Date" Name="updated" />
                    <asp:Parameter Name="favorite" Type="Boolean" />
                    <asp:Parameter Name="aid" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <asp:ValidationSummary ID="summary" runat="server" HeaderText="以下のエラーが発生しました。" ShowMessageBox="True" />
    </form>
</body>
</html>
