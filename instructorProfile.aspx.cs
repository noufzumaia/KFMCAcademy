using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Globalization;
using System.IO;
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
    public partial class instructorProfile : System.Web.UI.Page
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
                        getinstructorDetails();
                        populateMajorCombo();
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
            if (ValidateEmpty(txtFullName.Text) || ValidateEmpty(txtInstructorId.Text) || ValidateEmpty(txtEmail.Text) || ValidateEmpty(txtInstructorPhone.Text))
            {
                lblOutput.Text = "Please fill  all the fields correctly!";
                lblOutput.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                int PK = int.Parse(txtInstructorId.Text);
                string strTraName = txtFullName.Text;
                string strEmId = txtEmail.Text;
                string strPhoneNum = txtInstructorPhone.Text;
                string strMajorId = ddlMajorId.SelectedValue;
                string strOther = txtOther.Text;
                string strCV = txtCV.Text;
                string mySql = @"update instructor set instructor = @instructor, instructorEmail = @instructorEmail,instructorPhone = @instructorPhone,
                               instructorMajorId =@instructorMajorId, other =@other , instructorCv =@instructorCv
                               where instructorId = @instructorId";
                Dictionary<string, object> myPara = new Dictionary<string, object>();
                myPara.Add("@instructorId", PK);
                myPara.Add("@instructor", strTraName);
                myPara.Add("@instructorEmail", strEmId);
                myPara.Add("@instructorPhone", strPhoneNum);
                myPara.Add("@other ", strOther);
                myPara.Add("@instructorCv ", strCV);
                myPara.Add("@instructorMajorId", ddlMajorId.SelectedValue);
                if (!String.IsNullOrEmpty(txtInstructorPhone.Text) && int.TryParse(txtInstructorPhone.Text, out int n))
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
                string mySql = @"update Instructor set InstructorPassword = @InstructorPassword
                               where InstructorId = @InstructorId";
                Dictionary<string, object> myPara = new Dictionary<string, object>();
                myPara.Add("@InstructorId", txtInstructorId.Text);
                myPara.Add("@InstructorPassword", txtNewPass.Text);
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
        protected void populateMajorCombo()
        {
            CRUD myCrud = new CRUD(); //object of type my crud
            string mySql = @"select instructorMajorId, instructorMajor from instructorMajor";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            ddlMajorId.DataTextField = "instructorMajor";
            ddlMajorId.DataValueField = "instructorMajorId";
            ddlMajorId.DataSource = dr;
            ddlMajorId.DataBind();
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (ChBoxDelete.Checked == true)
            {
                CRUD myCrud = new CRUD();
                string mySql = @"delete instructor where instructorId = @instructorId";
                Dictionary<string, object> myPara = new Dictionary<string, object>();
                myPara.Add("@instructorId", int.Parse(txtInstructorId.Text));
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
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                String fileExtention = System.IO.Path.GetExtension(FileUpload1.FileName);
                if (fileExtention.ToLower() != ".pdf" && fileExtention.ToLower() != ".docx" && fileExtention.ToLower() != ".doc")
                {
                    lblOutput.Text = "Please PDF or Word!";
                    lblOutput.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    int InstructorId = int.Parse(txtInstructorId.Text);
                    CRUD myCrud = new CRUD();
                    string mySql = @" select instructor from 
		            instructor inst inner join document doc on inst.instructorId = doc.instructorId";
                    Dictionary<string, object> myPara = new Dictionary<string, object>();
                    myPara.Add("@instructorId", InstructorId);
                    SqlDataReader dr = myCrud.getDrPassSql(mySql, myPara);
                    InsertDocuments(InstructorId);
                    FileUpload1.SaveAs(Server.MapPath("~/Uploads/" + FileUpload1.FileName));
                    lblOutput.Text = "File uploaded successfully!";
                    lblOutput.ForeColor = System.Drawing.Color.Green;
                    sendEmail();
                }
            }
            else
            {
                lblOutput.Text = "Please select file to upload!";
                lblOutput.ForeColor = System.Drawing.Color.Red;
            }
        }
        protected void sendEmail()
        {
            try
            {
                MailMessage ms = new MailMessage();
                ms.From = new MailAddress("internkfmc2021@gmail.com");
                ms.To.Add(txtEmail.Text);
                ms.Subject = "KFMC Academy!";
                ms.Body = "Thank you for updating your profile in KFMC Academy!";

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
        protected void btnSend_Click(object sender, EventArgs e)
        {
            try
            {
                MailMessage ms = new MailMessage();
                ms.From = new MailAddress(txtEmail.Text);
                ms.To.Add("internkfmc2021@gmail.com");
                ms.Subject = "KFMC Academy";
                ms.Body = "Hello this is my CV thank you!";
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
                SmtpClient sc = new SmtpClient("smtp.gmail.com", 587);
                sc.Port = 587;
                sc.Credentials = new NetworkCredential(txtEmail.Text, getPassword());
                sc.EnableSsl = true;
                sc.Send(ms);
                lblOutput.Text = "Thank you! The CV has been sent successfully";
                lblOutput.ForeColor = Color.Blue;
            }
            catch (Exception ex)
            {
                //
            }
        }
        protected string getPassword()
        {
            SqlDataReader dr = null;
            //Create SQL Connection to Server
            SqlConnection myConnection = new SqlConnection(strcon);
            //Try and connect to Server and Database
            SqlCommand myCommand = new SqlCommand("select * from instructor where instructorEmail='" + txtEmail.Text.Trim() + "'", myConnection);
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
        protected void InsertDocuments(int instructorId)
        {
            foreach (HttpPostedFile postedFile in FileUpload1.PostedFiles)
            {
                string filename = Path.GetFileName(postedFile.FileName);
                string contentType = postedFile.ContentType;
                using (Stream fs = postedFile.InputStream)
                {
                    using (BinaryReader br = new BinaryReader(fs))
                    {
                        byte[] bytes = br.ReadBytes((Int32)fs.Length);
                        CRUD DocInsert = new CRUD();
                        string mySql = @"insert into document( instructorId, documentName,contentType, documentData) 
                                        values(@instructorId, @documentName, @contentType, @documentData)";
                        Dictionary<string, object> myPara = new Dictionary<string, object>();
                        myPara.Add("@instructorId", instructorId);
                        myPara.Add("@documentName", filename);
                        myPara.Add("@contentType", contentType);
                        myPara.Add("@documentData", bytes);
                        int rtn = DocInsert.InsertUpdateDelete(mySql, myPara);
                        lblOutput2.Text = " Thank you for submitting your CV!";
                        lblOutput2.ForeColor = System.Drawing.Color.Blue;
                        viewFiles();
                    }
                }
            }
        }
        protected void btnViewFiles_Click(object sender, EventArgs e)
        {
            viewFiles();
        }
        protected void viewFiles()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"Select document.documentId, instructor.instructor, document.documentName,document.contentType 
                                         FROM  instructor   INNER JOIN
                                         document ON instructor.instructorId = document.instructorId
										 where instructor.instructorEmail = @instructorEmail ";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@instructorEmail", txtEmail.Text);
            SqlDataReader dr = myCrud.getDrPassSql(mySql, myPara);
            gvFiles.DataSource = dr;
            gvFiles.DataBind();
            gvFiles.Visible = true;
        }
        protected void btnDeleteFiles_Click(object sender, EventArgs e)
        {
            CRUD myCrud = new CRUD();
            string mySql = @"delete document where documentId = @documentId";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@documentId", int.Parse(txtDocument.Text));
            int rtn = myCrud.InsertUpdateDelete(mySql, myPara);
            if (rtn >= 1)
                Response.Write("<script> alert('File Deleted Successfully') </script>");
            else
                Response.Write("<script> alert('File Is Not Deleted') </script>");
            viewFiles();
        }
        void getinstructorDetails()
        {
            try
            {
                SqlConnection trainingSConStr = new SqlConnection(strcon);
                if (trainingSConStr.State == ConnectionState.Closed)
                {
                    trainingSConStr.Open();
                }
                SqlCommand cmd = new SqlCommand(@"select instructorId, instructor, instructorPassword, instructorEmail, instructorPhone, instructorMajorId ,instructorCv
                                                from instructor where instructorEmail= '" + Session["Email"] + "'", trainingSConStr);
                SqlDataAdapter sqlDa = new SqlDataAdapter(cmd);
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);
                if (dtbl.Rows.Count > 0)
                {
                    txtInstructorId.Text = dtbl.Rows[0]["instructorId"].ToString();
                    txtFullName.Text = dtbl.Rows[0]["instructor"].ToString();
                    txtOldPass.Text = dtbl.Rows[0]["instructorPassword"].ToString();
                    txtEmail.Text = dtbl.Rows[0]["instructorEmail"].ToString();
                    txtInstructorPhone.Text = dtbl.Rows[0]["instructorPhone"].ToString();
                    txtCV.Text = dtbl.Rows[0]["instructorCv"].ToString();
                    ddlMajorId.SelectedValue = dtbl.Rows[0]["instructorMajorId"].ToString().Trim();
                }
                else
                {
                    // somethingWentWrong();
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        protected void btnHide_Click(object sender, EventArgs e)
        {
            if (gvFiles.Visible == true) // for hide Gridview
            {
                gvFiles.Visible = false;
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