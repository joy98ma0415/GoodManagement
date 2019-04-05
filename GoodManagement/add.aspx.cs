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
    public partial class add : System.Web.UI.Page
    {
        private string ConnSql = @"Data Source=azurewebapplication.database.windows.net;Initial Catalog=webapp;User ID=joy51744;Password=Joy98ma0415;Connect Timeout=60;Encrypt=True;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

        protected void Page_Load(object sender, EventArgs e)
        {
            this.Title = "添加新商品";
            TextBox1.Focus();
        }

        protected void BackHome_Click1(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

        protected void Submit_Click1(object sender, EventArgs e)
        {
            //string ConnSql = "Data Source=.;Initial Catalog=货品信息管理;Integrated Security=True";
            //声明Conn为一个SQL Server连接对象
            SqlConnection Conn = new SqlConnection(ConnSql);
            Conn.Open();        //打开连接
            SqlDataAdapter da = new SqlDataAdapter();
            string SelectSql = "select * from tb_Goods";
            da.SelectCommand = new SqlCommand(SelectSql, Conn);
            SqlCommandBuilder scb = new SqlCommandBuilder(da);  //为DataAdapter自动生成更新命令
            DataSet ds = new DataSet();
            da.Fill(ds);
            Conn.Close();
            DataRow NewRow = ds.Tables[0].NewRow();     //向DataSet第一个表对象中添加一个新行
            NewRow["商品代碼"] = TextBox1.Text;     //为新行的各字段赋值
            NewRow["生產商"] = TextBox2.Text;
            NewRow["經辦人"] = TextBox3.Text;
            NewRow["採購日期"] = TextBox4.Text;
            NewRow["商品名稱"] = TextBox5.Text;
            NewRow["單價"] = TextBox6.Text;
            NewRow["數量"] = TextBox7.Text;
            ds.Tables[0].Rows.Add(NewRow);          //将新建行添加到DataSet第一个表对象中
            da.Update(ds);          //将DataSet中数据变化提交到数据库（更新数据库）
            Response.Write("<script language=javascript>alert('添加成功，請單擊返回回到主頁面！');</script>");
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
        }
    }
}