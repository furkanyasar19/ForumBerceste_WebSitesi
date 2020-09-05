using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using pcyardim.App_Code;

namespace pcyardim.App
{
    public partial class KullaniciProfil : System.Web.UI.Page
    {
        Kullanicilar kullanicilar = new Kullanicilar();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            kullanicilar.kAdi = Request.QueryString["KullaniciAdi"];
            lblMail.Text = kullanicilar.KullaniciMailDonder();
            lblKAd.Text = kullanicilar.KullaniciAdiDonder();
            lblParola.Text = kullanicilar.KullaniciParolaDonder();
            GununSozu.Visible = false;
            if (lblKAd.Text=="admin")
            {
                GununSozu.Visible = true;
                lblGunSozu.Text = kullanicilar.GununSozuGetir();
            }
        }

        protected void btnUyeOl_Click(object sender, EventArgs e)
        {
            if (txtParola.Text == "" || txtParolaTekrar.Text=="")
            {
                lblSonuc.Text = "Lütfen tüm alanları doldurunuz.";
            }
            else if (txtParola.Text.Length < 4)
            {
                lblSonuc.Text = "Parolanız en az 4 karekterden oluşmalıdır.";
            }
            else if (txtParola.Text != txtParolaTekrar.Text)
            {
                lblSonuc.Text = "Parolanız eşleşmiyor.";
            }
            else
            {
                kullanicilar.parola = txtParola.Text;
                kullanicilar.kAdi = lblKAd.Text;
                bool guncellendimi = kullanicilar.ParolaGuncelle();
                if (guncellendimi)
                {
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    lblSonuc.Text = "Rahmet Olası Hatalar Oluştu. Lütfen Daha Sonra Tekrar Deneyin.";
                }
            }
        }

        protected void btnGeriDon_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void btnGunnSoz_Click(object sender, EventArgs e)
        {
            if (txtGunSozz.Text=="")
            {
                lblGunSozSonuc.Text = "Alanı Doldurunuz.";
            }
            else
            {
                kullanicilar.gununsozu = txtGunSozz.Text;
                bool guncellendimi = kullanicilar.GununSozuGuncelle();
                if (guncellendimi)
                {
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    lblGunSozSonuc.Text = "Rahmet Olası Hatalar Oluştu. Lütfen Daha Sonra Tekrar Deneyin.";
                }
            }
        }
    }
}