using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Training_School.App_Code;

namespace Training_School
{
    public partial class viewCourses : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            gvOutput.EmptyDataText = "No Records Found";
        }

        protected void ButSearch_Click(object sender, EventArgs e)
        {

            CRUD myCrud = new CRUD();
            string mySql = @"select instructor as 'Instructor Name', courseLanguage as 'Course Language', course as 'Course Title', courseDescription as 'Course Description'
                          from instructor i inner join course c on i.instructorId = c.instructorId inner join courseLanguage cl on c.courseLanguageId=cl.courseLanguageId 
                          where instructor = @instructor or courseLanguage = @courseLanguage or course = @course or courseDescription = @courseDescription ;";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@instructor", textSearch.Text);
            myPara.Add("@courseLanguage", textSearch.Text);
            myPara.Add("@course", textSearch.Text);
            myPara.Add("@courseDescription", textSearch.Text);
            SqlDataReader dr = myCrud.getDrPassSql(mySql, myPara);
            gvOutput.DataSource = dr;
            gvOutput.DataBind();

        }

        protected void btnDetails_Click(object sender, EventArgs e)
        {
            //Direct to Course Detials page
            Response.Redirect("courseDetails.aspx");
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