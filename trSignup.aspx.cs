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
    public partial class trSignup : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["trainingSConStr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // sign up button click event
        protected void btnSignUp_Click(object sender, EventArgs e)
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

                    if (ValidateEmpty(txtTraineeName.Text) || ValidateEmpty(txtEmail.Text) || ValidateEmpty(txtPhone.Text) || ValidateEmpty(txtPass.Text) || ValidateEmpty(txtConfirmPass.Text))
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
            string pass1 = txtPass.Text.Trim();
            string pass2 = txtConfirmPass.Text.Trim();

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
                SqlConnection ConnectionString = new SqlConnection(strcon);
                if (ConnectionString.State == ConnectionState.Closed)
                {
                    ConnectionString.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from trainee where traineeEmail='" + txtEmail.Text.Trim() + "';", ConnectionString);

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
            string traineeName = txtTraineeName.Text;
            string traineePhone = txtPhone.Text;
            string traineeEmail = txtEmail.Text;
            string Pass = txtPass.Text;
            string mySql = @"INSERT INTO trainee(trainee,traineePhone,traineeEmail,traineePassword)
                    values(@trainee,@traineePhone,@traineeEmail,@traineePassword)";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@trainee", traineeName);
            myPara.Add("@traineePhone", traineePhone);
            myPara.Add("@traineeEmail", traineeEmail);
            myPara.Add("@traineePassword", Pass);
            CRUD myCrud = new CRUD();

            int rtn = myCrud.InsertUpdateDelete(mySql, myPara);
            if (rtn >= 1)
            {



                Response.Write("<script>alert('Sign Up Successfully. Go to User Login to Login');</script>");
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