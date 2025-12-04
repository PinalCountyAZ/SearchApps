using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Search
{
    public partial class Inmate_Search : System.Web.UI.Page
    {
        // *** Connection Strings *** //
        string connectionString = ConfigurationManager.ConnectionStrings["AdultDetentionConnectionString"].ConnectionString;
        string lastName;
        string inmateID;
        string searchString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ClearForm();
            }
        }

        ///<Summary>
        /// Button click event for each search
        ///</Summary>
        protected void btn_Click(object sender, EventArgs e)
        {
            //gvInmates.DataSource = null;
            //gvInmates.DataBind();

            if (txtLastName.Text.Length == 0)
            {
                lblWarning.Text = "A LAST NAME or INMATE ID is required.";
                lblWarning.Visible = true;
                //gvInmates.Visible = false;
            }
            else
            {
                lblWarning.Visible = false;
                PopulateGridView();
            }
        }

        private void PopulateGridView()
        {
            searchString = txtLastName.Text.ToString().Trim();

            if (IsOnlyLetters(searchString))
            {
                lastName = searchString;
                inmateID = "";
            }
            else
            {
                lastName = "";
                inmateID = searchString;
            }

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("GetInmateByFirstLast", con);

                cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.Add("@FirstName", SqlDbType.VarChar).Value = firstName;
                cmd.Parameters.Add("@LastName", SqlDbType.VarChar).Value = lastName;
                cmd.Parameters.Add("@InmateID", SqlDbType.VarChar).Value = inmateID;

                DataTable dt = new DataTable();
                SqlDataAdapter adpt = new SqlDataAdapter(cmd);
                adpt.Fill(dt);
                rptrInmates.DataSource = dt;
                rptrInmates.DataBind();

                if (dt.Rows.Count <= 0)
                {
                    lblWarning.Text = "No Results Found";
                    lblWarning.Visible = true;
                    //gvInmates.Visible = false;
                }
                else
                {
                    //gvInmates.DataSource = dt;
                    //gvInmates.DataBind();
                    //gvInmates.Visible = true;
                }
            }
        }

        ///<Summary>
        /// Add pager to each gridview
        ///</Summary>
        protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //gvInmates.PageIndex = e.NewPageIndex;
            PopulateGridView();
        }

        ///<Summary>
        /// Format binded data in row
        ///</Summary>
        protected void gv_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Link inmate id number to the inmate details page
                string imagePath = DataBinder.Eval(e.Row.DataItem, "IMAGEPATH").ToString();

                e.Row.Attributes["onclick"] = $"window.open('{imagePath}', '_blank');";
                e.Row.Attributes["style"] = "cursor:pointer;"; // Optional: change cursor on hover
            }
        }

        private void BindRepeater()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {

            }
        }

        private void ClearForm()
        {
            txtLastName.Text = String.Empty;
            lblWarning.Visible = false;
            //gvInmates.Visible = false;
        }

        static bool IsOnlyLetters(string text)
        {
            return Regex.IsMatch(text, @"^[\p{L}]+$");
        }
    }
}
