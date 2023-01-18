using Microsoft.SqlServer.Server;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using User.Database;

namespace User
{
    public partial class USER_BECOMEADONOR : System.Web.UI.Page
    {
        private Database_Connection db = new Database_Connection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                PopulateDonationBloodGrid();
            }
        }

        private void PopulateDonationBloodGrid()
        {
            user_account ua = Session["USER"] as user_account;

            DataTable dt = db.GetuserBloodDonation(ua.UACC_ID);

            if (dt != null)
            {
                GridUserBloodDonation.DataSource = null;
                GridUserBloodDonation.DataSource = dt;
                GridUserBloodDonation.DataBind();
            }
        }

        protected void GridUserBloodDonation_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridUserBloodDonation.SelectedRow;
            string id = row.Cells[0].Text;

            blood_donation br = db.SearchBloodDonation(id);
            if (br != null)
            {

                Session["BloodDonation"] = br;
                Response.Redirect("~/USER_DONOR_SURVEY_FORM_VIEW.aspx");
            }
        }
    }
}