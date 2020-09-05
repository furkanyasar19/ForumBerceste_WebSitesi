using pcyardim.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace pcyardim.App
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        Kullanicilar kullanicilar = new Kullanicilar();
        protected void Page_Load(object sender, EventArgs e)
        {
            lnkGirisMesaj.Visible = false;
            lnkKonuEkle.Visible = false;
            lnkCikis.Visible = false;
            lblGunuSozuu.Text = kullanicilar.GununSozuGetir();
            if (Request.Cookies["cerezDosyam"] != null)
            {
                HttpCookie cerezOku = Request.Cookies["cerezdosyam"];
                kullanicilar.kAdi = cerezOku["kAd"].ToString();
                lnkGirisMesaj.Visible = true;
                lnkGirisMesaj.Text = "Allahın Selamı Üzerinize Olsun " + kullanicilar.KullaniciAdiDonder();
                lnkCikis.Visible = true;
                lnkGirisYap.Visible = false;
                lnkKonuEkle.Visible = true;
                //txtKAd.Visible = false;
                //txtParola.Visible = false;
                lnkUyeOl.Visible = false;
                //btnGiris.Visible = false;

                
                
            }
        }
        //protected void btnGiris_Click(object sender, EventArgs e)
        //{
        //    kullanicilar.mail = txtKAd.Text;
        //    kullanicilar.parola = txtParola.Text;
        //    if (txtKAd.Text == "" || txtParola.Text == "")
        //    {
        //        lblSonuc.Text = "Lütfen tüm alanları doldurunuz";
        //    }
        //    else
        //    {
        //        if (!kullanicilar.UyeGirisKontrol())
        //        {
        //            lblSonuc.Text = "Bilgileriniz Yanlış";
        //        }
        //        else
        //        {
        //            HttpCookie cerezim = new HttpCookie("cerezdosyam");
        //            cerezim["kAd"] = txtKAd.Text;
        //            kullanicilar.kAdi = cerezim["kAd"];
        //            lblSonuc.Text = "Giriş başarılı";
        //            cerezim.Expires = DateTime.Now.AddDays(1);
        //            Response.Cookies.Add(cerezim);
        //            Response.Redirect("Default.aspx");
        //        }
        //    }
        //}

        protected void lnkCikis_Click(object sender, EventArgs e)
        {
            HttpCookie cerezim = new HttpCookie("cerezdosyam");
            cerezim.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(cerezim);
            Response.Redirect("Default.aspx");
        }

        protected void btnGiris_Click1(object sender, EventArgs e)
        {
            kullanicilar.mail = txtKAd.Text;
            kullanicilar.parola = txtParola.Text;
            if (txtKAd.Text == "" || txtParola.Text == "")
            {
                lblSonuc.Text = "Lütfen tüm alanları doldurunuz";
            }
            else
            {
                if (!kullanicilar.UyeGirisKontrol())
                {
                    lblSonuc.Text = "Bilgileriniz Yanlış";
                }
                else
                {
                    HttpCookie cerezim = new HttpCookie("cerezdosyam");
                    cerezim["kAd"] = txtKAd.Text;
                    kullanicilar.kAdi = cerezim["kAd"];
                    lblSonuc.Text = "Giriş başarılı";
                    cerezim.Expires = DateTime.Now.AddDays(1);
                    Response.Cookies.Add(cerezim);
                    Response.Redirect("Default.aspx");
                }
            }
        }

        protected void lnkGirisMesaj_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["cerezDosyam"] != null)
            {
                HttpCookie cerezOku = Request.Cookies["cerezdosyam"];
                Response.Redirect(string.Format("KullaniciProfil.aspx?KullaniciAdi={0}", kullanicilar.KullaniciAdiDonder()));
            }
            else
            {

            }
        }
    }
}