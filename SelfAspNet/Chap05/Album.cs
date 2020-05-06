using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace SelfAspNet.Chap05
{
    public class Album
    {
        [DataObjectMethod(DataObjectMethodType.Select, true)]
        public DataSet GetAlbumData(String category)
        {
            // データベース接続準備
            var setting = ConfigurationManager.ConnectionStrings["SelfApp"];
            var db = new SqlConnection(setting.ConnectionString);
            // 取得コマンド準備
            var comm = new SqlCommand();
            comm.Connection = db;
            // 引数categoryの値によってsql命令を振り分け
            if (category == "無選択")
            {
                comm.CommandText = "SELECT [aid], [comment], [updated], [favorite], [category] FROM [Album]";
            }
            else
            {
                comm.CommandText = "SELECT aid, comment, updated, favorite, category FROM Album WHERE category = @category";
                comm.Parameters.AddWithValue("@category", category);
            }

            // データセットの生成＆取得コマンド実行
            var ds = new DataSet();
            var adapter = new SqlDataAdapter(comm);
            adapter.Fill(ds, "Album");
            return ds;
        }

        [DataObjectMethod(DataObjectMethodType.Delete, true)]
        public int DeleteAlbumData(String aid)
        {
            int result;
            // データベース接続準備
            var setting = ConfigurationManager.ConnectionStrings["SelfAsp"];
            using (var db = new SqlConnection(setting.ConnectionString))
            {
                // 削除コマンド準備
                var comm = new SqlCommand("DELETE FROM Album WHERE aid = @aid", db);
                comm.Parameters.AddWithValue("@aid", aid);
                db.Open();
                result = comm.ExecuteNonQuery();
            }
            return result;
        }
    }
}