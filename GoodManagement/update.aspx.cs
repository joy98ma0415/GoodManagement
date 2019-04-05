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
    public partial class update : System.Web.UI.Page
    {
        private string ConnSql = @"Data Source=azurewebapplication.database.windows.net;Initial Catalog=webapp;User ID=joy51744;Password=Joy98ma0415;Connect Timeout=60;Encrypt=True;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void SubMit_Click(object sender, EventArgs e)
        {
            //string ConnSql = "Data Source=.;Initial Catalog=货品信息管理;Integrated Security=True";
            SqlConnection Conn = new SqlConnection(ConnSql);
            Conn.Open();        //打开连接
            SqlDataAdapter da = new SqlDataAdapter();
            string SelectSql = "select * from tb_Goods where 商品代碼 ='" + DropDownList1.Text + "'";
            da.SelectCommand = new SqlCommand(SelectSql, Conn);
            SqlCommandBuilder scb = new SqlCommandBuilder(da);
            DataSet ds = new DataSet();
            da.Fill(ds);
            DataRow MyRow = ds.Tables[0].Rows[0];   //从表对象中得到要修改的行
            MyRow["生產商"] = TextBox1.Text;
            MyRow["經辦人"] = TextBox2.Text;
            MyRow["採購日期"] = TextBox3.Text;
            MyRow["商品名稱"] = TextBox4.Text;
            MyRow["單價"] = TextBox5.Text;
            MyRow["數量"] = TextBox6.Text;
            da.Update(ds);                  //提交更新
            Response.Write("<script language=javascript>alert('紀錄更新成功，請單擊返回按鈕回到主畫面！');</script>");
        }

        protected void BackHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("default.aspx");
        }

        protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            //string ConnSql = "Data Source=.;Initial Catalog=货品信息管理;Integrated Security=True";
            //声明Conn为一个SQL Server连接对象
            SqlConnection Conn = new SqlConnection(ConnSql);
            Conn.Open();        //打开连接
            SqlDataAdapter da = new SqlDataAdapter();
            string SelectSql = "select * from tb_Goods where 商品代碼 ='" + DropDownList1.Text + "'";
            da.SelectCommand = new SqlCommand(SelectSql, Conn);
            SqlCommandBuilder scb = new SqlCommandBuilder(da);
            DataSet ds = new DataSet();
            da.Fill(ds);
            Conn.Close();
            DataRow MyRow = ds.Tables[0].Rows[0];   //从表对象中得到要修改的行
            TextBox1.Text = MyRow["生產商"].ToString();
            TextBox2.Text = MyRow["經辦人"].ToString();
            TextBox3.Text = MyRow["採購日期"].ToString();
            TextBox4.Text = MyRow["商品名稱"].ToString();
            TextBox5.Text = MyRow["單價"].ToString();
            TextBox6.Text = MyRow["數量"].ToString();
        }
    }
}