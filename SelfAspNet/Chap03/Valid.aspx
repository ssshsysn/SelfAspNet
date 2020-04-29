﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Valid.aspx.cs" Inherits="SelfAspNet.Chap03.Valid" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>検証コントローク</title>
    <link href="../Site.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            名前：<br />
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="reqName" runat="server" ControlToValidate="txtName" CssClass="valid" ErrorMessage="名前は必須です。" SetFocusOnError="True" ValidationGroup="MyValid">*</asp:RequiredFieldValidator>
            <br />
            体重：<br />
            <asp:TextBox ID="txtWeight" runat="server" Columns="5" Width="137px"></asp:TextBox>
            Kg<asp:RangeValidator ID="rngWeight" runat="server" ControlToValidate="txtWeight" CssClass="valid" ErrorMessage="体重は０～３００ｋｇの範囲で入力してください。" MaximumValue="300" MinimumValue="0" SetFocusOnError="True" Type="Integer" ValidationGroup="MyValid"></asp:RangeValidator>
            <br />
            誕生日：<br />
            <asp:TextBox ID="txtBirth" runat="server" Columns="10"></asp:TextBox>
            <asp:CompareValidator ID="cmpBirth" runat="server" ControlToValidate="txtBirth" CssClass="valid" ErrorMessage="誕生日は日付形式で入力してください。" Operator="DataTypeCheck" SetFocusOnError="True" Type="Date" ValidationGroup="MyValid"></asp:CompareValidator>
            <br />
            E-Mail：<br />
            <asp:TextBox ID="txtEmail" runat="server" Columns="50"></asp:TextBox>
            <asp:RegularExpressionValidator ID="regEmail" runat="server" ControlToValidate="txtEmail" CssClass="valid" ErrorMessage="E-Mailアドレスは正しい形式で入力してください。" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="MyValid"></asp:RegularExpressionValidator>
            <br />
            E-Mail(確認)：<br />
            <asp:TextBox ID="txtEmail2" runat="server" Columns="50"></asp:TextBox>
            <asp:CompareValidator ID="cmpEmail2" runat="server" ControlToCompare="txtEmail" ControlToValidate="txtEmail2" CssClass="valid" ErrorMessage="E-MailとE-Mail(確認)は同一になる必要があります。" SetFocusOnError="True" ValidationGroup="MyValid"></asp:CompareValidator>
            <br />
            <asp:Button ID="btnSubmit" runat="server" Text="決定" OnClick="btnSubmit_Click" ValidationGroup="MyValid" />
            <asp:Button ID="btnClear" runat="server" Text="クリア" />
            <br />
            <asp:Label ID="lblResult" runat="server"></asp:Label>
            <br />
            <br />
            <asp:ValidationSummary ID="summary" runat="server" />
        </div>
    </form>
</body>
</html>
