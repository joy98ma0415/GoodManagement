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
    public partial class Default : System.Web.UI.Page
    {
        private string ConnSql = @"Data Source=azurewebapplication.database.windows.net;Initial Catalog=webapp;User ID=joy51744;Password=Joy98ma0415;Connect Timeout=60;Encrypt=True;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

        protected void Page_Load(object sender, EventArgs e)
        {
            this.Title = "商品訊息管理";

            //string  ConnSql = "Data Source=.;Initial Catalog=货品信息管理;Integrated Security=True";

            //声明Conn为一个SQL Server连接对象
            SqlConnection Conn = new SqlConnection(ConnSql);
            Conn.Open();  //打开连接
            SqlDataAdapter da = new SqlDataAdapter();  //创建DataAdapter对象
            string SelectSql = "select * from tb_Goods";
            da.SelectCommand = new SqlCommand(SelectSql, Conn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            Conn.Close();
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void Search_Click(object sender, EventArgs e)
        {        //string ConnSql = "Data Source=.;Initial Catalog=货品信息管理;Integrated Security=True";
                 //声明Conn为一个SQL Server连接对象
            SqlConnection Conn = new SqlConnection(ConnSql);
            Conn.Open();        //打开连接
            SqlDataAdapter da = new SqlDataAdapter();       //创建DataAdapter对象
            string SelectSql = "";
            switch (MySelect.SelectedIndex)
            {
                case 0:
                    SelectSql = "select * from tb_Goods where 商品代碼  like '%" + QueryText.Text + "%'";
                    break;

                case 1:
                    SelectSql = "select * from tb_Goods where 生產商 like N'%" + QueryText.Text + "%'";
                    break;

                case 2:
                    SelectSql = "select * from tb_Goods where 商品名稱 like N'%" + QueryText.Text + "%'";
                    break;
            }
            da.SelectCommand = new SqlCommand(SelectSql, Conn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            Conn.Close();
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            Page_Load(sender, e);
        }

        protected void InsRecord_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/add.aspx");
        }

        protected void UpdateRecord_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/update.aspx");
        }

        protected void DelRecord_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/del.aspx");
        }
    }
}