<%@ Page Title="" Language="C#" MasterPageFile="~/App/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="pcyardim.App.Default" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="Css/stiller.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="Css/style.css" media="screen" />

    <link href="Css/custom.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="Css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <%--ARAMA--%>
    <%--<script>
        $(document).ready(function () {
            $("#Arama1").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#myList1 li").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>
    <script>
        $(document).ready(function () {
            $("#Arama2").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#myList2 li").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>--%>
    <%--END ARAMA--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container">
        <div class="row">
            <div class="col-md-8" style="height:1280px !important; overflow:scroll !important">
                <asp:DataList ID="dataList1" runat="server" Width="100%">
                    <ItemTemplate>
                        <div class="post">
                            <div class="wrap-ut pull-left">
                                <div class="userinfo pull-left">
                                    <div class="avatar">
                                        <img src="img/icon4.jpg" alt="" />
                                    </div>
                                    <div class="icons">
                                        <img src="img/icon6.jpg" alt="" />
                                    </div>
                                    <div class="icons">
                                        <img src="img/icon5.jpg" alt="" />
                                    </div>
                                </div>
                                <div class="posttext pull-left">
                                    <%--<h2><a href="02_topic.html">10 Kids Unaware of Their Halloween Costume</a></h2>--%>

                                    <asp:LinkButton ID="lnkKonuBaslik" CssClass="konuBaslik" PostBackUrl='<%# string.Format("~/App/DefaultDetay.aspx?konuid={0}", Eval("Konuid")) %>' runat="server"><%#Eval("KonuBaslik").ToString().Length<45?Eval("KonuBaslik"):Eval("KonuBaslik").ToString().Substring(0,45)+" ..." %></asp:LinkButton><br />
                                    <br />

                                    <asp:Label ID="Label1" ForeColor="Black" runat="server" Text='<%#Eval("KonuIcerik").ToString().Length<150?Eval("KonuIcerik"):Eval("KonuIcerik").ToString().Substring(0,150)+" ..." %>'></asp:Label>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="postinfo pull-left">
                                <div class="comments">
                                    <div class="commentbg" style="background-color: #0f82c4 !important">
                                        <asp:Label ID="lblYorumSayi" runat="server" Text='<%#Eval("yorumSayi") %>'></asp:Label>

                                        <div class="mark" style="background-color: #0f82c4 !important"></div>
                                    </div>
                                </div>
                                <div class="views">
                                    <i class="fa fa-eye" style="color: #0f82c4 !important;"></i>
                                    <asp:Label ID="Label5" ForeColor="Black" runat="server" Text='<%#Eval("goruntulenme") %>'></asp:Label>
                                </div>
                                <div class="time">
                                    <i class="fa fa-clock-o" style="color: #0f82c4 !important"></i>
                                    <asp:Label ID="Label4" ForeColor="Black" runat="server" Text='<%#Eval("Tarih","{0:dd.MM.yy}") %>'></asp:Label>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>

                <div class="alert alert-danger" runat="server" id="divUyarı">
                    <strong>Uyarı!</strong> Seçtiğiniz Kategoriye Ait Konu Bulunamadı :( Lütfen Daha Sonra Tekrar Deneyin :)
                </div>


            </div>




            <%--------------------------------------------------KATEGORİ-------------------------%>
            <div class="col-md-4">
                <div class="sidebarblock">
                    <h3 style="color: #000 !important">Kategoriler</h3>
                    <div class="divline"></div>
                    <div class="blocktxt">
                        <ul class="cats">
                            <asp:DataList ID="dataList2" runat="server">
                                <ItemTemplate>
                                    <div style="float: left">
                                        <li>
                                            <asp:LinkButton ID="lnkKat" ForeColor="Black" OnClick="lnkKat_Click1" PostBackUrl='<%# string.Format("~/App/Default.aspx?kategori={0}", Eval("Kategori"))%>' runat="server"><%#Eval("Kategori").ToString().Length<30?Eval("Kategori"):Eval("Kategori").ToString().Substring(0,30)+" ..." %> </asp:LinkButton>

                                        </li>
                                    </div>
                                    <div style="position: absolute; right: 30px;">
                                        <span class="badge" title="Konu Sayısı" style="background-color: #0f82c4 !important"><%#Eval("konuSayisi") %></span>
                                    </div><br /><br />
                                </ItemTemplate>
                            </asp:DataList>
                        </ul>
                    </div>
                </div>

                <%------------------------------------------------------------KATEGORİ--%>

                <%--<div class="sidebarblock">
                    <h3 style="color: #000 !important">En Çok Görüş Alan 5 Konu</h3>
                    <div class="divline"></div>
                    <div class="blocktxt">
                        <asp:LinkButton ID="LinkButton2" ForeColor="Black" runat="server">This Dock Turns Your iPhone Into a Bedside Lamp</asp:LinkButton>
                    </div>
                </div>--%>
            </div>
        </div>
    </div>
    <footer class="footerAyar">
        <div class="container" style="text-align: center !important">
            <div class="row">
                <div class="col-sm-4">
                    <p>Design by Furkan</p>
                </div>
                <div class="col-sm-4">
                    <a style="color: #fff; text-decoration: none !important" href="Default.aspx">www.forumberceste.com</a>
                </div>
                <div class="col-sm-4 sMedyaAyar">
                    <ul>
                        <li>
                            <a href="https://www.instagram.com/furkanimyasar/">
                                <span></span>
                                <span></span>
                                <span></span>
                                <span></span>
                                <span style="color: #fff !important" class="fa fa-instagram" aria-hidden="true"></span>
                            </a>
                        </li>
                        <li>
                            <a href="https://www.facebook.com/furkiyas?ref=bookmarks">
                                <span></span>
                                <span></span>
                                <span></span>
                                <span></span>
                                <span style="color: #fff !important" class="fa fa-facebook" aria-hidden="true"></span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>







    <%--<div class="container-fluid">
        <div class="row">
            <div class="col-md-6 dikeyHR">
                <h3 class="basliklar">Donanım
            <asp:LinkButton ID="lnkDonanimAc" PostBackUrl="~/App/KonuEkle.aspx" CssClass="konuAc" runat="server">Konu Aç</asp:LinkButton>
                </h3>
                <br />
                <input class="form-control inputAyar" id="Arama1" type="text" placeholder="Ne Aramıştınız,Yardımcı Olalım...">
                <div class="donanimYazilimDivi">
                    <asp:DataList ID="dataListDonanim" runat="server" Width="100%">
                        <ItemTemplate>
                            <ul class="list-group" id="myList1">
                                <li class="list-group-item">
                                    <hr />
                                    <div class="icerik">
                                        <div class="msjiconAyar">
                                            <span class="glyphicon glyphicon-comment "></span>
                                        </div>
                                        <div class="baslikDivi">
                                            <asp:LinkButton ID="lnkKonuBaslik" title='<%#Eval("KonuIcerik").ToString().Length<85?Eval("KonuIcerik"):Eval("KonuIcerik").ToString().Substring(0,85)+" ..." %>' PostBackUrl='<%# string.Format("~/App/DefaultDetay.aspx?konuid={0}", Eval("Konuid")) %>' runat="server" CssClass="konuBaslik"><%#Eval("KonuBaslik").ToString().Length<30?Eval("KonuBaslik"):Eval("KonuBaslik").ToString().Substring(0,30)+" ..." %></asp:LinkButton><br />
                                            <asp:Label ID="lblKAd" runat="server" CssClass="kAd" Text='<%# Eval("kAdi") %>'></asp:Label><br />
                                        </div>
                                        <div class="tarih">
                                            <asp:Label ID="lblTarih" runat="server" Text='<%# Eval("Tarih","{0:d}") %>'></asp:Label>
                                            <span class="glyphicon glyphicon-pushpin raptiyeAyar"></span>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div>
            <div class="col-md-6">
                <h3 class="basliklar">Yazılım
            <asp:LinkButton ID="lnkYazilimAc" CssClass="konuAc" PostBackUrl="~/App/KonuEkle.aspx" runat="server">Konu Aç</asp:LinkButton>
                </h3>
                <br />
                <input class="form-control inputAyar" id="Arama2" type="text" placeholder="Ne Aramıştınız,Yardımcı Olalım...">
                <div class="donanimYazilimDivi">
                    <asp:DataList ID="dataListYazilim" runat="server" Width="100%">
                        <ItemTemplate>
                            <ul class="list-group" id="myList2">
                                <li class="list-group-item">
                                    <hr />
                                    <div class="icerik">
                                        <div class="msjiconAyar">
                                            <span class="glyphicon glyphicon-comment "></span>
                                        </div>
                                        <div class="baslikDivi">
                                            <asp:LinkButton ID="lnkKonuBaslik2" title='<%#Eval("KonuIcerik").ToString().Length<85?Eval("KonuIcerik"):Eval("KonuIcerik").ToString().Substring(0,85)+" ..." %>' PostBackUrl='<%# string.Format("~/App/DefaultDetay.aspx?konuid={0}", Eval("Konuid")) %>' runat="server" CssClass="konuBaslik"><%#Eval("KonuBaslik").ToString().Length<30?Eval("KonuBaslik"):Eval("KonuBaslik").ToString().Substring(0,30)+" ..." %></asp:LinkButton><br />
                                            <asp:Label ID="lblKAd2" runat="server" CssClass="kAd" Text='<%# Eval("kAdi") %>'></asp:Label><br />
                                        </div>
                                        <div class="tarih">
                                            <asp:Label ID="lblTarih2" runat="server" Text='<%# Eval("Tarih","{0:d}") %>'></asp:Label>
                                            <span class="glyphicon glyphicon-pushpin raptiyeAyar"></span>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div>
        </div>
    </div>

    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <h4 class="title">Hakkımızda</h4>
                    <p>Ben bu siteyi performans ödevi olduğu için yaptım. Furkan Yaşar 11C Bilişim</p>
                </div>
                <div class="col-sm-4">
                    <h4 class="title">İletişim</h4>
                    <p>
                        Yer: Ataşehir Rotary ÇPAL<br />
                        Tel: +90(595 654 05 46)
                    </p>
                </div>
                <div class="col-sm-4">
                    <h4 class="title">Kategori</h4>
                    <div class="category">
                        <a href="#">pc</a>
                        <a href="#">yardım</a>
                        <a href="#">donanım</a>
                        <a href="#">yazılım</a>
                        <a href="#">oyun</a>
                        <a href="#">soru</a>
                        <a href="#">bilişim</a>
                        <a href="#">teknolojileri</a>
                        <a href="#">teknik</a>
                    </div>
                </div>
            </div>
            <br />
            <br />
            <div class="row text-center"><a href="#" style="color: #fff; text-decoration: none">Copyright ©pcyardim 2018 Tüm Hakları Saklıdır.</a></div>
        </div>
    </footer>--%>
</asp:Content>
