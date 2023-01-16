using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using User.Database;

namespace User
{
    public partial class _Default : Page
    {
        //Response.Write("<script>alert('')</script>");

        private Database_Connection db = new Database_Connection();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            string email = EmailAddress.Text;
            string pword = Password.Text;

            if (email == "" || pword == "")
            {
                Response.Write("<script>alert('Missing Fields. Please Fill All Fields.')</script>");
            }
            else
            {
                string query = string.Format(@"select * from user_account where UACC_EMAIL='{0}' and binary UACC_PASSWORD='{1}' and UACC_STATUS=true;", email, pword);
                user_account ua = db.LoginUser(query);
                if (ua != null && ua.UACC_FIRST != null)
                {
                    Session["LOGIN"] = true;
                    Session["USER"] = ua;
                    query = string.Format(@"insert into user_logs(ULOG_EVENT, ULOG_UACC_ID) values('User {0} Login', {1});", ua.UACC_FIRST, ua.UACC_ID);
                    bool logs = db.InsertToUserLogs(query);
                    if(logs)
                    {
                        Server.Transfer("~/USER_BLOGPOST.aspx");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Invalid Credentials. Try Again.')</script>");
                }
            }
        }
    }
}