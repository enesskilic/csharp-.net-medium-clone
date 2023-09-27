using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace medium_clone
{
    public partial class Home : System.Web.UI.Page
    {
        public Boolean isInvalid = false;
        public Boolean isInvalidLength = false;
        public Boolean isExist = false;
        public Boolean isInvalidPassword = false;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void func_login(object sender, EventArgs e)
        {
            SqlConnection connect = new SqlConnection(@"Data Source=.\SqlExpress;Initial Catalog=Blog;Integrated Security=True");
            connect.Open();
            SqlCommand command = new SqlCommand("select id from Users where email='" + email.Text + "' and password='" + password.Text + "'", connect);
            SqlDataReader read = command.ExecuteReader();
            if (read.Read())
            {
                Session.Add("user_id", read.GetValue(0).ToString());
                Session.Add("isLoggedIn", "true");
                Response.Redirect("/");
                if (remember_me.Checked)
                {
                    Response.Cookies["remember_me"].Value = "true";
                    Response.Cookies["remember_me"].Expires = DateTime.Now.AddDays(15);
                    Response.Cookies["user_id"].Value = read.GetValue(0).ToString();
                    Response.Cookies["user_id"].Expires = DateTime.Now.AddDays(15);
                }
                read.Close();
            }
            else if (email.Text.Length == 0 || password.Text.Length == 0)
            {
                isInvalidLength = true;
                Response.Redirect("/home/?login");
            }
            else
            {
                isInvalid = true;
                Response.Redirect("/home/?login");
            }
            read.Close();
            }
            protected void func_register(object sender, EventArgs e)
        {
            if (register_username.Text.Length > 0 && register_email.Text.Length > 0 && password1.Text.Length > 0 && password2.Text.Length > 0 && password1.Text == password2.Text)
            {
                SqlConnection connect = new SqlConnection(@"Data Source=.\SqlExpress;Initial Catalog=Blog;Integrated Security=True");
                connect.Open();

                SqlCommand checkUser = new SqlCommand("select * from Users WHERE name='" + register_username.Text + "' or email='" + register_email.Text + "'", connect);
                SqlCommand command = new SqlCommand("INSERT INTO Users(name, email, password, bio, avatar) VALUES ('" + register_username.Text + "', '" + register_email.Text + "', '" + password1.Text + "', 'Kendinizden kısaca bahsedin.', '')", connect);

                SqlDataReader read = checkUser.ExecuteReader();
                if (read.Read())
                {
                    isExist = true;
                    connect.Close();
                    Response.Redirect("/home/?register");
                }
                else
                {
                    read.Close();
                    command.ExecuteNonQuery();
                    connect.Close();

                    Response.Redirect("/home/?login");
                }
            }
            else if (register_username.Text.Length == 0 || register_email.Text.Length == 0 || password1.Text.Length == 0 || password2.Text.Length == 0)
            {
                isInvalidLength = true;
                Response.Redirect("/home/?register");
            }
            else if (password1.Text != password2.Text)
            {
                isInvalidPassword = true; 
                Response.Redirect("/home/?register");
            }
        }
    }
}