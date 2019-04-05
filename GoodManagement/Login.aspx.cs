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
    public partial class _Default : Page
    {
        private string ConnSql = @"Data Source=azurewebapplication.database.windows.net;Initial Catalog=webapp;User ID=joy51744;Password=Joy98ma0415;Connect Timeout=60;Encrypt=True;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //string ConnSql = "Data Source=.;Initial Catalog=货品信息管理;Integrated Security=True";
            string userName = txtUserName.Text.ToString().Trim();
            string userPwd = txtPwd.Text.ToString().Trim();
            string selectStr = "Select * from td_GoodsAdmain where UserName= '" + userName + "'";
            SqlConnection conn = new SqlConnection(ConnSql);
            SqlCommand cmd = new SqlCommand(selectStr, conn);

            try
            {
                conn.Open();             //打开连接
                SqlDataReader sdr = cmd.ExecuteReader(); //执行查询
                if (sdr.Read())                 //如果该用户存在
                {
                    if (sdr.GetString(1) == userPwd) //密码正确
                    {
                        Session["userName"] = userName;

                        Response.Redirect("Default.aspx");
                    }
                    else                        //密码错误，给出提示信息！
                    {
                        lblMessage.Text = "您輸入的密碼有誤，請檢查後重新輸入！";
                    }
                }
                else                            //用户不存在或用户名输入错误
                {
                    lblMessage.Text = "該用戶不存在或用戶名輸入錯誤，請檢查後重新輸入！";
                }
            }
            catch (Exception ee)
            {
                Response.Write("<script language=javascript>alert('" + ee.Message.ToString() + "')</script>");
            }
            finally
            {
                conn.Close();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            txtUserName.Text = "";
            txtPwd.Text = "";
        }

        protected void txtUserName_TextChanged(object sender, EventArgs e)
        {
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
        }
    }
}