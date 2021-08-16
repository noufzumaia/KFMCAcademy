using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Training_School
{
    public partial class createCourses : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["trainingSConStr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            try
            {

                MailMessage ms = new MailMessage();
                ms.From = new MailAddress(txtSenderEmail.Text);
                ms.To.Add("internkfmc2021@gmail.com");
                ms.Subject = txtSubject.Text;
                ms.Body = txtMessage.Text;
                if (FileUpload1.HasFile)
                {
                    HttpFileCollection fc = Request.Files;
                    for (int i = 0; i < fc.Count; i++)
                    {
                        HttpPostedFile pf = fc[i];
                        Attachment attach = new Attachment(pf.InputStream, pf.FileName);
                        ms.Attachments.Add(attach);
                    }
                }

                if (string.IsNullOrEmpty(txtSubject.Text) || string.IsNullOrEmpty(txtMessage.Text))
                {
                    lblMsg.Text = "Please fill Subject & Message body!";
                    lblMsg.ForeColor = Color.Red;
                    return;
                }

                SmtpClient sc = new SmtpClient("smtp.gmail.com", 587);
                sc.Port = 587;
                sc.Credentials = new NetworkCredential(txtSenderEmail.Text, getPassword());
                sc.EnableSsl = true;
                sc.Send(ms);
                lblMsg.Text = "Thank you! The form has been sent successfully";
                lblMsg.ForeColor = Color.Blue;


            }
            catch (Exception ex)
            {

            }
        }
        protected string getPassword()
        {
            SqlDataReader dr = null;
            //Create SQL Connection to Server
            SqlConnection myConnection = new SqlConnection(strcon);
            //Try and connect to Server and Database
            SqlCommand myCommand = new SqlCommand("select * from instructor where instructorEmail='" + txtSenderEmail.Text.Trim() + "'", myConnection);
            string pData = "Data";
            try
            {
                //Open the connection to the database
                myConnection.Open();
                //Run the SQL Command
                dr = myCommand.ExecuteReader();
                //Read in data 

                while (dr.Read())
                {
                    pData = dr["instructorPassword"].ToString();
                }

                //Connect to server & database
                myConnection.Close();

            }
            catch (Exception ex)
            {
                //If there is an error Print it to the Page.
                Response.Write(ex.Message);
            }
            return pData;
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