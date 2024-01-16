using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

using ASPNet.OTS.v1.Classes;

namespace ASPNet.OTS.v1
{
    public partial class OgrenciEkle : System.Web.UI.Page
    {
        clsDBOperations clsDBOperations = new clsDBOperations();
        clsDTConvert clsDTConvert = new clsDTConvert();

        string vs_SQLText;
        string vs_DogTrh; // Öğrencinin DT sinin string hali
        string vs_Cinsiyet;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //GetLastRecordNo

                // Fill dropdown 
                FormInit();
            }
        }

        protected void FormInit()
        {
                LearnLastRecordNo();
                FillClassDropdown();

            tboxOgrNo.Text = "";
            tboxAd.Text = "";
            tboxOgrSoyad.Text = "";
            ddlsSinif.SelectedIndex = 0;
            calrDT.SelectedDate = DateTime.Now;
            rbtlCinsiyet.SelectedIndex = -1;


        }

        protected void btonKayit_Click(object sender, EventArgs e)
        {
 
            vs_SQLText = "INSERT INTO datOgrenci ";
            vs_SQLText += "(OgrNo,OgrAd,OgrSoyad,SinifID,OgrDT,OgrCinsiyet) VALUES (";
            vs_SQLText += Convert.ToInt32(tboxOgrNo.Text) + ",'" + tboxAd.Text + "','" + tboxOgrSoyad.Text + "'," + ddlsSinif.SelectedValue + ",'" + clsDTConvert.DTConvert(calrDT.SelectedDate, "1") + "','" + vs_Cinsiyet + "')";

            if (clsDBOperations.ExecuteQueries(vs_SQLText))
            {
                Response.Write("<script>alert('Kayıt Eklendi')</script>");

                FormInit();


            }
            else
            {
                Response.Write("<script>alert('Kayıt Eklenemedi')</script>");
            }



        }

        protected void rbtlCinsiyet_SelectedIndexChanged(object sender, EventArgs e)
        {
            vs_Cinsiyet = rbtlCinsiyet.SelectedValue;
        }

        protected void FillClassDropdown()
        {

            vs_SQLText = "SELECT SinifID,SinifTnm FROM prmSinif";

            clsDBOperations.ConnectionOC();

            if (clsDBOperations.GetDataSet(vs_SQLText).Tables[0].Rows.Count > 0)
            {
                ddlsSinif.DataValueField = "SinifID";
                ddlsSinif.DataTextField = "SinifTnm";

                ddlsSinif.DataSource = clsDBOperations.GetDataSet(vs_SQLText);
                ddlsSinif.DataBind();
            }
            else
            {
                Response.Write("<script>alert('Bir problem var...')</script>");
            }
        }

        protected void LearnLastRecordNo()
        {

            vs_SQLText = "SELECT TOP(1) OgrenciID FROM datOgrenci ORDER BY OgrenciID DESC";

            lbelOgrID.Text = Convert.ToString(clsDBOperations.GetLastID(vs_SQLText)+1);

        }
        
    }
}