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
    public partial class userProfile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["trainingSConStr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["Email"].ToString() == "" || Session["Email"] == null)
                {
                    Response.Write("<script>alert('Session Expired Login Again');</script>");
                    Response.Redirect("~/userlogin.aspx");
                }
                else
                {
                    if (!Page.IsPostBack)
                    {
                        getUserPersonalDetails();
                    }
                    else
                    {
                        //
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("~/userlogin.aspx");
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (ValidateEmpty(txtFullName.Text) || ValidateEmpty(txtTraineeId.Text) || ValidateEmpty(txtEmail.Text) || ValidateEmpty(txtTraineePhone.Text))
            {
                lblOutput.Text = "Please fill  all the fields correctly!";
                lblOutput.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                int PK = int.Parse(txtTraineeId.Text);
                string strTraName = txtFullName.Text;
                string strEmail = txtEmail.Text;
                string strPhoneNum = txtTraineePhone.Text;
                string mySql = @"update trainee set trainee = @trainee , traineeEmail = @traineeEmail,
                                traineePhone = @traineePhone where traineeId = @traineeId";
                Dictionary<string, object> myPara = new Dictionary<string, object>();
                myPara.Add("@traineeId", PK);
                myPara.Add("@trainee", strTraName);
                myPara.Add("@traineeEmail", strEmail);
                myPara.Add("@traineePhone", strPhoneNum);
                if (!String.IsNullOrEmpty(txtTraineePhone.Text) && int.TryParse(txtTraineePhone.Text, out int n))
                {
                    CRUD myCrud = new CRUD();
                    int rtn = myCrud.InsertUpdateDelete(mySql, myPara);
                    if (rtn >= 1)
                    {
                        lblOutput.Text = "Success operation!";
                        lblOutput.ForeColor = System.Drawing.Color.Green;
                        sendEmail();
                    }
                    else
                    {
                        lblOutput.Text = "Failed operation!";
                        lblOutput.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    lblOutput.Text = "Please enter valid phone number!";
                    lblOutput.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
        protected void btnUpdatePassword_Click(object sender, EventArgs e)
        {
            if (ValidateEmpty(txtNewPass.Text))
            {
                lblAjax.Text = "Please fill the new password field correctly!";
                lblAjax.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                string mySql = @"update trainee set traineePassword = @traineePassword
                               where traineeId = @traineeId";
                Dictionary<string, object> myPara = new Dictionary<string, object>();
                myPara.Add("@traineeId", txtTraineeId.Text);
                myPara.Add("@traineePassword", txtNewPass.Text);
                CRUD myCrud = new CRUD();
                int rtn = myCrud.InsertUpdateDelete(mySql, myPara);
                if (rtn >= 1)
                {
                    lblAjax.Text = "Success operation!";
                    lblAjax.ForeColor = System.Drawing.Color.Green;
                    sendEmail();
                }
                else
                {
                    lblAjax.Text = "Failed operation!";
                    lblAjax.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
        private bool ValidateEmpty(string empty)
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
        protected void sendEmail()
        {
            try
            {
                MailMessage ms = new MailMessage();
                ms.From = new MailAddress("internkfmc2021@gmail.com");
                ms.To.Add(txtEmail.Text);
                ms.Subject = "KFMC Academy";
                ms.Body = "Thank you for updating your profile in KFMC Academy!";
                //
                SmtpClient sc = new SmtpClient("smtp.gmail.com", 587);
                sc.Port = 587;
                sc.Credentials = new NetworkCredential("internkfmc2021@gmail.com", "KFMC123456");
                sc.EnableSsl = true;
                sc.Send(ms);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (ChBoxDelete.Checked == true)
            {
                CRUD myCrud = new CRUD();
                string mySql = @"delete trainee where traineeId = @traineeId";
                Dictionary<string, object> myPara = new Dictionary<string, object>();
                myPara.Add("@traineeId", int.Parse(txtTraineeId.Text));
                int rtn = myCrud.InsertUpdateDelete(mySql, myPara);
                if (rtn >= 1)
                {
                    lblOutput.Text = "Success operation!";
                    lblOutput.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblOutput.Text = "Failed operation!";
                    lblOutput.ForeColor = System.Drawing.Color.Red;
                }
                Session["role"] = "";
                Response.Redirect("~/home.aspx");
            }
            else
            {
                lblOutput.Text = "Checkbox to approve account removal!";
                lblOutput.ForeColor = System.Drawing.Color.Red;
            }
        }
        void getUserPersonalDetails()
        {
            try
            {
                SqlConnection trainingSConStr = new SqlConnection(strcon);
                if (trainingSConStr.State == ConnectionState.Closed)
                {
                    trainingSConStr.Open();
                }
                else
                { //
                }
                SqlCommand cmd = new SqlCommand(@"select traineeId, trainee, traineePassword, traineeEmail, traineePhone
                                                        from trainee where traineeEmail= '" + Session["Email"] + "'", trainingSConStr);
                SqlDataAdapter sqlDa = new SqlDataAdapter(cmd);
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);
                if (dtbl.Rows.Count > 0)
                {
                    txtTraineeId.Text = dtbl.Rows[0]["traineeId"].ToString();
                    txtFullName.Text = dtbl.Rows[0]["trainee"].ToString();
                    txtOldPass.Text = dtbl.Rows[0]["traineePassword"].ToString();
                    txtEmail.Text = dtbl.Rows[0]["traineeEmail"].ToString();
                    txtTraineePhone.Text = dtbl.Rows[0]["traineePhone"].ToString();
                }
                else
                {
                    //
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
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