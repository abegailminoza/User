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
                GetUnreadNotif();
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

        protected void BtnLogout_ServerClick(object sender, EventArgs e)
        {

            Session.Clear();
            Session.RemoveAll();
            Server.TransferRequest("~/Default.aspx");
        }

        private void GetUnreadNotif()
        {
            user_account ua = Session["USER"] as user_account;

            //Get Unread COunt
            string query = string.Format(@"select count(*) from notifications where NTF_RECEIVER_ID={0} and NTF_STATUS=false;", ua.UACC_ID);
            int count = db.GetUnreadNotificationCount(query);

            if(count <= 9)
            {
                UnreadCount.InnerText = count.ToString();
            }
            else
            {
                UnreadCount.InnerText = "9+";
            }
            Debug.Print("Unread Count : " + count);

            if(count > 0)
            {
                query = string.Format(@"select * from notifications where NTF_RECEIVER_ID={0} order by NTF_STATUS, NTF_DATE desc", ua.UACC_ID);
                List<notifications> nList = db.GetNotifications(query);
                try
                {
                    if (nList != null)
                    {
                        if (nList[0].NTF_ID != null)
                        {
                            List<notifications> unread = nList.Where(x => x.NTF_STATUS == false).Select(g => g).ToList();
                            if (unread != null)
                            {
                                int rows = 0;
                                if (count > 5)
                                {
                                    rows = 5;
                                }
                                else
                                {
                                    rows = unread.Count;
                                }
                                List<notifications> newUnread = new List<notifications>();
                                for (int i = 0; i < rows; i++)
                                {
                                    newUnread.Add(unread[i]);
                                }

                                NotificationNavList.DataSource = null;
                                NotificationNavList.DataSource = newUnread;
                                NotificationNavList.DataBind();
                            }
                        }

                    }
                }
                catch (Exception ex)
                {
                    Debug.Print("No Notification : " + ex.Message);
                }
            }

            
        }

        protected void NotificationNavList_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if(e.CommandName == "ViewNotif")
            {
                string id = e.CommandArgument.ToString();
                Session["IsViewing"] = true;
                Session["NTF_ID"] = id;
                Response.Redirect("~/USER_NOTIFICATION.aspx");
            }
        }
    }
}