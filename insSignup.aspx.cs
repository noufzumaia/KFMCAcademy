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
    public partial class insSignup : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["trainingSConStr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {


        }


        // sign up button click event
        protected void btnSignup_Click(object sender, EventArgs e)
        {
            if (checkMemberExists())
            {
                Response.Write("<script>alert('This Email already exists, try another Email');</script>");
            }
            else
            {
                try
                {
                    if (!confirmPassword())
                    {
                        Response.Write("<script>alert('The passwords are not match!');</script>");

                    }

                    if (ValidateEmpty(txtUsername.Text) || ValidateEmpty(txtEmail.Text) || ValidateEmpty(txtPhoneNumber.Text) || ValidateEmpty(txtPassword.Text) || ValidateEmpty(txtConfirmPassword.Text))
                    {
                        Response.Write("<script>alert('Please Fill all the fileds');</script>");
                    }

                    MailMessage ms = new MailMessage();
                    ms.From = new MailAddress("internkfmc2021@gmail.com");
                    ms.To.Add(txtEmail.Text);
                    ms.Subject = "Thank you for signing up on KFMC Academy!";
                    ms.Body = "Thank you for signing up on KFMC Academy!";

                    SmtpClient sc = new SmtpClient("smtp.gmail.com", 587);
                    sc.Port = 587;
                    sc.Credentials = new NetworkCredential("internkfmc2021@gmail.com", "KFMC123456");
                    sc.EnableSsl = true;
                    sc.Send(ms);
                    signUpNewMember();
                }
                catch (Exception ex)
                {

                    Response.Write("<script>alert('" + ex.Message + "');</script>");

                }

            }

        }


        // Check if password text boxes are match
        public bool confirmPassword()
        {
            string pass1 = txtPassword.Text.Trim();
            string pass2 = txtConfirmPassword.Text.Trim();

            if (pass1.Equals(pass2))
            {
                return true;
            }
            return false;
        }

        // user defined method
        bool checkMemberExists()
        {
            try
            {
                //  if () { }
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from instructor where instructorEmail='" + txtEmail.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        bool ValidateEmpty(string empty)
        {
            if (empty == "")
            {
                return true;
            }
            else
            {
                return false;

            }
        }
        void signUpNewMember()
        {
            string instructorName = txtUsername.Text;
            string instructorPhone = txtPhoneNumber.Text;
            string instructorEmail = txtEmail.Text;
            string Pass = txtPassword.Text;
            string mySql = @"INSERT INTO instructor(instructor,instructorEmail, instructorPhone,instructorPassword,instructorMajorId)
                    values(@instructor,@instructorEmail,@instructorPhone,@instructorPassword,@instructorMajorId)";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@instructor", instructorName);
            myPara.Add("@instructorPhone", instructorPhone);
            myPara.Add("@instructorEmail", instructorEmail);
            myPara.Add("@instructorPassword", Pass);
            myPara.Add("@instructorMajorId", DropDownList1.SelectedItem.Value);

            CRUD myCrud = new CRUD();

            int rtn = myCrud.InsertUpdateDelete(mySql, myPara);
            if (rtn >= 1)
            {



                Response.Write("<script>alert('Sign Up Successful. Go to User Login to Login');</script>");
            }

            else
            {
                Response.Write("<script>alert('## line 195');</script>");
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