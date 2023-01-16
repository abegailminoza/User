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
}