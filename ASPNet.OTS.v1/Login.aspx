<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ASPNet.OTS.v1.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>.: Öğrenci Yönetim Sistemi v2.0 _ © 2021 UCC Software :.</title>
    <link href="Styles/OTSStyles.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="login">
            <asp:Label ID="Label1" runat="server" Font-Bold="true" Text="Kullanıcı Adı : "></asp:Label>&nbsp;
            <asp:TextBox ID="tboxUserName" runat="server" MaxLength="10" BorderStyle="Solid" BorderWidth="1" AutoPostBack="True" Width="66px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Font-Bold="true" Text="Kullanıcı Şifre : "></asp:Label>&nbsp;
            <asp:TextBox ID="tboxUserPass" runat="server" MaxLength="10" BorderStyle="Solid" BorderWidth="1" TextMode="Password" AutoPostBack="True" Width="59px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btonLogin" runat="server" Text="Sisteme Giriş" OnClick="btonLogin_Click" />
        </div>
    </form>
</body>
</html>
