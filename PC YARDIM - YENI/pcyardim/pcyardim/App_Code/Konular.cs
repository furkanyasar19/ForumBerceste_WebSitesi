using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using pcyardim.App_Code;

namespace pcyardim.App
{
    public class Konular
    {
        public int konuid,kisiid,kategoriid;
        public string konuBaslik, konuIcerik;
        List<Veriler> list;
        string sorgu;
        SqlCommand cmd;
        Veriler veriler = new Veriler();


        //---------------------------------------------------ORJ
        public List<Veriler> KonuGetir(string kate)
        {
            list = new List<Veriler>();
            //sorgu = string.Format("select Konuid,KonuBaslik,KonuIcerik,tblKonular.Tarih,KullaniciAdi from tblKonular inner join tblKisiler on tblKisiler.Kisiid=tblKonular.Kisiid order by Tarih desc");
            //select count(Yorum),tblKonular.Tarih,tblKonular.Konuid,tblKonular.KonuBaslik,tblKonular.KonuIcerik from tblKonular inner join tblYorumlar on tblYorumlar.Konuid = tblKonular.Konuid group by tblKonular.Tarih,tblKonular.Konuid,tblKonular.KonuBaslik,tblKonular.KonuIcerik order by Tarih desc
            if (kate==null)
            {
                sorgu = string.Format("select count(Yorum) as sayi,tblKonular.Tarih,tblKonular.GoruntulenmeSayisi,tblKonular.Konuid,tblKonular.KonuBaslik,tblKonular.KonuIcerik from tblKonular left join tblYorumlar on tblYorumlar.Konuid = tblKonular.Konuid group by tblKonular.Tarih,tblKonular.GoruntulenmeSayisi,tblKonular.Konuid,tblKonular.KonuBaslik,tblKonular.KonuIcerik order by Tarih desc");
            }
            else
            {
                sorgu = string.Format("select count(Yorum) as sayi,tblKonular.Tarih,tblKonular.GoruntulenmeSayisi,tblKonular.Konuid,tblKonular.KonuBaslik,tblKonular.KonuIcerik,tblKategoriler.Kategori from tblKonular left join tblYorumlar on tblYorumlar.Konuid = tblKonular.Konuid left join tblKategoriler on tblKategoriler.Kategoriid=tblKonular.Kategoriid where tblKategoriler.Kategori='{0}' group by tblKonular.Tarih,tblKonular.GoruntulenmeSayisi,tblKonular.Konuid,tblKonular.KonuBaslik,tblKonular.KonuIcerik,tblKategoriler.Kategori order by Tarih desc", kate);
            }
            var okunan = veriler.VeriOku(sorgu);
            while (okunan.Read())
            {
                veriler = new Veriler();
                veriler.konuid = Convert.ToInt32(okunan["Konuid"]);
                veriler.konuBaslik = okunan["KonuBaslik"].ToString();
                veriler.konuIcerik = okunan["KonuIcerik"].ToString();
                veriler.tarih = Convert.ToDateTime(okunan["Tarih"]);
                veriler.goruntulenme = Convert.ToInt32(okunan["GoruntulenmeSayisi"]);
                veriler.yorumSayi = Convert.ToInt32(okunan["sayi"]);/*Konuya ait yorum sayısı*/

                //veriler.kAdi = okunan["KullaniciAdi"].ToString();
                list.Add(veriler);
            }
            return list;
        }
        //-----------------------------------------------------ORJ



        public List<Veriler> KonuDetay()
        {
            list = new List<Veriler>();
            sorgu = string.Format("select tblKisiler.KullaniciAdi,tblKisiler.Kisiid,tblKisiler.KullaniciAdi,tblKonular.Tarih,tblKonular.KonuBaslik,tblKonular.Konuid,tblKonular.KonuIcerik from tblKisiler inner join tblKonular on tblKonular.Kisiid=tblKisiler.Kisiid where Konuid={0}", konuid);
            var okunan = veriler.VeriOku(sorgu);
            while (okunan.Read())
            {
                veriler = new Veriler();
                veriler.konuid = Convert.ToInt32(okunan["Konuid"]);
                veriler.konuBaslik = okunan["KonuBaslik"].ToString();
                veriler.kisiid = (int)okunan["Kisiid"];
                veriler.kAdi = okunan["KullaniciAdi"].ToString();
                veriler.tarih = Convert.ToDateTime(okunan["Tarih"]);
                veriler.konuIcerik = okunan["KonuIcerik"].ToString();

                veriler.kAdi = okunan["KullaniciAdi"].ToString();

                list.Add(veriler);
            }
            return list;
        }



        //public List<Veriler> KategoriFiltrele()
        //{
        //    list = new List<Veriler>();
        //    //sorgu = string.Format("select tblKonular.KonuBaslik,tblKonular.KonuIcerik from tblKonular where tblKonular.Kategoriid={0}",kategoriid);
        //        sorgu = string.Format("select count(Yorum) as sayi,tblKonular.Kategoriid,tblKonular.Tarih,tblKonular.Konuid,tblKonular.KonuBaslik,tblKonular.KonuIcerik from tblKonular inner join tblYorumlar on tblYorumlar.Konuid = tblKonular.Konuid group by tblKonular.Tarih,tblKonular.Konuid,tblKonular.KonuBaslik,tblKonular.KonuIcerik where=tblKonular.Kategoriid={0} order by Tarih desc", kategoriid);

        //    var okunan = veriler.VeriOku(sorgu);
        //    while (okunan.Read())
        //    {
        //        veriler = new Veriler();
        //        veriler.konuid = Convert.ToInt32(okunan["Konuid"]);
        //        veriler.konuBaslik = okunan["KonuBaslik"].ToString();
        //        veriler.konuIcerik = okunan["KonuIcerik"].ToString();
        //        veriler.tarih = Convert.ToDateTime(okunan["Tarih"]);
        //        veriler.yorumSayi = Convert.ToInt32(okunan["sayi"]);/*Konuya ait yorum sayısı*/
        //        veriler.kategoriid = Convert.ToInt32(okunan["Kategoriid"]);


        //        veriler.kategori = okunan["Kategori"].ToString();
        //        veriler.konuSayisi = Convert.ToInt32(okunan["sayi"]);
        //        list.Add(veriler);
        //    }
        //    return list;
        //}

        //----------------------------------------------ORJ
        public List<Veriler> KategorileriGetir()
        {
            list = new List<Veriler>();
            //sorgu = string.Format("select Kategori from tblKategoriler");

            //select count(KonuBaslik) as KonuSayisi,tblKategoriler.Kategori from tblKategoriler inner join tblKonular on tblKonular.Kategoriid = tblKategoriler.Kategoriid group by tblKategoriler.Kategori
            sorgu = string.Format("select count(KonuBaslik) as sayi,tblKategoriler.Kategori from tblKategoriler left join tblKonular on tblKonular.Kategoriid=tblKategoriler.Kategoriid group by tblKategoriler.Kategori");

            var okunan = veriler.VeriOku(sorgu);
            while (okunan.Read())
            {
                veriler = new Veriler();
                veriler.kategori = okunan["Kategori"].ToString();
                veriler.konuSayisi = Convert.ToInt32(okunan["sayi"]);
                list.Add(veriler);
            }
            return list;
        }
        //----------------------------------------------ORJ

        public int Kategoriidgetir(string kategori)
        {
            sorgu = string.Format("Select Kategoriid from tblKategoriler where Kategori='{0}'", kategori);
            cmd = new SqlCommand(sorgu, Kullanicilar.Baglan());
            int kategoriid = Convert.ToInt32(cmd.ExecuteScalar());
            return kategoriid;
        }


        


        //KONUYA AİT YORUM SAYISI-----------
        //public int KonuYorumSayisi()
        //{
        //    sorgu = string.Format("select count(Yorum) from tblYorumlar inner join tblKonular on tblKonular.Konuid=tblYorumlar.Konuid where tblYorumlar.Konuid={0}", konuid);
        //    cmd = new SqlCommand(sorgu, Kullanicilar.Baglan());
        //    int YorumSayisi = Convert.ToInt32(cmd.ExecuteScalar());
        //    return YorumSayisi;
        //}
        //KONUYA AİT YORUM SAYISI------------

        public bool KonuEkle()
        {
            bool etkilendimi = false;
            sorgu = string.Format("insert into tblKonular (KonuBaslik,KonuIcerik,Kisiid,Kategoriid) values (@konuBaslik,@konuIcerik,@kisiid,@kategoriid)");
            cmd = new SqlCommand(sorgu, Kullanicilar.Baglan());
            cmd.Parameters.AddWithValue("@konuBaslik", konuBaslik);
            cmd.Parameters.AddWithValue("@konuIcerik", konuIcerik);
            cmd.Parameters.AddWithValue("@kisiid", kisiid);
            cmd.Parameters.AddWithValue("@kategoriid", kategoriid);
            int etkilenen = cmd.ExecuteNonQuery();
            if (etkilenen != 0)
            {
                etkilendimi = true;
            }
            Kullanicilar.Baglan().Close();
            return etkilendimi;
        }
        public string KonuBaslikGetir()
        {
            sorgu = string.Format("select KonuBaslik from tblKonular where Konuid={0}", konuid);
            cmd = new SqlCommand(sorgu, Kullanicilar.Baglan());
            string gundembaslik = cmd.ExecuteScalar().ToString();
            Kullanicilar.Baglan().Close();
            return gundembaslik;
        }
        public bool GoruntulenmeyiArttir()
        {
            bool durum = false;
            sorgu = string.Format("update tblKonular set GoruntulenmeSayisi+=1 where Konuid={0}", konuid);
            cmd = new SqlCommand(sorgu, Kullanicilar.Baglan());
            int etkilenen = cmd.ExecuteNonQuery();
            if (etkilenen != 0)
            {
                durum = true;
            }
            Kullanicilar.Baglan().Close();
            return durum;
        }
    }
}