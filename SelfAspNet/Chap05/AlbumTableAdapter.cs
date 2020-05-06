using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace SelfAspNet.Chap05.AlbumDataSetTableAdapters
{
    public partial class AlbumTableAdapter
    {
        [DataObjectMethod(DataObjectMethodType.Select, true)]
        public DataSet GetAlbumData(String category)
        {
            ConnectionStringSettings setting = ConfigurationManager.ConnectionStrings["SelfApp"];
            var db = new SqlConnection(setting.ConnectionString);
            var comm = new SqlCommand();
            comm.Connection = db;
            if (category == "無選択")
            {
                comm.CommandText = "SELECT aid, comment, updated, favorite, category FROM Album";
            }
            else
            {
                comm.CommandText = "SELECT aid, comment, updated, favorite, category FROM Album WHERE category = @category";
                comm.Parameters.AddWithValue("@category", category);
            }
            var ds = new DataSet();
            var adapter = new SqlDataAdapter(comm);
            adapter.Fill(ds, "Album");
            return ds;
        }

        //[DataObjectMethod(DataObjectMethodType.Select, false)]
        //public SelfAspNet.Chap05.AlbumDataset.AlbumDataTable GetAlbumPaging(int startRowIndex, int maximumRows)
        //{
            //SqlCommand comm = this.Connection.CreateCommand();
            //comm.CommandText = $"SELECT aid, comment, updated, favorite, category FROM Album ORDER BY updated DESC OFFSET {startRowIndex} ROWS FETCH NEXT {maximumRows} ROWS ONLY";
            //this.Adapter.SelectCommand = comm;
            //AlbumDataset ds = new AlbumDataset();
            //this.Adapter.Fill(ds, "Album");
            //return ds.Album;
        //}
    }
}