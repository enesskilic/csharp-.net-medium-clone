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
    public partial class Default : System.Web.UI.Page
    {
        public DataTable data_table = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection connect = new SqlConnection(@"Data Source=.\SqlExpress;Initial Catalog=Blog;Integrated Security=True");
            connect.Open();
            SqlCommand command = new SqlCommand("SELECT Posts.id, Users.id, name, title, content, read_time, avatar,  DATENAME(day, created_at) +' '+ DATENAME(month, created_at) AS 'date_name' from Posts, Users WHERE author_id=Users.id", connect);
            SqlDataReader read = command.ExecuteReader();

            data_table.Columns.Add("id", typeof(int));
            data_table.Columns.Add("author_id", typeof(int));
            data_table.Columns.Add("author", typeof(string));
            data_table.Columns.Add("title", typeof(string));
            data_table.Columns.Add("content", typeof(string));
            data_table.Columns.Add("read_time", typeof(int));
            data_table.Columns.Add("avatar", typeof(string));
            data_table.Columns.Add("date_name", typeof(string));

            while (read.Read())
            {
                DataRow data_row = data_table.NewRow();
                data_row["id"]= read.GetValue(0);
                data_row["author_id"]= read.GetValue(1);
                data_row["author"]= read.GetValue(2);
                data_row["title"]= read.GetValue(3);
                data_row["content"]= read.GetValue(4);
                data_row["read_time"]= read.GetValue(5);
                data_row["avatar"] = read.GetValue(6);
                data_row["date_name"]= read.GetValue(7);
                data_table.Rows.Add(data_row);
            }
        }
    }
}