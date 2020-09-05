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
    public partial class Default : System.Web.UI.Page
    {
        Konular konular = new Konular();
        Veriler veriler = new Veriler();
        string kateg = "";
        Kullanicilar kullanicilar = new Kullanicilar();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Request.Cookies["cerezDosyam"] == null)
            //{
            //    lnkDonanimAc.Visible = false;
            //    lnkYazilimAc.Visible = false;
            //}

            divUyarı.Visible = false;
            kateg = Request.QueryString["kategori"];
            dataList1.DataSource = konular.KonuGetir(kateg);
            dataList1.DataBind();
            if (konular.KonuGetir(kateg).Count == 0)
            {
                divUyarı.Visible = true;
            }
            else
            {
                divUyarı.Visible = false;
            }

            konular.kategoriid = Convert.ToInt32(Request.QueryString["kategoriid"]);

            //dataListYazilim.DataSource = konular.YazilimKonuGetir();
            //dataListYazilim.DataBind();


            dataList2.DataSource = konular.KategorileriGetir();
            dataList2.DataBind();
        }
        protected void lnkKat_Click1(object sender, EventArgs e)
        {
            kateg = Request.QueryString["kategori"];
            dataList1.DataSource = konular.KonuGetir(kateg);
            dataList1.DataBind();
            if (konular.KonuGetir(kateg).Count==0)
            {
                divUyarı.Visible = true;
            }
            else
            {
                divUyarı.Visible = false;
            }
        }
    }
}