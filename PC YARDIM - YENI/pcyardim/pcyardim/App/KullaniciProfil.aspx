<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KullaniciProfil.aspx.cs" Inherits="pcyardim.App.KullaniciProfil" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>forumberceste</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="Css/stiller.css" rel="stylesheet" />
    <link href="Css/animate.css" rel="stylesheet" />
    <script>
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid arkaPlan2 img-responsive">
            <div class="row">
                <div class="col-md-6 col-md-push-3">
                    <div id="login-box" class="animated fadeInDown">
                        <h3 class="text-center">Kullanıcı Profil</h3>
                        <br />
                        <div style="float: left !important">
                            <asp:Label ID="lblMailin" runat="server" Text="Mailin:"></asp:Label>
                        </div>
                        <div style="float: right !important">
                            <asp:Label ID="lblMail" runat="server" Text=""></asp:Label>
                        </div>
                        <br />
                        <br />
                        <div style="float: left !important">
                            <asp:Label ID="lblKAdin" runat="server" Text="Kullanı Adın:"></asp:Label>
                        </div>
                        <div style="float: right !important">
                            <asp:Label ID="lblKAd" runat="server" Text=""></asp:Label>
                        </div>
                        <br />
                        <br />
                        <div style="float: left">
                            <asp:Label ID="lblParolan" runat="server" Text="Şifren:"></asp:Label>
                        </div>
                        <div style="float: right">
                            <asp:Label ID="lblParola" runat="server" Text=""></asp:Label>
                        </div>
                        <br />
                        <br />
                        <h4>Şifreni Değiştir</h4>
                        <div class="form-group">
                            <asp:TextBox ID="txtParola" CssClass="textboxlar form-control" placeholder="Yeni Parola:" type="password" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtParolaTekrar" CssClass="textboxlar form-control" placeholder="Yeni Parola Tekrar:" type="password" runat="server"></asp:TextBox>
                        </div>
                        <button id="btnGeriDon" runat="server" onserverclick="btnGeriDon_ServerClick" class="uyeOlbtn" style="width: 50px !important" data-toggle="tooltip" data-placement="bottom" title="Geri Dön"><i class="fa fa-undo" aria-hidden="true"></i></button>
                        <asp:Button ID="btnUyeOl" OnClick="btnUyeOl_Click" CssClass="uyeOlbtn" runat="server" Text="Değiştir" /><br />
                        <br />
                        <asp:Label ID="lblSonuc" runat="server" Text="" CssClass="label label-danger"></asp:Label><br />
                        <br />
                        <div id="GununSozu" runat="server">
                            <h4>Günün Sözünü Güncelle</h4>
                            <br />
                            <div style="float: left !important">
                                <asp:Label ID="lblGunSoz" runat="server" Text="Günün Sözü:"></asp:Label>
                            </div>
                            <div style="float: right !important">
                                <asp:Label ID="lblGunSozu" runat="server" Text=""></asp:Label><br /><br />
                            </div>
                            <br />
                            <br />
                            <div class="form-group">
                                <asp:TextBox ID="txtGunSozz" CssClass="textboxlar form-control" placeholder="Günün Sözü:" runat="server"></asp:TextBox>
                                <asp:Button ID="btnGunnSoz" OnClick="btnGunnSoz_Click" CssClass="uyeOlbtn" runat="server" Text="Güncelle" /><br />
                                <br />
                                <asp:Label ID="lblGunSozSonuc" runat="server" Text="" CssClass="label label-danger"></asp:Label>
                            </div>
                        </div>
                        <%--<div class="form-group">
                            <asp:TextBox ID="txtKAd" CssClass="textboxlar form-control" autofocus placeholder="Kullanıcı Adı:" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtMail" CssClass="textboxlar form-control" placeholder="Mail:" type="email" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtParola" CssClass="textboxlar form-control" placeholder="Parola:" type="password" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtParolaTekrar" CssClass="textboxlar form-control" placeholder="Parola Tekrar:" type="password" runat="server"></asp:TextBox>
                        </div>
                        <button id="btnGeriDon" runat="server" class="uyeOlbtn" style="width:50px !important" data-toggle="tooltip" data-placement="bottom" title="Geri Dön"><i class="fa fa-undo" aria-hidden="true"></i></button>
                        <asp:Button ID="btnUyeOl" CssClass="uyeOlbtn" runat="server" Text="Üye Ol" /><br /><br />
                        <asp:Label ID="lblSonuc" runat="server" Text="" CssClass="label label-danger"></asp:Label>--%>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
