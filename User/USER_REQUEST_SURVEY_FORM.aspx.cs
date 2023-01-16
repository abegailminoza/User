using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using User.Database;

namespace User
{
    public partial class USER_REQUEST_SURVEY_FORM : System.Web.UI.Page
    {
        Database_Connection db = new Database_Connection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Convert.ToBoolean(Session["LOGIN"]))
            {
                Response.Redirect("~/Default.aspx");
            }

            if (!Convert.ToBoolean(Session["Input"]))
            {
                user_account ua = Session["USER"] as user_account;
                Username.InnerText = ua.UACC_FIRST + " " + ua.UACC_LAST;
                PopulateFormInputs();
            }
        }

        protected void SubmitSurvey_Click(object sender, EventArgs e)
        {
            request_survey_form rq = new request_survey_form();
            rq.lname = familyname.Text;
            rq.fname = firstname.Text;
            rq.mname = middlename.Text;
            rq.gender = gender.Text;
            rq.dob = dateofbirth.Text;
            rq.age = Age.Text;
            rq.brequest = bloobredtyperequest.Text;
            rq.raddress = resaddress.Text;
            rq.paddress = posaddress.Text;
            rq.home = Home.Text;
            rq.mobile = Mobile.Text;
            rq.email = Email.Text;

            user_account ua = Session["USER"] as user_account;

            blood_request br = new blood_request();
            br.BREQ_JSON_SURVEY_FORM = JsonConvert.SerializeObject(rq);
            br.BREQ_UACC_ID = ua.UACC_ID;

            if(db.InsertBloodrequest(br))
            {
                //Successfullu Inseryted
                Response.Write("<script>alert('Successfully Submitted Blood Request Form and is Pending for approval.')</script>");
                Server.Transfer("~/USER_REQUEST_A_BLOOD.aspx");
            }
            else
            {
                Response.Write("<script>alert('An error was encountered while submitting your Survey Form.')</script>");

            }

        }

        private void PopulateFormInputs()
        {
            blood_request br = Session["BloodRequest"] as blood_request;
            request_survey_form rq = JsonConvert.DeserializeObject<request_survey_form>(br.BREQ_JSON_SURVEY_FORM);

            familyname.Text = rq.lname;
            firstname.Text = rq.fname;
            middlename.Text = rq.mname;
            gender.Text = rq.gender;
            dateofbirth.Text = rq.dob;
            Age.Text = rq.age;
            bloobredtyperequest.Text = rq.brequest;
            resaddress.Text = rq.raddress;
            posaddress.Text = rq.paddress;
            Home.Text = rq.home;
            Mobile.Text = rq.mobile;
            Email.Text = rq.email;

            DisableInputs();
        }

        private void DisableInputs()
        {
            familyname.Enabled = false;
            firstname.Enabled = false;
            middlename.Enabled = false;
            gender.Enabled = false;
            dateofbirth.Enabled = false;
            Age.Enabled = false;
            bloobredtyperequest.Enabled = false;
            resaddress.Enabled = false;  
            posaddress.Enabled = false;
            Home.Enabled = false;
            Mobile.Enabled = false;
            Email.Enabled = false;

            BackButton.Visible = true;
            SubmitSurvey.Visible = false;
        }

        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/USER_REQUEST_A_BLOOD.aspx");
        }
    }
}