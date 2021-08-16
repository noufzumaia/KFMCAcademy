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
    public partial class mySubscription : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["trainingSConStr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            using (SqlConnection sqlCon = new SqlConnection(strcon))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter(@"select trainee.traineeId, [order].orderId, [order].orderdate, course.course, course.coursePrice 
                                                            from register inner join [order] on register.traineeId = [order].traineeId 
                                                            inner join course on register.courseId = course.courseId 
                                                 inner join trainee on register.traineeId = trainee.traineeId where trainee.traineeEmail= '" + Session["Email"] + "'", sqlCon);
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);
                gvSubscriptionsList.DataSource = dtbl;
                gvSubscriptionsList.DataBind();

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