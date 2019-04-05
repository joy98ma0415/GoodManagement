<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="del.aspx.cs" Inherits="GoodManagement.del" %>

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
            height: 341px;
        }

        .style2 {
            height: 54px;
        }

        .auto-style3 {
            font-size: xx-large;
            color: #FFFFFF;
            height: 28px;
        }
    </style>
    <asp:Table ID="Table1" runat="server" Height="85" BackColor="Plum"></asp:Table>
    <div>
        <h1 class="textAlign">刪除商品訊息管理</h1>
    </div>
    <div>
        <table class="style1">
            <tr>
                <td class="auto-style3">
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"
                        DataSourceID="SqlDataSource1" DataTextField="商品代碼" DataValueField="商品代碼" Height="29px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                        DataKeyNames="商品代碼" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" Height="257px" Width="955px" AllowPaging="True" PageSize="5">
                        <Columns>
                            <asp:BoundField DataField="商品代碼" HeaderText="商品代碼" ReadOnly="True"
                                SortExpression="商品代碼" />
                            <asp:BoundField DataField="生產商" HeaderText="生產商" SortExpression="生產商" />
                            <asp:BoundField DataField="經辦人" HeaderText="經辦人" SortExpression="經辦人" />
                            <asp:BoundField DataField="採購日期" HeaderText="採購日期" SortExpression="採購日期" />
                            <asp:BoundField DataField="商品名稱" HeaderText="商品名稱" SortExpression="商品名稱" />
                            <asp:BoundField DataField="單價" HeaderText="單價" SortExpression="單價" />
                            <asp:BoundField DataField="數量" HeaderText="數量" SortExpression="數量" />
                        </Columns>
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
                    <asp:Label ID="MsgLable" runat="server"></asp:Label>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                        ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                        SelectCommand="SELECT [商品代碼] FROM [tb_Goods] ORDER BY [商品代碼]"></asp:SqlDataSource>
                    <asp:Button ID="Submit" runat="server" Height="32px" OnClick="Button2_Click"
                        Text="刪除" />
                    <asp:Button ID="BackHome" runat="server" OnClick="BackHome_Click" Text="返回" Style="height: 26px" />
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                        ConnectionString="<%$ ConnectionStrings:DefaultConnection %>"
                        SelectCommand="SELECT * FROM [tb_Goods] WHERE ([商品代碼] = @商品代碼)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="商品代碼"
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>