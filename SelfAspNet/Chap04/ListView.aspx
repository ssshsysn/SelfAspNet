<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListView.aspx.cs" Inherits="SelfAspNet.Chap04.ListView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ListView ID="list" runat="server" DataKeyNames="isbn" DataSourceID="sds" InsertItemPosition="LastItem">
                <AlternatingItemTemplate>
                    <span style="background-color: #FFFFFF;color: #284775;">isbn:
                    <asp:Label ID="isbnLabel" runat="server" Text='<%# Eval("isbn") %>' />
                    <br />
                    title:
                    <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                    <br />
                    price:
                    <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                    <br />
                    publish:
                    <asp:Label ID="publishLabel" runat="server" Text='<%# Eval("publish") %>' />
                    <br />
                    published:
                    <asp:Label ID="publishedLabel" runat="server" Text='<%# Eval("published") %>' />
                    <br />
                    <asp:CheckBox ID="cdromCheckBox" runat="server" Checked='<%# Eval("cdrom") %>' Enabled="false" Text="cdrom" />
                    <br />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編集" />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="削除" />
<br /><br /></span>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <span style="background-color: #999999;">
                    <asp:Image ID="Image1" runat="server" Height="160px" Width="110px" ImageUrl='<%# Eval("isbn", "https://wings.msn.to/books/{0}/{0}.jpg") %>' />
                    <br />
                    isbnコード:
                    <asp:Label ID="isbnLabel1" runat="server" Text='<%# Eval("isbn") %>' />
                    <br />
                    title:
                    <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                    <br />
                    price:
                    <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                    <br />
                    publish:
                    <asp:TextBox ID="publishTextBox" runat="server" Text='<%# Bind("publish") %>' />
                    <br />
                    published:
                    <asp:TextBox ID="publishedTextBox" runat="server" Text='<%# Bind("published") %>' />
                    <br />
                    <asp:CheckBox ID="cdromCheckBox" runat="server" Checked='<%# Bind("cdrom") %>' Text="cdrom" />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="キャンセル" />
                    <br /><br /></span>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <span>データは返されませんでした。</span>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <span style="">isbn:
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
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="クリア" />
                    <br /><br /></span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <span style="background-color: #E0FFFF;color: #333333;">
                    <asp:Image ID="Image1" runat="server" Height="160px" Width="110px" ImageUrl='<%# Eval("isbn", "https://wings.msn.to/books/{0}/{0}.jpg") %>' />
                    </br>ISBNコード:
                    <asp:Label ID="isbnLabel" runat="server" Text='<%# Eval("isbn") %>' />
                    <br />
                    title:
                    <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                    <br />
                    price:
                    <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                    <br />
                    publish:
                    <asp:Label ID="publishLabel" runat="server" Text='<%# Eval("publish") %>' />
                    <br />
                    published:
                    <asp:Label ID="publishedLabel" runat="server" Text='<%# Eval("published") %>' />
                    <br />
                    <asp:CheckBox ID="cdromCheckBox" runat="server" Checked='<%# Eval("cdrom") %>' Enabled="false" Text="cdrom" />
                    <br />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編集" />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="削除" />
<br /><br /></span>
                </ItemTemplate>
                <LayoutTemplate>
                    <div id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF;">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </div>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <span style="background-color: #E2DED6;font-weight: bold;color: #333333;">isbn:
                    <asp:Label ID="isbnLabel" runat="server" Text='<%# Eval("isbn") %>' />
                    <br />
                    title:
                    <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                    <br />
                    price:
                    <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price") %>' />
                    <br />
                    publish:
                    <asp:Label ID="publishLabel" runat="server" Text='<%# Eval("publish") %>' />
                    <br />
                    published:
                    <asp:Label ID="publishedLabel" runat="server" Text='<%# Eval("published") %>' />
                    <br />
                    <asp:CheckBox ID="cdromCheckBox" runat="server" Checked='<%# Eval("cdrom") %>' Enabled="false" Text="cdrom" />
                    <br />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="編集" />
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="削除" />
<br /><br /></span>
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
