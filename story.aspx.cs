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
    public partial class story : System.Web.UI.Page
    {
        public DataTable data_table = new DataTable();

        public Boolean isLoading = true;
        public Boolean isEdit = false;
        public string user_id;
        public void isLoggedIn()
        {
            if (Session["isLoggedIn"] == null)
            {
                Response.Redirect("home");
            }
        }
        public void isRemember()
        {
            if (Request.Cookies["remember_me"] != null)
            {
                Session.Add("isLoggedIn", "true");
            }
        }
        public void userId()
        {
            if (Session["user_id"] != null)
            {
                user_id = Session["user_id"].ToString();
            }
            else if (Request.Cookies["user_id"] != null)
            {
                user_id = Request.Cookies["user_id"].Value.ToString();
            }
            else
            {
                user_id = "12";
            }
        }
        static double GetReadTime(string text)
        {
            int wordCount = 0, index = 0;
            while (index < text.Length && char.IsWhiteSpace(text[index]))
                index++;

            while (index < text.Length)
            {
                while (index < text.Length && !char.IsWhiteSpace(text[index]))
                    index++;
                wordCount++;
                while (index < text.Length && char.IsWhiteSpace(text[index]))
                    index++;
            }
            return wordCount <= 200 ? 1 : wordCount / 200;
        }
        protected void getPost()
        {
            data_table.Columns.Add("title", typeof(string));
            data_table.Columns.Add("content", typeof(string));
            DataRow data_row = data_table.NewRow();

            SqlConnection connect = new SqlConnection(@"Data Source=.\SqlExpress;Initial Catalog=Blog;Integrated Security=True");
            connect.Open();

            SqlCommand command = new SqlCommand("select title, content from Posts where id='" + Request.QueryString.ToString() + "'", connect);
            SqlDataReader read = command.ExecuteReader();


            if (read.Read())
            {
                data_row["title"] = read.GetString(0);
                data_row["content"] = read.GetString(1);
                data_table.Rows.Add(data_row);
                current_title.Value = data_row["title"].ToString();
                current_block_list.Value = data_row["content"].ToString();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                isLoggedIn();
                isRemember();
                userId();
                if (user_id == null)
                {
                    Response.Redirect("/home");
                }
            }
            if (Request.Url.AbsolutePath.Contains("edit"))
            {
                isEdit = true;
                getPost();
            }
        }
        protected void func_logout(object sender, EventArgs e)
        {
            Session.Clear();

            HttpCookie remember_cookie = new HttpCookie("remember_me");
            remember_cookie.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(remember_cookie);

            Response.Redirect("home");
        }

        protected void send_post(object sender, EventArgs e)
        {
            string Post_Title = post_title.Value;
            string Post_Content = post_content.Value.Trim();

            SqlConnection connect = new SqlConnection(@"Data Source=.\SqlExpress;Initial Catalog=Blog;Integrated Security=True");
            connect.Open();

            SqlCommand command = new SqlCommand("INSERT INTO Posts(author_id, title, content, created_at, read_time) VALUES(@author_id, @title, @content, @created_at, @read_time)", connect);
            command.Parameters.Add("@author_id", System.Data.SqlDbType.SmallInt).Value = Int16.Parse(user_id) != null ? Int16.Parse(user_id) : 12;
            command.Parameters.Add("@title", System.Data.SqlDbType.VarChar).Value = Post_Title;
            command.Parameters.Add("@content", System.Data.SqlDbType.NText).Value = Post_Content;
            command.Parameters.Add("@created_at", System.Data.SqlDbType.SmallDateTime).Value = DateTime.Now.ToString("dd/MM/yyyy");
            command.Parameters.Add("@read_time", System.Data.SqlDbType.TinyInt).Value = GetReadTime(Post_Content);

            command.ExecuteNonQuery();
            connect.Close();
            Response.Redirect("/");
        }
        protected void update_post(object sender, EventArgs e)
        {
            string Post_Title = post_title.Value;
            string Post_Content = post_content.Value.Trim();

            SqlConnection connect = new SqlConnection(@"Data Source=.\SqlExpress;Initial Catalog=Blog;Integrated Security=True");
            connect.Open();
            SqlCommand command = new SqlCommand("Update Posts set title='" + Post_Title + "', content='" + Post_Content + "' where id='" + Request.QueryString.ToString() + "'  ", connect);

            command.ExecuteNonQuery();
            connect.Close();
            Response.Redirect("/");
        }
        protected void give_up(object sender, EventArgs e)
        {
            Response.Redirect("/");
        }
    }
}
