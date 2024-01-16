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
    public partial class OgrenciDuzenle : System.Web.UI.Page
    {
        string vs_SQLText;

        clsDBOperations clsDBOperations = new clsDBOperations();
        clsDTConvert clsDTConvert = new clsDTConvert();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridFill();
            }
        }

        protected void GridFill()
        {
            clsDBOperations.ConnectionOC();

            vs_SQLText = "SELECT OgrenciID,OgrNo,OgrAd,OgrSoyad,datOgrenci.SinifID,prmSinif.SinifTnm,OgrDT,OgrDT,OgrCinsiyet,CASE WHEN OgrCinsiyet='E' THEN 'Erkek' WHEN OgrCinsiyet='K' THEN 'Kadın' ELSE 'Belirtmek İstemiyor' end AS 'CinsTnm'  FROM datOgrenci INNER JOIN prmSinif ON datOgrenci.SinifID = prmSinif.SinifID";

            dgrdOgrenci.DataSource = clsDBOperations.ShowDataInGridView(vs_SQLText);
            dgrdOgrenci.DataBind();

            clsDBOperations.ConnectionOC();

        }

        protected void dgrdOgrenci_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            int vi_OgrenciID = Convert.ToInt32(dgrdOgrenci.DataKeys[e.RowIndex].Value.ToString());

            vs_SQLText = "DELETE FROM datOgrenci WHERE OgrenciID=" + vi_OgrenciID;

            if (clsDBOperations.ExecuteQueries(vs_SQLText))
            {
                Response.Write("<script>alert('Kayıt Silindi')</script>");
            }
            else
            {
                Response.Write("<script>alert('Kayıt Silinemedi')</script>");
            }

            GridFill();
        }
        protected void dgrdOgrenci_RowEditing(object sender, GridViewEditEventArgs e)
        {
            dgrdOgrenci.EditIndex = e.NewEditIndex;

            GridFill();
        }
        protected void dgrdOgrenci_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int vi_OgrenciID = Convert.ToInt32(dgrdOgrenci.DataKeys[e.RowIndex].Value.ToString());

            GridViewRow row = (GridViewRow)dgrdOgrenci.Rows[e.RowIndex];

            TextBox textOgrNo = (TextBox)row.Cells[1].Controls[0];
            TextBox textOgrAd = (TextBox)row.Cells[2].Controls[0];
            TextBox textOgrSoyad = (TextBox)row.Cells[3].Controls[0];
            TextBox textSinifID = (TextBox)row.Cells[4].Controls[0];
            TextBox textOgrDT = (TextBox)row.Cells[6].Controls[0];
            TextBox textOgrCinsiyet = (TextBox)row.Cells[8].Controls[0];
 
            dgrdOgrenci.EditIndex = -1;

            clsDBOperations.ConnectionOC();

            vs_SQLText = "UPDATE datOgrenci ";
            vs_SQLText += "SET ";
            vs_SQLText += "OgrNo=" + Convert.ToInt32(textOgrNo.Text) + ",";
            vs_SQLText += "OgrAd='" + textOgrAd.Text + "',";
            vs_SQLText += "OgrSoyad='" + textOgrSoyad.Text + "',";
            vs_SQLText += "SinifID=" + Convert.ToInt32(textSinifID.Text) + ",";
            vs_SQLText += "OgrDT='" + textOgrDT.Text + "',";
            vs_SQLText += "OgrCinsiyet='" + textOgrCinsiyet.Text + "' ";
            vs_SQLText += "WHERE OgrenciID=" + vi_OgrenciID;

            if (clsDBOperations.ExecuteQueries(vs_SQLText))
            {
                Response.Write("<script>alert('Kayıt Güncellendi')</script>");
            }
            else
            {
                Response.Write("<script>alert('Kayıt Güncellenemedi')</script>");
            }

            GridFill();
        }
        protected void dgrdOgrenci_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgrdOgrenci.PageIndex = e.NewPageIndex;
            GridFill();
        }
        protected void dgrdOgrenci_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            dgrdOgrenci.EditIndex = -1;
            GridFill();
        }
    }

}
