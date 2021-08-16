using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
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
    public partial class manageInstructors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                populateGv();
                populateStatus();
            }

        }
        protected void populateGv()
        {
            CRUD myCrud = new CRUD();
            string mySql = @" select instructorId, instructor, instructorEmail as Email, instructorPhone as Phone, 
            instructorMajor as Major, other as Note, s.statusId
            from instructorMajor im inner join instructor i on im.instructorMajorId = i.instructorMajorId 
            inner join status s on i.statusId = s.statusId; ";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            gvInstructors.DataSource = dr;
            gvInstructors.DataBind();
        }
        protected void populateStatus()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"select statusId, status from status;";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            ddlStatus.DataValueField = "statusId";
            ddlStatus.DataTextField = "status";
            ddlStatus.DataSource = dr;
            ddlStatus.DataBind();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            CRUD myCrud = new CRUD();
            string mySql = @"update instructor set statusId = @statusId where instructorId = @instructorId; ";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@instructorId", int.Parse(txtInstructorId.Text));
            myPara.Add("statusId", ddlStatus.SelectedValue);
            int rtn = myCrud.InsertUpdateDelete(mySql, myPara);
            if (rtn >= 1)
                Response.Write("<script> alert('Status Updated Successfully'); </script>");
            else
                Response.Write("<script> alert('Status Is Not Updated'); </script>");
            
            populateGv();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            CRUD myCrud = new CRUD();
            string mySql = @"delete instructor where instructorId = @instructorId; ";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@instructorId", int.Parse(txtInstructorId.Text));
            int rtn = myCrud.InsertUpdateDelete(mySql, myPara);
            if (rtn >= 1)
                Response.Write("<script> alert('Instructor Deleted Successfully') </script>");
            else
                Response.Write("<script> alert('Instructor Is Not Deleted') </script>");

            populateGv();
        }

        protected void populategvInstructorData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "update")
            {
                Response.Write("test");
                int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
                int instructorId = Convert.ToInt32(e.CommandArgument);
                lblOutput.Text = instructorId.ToString();


                populateGv();
            }
            populateGv();
        }

        protected void gvAdminLinkButton1_Click(object sender, EventArgs e)
        {
            int PK = int.Parse((sender as LinkButton).CommandArgument);
            //lblOuput.Text = PK.ToString();
            string mySql = @"select instructorId, instructor, s.statusId from instructor i inner join status s on i.statusId=s.statusId where instructorId=@instructorId";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@instructorId", PK);
            CRUD myCrud = new CRUD();
            SqlDataReader dr = myCrud.getDrPassSql(mySql, myPara);
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    String instructorID = dr["instructorId"].ToString();
                    String instructor = dr["instructor"].ToString();
                    String statusID = dr["statusId"].ToString();
                    txtInstructorId.Text = instructorID;
                    txtInstructor.Text = instructor;
                    ddlStatus.SelectedValue = statusID;
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