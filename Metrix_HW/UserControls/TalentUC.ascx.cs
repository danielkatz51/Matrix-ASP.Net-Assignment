using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Metrix_HW
{
    public partial class TalentUC : System.Web.UI.UserControl
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Building table first time
                bindDataToRepeater();
            }
        }
        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Update":
                    //==== Getting id of the selelected record(We have passed on link button's command argument property).
                    int id = Convert.ToInt32(e.CommandArgument);
                    //Removing the hiiden class from the edit section
                    Editcon.Attributes["class"] = "Edit-Container";
                    //Editcon.Attributes.Add("class", "hidden");
                    bindDataWithId(id);
                    break;

                case "Delete":
                    //Getting the ID from the same row "Talent ID" Textbox
                    string idForDelete = ((TextBox)e.Item.FindControl("TalentIDRepeat")).Text;
                    //Getting the connection string from the web config
                    string ConnectionString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
                    SqlConnection sqlconn = new SqlConnection(ConnectionString);
                    //Opening connection 
                    sqlconn.Open();
                    //building the query
                    string sqlSQuery = "DELETE FROM [dbo].[Talents] WHERE [Talent ID]='" + idForDelete + "'";
                    SqlCommand sqlcommand = new SqlCommand(sqlSQuery, sqlconn);
                    //Executing the query
                    sqlcommand.ExecuteNonQuery();
                    //Closing the connection
                    sqlconn.Close();
                    //After deleting need to binding the new data from DB
                    bindDataToRepeater();
                    break;
                case "View":
                    //Getting the data from "CommandArgument" that we save 
                    int talentID = Convert.ToInt32(e.CommandArgument);
                    //Redirecting the user to the card view page.
                    //and we implementing the ID into the url
                    Response.Redirect($"Talent-Card-View.aspx?ID={talentID}");
                    break;
                default:
                    break;
            }
            
            
        }
        void bindDataToRepeater()
        {
            //This function is to get all existing data inside the table in the DB
            string ConnectionString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(ConnectionString);
            string sqlSQuery = "Select * from Talents";
            sqlconn.Open();
            SqlCommand sqlcommand = new SqlCommand(sqlSQuery, sqlconn);
            SqlDataAdapter adapter = new SqlDataAdapter(sqlcommand);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            List<Talent> TalentList = new List<Talent>();
            foreach (DataRow dr in dt.Rows)
            {
                Talent myTalent = new Talent(Int32.Parse(dr["Talent ID"].ToString()), dr["Name"].ToString(), dr["Email"].ToString(), dr["Specialization"].ToString(), dr["DOB"].ToString(), Int32.Parse(dr["Age"].ToString()));
                TalentList.Add(myTalent);
            }
            rptTalents.DataSource = TalentList;
            rptTalents.DataBind();
            sqlconn.Close();
        }
        void bindDataWithId(int id)
        {
            //This function is to get the Talent details by his ID

            string ConnectionString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(ConnectionString);
            string sqlSQuery = $"Select * from [dbo].[Talents] WHERE [Talent ID]='{id}'";
            sqlconn.Open();
            SqlCommand sqlcommand = new SqlCommand(sqlSQuery, sqlconn);
            SqlDataAdapter adapter = new SqlDataAdapter(sqlcommand);
            DataTable dt = new DataTable();
            adapter.Fill(dt);

            foreach (DataRow dr in dt.Rows)
            {
                NameTextBox.Text = dr["Name"].ToString();
                EmailTextBox.Text = dr["Email"].ToString();
                DOBTextBox.Text = dr["DOB"].ToString();
                AgeTextBox.Text = dr["Age"].ToString();
                SpecTextBox.Text = dr["Specialization"].ToString();

                //==== Store primary key of the selected record in hiddenfield for future reference.
                hfSelectedRecord.Value = dr["Talent ID"].ToString();
            }
            sqlconn.Close();
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            //====== Getting connection string defined in the web.config file. Pointed to the database we want to use.
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString);

            //======= Insert Query.
            string cmdText = "UPDATE Talents SET Name=@Name,Email=@Email,Age=@Age,Specialization=@Specialization WHERE [Talent ID]=@Id";

            SqlCommand cmd = new SqlCommand(cmdText, con);

            //===== Adding parameters/Values.
            cmd.Parameters.AddWithValue("@Name", NameTextBox.Text);
            cmd.Parameters.AddWithValue("@Email", EmailTextBox.Text);
            cmd.Parameters.AddWithValue("@Age", Convert.ToInt32(AgeTextBox.Text));
            cmd.Parameters.AddWithValue("@Specialization", SpecTextBox.Text);

            //====== use same id to pass id parameter.
            cmd.Parameters.AddWithValue("@Id", Convert.ToInt32(hfSelectedRecord.Value));


            //=====check current state of the connection object. If it is closed open the connection
            //=====to execute the insert query.
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }

            //===== Execute Query.
            cmd.ExecuteNonQuery();

            //===== close the connection.
            con.Close();

            //===== Clear text from textboxes
            clearInputControls();

            //===== Bind data to repeater so that repeater will display updated data.
            bindDataToRepeater();

            //===== Clear Hiddenfield
            hfSelectedRecord.Value = string.Empty;
            //===== Adding hiddien class to hide the section
            Editcon.Attributes.Add("class", "hidden");
        }
        void clearInputControls()
        {
            //Clearing the textbox values 
            NameTextBox.Text = "";
            EmailTextBox.Text = "";
            DOBTextBox.Text = "";
            AgeTextBox.Text = "";
            SpecTextBox.Text = "";
        }
    }

}