using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace User.Database
{
    public class user_account
    {
        public string UACC_ID { get; set; }
        public string UACC_FIRST { get; set; }
        public string UACC_MIDDLE { get; set; }
        public string UACC_LAST { get; set; }
        public string UACC_EMAIL { get; set; }
        public string UACC_PASSWORD { get; set; }
        public bool UACC_REQUESTOR { get; set; }
        public bool UACC_DONOR { get; set; }
        public bool UACC_STATUS { get; set; }
    }

    public class user_logs
    {
        public string ULOG_ID { get; set; }
        public string ULOG_EVENT { get; set; }
        public string ULOG_UACC_ID { get; set; }
        public string ULOG_DATE { get; set; }
    }

    public class blog_post
    {
        public string BLOG_ID { get; set; }
        public string BLOG_CONTENT { get; set; }
        public string BLOG_UACC_ID { get; set; }
        public string BLOG_REPORT { get; set; }
        public string BLOG_DATE { get; set; }
        public bool BLOG_STATUS { get; set; }
        public string BLOG_REPORTER { get; set; }

        //Mag agmit ug join query para ani niya nga fields
        public string BLOG_UACC_EMAIL { get; set; }
        public string BLOG_UACC_NAME { get; set; }

    }

    [Serializable]
    public class notifications
    {
        public string NTF_ID { get; set; }
        public string NTF_SUBJECT { get; set; }
        public string NTF_MESSAGE { get; set; }
        public string NTF_RECEIVER_ID { get; set; }
        public string NTF_SENDER_ID { get; set; }
        public bool NTF_STATUS { get; set; }
        public string NTF_DATE { get; set; }
    }

    [Serializable]
    public class blood_request
    {
        public string BREQ_ID { get; set; }
        public string BREQ_UACC_ID { get; set; }
        public string BREQ_JSON_SURVEY_FORM { get; set; }
        public bool BREQ_SURVEY_STATUS { get; set; }
        public bool BREQ_BLOOD_STATUS { get; set; }
        public bool BREQ_REQ_STATUS { get; set; }
        public string BREQ_DATE { get; set; }
    }

    [Serializable]
    public class blood_donation
    {
        public string BD_ID { get; set; }
        public string BD_UACC_ID { get; set; }
        public string BD_JSON_SURVEY_FORM { get; set; }
        public bool BD_SURVEY_STATUS { get; set; }
        public bool BD_BLOOD_STATUS { get; set; }
        public bool BD_REQ_STATUS { get; set; }
        public string BD_DATE { get; set; }
    }

    [Serializable]
    public class request_survey_form
    {
        public string lname { get; set; }
        public string fname { get; set; }
        public string mname { get; set; }
        public string month { get; set; }
        public string day { get; set; }
        public string year { get; set; }
        public string gender { get; set; }
        public string bloodtype { get; set; }
        public string barangay { get; set; }
        public string city { get; set; }
        public string province { get; set; }
        public string zip { get; set; }
        public string homenum { get; set; }
        public string mobilenum { get; set; }
        public string email { get; set; }
        public string street { get; set; }


    }

    [Serializable]
    public class DonorSurvey
    {
        public PersonalInfo personalInfo { get; set; }
        public HealthAssessment healthAssessment { get; set; }
        public RiskAssessment riskAssessment { get; set; }

        public DonorSurvey()
        {
            personalInfo = new PersonalInfo();
            healthAssessment = new HealthAssessment();
            riskAssessment = new RiskAssessment();
        }
    }

    [Serializable]
    public class PersonalInfo
    {
        public string Lname { get; set; }
        public string Fname { get; set; }
        public string Mname { get; set; }
        public string Month { get; set; }
        public string Day { get; set; }
        public string Year { get; set; }
        public string Gender { get; set; }
        public string Barangay { get; set; }
        public string City { get; set; }
        public string Province { get; set; }
        public string Zip { get; set; }
        public string Homenum { get; set; }
        public string Mobilenum { get; set; }
        public string Email { get; set; }
        public string Street { get; set; }
    }

    [Serializable]
    public class HealthAssessment
    {
        public string N11 { get; set; }
        public string N12 { get; set; }
        public string N13 { get; set; }
        public string N14 { get; set; }
        public string N15 { get; set; }
        public string N16a { get; set; }
        public string N16b { get; set; }
        public string N16c { get; set; }
        public string N16d { get; set; }
        public string N17 { get; set; }
        public string N18a { get; set; }
        public string N18b { get; set; }
        public string N19a { get; set; }
        public string N19b { get; set; }
        public string N19c { get; set; }
        public string N110 { get; set; }
        public string N111 { get; set; }
        public string N112 { get; set; }
        public string N113 { get; set; }
        public string N114a { get; set; }
        public string N114b { get; set; }
        public string N115 { get; set; }
    }

    [Serializable]
    public class RiskAssessment
    {
        public string N21 { get; set; }
        public string N22 { get; set; }
        public string N23 { get; set; }
        public string N24 { get; set; }
        public string N25 { get; set; }
        public string N26 { get; set; }
        public string N27a { get; set; }
        public string N27b { get; set; }
        public string N27c { get; set; }
        public string N28 { get; set; }
        public string N29 { get; set; }
        public string N210 { get; set; }
        public string N211 { get; set; }
    }
}