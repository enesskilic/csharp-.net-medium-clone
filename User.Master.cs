using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace medium_clone
{
    public partial class User : System.Web.UI.MasterPage
    {
        public string user_id;
        public string avatar;

        public void isLoggedIn()
        {
            if (Session["isLoggedIn"] == null)
            {
                Response.Redirect("/home/?login");
            }
        }
        public void isRemember()
        {
            if (Request.Cookies["remember_me"] != null)
            {
                Session.Add("isLoggedIn", "true");
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            isRemember();
            isLoggedIn();

            if (Request.Cookies["user_id"] != null)
            {
                user_id = Request.Cookies["user_id"].Value.ToString();
            }
            else
            {
                user_id = Session["user_id"].ToString();
            }

            SqlConnection connect = new SqlConnection(@"Data Source=.\SqlExpress;Initial Catalog=Blog;Integrated Security=True");
            connect.Open();
            SqlCommand command = new SqlCommand("select avatar from Users where id='" + user_id + "'", connect);
            SqlDataReader read = command.ExecuteReader();

            if (read.Read() && read.GetString(0) != null)
            {
                avatar = read.GetString(0);
            }
            else
            {
                avatar = "";
            }
        }
        protected void func_logout(object sender, EventArgs e)
        {
            Session.Clear();

            HttpCookie remember_cookie = new HttpCookie("remember_me");
            HttpCookie user_id_cookie = new HttpCookie("user_id");
            remember_cookie.Expires = DateTime.Now.AddDays(-1);
            user_id_cookie.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(remember_cookie);
            Response.Cookies.Add(user_id_cookie);

            Response.Redirect("/home");
        }
    }
}