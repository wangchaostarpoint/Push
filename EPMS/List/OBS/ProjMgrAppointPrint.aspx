<%@ Page Title="设总任命书打印" Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectPrint.Master"
    CodeBehind="ProjMgrAppointPrint.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.OBS.ProjMgrAppointPrint" %>

<asp:Content ID="Cotent1" ContentPlaceHolderID="ContentPrint" runat="server">
    <script type="text/javascript">
        function printMargin() {
            return "30,35,30,25"//左上右下
        }
        function printOrientation() {
            return true;
        }
        //点击打印按钮添加页眉页脚
        function setControlsBeforPrint() {
            var factory = document.getElementById("factory");
            factory.printing.header = "";        //页眉
            factory.printing.footer = "第 &p 页/共 &P 页";        //页脚
        }
        //打印结束后取消页眉页脚
        function setControlsAfterPrint() {
            var factory = document.getElementById("factory");
            factory.printing.header = "";        //页眉
            factory.printing.footer = "";        //页脚
        }
        //点击打印预览按钮添加页眉页脚
        function setControlsBeforPrint() {
            var factory = document.getElementById("factory");
            factory.printing.header = "";        //页眉
            factory.printing.footer = "第 &p 页/共 &P 页";        //页脚
        }
        //打印预览结束后取消页眉页脚
        function setControlsAfterPrint() {
            var factory = document.getElementById("factory");
            factory.printing.header = "";        //页眉
            factory.printing.footer = "";        //页脚d
        }
    </script>
    <style type="text/css">
        /*****<!---detail列表--->****/.kpms-gridview1
        {
            width: 100%;
            border-spacing: 0px;
            border-collapse: collapse;
            border: 0px solid;
            font-size: 14px;
        }
        .kpms-gridview1 th
        {
            height: 25px;
            white-space: nowrap;
            word-break: keep-all;
        }
        .kpms-gridview1 td
        {
            height: 25px;
        }
        .kpms-gridview1header
        {
            text-align: center;
        }
        .kpms-gridview1header th
        {
            border: 1px solid;
        }
        .kpms-gridviewbody-ji1
        {
            background: #fff;
        }
        .kpms-gridviewbody-ji1 td
        {
            border: 1px solid;
        }
        .kpms-gridviewbody-ou1
        {
            background-color: #fff;
        }
        .kpms-gridviewbody-ou1 td
        {
            border: 1px solid;
        }
        .cTitle
        {
            text-align: center;
        }
        .smalltb td
        {
            border: 0;
            font-size: 18px;
            text-align: left;
            height: 50px;
        }
        .b
        {
            font-weight: bold;
        }
    </style>
    <%--       <div id="divBill" runat="server" style="page-break-after: always">
        <div class="kpms-print-maintitle">--%>
    <div id="divBill" runat="server">
        <table width="100%">
            <tr>
                <td rowspan="2">
                    <img src="../../../Themes/UserImages/imglogo.png" width="100px" height="93px" />
                </td>
                <td style="font-size: 50px;">
                    <b>岗 位 任 命 书</b>
                </td>
            </tr>
            <tr>
                <td style="font-size: 30px;">
                    陕西省水利电力勘测设计研究院
                </td>
            </tr>
        </table>
        <%-- <div class="kpms-print-maintitle" style="width: 100%">
            <asp:Label ID="Label1" runat="server" Style="font-family: 华文中宋;">广西壮族自治区 电力勘测设计研究院客饭申请报销单</asp:Label>
        </div>--%>
        <%--<div>
            <div style="line-height: 28.0pt; text-align: right; font-size: 14px; font-family: 宋体;
                font-weight: bold">
                流水号：<asp:Label ID="lbExpenseNo" runat="server"></asp:Label>
                &nbsp
            </div>
        </div>--%>
        <br />
        <br />
        <table class="kpms-table-inner" style="font-size: 18px;">
            <tr>
                <td style="width: 15%;">
                    工程名称
                </td>
                <td>
                    <asp:Label ID="lbProjName" runat="server" CssClass="b" Style="line-height: 30px;">
                    </asp:Label>
                </td>
                <td style="width: 15%">
                    设计阶段
                </td>
                <td style="width: 20%">
                    <asp:Label ID="lbPhase" runat="server" CssClass="b">
                    </asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    任<br />
                    <br />
                    <br />
                    命<br />
                    <br />
                    <br />
                    内<br />
                    <br />
                    <br />
                    容
                    <br />
                    <br />
                </td>
                <td colspan="3" style="text-align: left;">
                    <br />
                    <table class="smalltb">
                        <tr>
                            <td>
                                主管总工程师：
                            </td>
                            <td>
                                <asp:Label ID="lbZG" runat="server" CssClass="b">
                                </asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                设计总工程师：
                            </td>
                            <td>
                                <asp:Label ID="lbSZ" runat="server" CssClass="b">
                                </asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                开 始 时 间：
                            </td>
                            <td>
                                <!-- 项目立项日期-->
                                <asp:Label ID="lbStartTime" runat="server">
                                </asp:Label>
                            </td>
                        </tr>
                    </table>
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                    任<br />
                    <br />
                    <br />
                    命<br />
                    <br />
                    <br />
                    要<br />
                    <br />
                    <br />
                    求
                    <br />
                    <br />
                </td>
                <td colspan="3" style="text-align: left;">
                    <br />
                    <asp:Label ID="lbReqire" Style="line-height: 35px;" runat="server" Text="&nbsp;&nbsp;&nbsp;&nbsp;祝贺你们接受这一重要工作，相信你们能够在参加项目的全体人员的支持下做好这一工作，你们将执行国家有关法律、法规、标准和规程规范，坚决执行我院的质量管理体系程序文件的规定，认真听取业主的意见，充分发挥个人的聪明才智，全心全意地为业主服务，你们的工作责任和伴随而来的荣誉是终生的。">
                    </asp:Label>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    批
                    <br />
                    <br />
                    <br />
                    准
                </td>
                <td colspan="3" style="text-align: left;">
                    <br />
                    <table class="smalltb">
                        <tr>
                            <td>
                                主管院长：
                            </td>
                            <td>
                                <img runat="server" id="imgYZ" />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Label runat="server" ID="lbYzTime"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <br />
                </td>
            </tr>
        </table>
        <br />
        <br />
        <table style="font-size: 18px;">
            <tr>
                <td>
                    注：本表适用于工程类或非工程类工作的岗位任命，由上岗人持有
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
