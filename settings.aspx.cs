using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace medium_clone
{
    public partial class Settings : System.Web.UI.Page
    {
        public string user_id;
        public string user_name;
        public string user_bio;

        private void getUser()
        {
            if (Session["user_id"] != null)
            {
                user_id = Session["user_id"].ToString();
            }
            else if (Request.Cookies["user_id"] != null)
            {
                user_id = Request.Cookies["user_id"].Value;
            }
            SqlConnection connect = new SqlConnection(@"Data Source=.\SqlExpress;Initial Catalog=Blog;Integrated Security=True");
            connect.Open();
            SqlCommand command = new SqlCommand("select * from Users where id='" + user_id + "'", connect);
            SqlDataReader read = command.ExecuteReader();

            if (read.Read())
            {
                user_name = read.GetString(1);
                user_bio = read.GetString(4);
                current_name.Value = user_name;
                current_bio.Value = user_bio;
            }
        }
        protected void save_target(Object sender, EventArgs e)
        {
            string value = "";
            string target = "";
            Button btn = (Button)sender;
            switch (btn.CommandName)
            {
                case "change_name":
                    target = "name";
                    value = new_name.Value;
                    break;
                case "change_bio":
                    target = "bio";
                    value = new_bio.Value;
                    break;
            }

            SqlConnection connect = new SqlConnection(@"Data Source=.\SqlExpress;Initial Catalog=Blog;Integrated Security=True");
            connect.Open();
            SqlCommand command = new SqlCommand("update Users set " + target + "='" + value + "'  where id='" + user_id + "'", connect);

            command.ExecuteNonQuery();
            Response.Redirect("/");
            connect.Close();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            getUser();
        }
    }
}