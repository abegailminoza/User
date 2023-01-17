using System;
using System.Collections.Generic;
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
                Display();
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
    }
 }

