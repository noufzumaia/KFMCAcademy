using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Training_School.App_Code;

namespace Training_School
{
    public partial class manageTrainees : System.Web.UI.Page
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
            string mySql = @"select traineeId, trainee, traineeEmail as Email, traineePhone as Phone,s.traineeStatusId
                 from trainee t inner join traineeStatus s on t.traineeStatusId = s.traineeStatusId";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            gvTrainees.DataSource = dr;
            gvTrainees.DataBind();
        }

        protected void populateStatus()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"select traineeStatusId, traineeStatus from traineeStatus";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            ddlStatus.DataValueField = "traineeStatusId";
            ddlStatus.DataTextField = "traineeStatus";
            ddlStatus.DataSource = dr;
            ddlStatus.DataBind();
        }

        protected void btnShowPaasedTrainees_Click(object sender, EventArgs e)
        {
            showPassedTraineesData();


        }

        protected void showPassedTraineesData()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"select trainee, traineeEmail as Email, instructor, course, courseDuration
             from register r inner join trainee t on r.traineeId=t.traineeId inner join course c on r.courseId=c.courseId
            inner join instructor i on c.instructorId = i.instructorId where t.traineeStatusId=1";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            gvPassedTrainee.DataSource = dr;
            gvPassedTrainee.DataBind();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }

        protected void btnExportToExcel_Click1(object sender, EventArgs e)
        {
            ExportGridToExcel(gvPassedTrainee);
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
            showPassedTraineesData();
            grd.RenderControl(hw);
            string style = @"<style> .textmode { mso-number-format:\@; } </style>";
            Response.Write(style);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            CRUD myCrud = new CRUD();
            string mySql = @"update trainee set statusId = @statusId where traineeId = @traineeId";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@traineeId", int.Parse(txtTraineeId.Text));
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
            string mySql = @"delete trainee where traineeId = @traineeId; ";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@traineeId", int.Parse(txtTraineeId.Text));
            int rtn = myCrud.InsertUpdateDelete(mySql, myPara);
            if (rtn >= 1)
                Response.Write("<script> alert('Instructor Deleted Successfully') </script>");
            else
                Response.Write("<script> alert('Instructor Is Not Deleted') </script>");
            populateGv();
        }

        protected void gvTraineeData_PreRender(object sender, EventArgs e)
        {
            if (gvTrainees.Rows.Count > 0)
            {
                gvTrainees.UseAccessibleHeader = true;
                gvTrainees.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void gvPassedTraineeData_PreRender(object sender, EventArgs e)
        {
            if (gvPassedTrainee.Rows.Count > 0)
            {
                gvPassedTrainee.UseAccessibleHeader = true;
                gvPassedTrainee.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void populategvTraineeData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "update")
            {
                Response.Write("test");
                int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;
                int traineeId = Convert.ToInt32(e.CommandArgument);
                lblOutput.Text = traineeId.ToString();


                populateGv();
            }
            populateGv();
        }

        protected void gvAdminLinkButton1_Click(object sender, EventArgs e)
        {
            int PK = int.Parse((sender as LinkButton).CommandArgument);
            //lblOuput.Text = PK.ToString();
            string mySql = @"select traineeId, trainee, s.traineeStatusId from trainee t inner join traineeStatus s on t.traineeStatusId=s.traineeStatusId where traineeId=@traineeId";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@traineeId", PK);
            CRUD myCrud = new CRUD();
            SqlDataReader dr = myCrud.getDrPassSql(mySql, myPara);
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    String traineeID = dr["traineeId"].ToString();
                    String trainee = dr["trainee"].ToString();
                    String statusID = dr["traineeStatusId"].ToString();
                    txtTraineeId.Text = traineeID;
                    txtTrainee.Text = trainee;
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
