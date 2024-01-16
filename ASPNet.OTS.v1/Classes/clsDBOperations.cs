using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ASPNet.OTS.v1.Classes
{
    public class clsDBOperations
    {
        string vs_ConnStr = string.Empty;
        string vs_dbLocation = "B"; //H: Home, B:BEM

        SqlConnection vo_Conn;
        SqlCommand vo_Cmd;
        SqlDataAdapter vo_DA; // adapter için
        SqlDataReader vo_DR;
        DataSet vo_DS; // dataset için
        public void ConnectionOC()
        {
            if (vs_dbLocation=="H")
            {
                vo_Conn = new SqlConnection(GetConnectionString("OTSv1_ConnStrH"));
            }
            else
            {
                vo_Conn = new SqlConnection(GetConnectionString("OTSv1_ConnStrB"));
            }

            switch (vo_Conn.State)
            {
                case ConnectionState.Open:
                    vo_Conn.Close();
                    break;
                case ConnectionState.Closed:
                    vo_Conn.Open();
                    break;
                default:
                    break;
            }
        }
        public string GetConnectionString(string keyname)
        {
            switch (keyname)
            {
                case "OTSv1_ConnStrH":
                    vs_ConnStr = ConfigurationManager.ConnectionStrings[keyname].ConnectionString;
                    break;
                case "OTSv1_ConnStrB":
                    vs_ConnStr = ConfigurationManager.ConnectionStrings[keyname].ConnectionString;
                    break;
                default:
                    break;
            }
            return vs_ConnStr;
        }

        public bool ExecuteQueries(string Query)
        {
            ConnectionOC();

            vo_Cmd = new SqlCommand(Query, vo_Conn);

            try
            {
                vo_Cmd.ExecuteNonQuery();
                ConnectionOC();
                return true;
            }
            catch (Exception)
            {
                ConnectionOC();
                return false;   
            }


        }
        public SqlDataReader GetDataReader(string Query)
        {
            vo_Cmd = new SqlCommand(Query, vo_Conn);
            vo_DR = vo_Cmd.ExecuteReader();

            return vo_DR;
        }
        public DataSet GetDataSet(string Query)
        {
            ConnectionOC();

            vo_DA = new SqlDataAdapter(Query, vo_Conn);

            vo_DS = new DataSet();

            vo_DA.Fill(vo_DS, "datUser");

            ConnectionOC();

            return vo_DS;
        }
        public object ShowDataInGridView(string Query)
        {
            // direk olarak datagridview da gözzükecek veriler oluşturuluyor ve geri döndürülüyor.

            vo_DA = new SqlDataAdapter(Query, vs_ConnStr);
            vo_DS = new DataSet();
            vo_DA.Fill(vo_DS);

            object griddata = vo_DS.Tables[0];
            
            return griddata;
        }

        public object ShowDataInCheckListBox(string Query)
        {
            // direk olarak checklistboxda gözükecek veriler oluşturuluyor ve geri döndürülüyor.

            vo_DA = new SqlDataAdapter(Query, vs_ConnStr);
            vo_DS = new DataSet();
            vo_DA.Fill(vo_DS);

            object chklbdata = vo_DS.Tables[0];

            return chklbdata;
        }

        public int GetLastID(string Query)
        {
            ConnectionOC();

            vo_Cmd = new SqlCommand(Query, vo_Conn);
            
            SqlDataReader reader = vo_Cmd.ExecuteReader();

            reader.Read();

            int LastID= Convert.ToInt32(reader["OgrenciID"].ToString());

            reader.Close();

            ConnectionOC();

            return LastID;
        }
    }

}
