using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Training_School.App_Code;

namespace Training_School
{
    public partial class manageCourses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                showCourseData();
                populateLanguage();

            }
        }

        protected void populateLanguage()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"select courseLanguageId, courseLanguage from courseLanguage; ";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            rblLanguage.DataValueField = "courseLanguageId";
            rblLanguage.DataTextField = "courseLanguage";
            rblLanguage.DataSource = dr;
            rblLanguage.DataBind();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int PK = int.Parse(txtcourseId.Text);
            string CourseName = txtCourse.Text;
            string CourseInst = txtInstructor.Text;
            string Duration = txtDuration.Text;
            string CourseDescrip = txtCD.Text;
            string mySql = @"Update course set course = @course ,instructorId= @instructorId 
             ,courseDuration= @courseDuration , courseLanguageId= @courseLanguageId ,courseDescription= @courseDescription
            where courseId = @courseId";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@courseId", PK);
            myPara.Add("@course", CourseName);
            myPara.Add("@instructorId", CourseInst);
            myPara.Add("@courseDuration", Duration);
            myPara.Add("@courseLanguageId", rblLanguage.SelectedValue);
            myPara.Add("@courseDescription", CourseDescrip);
            CRUD myCrud = new CRUD();
            int rtn = myCrud.InsertUpdateDelete(mySql, myPara);
            if (rtn >= 1)
            {
                lblOutput.Text = "Success Operation!";
                lblOutput.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblOutput.Text = "Failed Operation!";
                lblOutput.ForeColor = System.Drawing.Color.Red;
            }
            showCourseData();
        }

        protected void btnAdd_Click_Click(object sender, EventArgs e)
        {
            CRUD myCrud = new CRUD();
            string mySql = @"insert into course (course, instructorId, courseDuration,courseLanguageId , courseDescription ) 
                values (@course , @instructorId , @courseDuration , @courseLanguageId , @courseDescription)";
            Dictionary<string, object> myPara = new Dictionary<string, object>();

            myPara.Add("@course", txtCourse.Text);
            myPara.Add("@instructorId", txtInstructor.Text);
            myPara.Add("@courseDuration", txtDuration.Text);
            myPara.Add("@courseLanguageId", rblLanguage.SelectedValue);
            myPara.Add("@courseDescription", txtCD.Text);
            int rtn = myCrud.InsertUpdateDelete(mySql, myPara);
            if (rtn >= 1)
            {
                lblOutput.Text = "Success Operation!";
                lblOutput.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblOutput.Text = "Failed Operation!";
                lblOutput.ForeColor = System.Drawing.Color.Red;
            }
            showCourseData();

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

            CRUD myCrud = new CRUD();
            string mySql = @"delete course where courseId = @courseId";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@courseId", int.Parse(txtcourseId.Text));
            int rtn = myCrud.InsertUpdateDelete(mySql, myPara);
            if (rtn >= 1)
            {
                lblOutput.Text = "Success Operation!";
                lblOutput.ForeColor = System.Drawing.Color.Green;
            }

            else
            {
                lblOutput.Text = "Failed Operation!";
                lblOutput.ForeColor = System.Drawing.Color.Red;
            }
            showCourseData();
        }

        protected void btnGetAll_Click(object sender, EventArgs e)
        {
            showCourseData();
        }

        protected void showCourseData()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"select courseId, course, c.instructorId, instructor ,courseLanguageId , courseDuration , courseDescription
            from course c inner join instructor i on c.instructorId = i.instructorId; ";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            gvCourseData.DataSource = dr;
            gvCourseData.DataBind();
        }

        protected void gvCourseData_PreRender(object sender, EventArgs e)
        {
            if (gvCourseData.Rows.Count > 0)
            {
                gvCourseData.UseAccessibleHeader = true;
                gvCourseData.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void btnExcel_Click(object sender, EventArgs e)
        {
            ExportGridToExcel(gvCourseData);
        }

        public void ExportGridToExcel(GridView grd)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            grd.AllowPaging = false;
            showCourseData();
            grd.RenderControl(hw);
            string style = @"<style> .textmode { mso-number-format:\@; } </style>";
            Response.Write(style);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }

        protected void btnWord_Click(object sender, EventArgs e)
        {
            ExportGridToWord();
        }

        public void ExportGridToWord()
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/msword";
            Response.AddHeader("Content-Disposition", "attachment;filename=GridViewExport.doc");
            gvCourseData.GridLines = GridLines.Both;
            gvCourseData.HeaderStyle.Font.Bold = true;
            gvCourseData.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
        }

        protected void btnPDF_Click(object sender, EventArgs e)
        {
            ExportGridToPDF();
        }

        public void ExportGridToPDF()
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            gvCourseData.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
            gvCourseData.AllowPaging = true;
            gvCourseData.DataBind();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }

        protected void populategvCourseData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "update")
            {
                Response.Write("test");
                int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
                int courseId = Convert.ToInt32(e.CommandArgument);
                lblOutput.Text = courseId.ToString();


                showCourseData();
            }
            showCourseData();
        }

        protected void gvAdminLinkButton1_Click(object sender, EventArgs e)
        {
            int PK = int.Parse((sender as LinkButton).CommandArgument);
            //lblOuput.Text = PK.ToString();
            string mySql = @"select courseId, course, c.instructorId, instructor ,courseLanguageId , courseDuration , courseDescription
            from course c inner join instructor i on c.instructorId = i.instructorId where courseId=@courseId";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@courseId", PK);
            CRUD myCrud = new CRUD();
            SqlDataReader dr = myCrud.getDrPassSql(mySql, myPara);
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    String courseID = dr["courseId"].ToString();
                    String courseName = dr["course"].ToString();
                    String instructorID = dr["instructorId"].ToString();
                    String Duration = dr["courseDuration"].ToString();
                    String CourseDiscription = dr["courseDescription"].ToString();
                    String Language = dr["courseLanguageId"].ToString();
                    txtcourseId.Text = courseID;
                    txtCourse.Text = courseName;
                    txtInstructor.Text = instructorID;
                    txtDuration.Text = Duration;
                    txtCD.Text = CourseDiscription;
                    rblLanguage.SelectedValue = Language;
                }
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