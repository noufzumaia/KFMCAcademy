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
    public partial class insResetPass : System.Web.UI.Page
    {

		string CS = ConfigurationManager.ConnectionStrings["trainingSConStr"].ConnectionString;
		string GUIDvalue;
		DataTable dt = new DataTable();
		int instructorId;
		protected void Page_Load(object sender, EventArgs e)
		{
			using (SqlConnection con = new SqlConnection(CS))
			{
				GUIDvalue = Request.QueryString["instructorId"];
                if (GUIDvalue != null)
                {
                    SqlCommand cmd = new SqlCommand("select * from instructorForgotPass where guidId='" + GUIDvalue + "'", con);
                    con.Open();
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        instructorId = Convert.ToInt32(dt.Rows[0][2]);
                    }
                    else
                    {
                        Response.Write("<script>alert('Your Password Reset Link is Expired or Invalid !');</script>");
                    }
                }
                else
                {
                    Response.Redirect("~/forgotPass.aspx");
                }
            }
            if (!IsPostBack)
			{
				if (dt.Rows.Count != 0)
				{
					txtNewPass.Visible = true;
					txtConfirmPass.Visible = true;
					btRecPass.Visible = true;
				}
				else
				{
					Response.Write("<script>alert('Your Password Reset Link is Expired or Invalid !');</script>");
				}
			}
		}

		protected void btRecPass_Click(object sender, EventArgs e)
		{
			if (txtNewPass.Text != "" && txtConfirmPass.Text != "" && txtNewPass.Text == txtConfirmPass.Text)
			{
				using (SqlConnection con = new SqlConnection(CS))
				{
					SqlCommand cmd = new SqlCommand("update instructor set instructorPassword='" + txtNewPass.Text + "' where instructorId='" + instructorId + "'", con);
					con.Open();
					cmd.ExecuteNonQuery();
					SqlCommand cmd2 = new SqlCommand("delete from instructorForgotPass where instructorId='" + instructorId + "'", con);
					cmd2.ExecuteNonQuery();
					Response.Write("<script>alert('Password Successfully Changed');</script>");
				}
			}
			else
			{
				Response.Write("<script>alert('All fields are mandatory');</script>");
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


		//string CS = ConfigurationManager.ConnectionStrings["trainingSConStr"].ConnectionString;
		//string GUIDvalue;
		//DataTable dt = new DataTable();
		//int Uid;
		//protected void Page_Load(object sender, EventArgs e)
		//{

		//}
		//// Click event
		//protected void btRecPass_Click(object sender, EventArgs e)
		//{
		//    string myGuid = Request.QueryString["Uid"].ToString();

		//    bool rtn = checkGuid(myGuid);
		//    if (rtn == true)
		//    {

		//        if (tbNewPass.Text != "" && tbConfirmPass.Text != "" && tbNewPass.Text == tbConfirmPass.Text)
		//        {
		//            updatePassword(Uid, tbNewPass.Text);

		//        }
		//        else
		//        {
		//            Response.Write("<script>alert('All fields are mandatory');</script>");
		//        }
		//    }
		//    else
		//    {
		//        Response.Write("<script>alert('Your Password Reset Link is Expired or Invalid !');</script>");

		//    }

		//}

		//// Method to check GUID 
		//protected bool checkGuid(string myGuid)
		//{
		//    bool rtn = false;
		//    CRUD myCrud = new CRUD();
		//    string mySql = @"  select guidId from traineeForgotPass where guidId = @guideId";
		//    Dictionary<string, object> myPara = new Dictionary<string, object>();
		//    myPara.Add("@guideId", myGuid);
		//    rtn = myCrud.authenticateUser(mySql, myPara);
		//    return rtn;
		//}

		//// update the password
		//protected void updatePassword(int myId, string myPasssord)
		//{
		//    CRUD myCrud = new CRUD();
		//    string mySql = @"update trainee set traineePassword = @traineePassword 
		//                            where traineeid = @traineeId";
		//    Dictionary<string, object> myPara = new Dictionary<string, object>();
		//    myPara.Add("@traineeId", myId);
		//    myPara.Add("@traineePassword", myPasssord);
		//    int rtn = myCrud.InsertUpdateDelete(mySql, myPara);
		//    if (rtn >= 1)
		//    {
		//        Response.Write("<script>alert('Sucess!');</script>");
		//    }
		//    else
		//    { Response.Write("<script>alert('Failed!');</script>"); }
		//}
	}
}