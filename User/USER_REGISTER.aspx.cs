using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using User.Database;

namespace User
{
    public partial class USER_REGISTER : System.Web.UI.Page
    {
        private Database_Connection db = new Database_Connection();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegisterBtn_Click(object sender, EventArgs e)
        {
            user_account ua = new user_account();



            if (Password.Text != RepeatPassword.Text)
            {
                Response.Write("<script>alert('Password Does Not Match')</script>");
                ua = null;
            }
            else
            {
                ua.UACC_FIRST = FirstName.Text;
                ua.UACC_MIDDLE = MiddleName.Text;
                ua.UACC_LAST = LastName.Text;
                ua.UACC_EMAIL = Email.Text;
                ua.UACC_PASSWORD = Password.Text;

                bool isSuccess = false;
                string msg = "";
                int res = db.RegisterUserAccount(ua);
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
                        ul.ULOG_EVENT = "Account Registration";
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