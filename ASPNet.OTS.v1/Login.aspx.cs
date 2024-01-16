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
    public partial class Login : System.Web.UI.Page
    {
        clsDBOperations dBOperations = new clsDBOperations();

        string vs_SQLText;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                tboxUserName.Text = "";
                tboxUserPass.Text = "";
            }

            tboxUserPass.Attributes["value"] = tboxUserPass.Text;

        }

        protected void btonLogin_Click(object sender, EventArgs e)
        {
            dBOperations = new clsDBOperations();

            dBOperations.ConnectionOC();
            
            vs_SQLText = "SELECT UserID FROM datUser WHERE ";
            vs_SQLText += "UserName='" + tboxUserName.Text.Trim() + "' AND ";
            vs_SQLText += "UserPass='" + tboxUserPass.Text.Trim() + "'";

            dBOperations.ConnectionOC();
            
            if (dBOperations.GetDataSet(vs_SQLText).Tables[0].Rows.Count > 0)
            {
                Server.Transfer("Default.aspx");
            }
            else
            {
                Server.Transfer("Error.aspx");
            }
        }
    }
}