using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace SelfAspNet.Chap05
{
    public partial class ExecuteReader : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // データベース接続情報を取得
            var setting = ConfigurationManager.ConnectionStrings["SelfApp"];

            // 接続準備
            using(var db= new SqlConnection(setting.ConnectionString))
            {
                // SQL ORDER
                var comm = new SqlCommand("SELECT * FROM Book WHERE publish = @publish", db);
                comm.Parameters.AddWithValue("@publish", "翔泳社");
                // 接続の確立
                db.Open();
                // SQL命令を実行し、その結果を表示
                var reader = comm.ExecuteReader();
                while (reader.Read())
                {
                    Response.Write($"{reader["title"]}<br />");
                }
                db.Close();
            }
        }
    }
}