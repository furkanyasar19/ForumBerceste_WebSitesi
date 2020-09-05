<%@ Page Title="" Language="C#" MasterPageFile="~/App/MasterPage.Master" AutoEventWireup="true" CodeBehind="DefaultDetay.aspx.cs" Inherits="pcyardim.App.DefaultDetay" %>

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
    <script>
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container">
        <div class="row">
            <div class="col-md-8">


                <div class="post">
                    <div class="wrap-ut pull-left">
                        <div class="userinfo pull-left">
                            <div class="avatar">
                                <img src="img/icon4.jpg" alt=""/>
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
                            <asp:Label ID="lblKonuBaslik" ForeColor="#0f82c4" Font-Size="Large" runat="server" Text=""></asp:Label><br />

                            <br />

                            <asp:Label ID="lblKonuIcerik" ForeColor="Black" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="postinfobot" style="border-top: 1px solid #ebebeb !important">

                        

                        <div class="prev pull-left">
                            <%--<a href="#"><i class="fa fa-reply" style="color:#0f82c4 !important"></i></a>--%>
                            <asp:LinkButton ID="lnkYorumEkle" runat="server" data-toggle="tooltip" data-placement="bottom" title="Giriş Yapmadıysan Boşuna Tıklama !" OnClick="lnkYorumEkle_Click1" ><i class="fa fa-reply" style="color:#0f82c4 !important"></i></asp:LinkButton>
                        </div>

                        <div class="posted pull-left">
                           <i class="fa fa-user-o" style="color: #0f82c4 !important"></i>
                            <asp:Label ID="lblKullaniciAdi" ForeColor="Black" runat="server" Text=""></asp:Label>
                        </div>

                        <div class="clearfix"></div>
                    </div>
                </div>

                <asp:DataList ID="dataListKonuYorum" runat="server" Width="100%">
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
                                        <img src="img/icon5.jpg" alt=""/>
                                    </div>
                                </div>
                                <div class="posttext pull-left">
                                    <%--<h2><a href="02_topic.html">10 Kids Unaware of Their Halloween Costume</a></h2>--%>



                                    <asp:Label ID="Label1" ForeColor="Black" runat="server" Text='<%#Eval("Yorum").ToString().Length<450?Eval("Yorum"):Eval("Yorum").ToString().Substring(0,450)+" ..." %>'></asp:Label>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="postinfobot" style="border-top: 1px solid #ebebeb !important">

                                

                                

                                <div class="posted pull-left">
                                    <i class="fa fa-user-o" style="color: #0f82c4 !important"></i>
                                    <asp:Label ID="Label2" runat="server" ForeColor="Black" Text='<%#Eval("kAdi") %>'></asp:Label>&nbsp;&nbsp;
                                    <i class="fa fa-clock-o" style="color: #0f82c4 !important"></i>
                                    <asp:Label ID="Label4" ForeColor="Black" runat="server" Text='<%#Eval("Tarih","{0:dd MMMM yyyy dddd hh:mm}") %>'></asp:Label>
                                </div>

                                <%--                                    <div class="next pull-right">                                        
                                        <a href="#"><i class="fa fa-share"></i></a>

                                        <a href="#"><i class="fa fa-flag"></i></a>
                                    </div>--%>

                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
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
                                            <asp:LinkButton ID="lnkFur" ForeColor="Black"  PostBackUrl='<%# string.Format("~/App/Default.aspx?kategori={0}", Eval("Kategori"))%>'  runat="server"><%#Eval("Kategori").ToString().Length<30?Eval("Kategori"):Eval("Kategori").ToString().Substring(0,30)+" ..." %> </asp:LinkButton>

                                        </li>
                                    </div>
                                    <div style="position: absolute; right: 30px;">
                                        <span class="badge" title="Konu Sayısı" style="background-color: #0f82c4 !important"><%#Eval("konuSayisi") %></span>
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                        </ul>
                    </div>
                </div>
                <%--------------------------------------------------KATEGORİ FINISH-------------------------%>
                <div class="sidebarblock">
                    <h3 style="color: #000 !important">En Çok Görüş Alan 5 Konu</h3>
                    <div class="divline"></div>
                    <div class="blocktxt">
                        <asp:LinkButton ID="LinkButton2" ForeColor="Black" runat="server">This Dock Turns Your iPhone Into a Bedside Lamp</asp:LinkButton>
                    </div>
                    <%-- <div class="divline"></div>
                    <div class="blocktxt">
                        <a href="#">Who Wins in the Battle for Power on the Internet?</a>
                    </div>
                    <div class="divline"></div>
                    <div class="blocktxt">
                        <a href="#">Sony QX10: A Funky, Overpriced Lens Camera for Your Smartphone</a>
                    </div>
                    <div class="divline"></div>
                    <div class="blocktxt">
                        <a href="#">FedEx Simplifies Shipping for Small Businesses</a>
                    </div>
                    <div class="divline"></div>
                    <div class="blocktxt">
                        <a href="#">Loud and Brave: Saudi Women Set to Protest Driving Ban</a>
                    </div>--%>
                </div>
            </div>
        </div>
    </div>








    <%--<div class="container">
        <div class="row">
            <asp:DataList ID="dataListKonuTarih" runat="server" Width="100%">
                <ItemTemplate>
                    <div>
                        <asp:Label ID="lblKAd" runat="server" CssClass="konuBaslik2 labelTarih" Text='<%# Eval("kAdi") %>'>
                        </asp:Label>
                        <asp:Label ID="lblTarihZaman" runat="server" CssClass="konuBaslik2 labelTarih" Text="">
                            <span class="glyphicon glyphicon-time"></span>
                            <%# Eval("Tarih") %>
                        </asp:Label>
                    </div>
                </ItemTemplate>
            </asp:DataList>
            <br />

            <div class="disdivYorum" style="margin-bottom: 50px !important">
                <div class="row">
                    <asp:Label ID="lblKonuBaslik" CssClass="konuBaslikAyar" Style="display: inline-block" runat="server" Text=""></asp:Label>
                    <asp:LinkButton ID="lnkYorumEkle" OnClick="lnkYorumEkle_Click" CssClass="yorumEkle" runat="server">Yorum Ekle</asp:LinkButton>
                    <br />
                    <br />
                    <asp:Label ID="lblKonuIcerik" runat="server" Style="padding-bottom: 40px !important; display: inline-block !important" Text=""></asp:Label>
                </div>
            </div>

            <asp:DataList ID="dataListKonuYorum" runat="server" Width="100%">
                <ItemTemplate>
                    <hr style="background-color: #444 !important; height: 1px" />
                    <div>
                        <asp:Label ID="lblYorumKAd" runat="server" CssClass="konuBaslik2 labelTarih" Text='<%# Eval("kAdi") %>'></asp:Label>
                        <asp:Label ID="lblYorumTarihZaman" runat="server" CssClass="konuBaslik2 labelTarih" Text="">
                <span class="glyphicon glyphicon-time"></span>
                <%# Eval("Tarih") %>

                        </asp:Label>
                    </div>
                    <br />
                    <div class="disdivYorum" style="margin-bottom: 50px !important">
                        <div class="row">
                            <asp:Label ID="lblYorum" runat="server" Style="padding-bottom: 40px !important; display: inline-block !important" Text='<%# Eval("Yorum") %>'></asp:Label>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>

        </div>
    </div>--%>
</asp:Content>
