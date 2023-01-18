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

        protected void BloodDonor_Click(object sender, EventArgs e)
        {
            Session["Input"] = true;

            user_account ua = Session["USER"] as user_account;

            blood_donation br = new blood_donation();

            br.BD_UACC_ID = ua.UACC_ID;

            if (db.ClickDonationrequest(br))
            {
                //Successfullu Inseryted
                Response.Redirect("~/USER_DONOR_SURVEY_FORM.aspx");
            }
            else
            {
                Response.Write("<script>alert('You have already made a request. Wait till the process is completed.')</script>");

            }

        }


        protected void BtnLogout_ServerClick(object sender, EventArgs e)
        {

            Session.Clear();
            Session.RemoveAll();
            Server.Transfer("~/Default.aspx");
        }

    }
}