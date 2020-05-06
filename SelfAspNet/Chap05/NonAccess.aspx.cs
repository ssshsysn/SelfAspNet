using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace SelfAspNet.Chap05
{
    public partial class NonAccess : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var setting = ConfigurationManager.ConnectionStrings["SelfApp"];
            
            // 接続文字列とSELECT命令を定義したデータアダプタを生成
            var adapter = new SqlDataAdapter(
                "SELECT * FROM Book WHERE publish = @publish", setting.ConnectionString);
            adapter.SelectCommand.Parameters.AddWithValue("@publish", "翔泳社");

            var ds = new DataSet();
            // データアダプタを使用してデータセットにデータを流し込み
            adapter.Fill(ds, "Book");
            // データセットの内容を読み込み＆出力
            for (var i = 0; i < ds.Tables["Book"].Rows.Count; i++)
            {
                Response.Write($"{ds.Tables["Book"].Rows[i]["title"]}<br />");
            }
        }
    }
}