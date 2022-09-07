using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Metrix_HW.UserControls
{
    public partial class Talent_Card : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //getting the ID of the  talent from the url
                string TalentId = Server.UrlDecode(Request.QueryString["ID"].ToString());
                //Getting Connection string from web config
                string ConnectionString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
                SqlConnection sqlconn = new SqlConnection(ConnectionString);
                //Creating Query 
                string sqlSQuery = $"Select * from [dbo].[Talents] WHERE [Talent ID]='{TalentId}'";
                //======Opening The connection
                sqlconn.Open();
                SqlCommand sqlcommand = new SqlCommand(sqlSQuery, sqlconn);
                SqlDataAdapter adapter = new SqlDataAdapter(sqlcommand);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                //putting the data we pulled in to the labels
                foreach (DataRow dr in dt.Rows)
                {
                    TalentName.Text += dr["Name"].ToString();
                    TalentEmail.Text += dr["Email"].ToString();
                    string[] DOB = dr["DOB"].ToString().Split(' ');
                    TalentDOB.Text += DOB[0];
                    TalentID.Text += dr["Talent ID"].ToString();
                    TalentSpec.Text += dr["Specialization"].ToString();
                }
                //======closing The connection
                sqlconn.Close();
            }
            
        }
        protected void backHome(object sender, EventArgs e)
        {
            //Href for Table page
            Response.Redirect("TalentsTable.aspx");
        }
    }
}