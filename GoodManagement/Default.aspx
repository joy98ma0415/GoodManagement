<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GoodManagement.Default" %>

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
            height: 291px;
        }

        .style2 {
            height: 25px;
        }

        .style3 {
        }

        .style4 {
            height: 25px;
            width: 255px;
        }

        .style5 {
            height: 102px;
        }

        .style6 {
            width: 255px;
            height: 102px;
        }

        .style7 {
            width: 208px;
            height: 102px;
        }

        .style8 {
            width: 208px;
        }

        .style9 {
            height: 25px;
            width: 208px;
        }

        .auto-style3 {
            font-size: large;
        }
        .auto-style8 {
            font-size: Small;
            width: 300px;
        }
        .auto-style9 {
            width: 1201px;
            height: 291px;
        }
        .auto-style10 {
            font-size: large;
            width: 300px;
            height: 72px;
        }
        .auto-style13 {
            width: 385px;
            height: 217px;
        }
        .auto-style15 {
            font-size: xx-large;
            height: 72px;
        }
        .auto-style16 {
            width: 300px;
            height: 73px;
        }
    </style>
    <asp:Table ID="Table1" runat="server" Height="85" BackColor="Plum"></asp:Table>
    <div>
        <h1 class="textAlign">商品訊息管理顯示畫面</h1>
    </div>
    <div>
        <table class="auto-style9">
            <tr>
                <td class="auto-style8">
                    <asp:RadioButtonList ID="MySelect" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True">商品代碼</asp:ListItem>
                        <asp:ListItem>生產商</asp:ListItem>
                        <asp:ListItem>商品名稱</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="auto-style10">
                    <asp:TextBox ID="QueryText" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style15">&nbsp;&nbsp;
                <asp:Button ID="Search" runat="server" Text="查詢" Height="38px"
                    OnClick="Search_Click" Style="margin-bottom: 0px" Width="95px" CssClass="auto-style3" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="ShowAll" runat="server" Height="38px" Text="顯示全部"
                    OnClick="Unnamed1_Click" Style="margin-bottom: 0px" CssClass="auto-style3" />
                </td>
            </tr>
            <tr>
                <td class="auto-style16">
                    <asp:LinkButton ID="InsRecord" runat="server" OnClick="InsRecord_Click" CssClass="auto-style3">添加商品</asp:LinkButton>
                </td>
                <td class="auto-style13" colspan="2" rowspan="3">
                    <asp:GridView ID="GridView1" runat="server" Width="645px" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                        <RowStyle BackColor="White" ForeColor="#330099" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                        <SortedAscendingCellStyle BackColor="#FEFCEB" />
                        <SortedAscendingHeaderStyle BackColor="#AF0101" />
                        <SortedDescendingCellStyle BackColor="#F6F0C0" />
                        <SortedDescendingHeaderStyle BackColor="#7E0000" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="auto-style16">
                    <asp:LinkButton ID="UpdateRecord" runat="server" OnClick="UpdateRecord_Click" CssClass="auto-style3">修改商品</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="auto-style16">
                    <asp:LinkButton ID="DelRecord" runat="server" OnClick="DelRecord_Click" CssClass="auto-style3">刪除商品</asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>