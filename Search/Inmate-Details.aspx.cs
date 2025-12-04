using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Search
{
    public partial class Inmate_Details : System.Web.UI.Page
    {
        // *** Connection Strings *** //
        string connectionString = ConfigurationManager.ConnectionStrings["AdultDetentionConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GetInmateInfo();
        }

        private void GetInmateInfo()
        {
            string inmatelID = Request.QueryString["id"];

            GetDetails(inmatelID);
            //GetCases(inmatelID);
            //GetCourtDates(inmatelID);
        }

        private void GetDetails(string id)
        {
            string subFolder = id.Substring(id.Length - 2, 2);

            // *** Stored Procedure *** //
            string detailsProcedure = "[dbo].[spGetInmateDetails]";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(detailsProcedure, con);
                SqlDataReader dr;

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@InmateID", SqlDbType.VarChar).Value = id;

                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    string FirstInitial = (dr["FirstName"].ToString()).Substring(0,1);
                    // *** Inmate Details *** //
                    imgInmate.ImageUrl = "https://app1.pinal.gov/Files/MugShots/" + subFolder + "/" + id + ".jpg";
                    lblInmateID.Text = dr["InmateID"].ToString();
                    lblName.Text = FirstInitial + " " + dr["LastName"].ToString();
                }

                dr.Close();
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inmate-Search.aspx");
        }
    }
}
