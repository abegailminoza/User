using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using User.Database;

namespace User
{
    public partial class USER_PROFILE1 : System.Web.UI.Page
    {
        private Database_Connection db = new Database_Connection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Convert.ToBoolean(Session["LOGIN"]))
            {
                Response.Redirect("~/Default.aspx");
            }
            if (!Page.IsPostBack)
            {
                user_account ua = Session["USER"] as user_account;
                Username.InnerText = ua.UACC_FIRST + " " + ua.UACC_LAST;
                Display();
                GetUnreadNotif();
            }


        }
        public void Display()
        {
            Session["Input"] = true;
            user_account ua = Session["USER"] as user_account;



            UPD_F.Text = ua.UACC_FIRST;
            UPD_M.Text = ua.UACC_MIDDLE;
            UPD_L.Text = ua.UACC_LAST;
            UPD_EMAIL.Text = ua.UACC_EMAIL;
            UPD_PASS.Text = ua.UACC_PASSWORD;
            UPD_RPASS.Text = ua.UACC_PASSWORD;
        }

        protected void UpdateBtn_Click(object sender, EventArgs e)
        {
            Session["Input"] = true;
            user_account ua= Session["USER"] as user_account;
            user_account ub = new user_account();

            if (UPD_PASS.Text != UPD_RPASS.Text)
            {
                Response.Write("<script>alert('Password Does Not Match')</script>");
                ub = null;
            }
            else {
            
            ub.UACC_ID = ua.UACC_ID;
            ub.UACC_FIRST = UPD_F.Text;
            ub.UACC_MIDDLE = UPD_M.Text;
            ub.UACC_LAST = UPD_L.Text;
            ua.UACC_EMAIL = UPD_EMAIL.Text;
            ub.UACC_PASSWORD = UPD_PASS.Text;
            bool isSuccess = false;
            string msg = "";
            int res = db.UpdateUserAccount(ua);
                switch (res)
                {
                    case -1: //Database error
                        msg = "There has been an error with the database.";
                        break;
                    case -2: //Duplicate Email
                        msg = "Email address already exists. Try again.";
                        break;
                    default: //Success
                        isSuccess = true;
                        msg = "Account Successfully Registered. You may now proceed to login.";

                        //Insert to User Account Logs
                        user_logs ul = new user_logs();
                        ul.ULOG_UACC_ID = res.ToString();
                        ul.ULOG_EVENT = "Account Updated";
                        string query = string.Format("insert into user_logs(ULOG_EVENT, ULOG_UACC_ID) values('{0}', {1});", ul.ULOG_EVENT, ul.ULOG_UACC_ID);
                        bool logs = db.InsertToUserLogs(query);
                        if (logs)
                        {
                            //Response.Write("<script>alert('Success Insert to Logs')</script>");
                            //Response.Redirect("~/Default.aspx");
                        }
                        break;
                }
                Response.Write("<script>alert('" + msg + "')</script>");
                if (isSuccess)
                {
                    //Redirect To Login Page
                    Server.Transfer("~/Default.aspx");
                }

            }
        }


        private void GetUnreadNotif()
        {
            user_account ua = Session["USER"] as user_account;

            //Get Unread COunt
            string query = string.Format(@"select count(*) from notifications where NTF_RECEIVER_ID={0} and NTF_STATUS=false;", ua.UACC_ID);
            int count = db.GetUnreadNotificationCount(query);

            if (count <= 9)
            {
                UnreadCount.InnerText = count.ToString();
            }
            else
            {
                UnreadCount.InnerText = "9+";
            }
            Debug.Print("Unread Count : " + count);

            query = string.Format(@"select * from notifications where NTF_RECEIVER_ID={0} order by NTF_STATUS, NTF_DATE desc", ua.UACC_ID);
            List<notifications> nList = db.GetNotifications(query);
            if (nList != null && nList[0].NTF_ID != null)
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
}

