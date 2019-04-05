using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace GoodManagement
{
    public partial class del : System.Web.UI.Page
    {
        private string ConnSql = @"Data Source=azurewebapplication.database.windows.net;Initial Catalog=webapp;User ID=joy51744;Password=Joy98ma0415;Connect Timeout=60;Encrypt=True;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

        protected void Page_Load(object sender, EventArgs e)
        {
            this.Title = "刪除紀錄";
            MsgLable.Text = "單擊刪除將刪除當前紀錄";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection Conn = new SqlConnection(ConnSql);
            Conn.Open();        //打开连接
            SqlDataAdapter da = new SqlDataAdapter();
            string SelectSql = "select * from tb_Goods where 商品代碼 ='" + DropDownList1.Text + "'";
            da.SelectCommand = new SqlCommand(SelectSql, Conn);
            SqlCommandBuilder scb = new SqlCommandBuilder(da);  //为DataAdapter自动生成更新命令
            DataSet ds = new DataSet();
            da.Fill(ds);
            Conn.Close();
            DataRow DeleteRow = ds.Tables[0].Rows[0];   //指定要删除的行索引值（删除第4条记录）
            DeleteRow.Delete();     //调用行删除方法
            da.Update(ds);
            DropDownList1.DataSourceID = "SqlDataSource1";
            DropDownList1.DataBind();
            GridView1.DataSourceID = "SqlDataSource2";
            GridView1.DataBind();
            Response.Write("<script language=javascript>alert('紀錄刪除成功！');</script>");
        }

        protected void BackHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}