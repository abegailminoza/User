using Microsoft.Ajax.Utilities;
using MySql.Data.MySqlClient;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace User.Database
{
    public class Database_Connection
    {
        public static string connectionType = "GCloud";
        readonly string path = ConfigurationManager.ConnectionStrings[connectionType].ConnectionString;

        private MySqlConnection con;
        private MySqlCommand cmd;
        private MySqlDataReader rdr;
        private MySqlDataAdapter da;

        public void DB_Connect()
        {
            try
            {
                con = new MySqlConnection(path);
            }
            catch (Exception ex)
            {
                Debug.Print("Connection Error : " + ex.Message);
            }
        }

        public DataTable SampleReapeater()
        {
            DataTable dt = new DataTable();
            try
            {
                DB_Connect();
                con.Open();
                cmd = con.CreateCommand();
                cmd.CommandText = "select *, concat(UACC_FIRST, ' ', UACC_LAST) as BLOG_UACC_NAME, UACC_EMAIL as BLOG_UACC_EMAIL from blog_post join user_account on BLOG_UACC_ID=UACC_ID where BLOG_STATUS=true order by BLOG_DATE desc;";
                da = new MySqlDataAdapter(cmd);
                da.Fill(dt);
                con.Close();
            }
            catch (Exception ex)
            {
                Debug.Print("Sample Repeater Error : " + ex.Message);
            }
            return dt;
        }

        //Insert Into User Logs
        public bool InsertToUserLogs(string query)
        {
            bool res = false;
            try
            {
                DB_Connect();
                con.Open();
                cmd = con.CreateCommand();
                cmd.CommandText = query;
                int x = cmd.ExecuteNonQuery();
                if (x > 0)
                {
                    res = true;
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Debug.Print("Insert To User Logs Error : " + ex.Message);
            }
            return res;
        }


        //Register User Account
        public int RegisterUserAccount(user_account ua)
        {
            int res = -1;
            try
            {
                DB_Connect();
                con.Open();
                cmd = con.CreateCommand();
                //Check if there are duplicate email
                cmd.CommandText = "select count(*) as duplicate from user_account where UACC_EMAIL='" + ua.UACC_EMAIL + "';";
                int x = Convert.ToInt32(cmd.ExecuteScalar());
                if (x <= 0)
                {
                    //No Duplicates
                    cmd.CommandText = string.Format(@"insert into user_account(UACC_FIRST, UACC_MIDDLE, UACC_LAST, UACC_EMAIL, UACC_PASSWORD) 
                                                values('{0}', '{1}', '{2}', '{3}', '{4}');",
                                                ua.UACC_FIRST, ua.UACC_MIDDLE, ua.UACC_LAST, ua.UACC_EMAIL, ua.UACC_PASSWORD);
                    int y = cmd.ExecuteNonQuery();
                    if (y > 0)
                    {
                        //Success
                        cmd.CommandText = "select UACC_ID from user_account where UACC_EMAIL='" + ua.UACC_EMAIL + "';";
                        res = Convert.ToInt32(cmd.ExecuteScalar());
                    }
                }
                else
                {
                    res = -2;
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Debug.Print("Register User Account Error : " + ex.Message);
            }
            return res;
        }

        //Update User Account
        public int UpdateUserAccount(user_account ub,string email)
        {


            int res = -1;
            try
            {
                DB_Connect();
                con.Open();
                cmd = con.CreateCommand();
                if(email==ub.UACC_EMAIL)
                {
                    cmd.CommandText = string.Format("UPDATE user_account SET UACC_FIRST = '{0}',UACC_MIDDLE = '{1}',UACC_LAST = '{2}',UACC_EMAIL = '{3}',UACC_PASSWORD = '{4}'  WHERE UACC_ID = {5};",
                       ub.UACC_FIRST, ub.UACC_MIDDLE, ub.UACC_LAST, ub.UACC_EMAIL, ub.UACC_PASSWORD, ub.UACC_ID);

                    int x = cmd.ExecuteNonQuery();
                    if (x > 0)
                    {
                        //Successful Update
                        res = 1;
                    }


                }
                else
                {
                    cmd.CommandText = "select count(*) as duplicate from user_account where UACC_EMAIL='" + ub.UACC_EMAIL + "';";
                    int x = Convert.ToInt32(cmd.ExecuteScalar());
                    if (x <= 0)
                    {
                        cmd.CommandText = string.Format("UPDATE user_account SET UACC_FIRST = '{0}',UACC_MIDDLE = '{1}',UACC_LAST = '{2}',UACC_EMAIL = '{3}',UACC_PASSWORD = '{4}'  WHERE UACC_ID = {5};",
                       ub.UACC_FIRST, ub.UACC_MIDDLE, ub.UACC_LAST, ub.UACC_EMAIL, ub.UACC_PASSWORD, ub.UACC_ID);

                        int y = cmd.ExecuteNonQuery();
                        if (y > 0)
                        {
                            //Successful Update
                            res = 1;
                        }
                    }
                    else
                    {
                        res = -2;
                    }
                }

                con.Close();


            }
            catch (Exception ex)
            {
                Debug.Print("Update User Account Error : " + ex.Message);
            }
            return res;
        }


        //Login User
        public user_account LoginUser(string query)
        {
            user_account ua = new user_account();
            try
            {
                DB_Connect();
                con.Open();
                cmd = con.CreateCommand();
                cmd.CommandText = query;
                rdr = cmd.ExecuteReader();
                if (rdr.Read() && !rdr.IsDBNull(0))
                {
                    ua.UACC_ID = rdr["UACC_ID"].ToString();
                    ua.UACC_FIRST = rdr["UACC_FIRST"].ToString();
                    ua.UACC_MIDDLE = rdr["UACC_MIDDLE"].ToString();
                    ua.UACC_LAST = rdr["UACC_LAST"].ToString();
                    ua.UACC_EMAIL = rdr["UACC_EMAIL"].ToString();
                    ua.UACC_PASSWORD = rdr["UACC_PASSWORD"].ToString();
                    ua.UACC_REQUESTOR = Convert.ToBoolean(rdr["UACC_REQUESTOR"]);
                    ua.UACC_DONOR = Convert.ToBoolean(rdr["UACC_DONOR"]);
                    ua.UACC_STATUS = Convert.ToBoolean(rdr["UACC_STATUS"]);
                }
                rdr.Close();
                con.Close();
            }
            catch (Exception ex)
            {
                Debug.Print("Login User Error : " + ex.Message);
            }
            return ua;
        }

        //Send Blog Post
        public int PostBlogPost(string content, string id)
        {
            int res = -1;
            try
            {
                DB_Connect();
                con.Open();
                cmd = con.CreateCommand();
                //query to insert post
                string query = string.Format(@"insert into blog_post(BLOG_CONTENT, BLOG_UACC_ID) values('{0}', {1});", content, id);
                cmd.CommandText = query;
                int x = cmd.ExecuteNonQuery();
                if (x > 0)
                {
                    //Success fully Inserted Post
                    //get Post ID for Logs
                    cmd.CommandText = string.Format("select BLOG_ID from blog_post where BLOG_UACC_ID={0} and BLOG_CONTENT='{1}';", id, content);
                    res = Convert.ToInt32(cmd.ExecuteScalar());

                }
                con.Close();
            }
            catch (Exception ex)
            {
                Debug.Print("Post Blog Post Error : " + ex.Message);
            }
            return res;
        }

        //public bool Report Post
        public bool ReportPost(int blogid, string uid)
        {
            bool res = false;
            try
            {
                DB_Connect();
                con.Open();
                cmd = con.CreateCommand();
                //Check if User Already Reported Post
                cmd.CommandText = string.Format("select BLOG_REPORT from blog_post where BLOG_ID={0};", blogid);
                int count = Convert.ToInt32(cmd.ExecuteScalar());
                count++;
                if (count >= 3)
                {
                    cmd.CommandText = string.Format("update blog_post set BLOG_REPORT=3, BLOG_REPORTER='{0}', BLOG_STATUS=false where BLOG_ID={1};", uid, blogid);
                    int x = cmd.ExecuteNonQuery();
                    if (x > 0)
                    {
                        res = true;
                    }
                }
                else
                {
                    cmd.CommandText = string.Format("update blog_post set BLOG_REPORT={0}, BLOG_REPORTER='{1}' where BLOG_ID={2};", count, uid, blogid);
                    int x = cmd.ExecuteNonQuery();
                    if (x > 0)
                    {
                        res = true;
                    }
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Debug.Print("Report Post : " + ex.Message);
            }
            return res;
        }

        //Insert Blood Request
        public bool InsertBloodrequest(blood_request br)
        {
            bool res = false;
            try
            {
                DB_Connect();
                con.Open();
                cmd = con.CreateCommand();
                cmd.CommandText = string.Format("select count(*) from blood_request where BREQ_UACC_ID={0} and (BREQ_SURVEY_STATUS = false or BREQ_BLOOD_STATUS = false) and BREQ_REQ_STATUS=true", br.BREQ_UACC_ID);
                int chck = Convert.ToInt32(cmd.ExecuteScalar());
                if (chck <= 0)
                {
                    //walay existing
                    cmd.CommandText = string.Format("insert into blood_request(BREQ_JSON_SURVEY_FORM, BREQ_UACC_ID) values('{0}', {1});", br.BREQ_JSON_SURVEY_FORM, br.BREQ_UACC_ID);
                    int x = cmd.ExecuteNonQuery();
                    if (x > 0)
                    {
                        res = true;
                    }
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Debug.Print("Insert Blood request Error : " + ex.Message);
            }
            return res;
        }

        public DataTable GetUserLogsTableData()
        {

            DataTable dt = new DataTable();
            try
            {
                DB_Connect();
                con.Open();
                cmd = con.CreateCommand();
                cmd.CommandText = "select * from activity_logs where ACT_UNAME='User' order by ACT_DATE desc;";
                da = new MySqlDataAdapter(cmd);
                da.Fill(dt);
                con.Close();
            }
            catch (Exception ex)
            {
                Debug.Print("Get Action Logs Error : " + ex.Message);
            }
            return dt;
        }

        public bool ClickBloodrequest(blood_request br)
        {
            bool res = false;
            try
            {
                DB_Connect();
                con.Open();
                cmd = con.CreateCommand();
                cmd.CommandText = string.Format("select count(*) from blood_request where BREQ_UACC_ID={0} and BREQ_BLOOD_STATUS=false", br.BREQ_UACC_ID);
                int chck = Convert.ToInt32(cmd.ExecuteScalar());
                if (chck <= 0)
                {
                   
                        res = true;
                    
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Debug.Print("Blood request Error : " + ex.Message);
            }
            return res;
        }

        //Get User Blood Requests
        public DataTable GetuserBloodRequests(string id)
        {
            DataTable dt = new DataTable();
            try
            {
                DB_Connect();
                con.Open();
                cmd = con.CreateCommand();
                cmd.CommandText = string.Format(@"select BREQ_ID, BREQ_UACC_ID, BREQ_JSON_SURVEY_FORM, BREQ_REQ_STATUS, BREQ_DATE,
                                                    if(BREQ_SURVEY_STATUS = false && BREQ_REQ_STATUS = true, 'PENDING', 
                                                    if(BREQ_SURVEY_STATUS = true && BREQ_REQ_STATUS = true, 'APPROVED', 
                                                    if(BREQ_REQ_STATUS = false, 'REJECTED', 'REJECTED'))) as BREQ_SURVEY_STATUS,
                                                    if(BREQ_BLOOD_STATUS = false && BREQ_REQ_STATUS = true, 'PENDING', 
                                                    if(BREQ_BLOOD_STATUS = true && BREQ_REQ_STATUS = true, 'APPROVED', 
                                                    if(BREQ_REQ_STATUS = false, 'REJECTED', 'REJECTED'))) as BREQ_BLOOD_STATUS
                                                     from blood_request where BREQ_UACC_ID={0} order by BREQ_DATE desc;", id);
                da = new MySqlDataAdapter(cmd);
                da.Fill(dt);
                con.Close();
            }
            catch (Exception ex)
            {
                Debug.Print("Get User Blood Requests : " + ex.Message);
            }
            return dt;
        }

        //Check if there is Existing Un Approved Requests by user
        public bool CheckUserBloodRequests(string id)
        {
            bool res = false;
            try
            {
                DB_Connect();
                con.Open();
                cmd = con.CreateCommand();
                cmd.CommandText = string.Format("select count(*) from blood_request where BREQ_REQ_STATUS=true;", id);
                int chck = Convert.ToInt32(cmd.ExecuteScalar());
                if (chck > 0)
                {
                    res = true;
                    Debug.Print("Result : " + res);
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Debug.Print("Check User Blood request Error : " + ex.Message);
            }
            return res;
        }

        //Search Blood Request on grid table row selected
        public blood_request SearchBloodRequest(string id)
        {
            blood_request br = new blood_request();
            try
            {
                DB_Connect();
                con.Open();
                cmd = con.CreateCommand();
                cmd.CommandText = string.Format("select * from blood_request where BREQ_ID={0};", id);
                rdr = cmd.ExecuteReader();
                if (rdr.Read() && !rdr.IsDBNull(0))
                {
                    br.BREQ_ID = rdr["BREQ_ID"].ToString();
                    br.BREQ_UACC_ID = rdr["BREQ_UACC_ID"].ToString();
                    br.BREQ_JSON_SURVEY_FORM = rdr["BREQ_JSON_SURVEY_FORM"].ToString();
                    br.BREQ_SURVEY_STATUS = Convert.ToBoolean(rdr["BREQ_SURVEY_STATUS"]);
                    br.BREQ_BLOOD_STATUS = Convert.ToBoolean(rdr["BREQ_BLOOD_STATUS"]);
                    br.BREQ_REQ_STATUS = Convert.ToBoolean(rdr["BREQ_REQ_STATUS"]);
                    br.BREQ_DATE = rdr["BREQ_DATE"].ToString();
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Debug.Print("Search Blood request Error : " + ex.Message);
            }
            return br;
        }

        //Insert Blood Donation Survey
        public bool InsertBloodDonationSurvey(blood_donation bd)
        {
            bool res = false;
            try
            {
                DB_Connect();
                con.Open();
                cmd = con.CreateCommand();
                cmd.CommandText = string.Format("select count(*) from blood_donation where BD_UACC_ID={0} and (BD_SURVEY_STATUS = false or BD_BLOOD_STATUS=false) and BD_REQ_STATUS=true", bd.BD_UACC_ID);
                int chck = Convert.ToInt32(cmd.ExecuteScalar());
                if (chck <= 0)
                {
                    //walay existing
                    cmd.CommandText = string.Format("insert into blood_donation(BD_JSON_SURVEY_FORM, BD_UACC_ID) " +
                        "values('{0}', {1});", bd.BD_JSON_SURVEY_FORM, bd.BD_UACC_ID);
                    int x = cmd.ExecuteNonQuery();
                    if (x > 0)
                    {
                        res = true;
                    }
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Debug.Print("Insert Blood donation Error : " + ex.Message);
            }
            return res;
        }
        public bool ClickDonationrequest(blood_donation br)
        {
            bool res = false;
            try
            {
                DB_Connect();
                con.Open();
                cmd = con.CreateCommand();
                cmd.CommandText = string.Format("select count(*) from blood_donation where BD_UACC_ID={0} and BD_BLOOD_STATUS=false", br.BD_UACC_ID);
                int chck = Convert.ToInt32(cmd.ExecuteScalar());
                if (chck <= 0)
                {

                    res = true;

                }
                con.Close();
            }
            catch (Exception ex)
            {
                Debug.Print("Blood request Error : " + ex.Message);
            }
            return res;
        }

        //Get User Blood Donation
        public DataTable GetuserBloodDonation(string id)
        {
            DataTable dt = new DataTable();
            try
            {
                DB_Connect();
                con.Open();
                cmd = con.CreateCommand();
                cmd.CommandText = string.Format(@"select BD_ID, BD_UACC_ID, BD_JSON_SURVEY_FORM, BD_REQ_STATUS, BD_DATE,
                                                    if(BD_SURVEY_STATUS = false && BD_REQ_STATUS = true, 'PENDING', 
                                                    if(BD_SURVEY_STATUS = true && BD_REQ_STATUS = true, 'APPROVED', 
                                                    if(BD_REQ_STATUS = false, 'REJECTED', 'REJECTED'))) as BD_SURVEY_STATUS,
                                                    if(BD_BLOOD_STATUS = false && BD_REQ_STATUS = true, 'PENDING', 
                                                    if(BD_BLOOD_STATUS = true && BD_REQ_STATUS = true, 'APPROVED', 
                                                    if(BD_REQ_STATUS = false, 'REJECTED', 'REJECTED'))) as BD_BLOOD_STATUS
                                                     from blood_donation where BD_UACC_ID={0} order by BD_DATE desc;", id);
                da = new MySqlDataAdapter(cmd);
                da.Fill(dt);
                con.Close();
            }
            catch (Exception ex)
            {
                Debug.Print("Get User Blood Donation : " + ex.Message);
            }
            return dt;
        }

        //Search Blood Request on grid table row selected
        public blood_donation SearchBloodDonation(string id)
        {
            blood_donation bd = new blood_donation();
            try
            {
                DB_Connect();
                con.Open();
                cmd = con.CreateCommand();
                cmd.CommandText = string.Format("select * from blood_donation where BD_ID={0};", id);
                rdr = cmd.ExecuteReader();
                if (rdr.Read() && !rdr.IsDBNull(0))
                {
                    bd.BD_ID = rdr["BD_ID"].ToString();
                    bd.BD_UACC_ID = rdr["BD_UACC_ID"].ToString();
                    bd.BD_JSON_SURVEY_FORM = rdr["BD_JSON_SURVEY_FORM"].ToString();
                    bd.BD_SURVEY_STATUS = Convert.ToBoolean(rdr["BD_SURVEY_STATUS"]);
                    bd.BD_BLOOD_STATUS = Convert.ToBoolean(rdr["BD_BLOOD_STATUS"]);
                    bd.BD_REQ_STATUS = Convert.ToBoolean(rdr["BD_REQ_STATUS"]);
                    bd.BD_DATE = rdr["BD_DATE"].ToString();
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Debug.Print("Search Blood Donation Error : " + ex.Message);
            }
            return bd;
        }

        //Get Notification in List
        public List<notifications> GetNotifications(string query)
        {
            List<notifications> nList = new List<notifications>();
            try
            {
                DB_Connect();
                con.Open();
                cmd = con.CreateCommand();
                cmd.CommandText = query;
                rdr = cmd.ExecuteReader();
                while(rdr.Read() && !rdr.IsDBNull(0))
                {
                    notifications n = new notifications();
                    n.NTF_ID = rdr["NTF_ID"].ToString();
                    n.NTF_SUBJECT = rdr["NTF_SUBJECT"].ToString();
                    n.NTF_MESSAGE = rdr["NTF_MESSAGE"].ToString();
                    n.NTF_SENDER_ID = rdr["NTF_SENDER_ID"].ToString();
                    n.NTF_RECEIVER_ID = rdr["NTF_RECEIVER_ID"].ToString();
                    n.NTF_STATUS = Convert.ToBoolean(rdr["NTF_STATUS"]);
                    n.NTF_DATE = rdr["NTF_DATE"].ToString();
                    nList.Add(n);
                }
                rdr.Close();
                con.Close();
            }
            catch(Exception ex)
            {
                Debug.Print("Get Notification List error : " + ex.Message);
            }
            return nList;
        }

        //Get Notification Unread count
        public int GetUnreadNotificationCount(string query)
        {
            int res = -1;
            try
            {
                DB_Connect();
                con.Open();
                cmd = con.CreateCommand();
                cmd.CommandText = query;
                res = Convert.ToInt32(cmd.ExecuteScalar());
                con.Close();
            }
            catch(Exception ex)
            {
                Debug.Print("Get Unread Notification COunt Error : " + ex.Message);
            }
            return res;
        }

        //Insert into Notification Table
        public bool InsertToNotification(string query)
        {
            bool res = false;
            try
            {
                DB_Connect();
                con.Open();
                cmd = con.CreateCommand();
                cmd.CommandText = query;
                int x = cmd.ExecuteNonQuery();
                if (x > 0)
                {
                    res = true;
                }
                con.Close();
            }
            catch (Exception ex)
            {
                Debug.Print("Insert To Notification Error : " + ex.Message);
            }
            return res;
        }

        public DataTable GetNotificationTableData(user_account ua)
        {

            DataTable dt = new DataTable();
            try
            {
                DB_Connect();
                con.Open();
                cmd = con.CreateCommand();
                cmd.CommandText = string.Format("select NTF_ID, NTF_SUBJECT, NTF_DATE, if(NTF_STATUS=true, 'READ', 'UNREAD') as NTF_STATUS from notifications where NTF_RECEIVER_ID={0} order by NTF_STATUS desc, NTF_DATE desc;", ua.UACC_ID);
                da = new MySqlDataAdapter(cmd);
                da.Fill(dt);
                con.Close();
            }
            catch (Exception ex)
            {
                Debug.Print("Get Action Logs Error : " + ex.Message);
            }
            return dt;
        }


        //Get Notification Details
        public notifications SearchNotification(string id)
        {
            notifications res = new notifications();
            try
            {
                DB_Connect();
                con.Open();
                cmd = con.CreateCommand();
                Debug.Print(string.Format(@"select * from notifications where NTF_ID={0};", id));
                cmd.CommandText = string.Format(@"select * from notifications where NTF_ID={0};", id);
                rdr = cmd.ExecuteReader();
                if(rdr.Read())
                {
                    if(!rdr.IsDBNull(0))
                    {
                        res.NTF_ID = rdr["NTF_ID"].ToString();
                        res.NTF_SUBJECT = rdr["NTF_SUBJECT"].ToString();
                        res.NTF_MESSAGE = rdr["NTF_MESSAGE"].ToString();
                        res.NTF_SENDER_ID = rdr["NTF_SENDER_ID"].ToString();
                        res.NTF_RECEIVER_ID = rdr["NTF_RECEIVER_ID"].ToString();
                        res.NTF_STATUS = Convert.ToBoolean(rdr["NTF_STATUS"]);
                        res.NTF_DATE = rdr["NTF_DATE"].ToString();
                    }
                }
                rdr.Close();
                con.Close();
            }
            catch(Exception ex)
            {
                Debug.Print("Search Notification Error : " + ex.Message);
            }
            return res;
        }

        //Updat eNotification Status
        public bool UpdateNotificationStatus(string id)
        {
            bool res = false;
            try
            {
                DB_Connect();
                con.Open();
                cmd = con.CreateCommand();
                Debug.Print(string.Format(@"update notifications set NTF_STATUS=true where NTF_ID={0};", id));
                cmd.CommandText = string.Format(@"update notifications set NTF_STATUS=true where NTF_ID={0};", id);
                int x = cmd.ExecuteNonQuery();
                if(x > 0)
                {
                    Debug.Print("Success");
                    res = false;
                }
                con.Close();
            }
            catch(Exception ex)
            {
                Debug.Print("Update Notification Status Error : " + ex.Message);
            }
            return res;
        }


    }
}