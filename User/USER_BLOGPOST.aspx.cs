using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using User.Database;

namespace User
{
    public partial class USER_BLOGPOST : System.Web.UI.Page
    {
        Database_Connection db = new Database_Connection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Convert.ToBoolean(Session["LOGIN"]))
            {
                Response.Redirect("~/Default.aspx");
            }

            if(!Page.IsPostBack)
            {
                user_account ua = Session["USER"] as user_account;
                Username.InnerText = ua.UACC_FIRST + " " + ua.UACC_LAST;
                PopulatePosts();
            }
        }

        public void PopulatePosts()
        {
            DataTable dt = db.SampleReapeater();
            if (dt != null)
            {
                BlogPosts.DataSource = null;
                BlogPosts.DataSource = dt;
                BlogPosts.DataBind();
                Session["BlogPosts"] = dt;
            }
        }

        protected void BlogPosts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if(e.CommandName == "ReportPost")
            {
                user_account ua = Session["USER"] as user_account;

                DataTable dt = Session["BlogPosts"] as DataTable;
                DataRow[] row = dt.Select("BLOG_ID='" + e.CommandArgument + "'");
                
                string reporter = "";

                if (row.Length > 0)
                {
                    reporter = row[0]["BLOG_REPORTER"].ToString();    
                }



                bool shouldReport = false;

                List<string> reporters = new List<string>();

                if (reporter == "")
                {
                    shouldReport = true;
                    reporters.Add(ua.UACC_ID);
                }
                else
                {
                    reporters = JsonConvert.DeserializeObject<List<string>>(reporter);

                    string exist = reporters.Find(x => x == ua.UACC_ID);
                    if (exist == null && exist != ua.UACC_ID)
                    {
                        //Should Report
                        shouldReport = true;
                        reporters.Add(ua.UACC_ID);
                    }
                }

                if (shouldReport)
                {
                    if (db.ReportPost(Convert.ToInt32(e.CommandArgument), JsonConvert.SerializeObject(reporters)))
                    {
                        //Insert Logs
                        string query = string.Format(@"insert into user_logs(ULOG_EVENT, ULOG_UACC_ID) values('User {0} Reported Post {1}', {2});", ua.UACC_FIRST, e.CommandArgument, ua.UACC_ID);
                        bool logs = db.InsertToUserLogs(query);
                        if (logs)
                        {
                            //Success
                            PopulatePosts();
                        }
                    }
                    else
                    {
                        //Error
                        Response.Write("<script>alert('Error in Reporting Blog Post.')</script>");
                    }
                }



            }
        }

        protected void PostBlog_Click(object sender, EventArgs e)
        {
            string content = BlogPostMessage.Text;
            if(content == "")
            {
                Response.Write("<script>alert('Missing Field.')</script>");
            }
            else
            {
                user_account ua = Session["USER"] as user_account;

                if (ua != null || ua.UACC_FIRST != null)
                {
                    int res = db.PostBlogPost(content, ua.UACC_ID);
                    if (res != -1)
                    {
                        //Success Insert
                        //Clear Content Field
                        BlogPostMessage.Text = "";

                        //Insert Logs
                        string query = string.Format(@"insert into user_logs(ULOG_EVENT, ULOG_UACC_ID) values('User {0} Posted Post {1}', {2});", ua.UACC_FIRST, res, ua.UACC_ID);
                        bool logs = db.InsertToUserLogs(query);

                        if (logs)
                        {
                            //Response.Write("<script>alert('Success Logs.')</script>");
                            PopulatePosts();
                        }

                    }
                    else
                    {
                        Response.Write("<script>alert('Error in Inserting Blog Post.')</script>");
                    }

                }
            }
        }


       
    }
}