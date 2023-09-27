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
    public partial class Profile : System.Web.UI.Page
    {
        public string user_id;
        public DataTable data_table = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
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
            SqlCommand command = new SqlCommand("SELECT *, DATENAME(day, created_at) +' '+ DATENAME(month, created_at) AS 'date_name' from Posts where author_id='" + user_id + "'", connect);
            SqlDataReader read = command.ExecuteReader();

            data_table.Columns.Add("id", typeof(int));
            data_table.Columns.Add("title", typeof(string));
            data_table.Columns.Add("date_name", typeof(string));

            while (read.Read())
            {
                DataRow data_row = data_table.NewRow();
                data_row["id"] = read.GetInt16(0);
                data_row["title"] = read.GetString(2);
                data_row["date_name"] = read.GetString(6);
                data_table.Rows.Add(data_row);
            }
            connect.Close();

        }
        protected void delete_post(object sender, EventArgs e)
        {
            id.Value = id.Value.Replace(",", "");
            
            SqlConnection connect = new SqlConnection(@"Data Source=.\SqlExpress;Initial Catalog=Blog;Integrated Security=True");
            connect.Open();
            

            SqlCommand command = new SqlCommand("delete from Posts where id='"+ id.Value + "'", connect);
            command.ExecuteNonQuery();
            
            connect.Close();
            Response.Redirect("/");
        }
    }
}