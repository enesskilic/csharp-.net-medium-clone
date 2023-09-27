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
    public partial class user : System.Web.UI.Page
    {
        public DataTable data_table = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection connect = new SqlConnection(@"Data Source=.\SqlExpress;Initial Catalog=Blog;Integrated Security=True");
            connect.Open();
            SqlCommand command = new SqlCommand("SELECT *, DATENAME(day, created_at) +' '+ DATENAME(month, created_at) AS 'date_name' from Posts, Users where author_id='" + Request.QueryString + "' and author_id=Users.id", connect);
            SqlDataReader read = command.ExecuteReader();

            data_table.Columns.Add("id", typeof(int));
            data_table.Columns.Add("author", typeof(string));
            data_table.Columns.Add("title", typeof(string));
            data_table.Columns.Add("content", typeof(string));
            data_table.Columns.Add("date_name", typeof(string));

            while (read.Read())
            {
                DataRow data_row = data_table.NewRow();
                data_row["id"] = read.GetInt16(0);
                data_row["title"] = read.GetString(2);
                data_row["content"] = read.GetString(3);
                data_row["date_name"] = read.GetString(12);
                data_row["author"] = read.GetString(7);
                data_table.Rows.Add(data_row);
            }
        }
    }
}