<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="update.aspx.cs" Inherits="GoodManagement.update" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function getWidth() {
            var intViewportWidth = window.innerWidth;
            var w = window.innerWidth;
            var h = window.innerHeight;
            var ow = window.outerWidth; //including toolbars and status bar etc.
            var oh = window.outerHeight;
            if (window.matchMedia("(min-width: 400px)").matches) {
                /* the viewport is at least 400 pixels wide */
            }
            else {
                /* the viewport is less than 400 pixels wide */
            }
            if (self.innerWidth) {
                return self.innerWidth;
            }
            if (document.documentElement && document.documentElement.clientWidth) {
                return document.documentElement.clientWidth;
            }
            if (document.body) {
                return document.body.clientWidth;
            }
        }
    </script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.js"></script>
    <script type="text/javascript">
        $(function () {
            // See if this is a touch device
            if ('ontouchstart' in window) {
                // Set the correct body class
                $('body').removeClass('no-touch').addClass('touch');

                // Add the touch toggle to show text
                $('div.boxInner img').click(function () {
                    $(this).closest('.boxInner').toggleClass('touchFocus');
                });
            }
        });
    </script>
    <style type="text/css">
        .style1 {
            width: 100%;
        }

        .style2 {
            width: 179px;
        }

        .auto-style3 {
            width: 1205px;
            height: 680px;
        }

        .auto-style5 {
            font-size: large;
            color: #000000;
            height: 98px;
            width: 602px;
        }

        .auto-style8 {
            font-size: large;
            color: #000000;
            height: 97px;
            width: 602px;
        }

        .auto-style9 {
            width: 603px;
        }
    </style>
    <asp:Table ID="Table1" runat="server" Height="85" BackColor="Plum"></asp:Table>
    <div>
        <h1 class="textAlign">更新商品訊息管理</h1>
    </div>
    <div>
        <table class="auto-style3">
            <tr>
                <td class="auto-style8">商品代碼</td>
                <td class="auto-style9">
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"
                        DataSourceID="SqlDataSource1" DataTextField="商品代碼" DataValueField="商品代碼"
                        OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">生產商</td>
                <td class="auto-style9">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">經辦人</td>
                <td class="auto-style9">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">採購日期</td>
                <td class="auto-style9">
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">商品名稱</td>
                <td class="auto-style9">
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">單價</td>
                <td class="auto-style9">
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">數量</td>
                <td class="auto-style9">
                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
        <asp:Button ID="SubMit" runat="server" OnClick="SubMit_Click" Text="提交" CssClass="style6" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="BackHome" runat="server" OnClick="BackHome_Click" Text="返回" CssClass="style6" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
            SelectCommand="SELECT [商品代碼] FROM [tb_Goods] ORDER BY [商品代碼]"></asp:SqlDataSource>
    </div>
</asp:Content>