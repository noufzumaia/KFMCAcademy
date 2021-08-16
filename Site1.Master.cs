using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Threading;

namespace Training_School
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"].Equals(""))
                {
                    lbtnUserLogin.Visible = true; // user login link button
                    lbtnSignup.Visible = true; // sign up link button

                    lbtnLogout.Visible = false; // logout link button
                    lbtnMsg.Visible = false; // hello user link button


                    lbtnAdminLogin.Visible = true; // admin login link button
                }
                else if (Session["role"].Equals("trainee"))
                {
                    lbtnMySubscriptions.Visible = true;
                    lbtnUserLogin.Visible = false; // user login link button
                    lbtnSignup.Visible = false; // sign up link button
                    lbtnCart.Visible = true;  //trinee cart link button

                    lbtnLogout.Visible = true; // logout link button
                    lbtnMsg.Visible = true; // hello user link button
                    lbtnMsg.Text = "Hello, &nbsp;" + Session["traineeName"].ToString();


                    lbtnAdminLogin.Visible = true; // admin login link button
                }

                else if (Session["role"].Equals("instructor"))
                {
                    lbtnCreateCourses.Visible = true;
                    lbtnUserLogin.Visible = false; // user login link button
                    lbtnSignup.Visible = false; // sign up link button

                    lbtnLogout.Visible = true; // logout link button
                    lbtnMsg.Visible = true; // hello user link button
                    lbtnMsg.Text = "Hello, &nbsp;" +  Session["instructorName"].ToString();


                    lbtnAdminLogin.Visible = true; // admin login link button
                }
                else if (Session["role"].Equals("admin"))
                {
                    lbtnUserLogin.Visible = false; // user login link button
                    lbtnSignup.Visible = false; // sign up link button

                    lbtnLogout.Visible = true; // logout link button
                    lbtnMsg.Visible = true; // hello user link button
                    lbtnMsg.Text = "Hello, Admin";


                    lbtnAdminLogin.Visible = false; // admin login link button
                    lbtnManage.Visible = true; // admin management link button
                    lbtnManageInstructors.Visible = true; // manage instructors link button
                    lbtnManageCourses.Visible = true; // manage courses link button
                    lbtnManageTrainees.Visible = true; // manage trainees link button
                }
            }
            catch (Exception ex)
            {
               
            }
        }

        protected void lbtnAdminLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminLogin.aspx");
        }

        protected void lbtnUserLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("userLogin.aspx");
        }

        protected void lbtnUserSignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("usersignup.aspx");
        }

        //logout button
        protected void lbtnLogout_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";
            Session["status"] = "";

            lbtnCreateCourses.Visible = false; // Create Courses link button
            lbtnManage.Visible = false; // manage link button
            lbtnMySubscriptions.Visible = false; // My Subscriptions link button
            lbtnUserLogin.Visible = true; // user login link button
            lbtnSignup.Visible = true; // sign up link button
            lbtnCart.Visible = false; // trainees cart link button

            lbtnLogout.Visible = false; // logout link button
            lbtnMsg.Visible = false; // hello user link button


            lbtnAdminLogin.Visible = true; // admin login link button
            lbtnManageInstructors.Visible = false; // manage instructors link button
            lbtnManageCourses.Visible = false; // manage courses link button
            lbtnManageTrainees.Visible = false; // manage trainees link button

            Response.Redirect("home.aspx");
        }

        protected void lbtnManage_Click(object sender, EventArgs e)
        {
            lbtnManageInstructors.Focus();
        }

        protected void lbtnMsg_Click(object sender, EventArgs e)
        {
            if (Session["role"].Equals("instructor"))
            {
                Response.Redirect("instructorProfile.aspx");
            }
            else
            {
                Response.Redirect("userProfile.aspx");
            }
        }

        protected void lbtnManageInstructors_Click(object sender, EventArgs e)
        {
            Response.Redirect("manageInstructors.aspx");
        }

        protected void lbtnCreateCourses_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateCourses.aspx");
        }

        protected void lbtnViewCourses_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewCourses.aspx");
        }

        protected void lbtnManageCourses_Click(object sender, EventArgs e)
        {
            Response.Redirect("manageCourses.aspx");
        }

        protected void lbtnViewCourse_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewCourses.aspx");
        }

        protected void lbtnAboutUs_Click(object sender, EventArgs e)
        {
            Response.Redirect("aboutUs.aspx");
        }

        protected void lbtnMySubscriptions_Click(object sender, EventArgs e)
        {
            Response.Redirect("mySubscription.aspx");
        }

        protected void lbtnSignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("trSignup.aspx");
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
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

        protected void lbtnCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("cart.aspx");
        }

        protected void lbtnManageTrainees_Click(object sender, EventArgs e)
        {
            Response.Redirect("manageTrainees.aspx");
        }
    }
}