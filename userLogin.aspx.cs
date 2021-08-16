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

namespace Training_School
{
    public partial class userLogin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["trainingSConStr"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void btnLogin_Click1(object sender, EventArgs e)
        {
            //Response.Write("<script>alert('Button click');</script>");
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("select * from instructor where instructorEmail='" + txtUserEmail.Text.Trim() + "' AND instructorPassword='" + txtUserPassword.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();


                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Session["Email"] = dr.GetValue(3).ToString();
                        Session["instructorName"] = dr.GetValue(2).ToString();
                        Session["Password"] = dr.GetValue(5).ToString();
                        Session["role"] = "instructor";
                        //Response.Write("<script>alert('Successful Login');</script>");
                    }
                    Response.Redirect("home.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Email or Password');</script>");
                }
            }

            catch (Exception ex)
            {

            }

            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("select * from trainee where traineeEmail='" + txtUserEmail.Text.Trim() + "' AND traineePassword='" + txtUserPassword.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();


                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        Session["Email"] = dr.GetValue(4).ToString();
                        Session["traineeName"] = dr.GetValue(2).ToString();
                        Session["Password"] = dr.GetValue(5).ToString();
                        Session["role"] = "trainee";
                        //Response.Write("<script>alert('Successful Login');</script>");
                    }
                    Response.Redirect("home.aspx");
                }
                else
                {
                    // 
                }
            }

            catch (Exception ex)
            {

            }



        }

        protected void lbtnForgotPass_Click(object sender, EventArgs e)
        {
                Response.Redirect("forgotPass.aspx");
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
        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/trSignup.aspx");
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