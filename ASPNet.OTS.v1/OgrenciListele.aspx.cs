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
    public partial class OgrenciListele : System.Web.UI.Page
    {
        clsDBOperations clsDBOperations = new clsDBOperations();
        clsDTConvert clsDTConvert = new clsDTConvert();

        string vs_In="(";
        string vs_SQLText;
        string vs_WhereText=" WHERE OgrenciID > 0 "; // her halukarda olması gerek diğer seçenekler seçilmemişse bile
        string vs_DogTrh; // Öğrencinin DT sinin string hali
        string vs_Cinsiyet;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                FormInit();
            }
        }

        protected void FormInit()
        {
            ChecklistBox_Sinif_Fill();
            chlbSinif.SelectedIndex = -1; // seçili olmasın seçenekler...
        }

        protected void ChecklistBox_Sinif_Fill()
        {
            vs_SQLText = "SELECT SinifID,SinifTnm FROM prmSinif";

            clsDBOperations.ConnectionOC();

            chlbSinif.DataSource = clsDBOperations.ShowDataInCheckListBox(vs_SQLText);
            chlbSinif.DataValueField = "SinifID";
            chlbSinif.DataTextField = "SinifTnm";
            chlbSinif.DataBind();

            clsDBOperations.ConnectionOC();
        }

        protected void GridFill()
        {
            clsDBOperations.ConnectionOC();

            dgrdOgrenci.DataSource = clsDBOperations.ShowDataInGridView(vs_SQLText);


            dgrdOgrenci.DataBind();

            clsDBOperations.ConnectionOC();
        }

        protected void dgrdOgrenci_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow)dgrdOgrenci.Rows[e.RowIndex];
            Label lbldeleteid = (Label)row.FindControl("lblID");

            //conn.Open();

            //SqlCommand cmd = new SqlCommand("delete FROM detail where id='" + Convert.ToInt32(dgrdOgrenci.DataKeys[e.RowIndex].Value.ToString()) + "'", conn);
            //cmd.ExecuteNonQuery();

            //conn.Close();

            GridFill();
        }
        protected void dgrdOgrenci_RowEditing(object sender, GridViewEditEventArgs e)
        {
            dgrdOgrenci.EditIndex = e.NewEditIndex;

            GridFill();
        }
        protected void dgrdOgrenci_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int userid = Convert.ToInt32(dgrdOgrenci.DataKeys[e.RowIndex].Value.ToString());
            GridViewRow row = (GridViewRow)dgrdOgrenci.Rows[e.RowIndex];
            Label lblID = (Label)row.FindControl("lblID");
            //TextBox txtname=(TextBox)gr.cell[].control[];  
            TextBox textName = (TextBox)row.Cells[0].Controls[0];
            TextBox textadd = (TextBox)row.Cells[1].Controls[0];
            TextBox textc = (TextBox)row.Cells[2].Controls[0];
            //TextBox textadd = (TextBox)row.FindControl("txtadd");  
            //TextBox textc = (TextBox)row.FindControl("txtc");  
            dgrdOgrenci.EditIndex = -1;

            //conn.Open();

            //SqlCommand cmd = new SqlCommand("SELECT * FROM detail", conn);  

            //SqlCommand cmd = new SqlCommand("update detail set name='" + textName.Text + "',address='" + textadd.Text + "',country='" + textc.Text + "'where id='" + userid + "'", conn);

            //cmd.ExecuteNonQuery();

            //conn.Close();

            GridFill();
            //GridView1.DataBind();  
        }
        protected void dgrdOgrenci_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            int sayfano = dgrdOgrenci.PageIndex;

            e.NewPageIndex = sayfano;

            dgrdOgrenci.PageIndex = e.NewPageIndex;

            sayfano= dgrdOgrenci.PageIndex;
            vs_SQLText = "SELECT OgrenciID,OgrNo,OgrAd,OgrSoyad,datOgrenci.SinifID,prmSinif.SinifTnm,OgrDT,OgrDT,OgrCinsiyet,CASE WHEN OgrCinsiyet='E' THEN 'Erkek' WHEN OgrCinsiyet='K' THEN 'Kadın' ELSE 'Belirtmek İstemiyor' end AS 'CinsTnm'  FROM datOgrenci INNER JOIN prmSinif ON datOgrenci.SinifID = prmSinif.SinifID";
            GridFill();
        }
        protected void dgrdOgrenci_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            dgrdOgrenci.EditIndex = -1;
            GridFill();
        }

        protected void btonQuery_Click(object sender, EventArgs e)
        {
            // ekrandaki seçenekler seçildikten sonra sorgula işlemini yapar..

            vs_SQLText = "SELECT OgrenciID,OgrNo,OgrAd,OgrSoyad,datOgrenci.SinifID,prmSinif.SinifTnm,OgrDT,OgrDT,OgrCinsiyet,CASE WHEN OgrCinsiyet='E' THEN 'Erkek' WHEN OgrCinsiyet='K' THEN 'Kadın' ELSE 'Belirtmek İstemiyor' end AS 'CinsTnm'  FROM datOgrenci INNER JOIN prmSinif ON datOgrenci.SinifID = prmSinif.SinifID";

            // Kontroller başlıyor.

            // Ogrenci No Bas-Son
            if (tboxOgrNo_Bas.Text.Trim() != "")
            {
                if (tboxOgrNo_Son.Text.Trim() != "")
                {
                    vs_WhereText += "AND OgrNo BETWEEN " + Convert.ToInt32(tboxOgrNo_Bas.Text) + " AND " + Convert.ToInt32(tboxOgrNo_Son.Text);
                }
                else
                {
                    vs_WhereText += "AND OgrNo=" + Convert.ToInt32(tboxOgrNo_Bas.Text);
                }
            }

            // Ogrenci Ad Bas-Son
            if (tboxOgrAd_Bas.Text.Trim() != "")
            {
                if (tboxOgrAd_Son.Text.Trim() != "")
                {
                    vs_WhereText += "AND (OgrAd LIKE '" + tboxOgrAd_Bas.Text + "%' OR OgrAd LIKE '" + tboxOgrAd_Son.Text + "%')";
                }
                else
                {
                    vs_WhereText += "AND OgrAd LIKE '" + tboxOgrAd_Bas.Text + "%'";
                }
            }
            // Ogrenci Soyad Bas-Son
            if (tboxOgrSoyad_Bas.Text.Trim() != "")
            {
                if (tboxOgrSoyad_Son.Text.Trim() != "")
                {
                    vs_WhereText += "AND (OgrSoyad LIKE '" + tboxOgrSoyad_Bas.Text + "%' OR OgrSoyad LIKE '" + tboxOgrSoyad_Son.Text + "%')";
                }
                else
                {
                    vs_WhereText += "AND OgrSoyad LIKE '" + tboxOgrSoyad_Bas.Text + "%'";
                }
            }

                        // Ogrenci Sınıf
            for (int i = 0; i < chlbSinif.Items.Count-1; i++)
            {
                if (chlbSinif.Items[i].Selected==true)
                {
                    vs_In += chlbSinif.Items[i].Value + ","; // (1,2,5) gibi


                    //vs_WhereText += "AND SinifID=" + chlbSinif.SelectedValue;
                }
            }
            
            
            //if (tboxOgrSoyad_Bas.Text.Trim() != "")
            //{
            //    if (tboxOgrSoyad_Son.Text.Trim() != "")
            //    {
            //        vs_WhereText += "AND (OgrSoyad LIKE '" + tboxOgrSoyad_Bas.Text + "%' OR OgrSoyad LIKE '" + tboxOgrSoyad_Son.Text + "%')";
            //    }
            //    else
            //    {
            //        vs_WhereText += "AND OgrSoyad LIKE '" + tboxOgrSoyad_Bas.Text + "%'";
            //    }
            //}



            vs_SQLText += vs_WhereText; // sorguya gidecek ana select

            //clsDBOperations.ExecuteQueries(vs_SQLText);

            GridFill();




        }
    }
}