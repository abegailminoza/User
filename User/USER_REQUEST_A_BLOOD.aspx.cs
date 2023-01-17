using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using User.Database;

namespace User
{
    public partial class USER_REQUEST_A_BLOOD : System.Web.UI.Page
    {
        private Database_Connection db = new Database_Connection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Convert.ToBoolean(Session["LOGIN"]))
            {
                Response.Redirect("~/Default.aspx");
            }

            if(!Page.IsPostBack)
            {
                user_account ua = Session["USER"] as user_account;
                Username.InnerText = ua.UACC_FIRST + " " + ua.UACC_LAST;
                CheckUserBloodRequestsHistory();
                PopulateRequestBloodGrid();
            }
        }

        protected void RequestBloodBtn_Click(object sender, EventArgs e)
        {
            Session["Input"] = true;
            Response.Redirect("~/USER_REQUEST_SURVEY_FORM.aspx");

        }

        private void PopulateRequestBloodGrid()
        {
            user_account ua = Session["USER"] as user_account;

            DataTable dt = db.GetuserBloodRequests(ua.UACC_ID);

            if(dt != null)
            {
                GridUserBloodRequest.DataSource = null;
                GridUserBloodRequest.DataSource = dt;
                GridUserBloodRequest.DataBind();
            }
        }

        private void CheckUserBloodRequestsHistory()
        {
            user_account ua = Session["USER"] as user_account;

            if(db.CheckUserBloodRequests(ua.UACC_ID))
            {
                Debug.Print("Show Button");
                RequestBloodBtn.Visible = true;
            }
            else
            {
                Debug.Print("Do not Show Button");
                RequestBloodBtn.Visible = false;
            }
        }

        protected void GridUserBloodRequest_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridUserBloodRequest.SelectedRow;
            string id = row.Cells[0].Text;

            blood_request br = db.SearchBloodRequest(id);
            if(br != null)
            {
                
                Session["BloodRequest"] = br;
                Session["Input"] = false;
                Response.Redirect("~/USER_REQUEST_SURVEY_FORM.aspx");
            }
        }
    }
}