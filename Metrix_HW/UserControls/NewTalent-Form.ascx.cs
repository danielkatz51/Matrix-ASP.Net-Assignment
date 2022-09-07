using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Metrix_HW
{
    public partial class NewTalent_Form : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void AddNewTalent(Object sender, EventArgs e)
        {
            //Saving in vars all inputs values
            string TName = TalentName.Value;
            string TDOB = TalentDOB.Value;
            string TAge = TalentAge.Value;
            string TEmail = TalentEmail.Value;
            string TSpec = TalentSpec.Value;
            clearinput();
            //geting Connection String from web config
            string ConnectionString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(ConnectionString);
            //Opening connection 
            sqlconn.Open();
            String sql = "";
            //building sql query
            sql += $"INSERT INTO Talents ( Name, DOB, Email, Specialization, Age)";
            sql += $"VALUES ('{TName}','{TDOB}','{TEmail}','{TSpec}','{TAge}');";
            SqlCommand sqlcommand = new SqlCommand(sql, sqlconn);
            SqlDataAdapter adapter = new SqlDataAdapter(sqlcommand);
            adapter.InsertCommand = new SqlCommand(sql, sqlconn);
            //Executing query
            adapter.InsertCommand.ExecuteNonQuery();
            sqlcommand.Dispose();
            //closing connection
            sqlconn.Close();

            //Alerting for succefull insert
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
        }
        void clearinput()
        {
            //Clearing inputs
            TalentName.Value = "";
            TalentDOB.Value = "";
            TalentAge.Value = "";
            TalentEmail.Value= "";
            TalentSpec.Value = "";
        }
        protected void BackToHomePage(Object sender, EventArgs e)
        {
            //Href for Table page
            Response.Redirect("TalentsTable.aspx");
        }
    }
}