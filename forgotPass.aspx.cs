using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Training_School.App_Code;

namespace Training_School
{
    public partial class forgotPass : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btPassRec_Click1(object sender, EventArgs e)
        {
            try
            {

                String myGUID = Guid.NewGuid().ToString();
                int intPk = 0;
                string strEmail = "";
                CRUD myCrud = new CRUD();
                string mySql = @"select * from trainee where traineeEmail =@traineeEmail";
                Dictionary<string, object> myPara = new Dictionary<string, object>();
                myPara.Add("@traineeEmail", txtEmail.Text);
                SqlDataReader dr = myCrud.getDrPassSql(mySql, myPara);
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        intPk = int.Parse(dr["traineeId"].ToString());
                        strEmail = dr["traineeEmail"].ToString();
                        // send email 
                        sendEmailTr(intPk, strEmail, myGUID);
                        insertEmailGuideTr(intPk, strEmail, myGUID);
                    }
                }

            }

            catch (Exception ex)
            {

            }

            try
            {
                String myGUID = Guid.NewGuid().ToString();
                int intPk = 0;
                string strEmail = "";
                CRUD myCrud = new CRUD();
                string mySql = @"select * from instructor where instructorEmail =@instructorEmail";
                Dictionary<string, object> myPara = new Dictionary<string, object>();
                myPara.Add("@instructorEmail", txtEmail.Text);
                SqlDataReader dr = myCrud.getDrPassSql(mySql, myPara);
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        intPk = int.Parse(dr["instructorId"].ToString());
                        strEmail = dr["instructorEmail"].ToString();
                        // send email 
                        sendEmailIns(intPk, strEmail, myGUID);
                        insertEmailGuideIns(intPk, strEmail, myGUID);
                    }
                }

            }
            catch(Exception ex)
            {

            }

        }

        protected void insertEmailGuideTr(int myId, string myEmail, string myGuidId)
        {
            CRUD myCrud = new CRUD();
            string mySql = @"insert traineeForgotPass(guidId, traineeId) values (@guidId, @traineeId)";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@guidId", myGuidId);
            myPara.Add("@traineeId", myId);
            int rtn = myCrud.InsertUpdateDelete(mySql, myPara);
            //if (rtn >= 1)
            //{
            //    Response.Write("<script>alert('Success!');</script>");
            //}
            //else
            //{ Response.Write("<script>alert('Failed!');</script>"); }
        }

        protected void sendEmailTr(int intUserId, string strMyEmail, string strMyGuid)
        {
            try
            {
                String EmailBody = "Hi " + strMyEmail + ",<br/><br/> Click the link below to reset your password <br/><br/> http://noufaalzumaia-001-site1.btempurl.com/trResetPass.aspx?traineeId=" + strMyGuid;

                MailMessage PassRecMail = new MailMessage("internkfmc2021@gmail.com", strMyEmail);
                PassRecMail.Body = EmailBody;
                PassRecMail.IsBodyHtml = true;
                PassRecMail.Subject = "Reset Password";
                PassRecMail.Priority = MailPriority.High;
                SmtpClient SMTP = new SmtpClient("smtp.gmail.com", 587);
                SMTP.DeliveryMethod = SmtpDeliveryMethod.Network;
                SMTP.UseDefaultCredentials = false;
                SMTP.Credentials = new NetworkCredential()
                {
                    UserName = "internkfmc2021@gmail.com",
                    Password = "KFMC123456"
                };
                SMTP.EnableSsl = true;
                SMTP.Send(PassRecMail);
                Response.Write("<script>alert('Check your email to reset your password.');</script>");
                txtEmail.Text = "";
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Message not sent !');</script>");
            }

        }

        protected void insertEmailGuideIns(int myId, string myEmail, string myGuidId)
        {
            CRUD myCrud = new CRUD();
            string mySql = @"insert into instructorForgotPass(guidId, instructorId) values (@guidId, @instructorId)";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@guidId", myGuidId);
            myPara.Add("@instructorId", myId);
            int rtn = myCrud.InsertUpdateDelete(mySql, myPara);
            //if (rtn >= 1)
            //{
            //    Response.Write("<script>alert('Success');</script>");
            //}
            //else
            //{ Response.Write("<script>alert('Failed!');</script>"); }
        }

        protected void sendEmailIns(int intUserId, string strMyEmail, string strMyGuid)
        {
            try
            {
                String EmailBody = "Hi " + strMyEmail + ",<br/><br/> Click the link below to reset your password <br/><br/> http://noufaalzumaia-001-site1.btempurl.com/insResetPass.aspx?instructorId=" + strMyGuid;
                MailMessage PassRecMail = new MailMessage("internkfmc2021@gmail.com", strMyEmail);
                PassRecMail.Body = EmailBody;
                PassRecMail.IsBodyHtml = true;
                PassRecMail.Subject = "Reset Password";
                PassRecMail.Priority = MailPriority.High;
                SmtpClient SMTP = new SmtpClient("smtp.gmail.com", 587);
                SMTP.DeliveryMethod = SmtpDeliveryMethod.Network;
                SMTP.UseDefaultCredentials = false;
                SMTP.Credentials = new NetworkCredential()
                {
                    UserName = "internkfmc2021@gmail.com",
                    Password = "KFMC123456"
                };
                SMTP.EnableSsl = true;
                SMTP.Send(PassRecMail);
                Response.Write("<script>alert('Check your email to reset your password.');</script>");
                txtEmail.Text = "";
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Message not sent !');</script>");
            }

        }
        protected override void InitializeCulture()
        {
            base.InitializeCulture();
            if (Session["culture"] != null)
            {
                CultureInfo ci = new CultureInfo(Session["culture"].ToString());
                Thread.CurrentThread.CurrentCulture = ci;
                Thread.CurrentThread.CurrentUICulture = ci;
            }
        }
        protected void lbtn_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            switch (btn.ID)
            {
                case ("lbtnEnglish"):
                    Session["culture"] = "en-US";
                    Server.Transfer(Request.Url.PathAndQuery, false);
                    break;
                case ("lbtnArabic"):
                    Session["culture"] = "ar-SA";
                    Server.Transfer(Request.Url.PathAndQuery, false);
                    break;
            }
        }

    }
}