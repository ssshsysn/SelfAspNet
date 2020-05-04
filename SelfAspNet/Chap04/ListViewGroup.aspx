<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListViewGroup.aspx.cs" Inherits="SelfAspNet.Chap04.ListViewGroup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="isbn" DataSourceID="sds" GroupItemCount="3" InsertItemPosition="LastItem">
                <AlternatingItemTemplate>
                    <td runat="server" style="background-color:#FFF8DC;">isbn:
                        <asp:Label ID="isbnLabel" runat="server" Text='<%# Eval("isbn") %>' />
                        <br />title:
                        <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                        <br />price:
                        <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                        <br />publish:
                        <asp:Label ID="publishLabel" runat="server" Text='<%# Eval("publish") %>' />
                        <br />published:
                        <asp:Label ID="publishedLabel" runat="server" Text='<%# Eval("published") %>' />
                        <br />
                        <asp:CheckBox ID="cdromCheckBox" runat="server" Checked='<%# Eval("cdrom") %>' Enabled="false" Text="cdrom" />
                        <br />
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="削除" />
                        <br />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編集" />
                        <br /></td>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <td runat="server" style="background-color:#008A8C;color: #FFFFFF;">isbn:
                        <asp:Image ID="Image1" runat="server" Height="160px" Width="110px" ImageUrl='<%# Eval("isbn", "https://wings.msn.to/books/{0}/{0}.jpg") %>' />
                        <asp:Label ID="isbnLabel1" runat="server" Text='<%# Eval("isbn") %>' />
                        <br />title:
                        <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                        <br />price:
                        <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                        <br />publish:
                        <asp:TextBox ID="publishTextBox" runat="server" Text='<%# Bind("publish") %>' />
                        <br />published:
                        <asp:TextBox ID="publishedTextBox" runat="server" Text='<%# Bind("published") %>' />
                        <br />
                        <asp:CheckBox ID="cdromCheckBox" runat="server" Checked='<%# Bind("cdrom") %>' Text="cdrom" />
                        <br />
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="キャンセル" />
                        <br /></td>
                </EditItemTemplate>
                <EmptyDataTemplate>
                        <td runat="server">
                            <asp:Image ID="Image1" runat="server" ImageUrl="https://wings.msn.to/image/wings.jpg" />
                        </td>
                </EmptyDataTemplate>
                <EmptyItemTemplate>
<td runat="server" />
                </EmptyItemTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
                <InsertItemTemplate>
                    <td runat="server" style="">isbn:
                        <asp:TextBox ID="isbnTextBox" runat="server" Text='<%# Bind("isbn") %>' />
                        <br />title:
                        <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                        <br />price:
                        <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                        <br />publish:
                        <asp:TextBox ID="publishTextBox" runat="server" Text='<%# Bind("publish") %>' />
                        <br />published:
                        <asp:TextBox ID="publishedTextBox" runat="server" Text='<%# Bind("published") %>' />
                        <br />
                        <asp:CheckBox ID="cdromCheckBox" runat="server" Checked='<%# Bind("cdrom") %>' Text="cdrom" />
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="挿入" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="クリア" />
                        <br /></td>
                </InsertItemTemplate>
                <ItemTemplate>
                    <td runat="server" style="background-color:#DCDCDC;color: #000000;">isbn:
                        <asp:Image ID="Image1" runat="server" Height="160px" Width="110px" ImageUrl='<%# Eval("isbn", "https://wings.msn.to/books/{0}/{0}.jpg") %>' />
                        <asp:Label ID="isbnLabel" runat="server" Text='<%# Eval("isbn") %>' />
                        <br />title:
                        <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                        <br />price:
                        <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                        <br />publish:
                        <asp:Label ID="publishLabel" runat="server" Text='<%# Eval("publish") %>' />
                        <br />published:
                        <asp:Label ID="publishedLabel" runat="server" Text='<%# Eval("published") %>' />
                        <br />
                        <asp:CheckBox ID="cdromCheckBox" runat="server" Checked='<%# Eval("cdrom") %>' Enabled="false" Text="cdrom" />
                        <br />
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="削除" />
                        <br />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編集" />
                        <br /></td>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr id="groupPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <td runat="server" style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">isbn:
                        <asp:Label ID="isbnLabel" runat="server" Text='<%# Eval("isbn") %>' />
                        <br />title:
                        <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                        <br />price:
                        <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                        <br />publish:
                        <asp:Label ID="publishLabel" runat="server" Text='<%# Eval("publish") %>' />
                        <br />published:
                        <asp:Label ID="publishedLabel" runat="server" Text='<%# Eval("published") %>' />
                        <br />
                        <asp:CheckBox ID="cdromCheckBox" runat="server" Checked='<%# Eval("cdrom") %>' Enabled="false" Text="cdrom" />
                        <br />
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="削除" />
                        <br />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編集" />
                        <br /></td>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="sds" runat="server" ConnectionString="<%$ ConnectionStrings:SelfApp %>" DeleteCommand="DELETE FROM [Book] WHERE [isbn] = @isbn" InsertCommand="INSERT INTO [Book] ([isbn], [title], [price], [publish], [published], [cdrom]) VALUES (@isbn, @title, @price, @publish, @published, @cdrom)" SelectCommand="SELECT [isbn], [title], [price], [publish], [published], [cdrom] FROM [Book] ORDER BY [isbn]" UpdateCommand="UPDATE [Book] SET [title] = @title, [price] = @price, [publish] = @publish, [published] = @published, [cdrom] = @cdrom WHERE [isbn] = @isbn">
                <DeleteParameters>
                    <asp:Parameter Name="isbn" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="isbn" Type="String" />
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="price" Type="Int32" />
                    <asp:Parameter Name="publish" Type="String" />
                    <asp:Parameter DbType="Date" Name="published" />
                    <asp:Parameter Name="cdrom" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="price" Type="Int32" />
                    <asp:Parameter Name="publish" Type="String" />
                    <asp:Parameter DbType="Date" Name="published" />
                    <asp:Parameter Name="cdrom" Type="Boolean" />
                    <asp:Parameter Name="isbn" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
