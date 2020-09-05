using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using pcyardim.App_Code;
using System.Globalization;

namespace pcyardim.App
{
    public partial class DefaultDetay : System.Web.UI.Page
    {
        Konular konular = new Konular();
        Yorumlar yorumlar = new Yorumlar();
        Kullanicilar kullanicilar = new Kullanicilar();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["cerezDosyam"] == null)
            {
                //lnkYorumEkle.Visible = false;
            }
            int konuid = Convert.ToInt32(Request.QueryString["konuid"]);
            konular.konuid = konuid;
            yorumlar.konuid = konuid;
            KonuDetayDoldur();
            
            dataListKonuYorum.DataSource = yorumlar.KonuYorumBilgiGetir();
            dataListKonuYorum.DataBind();

            //dataListKonuTarih.DataSource = konular.KonuDetay();
            //dataListKonuTarih.DataBind();
            dataList2.DataSource = konular.KategorileriGetir();
            dataList2.DataBind();
            //konular.KonuDetay();

            if (!IsPostBack)
            {
                if (konular.GoruntulenmeyiArttir())
                {
                    
                }
            }

        }
        private void KonuDetayDoldur()
        {
            var bilgiler = konular.KonuDetay().FirstOrDefault();
            lblKonuBaslik.Text = bilgiler.konuBaslik.ToString();
            lblKonuIcerik.Text = bilgiler.konuIcerik.ToString();
            lblKullaniciAdi.Text =bilgiler.kAdi.ToString();
        }

        protected void lnkYorumEkle_Click(object sender, EventArgs e)
        {
            Response.Redirect(string.Format("YorumEkle.aspx?Konuid={0}", Request.QueryString["konuid"]));
        }

        protected void lnkYorumEkle_Click1(object sender, EventArgs e)
        {
            if (Request.Cookies["cerezDosyam"] != null)
            {
                HttpCookie cerezOku = Request.Cookies["cerezdosyam"];
                Response.Redirect(string.Format("YorumEkle.aspx?Konuid={0}", Request.QueryString["konuid"]));
            }
            else
            {

            }
        }
    }
}