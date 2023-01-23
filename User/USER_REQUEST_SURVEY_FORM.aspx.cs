using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
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
                GetUnreadNotif();
            }
        }

        protected void NotificationNavList_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "ViewNotif")
            {
                string id = e.CommandArgument.ToString();
                Session["IsViewing"] = true;
                Session["NTF_ID"] = id;
                Response.Redirect("~/USER_NOTIFICATION.aspx");
            }
        }
        protected void SubmitSurvey_Click(object sender, EventArgs e)
        {
            request_survey_form rq = new request_survey_form();
            rq.lname = familyname.Text;
            rq.fname = firstname.Text;
            rq.mname = middlename.Text;
            rq.gender = Sex.SelectedValue;
            rq.month = month.SelectedValue;
            rq.day = day.Text;
            rq.year = year.Text;
            rq.bloodtype = Bloodtype.SelectedValue;
            rq.city = city.Text;
            rq.street = street.Text;
            rq.province = province.Text;
            rq.barangay = barangay.Text;
            rq.zip = zip.Text;
            rq.homenum = Home.Text;
            rq.mobilenum = Mobile.Text;
            rq.email = Email.Text;

            user_account ua = Session["USER"] as user_account;

            blood_request br = new blood_request();
            br.BREQ_JSON_SURVEY_FORM = JsonConvert.SerializeObject(rq);
            br.BREQ_UACC_ID = ua.UACC_ID;

            if (db.InsertBloodrequest(br))
            {
                string query = string.Format(@"insert into activity_logs(ACT_DESCRIPTION, ACT_UACC_ID, ACT_UNAME)
                                            select concat('User ', UACC_FIRST, ' ', UACC_LAST, ' Submitted Blood Request'), {0}, '{1}' from user_account
                                            where UACC_ID={2};", ua.UACC_ID, "User", ua.UACC_ID);
                bool logs = db.InsertToUserLogs(query);

                //Send Notification
                string sbj = string.Format("User {0} submitted a Blood Request", ua.UACC_ID);
                string msg = MySqlHelper.EscapeString(string.Format(@"User {0} ( {1} {2} ) Submitted Blood Request.", ua.UACC_ID, ua.UACC_FIRST, ua.UACC_LAST));
                query = string.Format(@"insert into notifications(NTF_SUBJECT, NTF_MESSAGE, NTF_RECEIVER_ID, NTF_SENDER_ID) 
                                                values('{0}', '{1}', 1, {2})", sbj, msg, ua.UACC_ID);
                if (!db.InsertToNotification(query))
                {
                    Debug.Print("Notification was not sent.");
                }

                //Successfullu Inserted
                Response.Write("<script>alert('Successfully Submitted Blood Request Form and is Pending for approval.')</script>");
                Server.Transfer("~/USER_REQUEST_A_BLOOD.aspx");
            }
            else
            {
                Response.Write("<script>alert('You have already made a request. Wait till the process is completed.')</script>");

            }

        }

        private void PopulateFormInputs()
        {
            blood_request br = Session["BloodRequest"] as blood_request;
            request_survey_form rq = JsonConvert.DeserializeObject<request_survey_form>(br.BREQ_JSON_SURVEY_FORM);

            familyname.Text = rq.lname;
            firstname.Text = rq.fname;
            middlename.Text = rq.mname;
            Sex.SelectedValue = rq.gender;
            month.SelectedValue = rq.month;
            day.Text = rq.day;
            year.Text = rq.year;
            Bloodtype.SelectedValue = rq.bloodtype;
            city.Text = rq.city;
            street.Text = rq.street;
            province.Text = rq.province;
            barangay.Text = rq.barangay;
            zip.Text = rq.zip;
            Home.Text = rq.homenum;
            Mobile.Text = rq.mobilenum;
            Email.Text = rq.email;

            DisableInputs();
        }

        private void DisableInputs()
        {
            familyname.Enabled = false;
            firstname.Enabled = false;
            middlename.Enabled = false;
            month.Enabled = false;
            day.Enabled = false;
            year.Enabled = false;
            Bloodtype.Enabled = false;
            city.Enabled = false;
            street.Enabled = false;
            province.Enabled = false;
            barangay.Enabled = false;
            zip.Enabled = false;
            Home.Enabled = false;
            Mobile.Enabled = false;
            Email.Enabled = false;
            Sex.Enabled = false;
            BackButton.Visible = true;
            SubmitSurvey.Visible = false;
        }

        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/USER_REQUEST_A_BLOOD.aspx");
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
            if (count > 0)
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


        protected void BtnLogout_ServerClick(object sender, EventArgs e)
        {

            Session.Clear();
            Session.RemoveAll();
            Server.Transfer("~/Default.aspx");
        }

    }
}