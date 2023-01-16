using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace User
{
    public partial class USER_DONOR_SURVEY_FORM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //private void GetSurveyInputs()
        //{
        //     DonorSurvey ds = new DonorSurvey();

        //    //Basic/Personal Information
        //    ds.personalInfo.PanelName = Request.Form["panelname"].ToString();
        //    ds.personalInfo.DonorName = Request.Form["donorname"].ToString();
        //    ds.personalInfo.FamilyName = Request.Form["familyname"].ToString();
        //    ds.personalInfo.FirstName = Request.Form["firstname"].ToString();
        //    ds.personalInfo.Title = Request.Form["title"].ToString();
        //    ds.personalInfo.IDNo = Request.Form["idno"].ToString();
        //    ds.personalInfo.DateOfBirth = Request.Form["dob"].ToString();
        //    ds.personalInfo.Gender = Request.Form["gender"].ToString();
        //    ds.personalInfo.Occupation = Request.Form["occupation"].ToString();
        //    ds.personalInfo.ResidentialAddress = Request.Form["resaddress"].ToString();
        //    ds.personalInfo.PostalAddress = Request.Form["posaddress"].ToString();
        //    ds.personalInfo.Home = Request.Form["home"].ToString();
        //    ds.personalInfo.Work = Request.Form["work"].ToString();
        //    ds.personalInfo.Mobile = Request.Form["mobile"].ToString();
        //    ds.personalInfo.EmailAddress = Request.Form["email"].ToString();

        //    //1st Part of the Survey
        //    ds.healthAssessment.N11 = Request.Form["rd11"].ToString();
        //    ds.healthAssessment.N12 = Request.Form["rd12"].ToString();
        //    ds.healthAssessment.N13 = Request.Form["rd13"].ToString();
        //    ds.healthAssessment.N14 = Request.Form["rd14"].ToString();
        //    ds.healthAssessment.N15 = Request.Form["rd15"].ToString();
        //    ds.healthAssessment.N16a = Request.Form["rd16a"].ToString();
        //    ds.healthAssessment.N16b = Request.Form["rd16b"].ToString();
        //    ds.healthAssessment.N16c = Request.Form["rd16c"].ToString();
        //    ds.healthAssessment.N16d = Request.Form["rd16d"].ToString();
        //    ds.healthAssessment.N17 = Request.Form["rd17"].ToString();
        //    ds.healthAssessment.N18a = Request.Form["rd18a"].ToString();
        //    ds.healthAssessment.N18b = Request.Form["rd18b"].ToString();
        //    ds.healthAssessment.N19a = Request.Form["rd19a"].ToString();
        //    ds.healthAssessment.N19b = Request.Form["rd19b"].ToString();
        //    ds.healthAssessment.N19c = Request.Form["rd19c"].ToString();
        //    ds.healthAssessment.N110 = Request.Form["rd110"].ToString();
        //    ds.healthAssessment.N111 = Request.Form["rd111"].ToString();
        //    ds.healthAssessment.N112 = Request.Form["rd112"].ToString();
        //    ds.healthAssessment.N113 = Request.Form["rd113"].ToString();
        //    ds.healthAssessment.N114a = Request.Form["rd114a"].ToString();
        //    ds.healthAssessment.N114b = Request.Form["rd114b"].ToString();
        //    ds.healthAssessment.N115 = Request.Form["rd115"].ToString();

        //    //2nd Part of the survey
        //    ds.riskAssessment.N21 = Request.Form["rd21"].ToString();
        //    ds.riskAssessment.N22 = Request.Form["rd22"].ToString();
        //    ds.riskAssessment.N23 = Request.Form["rd23"].ToString();
        //    ds.riskAssessment.N24 = Request.Form["rd24"].ToString();
        //    ds.riskAssessment.N25 = Request.Form["rd25"].ToString();
        //    ds.riskAssessment.N26 = Request.Form["rd26"].ToString();
        //    ds.riskAssessment.N27a = Request.Form["rd27a"].ToString();
        //    ds.riskAssessment.N27b = Request.Form["rd27b"].ToString();
        //    ds.riskAssessment.N27c = Request.Form["rd27c"].ToString();
        //    ds.riskAssessment.N28 = Request.Form["rd28"].ToString();
        //    ds.riskAssessment.N29 = Request.Form["rd29"].ToString();
        //    ds.riskAssessment.N210 = Request.Form["rd210"].ToString();
        //    ds.riskAssessment.N211 = Request.Form["rd211"].ToString();

        //    Session["Surver"] = JsonConvert.SerializeObject(ds);
        //    Response.Write(JsonConvert.SerializeObject(ds));
        //}
    }
}