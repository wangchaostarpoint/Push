<%@ Page Language="C#" AutoEventWireup="true" Title="分院出案报告申请单-打印" MasterPageFile="~/UI/Master/ObjectPrint.Master"
    CodeBehind="ApplyFormPrint.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Publish.Print.ApplyFormPrint" %>

<%@ Import Namespace="System.Data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPrint" runat="server">
    <style type="text/css">
        .divBill * {
            font-weight: normal;
            text-align: left;
            margin: 0px;
            padding: 0px;
        }

        .divBill {
            /*page-break-after: always;*/
            padding-bottom: 10px;
            width: 630px;
            margin: 0px auto;
            font-size: 10.5pt;
        }

        .printtable {
            font-family: 宋体;
            font-family: 宋体 !important;
            border-collapse: collapse;
            border: 1px;
            width: 100%;
            font-size: 10.5pt;
        }

            .printtable th {
                font-family: 宋体;
                font-family: 宋体 !important;
                border: 1px #000000 solid;
                font-size: 10.5pt;
                text-align: center;
                vertical-align: middle;
                line-height: 40px;
            }

            .printtable td {
                font-family: 宋体;
                font-family: 宋体 !important;
                border: 1px #000000 solid;
                font-size: 10.5pt;
                height: 12.75pt;
                text-align: center;
            }

        .pritTr {
            height: 15px;
        }

        .tdNo {
            BORDER: #f6f6f6 0px solid;
        }

        .fotertable {
            font-family: 宋体;
            font-family: 宋体 !important;
            border-collapse: collapse;
            border: 1px;
            width: 100%;
            font-size: 10.5pt;
        }

            .fotertable td {
                font-family: 宋体 !important;
                border: 1px #000000 solid;
                font-size: 10.5pt;
                BORDER: #f6f6f6 0px solid;
            }

        .td-Header {
            font-family: 宋体 !important;
            border: 1px #000000 solid;
            font-size: 10.5pt;
            BORDER: #f6f6f6 0px solid;
            width: 15%;
            font-weight: bold;
        }

        .td-r {
            font-family: 宋体 !important;
            border: 1px #000000 solid;
            font-size: 10.5pt;
            BORDER: #f6f6f6 0px solid;
            width: 15%;
            text-align: right;
        }

        .td-l {
            font-family: 宋体 !important;
            border: 1px #000000 solid;
            font-size: 10.5pt;
            BORDER: #f6f6f6 0px solid;
            width: 15%;
            text-align: left;
        }

        .td-r2 {
            font-family: 宋体 !important;
            border: 1px #000000 solid;
            font-size: 10.5pt;
            BORDER: #f6f6f6 0px solid;
            width: 13%;
            text-align: right;
        }

        .td-l2 {
            font-family: 宋体 !important;
            border: 1px #000000 solid;
            font-size: 10.5pt;
            BORDER: #f6f6f6 0px solid;
            width: 35%;
            text-align: left;
        }


        .td-r3 {
            font-family: 宋体 !important;
            border: 1px #000000 solid;
            font-size: 10.5pt;
            BORDER: #f6f6f6 0px solid;
            width: 13%;
            text-align: right;
        }

        .td-r3-3 {
            font-family: 宋体 !important;
            border: 1px #000000 solid;
            font-size: 10.5pt;
            BORDER: #f6f6f6 0px solid;
            width: 8%;
            text-align: right;
        }

        .td-l3 {
            font-family: 宋体 !important;
            border: 1px #000000 solid;
            font-size: 10.5pt;
            BORDER: #f6f6f6 0px solid;
            width: 15%;
            text-align: left;
        }

        .td-l3-2 {
            font-family: 宋体 !important;
            border: 1px #000000 solid;
            font-size: 10.5pt;
            BORDER: #f6f6f6 0px solid;
            width: 35%;
            text-align: left;
        }

        .title {
            font-family: 黑体;
            font-family: 黑体 !important;
            text-align: center;
            font-size: 16pt;
            line-height: 80px;
        }

        .numText {
            font-size: 42.0pt;
            font-family: 黑体;
            mso-bidi-font-family: Tahoma;
            color: black;
            mso-font-kerning: 0pt;
            mso-ansi-language: EN-US;
            mso-fareast-language: ZH-CN;
            mso-bidi-language: AR-SA;
            mso-no-proof: yes
        }

        .allfontSezi {
            font-size: 10.5pt;
        }
    </style>
    <script type="text/javascript">
        function printMargin() {
            return "20,20,20,5"
        }
        function printOrientation() {
            return true;
        }
        $("#button_exp1").show();

    </script>
    <div id="divBill" class="divBill">
        <div class="projectContent">
            <div class="title"><%=ShowDeptName %> 出案报告申请单</div>
            <table>

                <tr>
                    <td class="td-r3">发送单位：
                    </td>
                    <td class="td-l3-2">
                        <%=ShowCustoerName %>
                    </td>
                    <td class="td-r3">项目编号：
                    </td>
                    <td class="td-l3" style="width: 8%">
                        <%=ShowPrjCode %>
                    </td>
                    <td class="td-r3-3">序号：
                    </td>
                    <td class="td-l3" style="width: 27%">
                        <%=ShowSendCode %>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td class="td-r2">项目名称：
                    </td>
                    <td colspan="2" class="td-l2"><%=ShowPrjName %> </td>
                    <td class="td-r2">设计阶段： </td>
                    <td class="td-l2">
                        <%=ShowPhase %>
                    </td>
                </tr>
            </table>
            <table class="printtable">
                <colgroup>
                    <col width="40px" />
                    <col width="200px" />
                    <col width="40px" />
                    <col width="40px" />
                    <col width="40px" />
                    <col width="40px" />
                    <col width="200px" />
                </colgroup>
                <tbody>
                    <tr style="height: 15px;">
                        <td class="td-Header">序号
                        </td>
                        <td class="td-Header">文件名称
                        </td>
                        <td class="td-Header">总印制数
                        </td>
                        <td class="td-Header">提交客户份数
                        </td>
                        <td class="td-Header">自留份数
                        </td>
                        <td class="td-Header">归档份数
                        </td>
                        <td class="td-Header">备注
                        </td>

                    </tr>
                    <% 
                        foreach (DataRow dr1 in DtContent.Rows)
                        {
                    %>
                    <tr>
                        <td style="text-align: center;">
                            <%=dr1["SortIndex"].ToString()%>
                        </td>
                        <td style="padding-left: 2px;">
                            <%=dr1["WBSName"].ToString()%>
                        </td>
                        <td style="padding-left: 2px;">
                            <%=dr1["SumNum"].ToString()%>
                        </td>
                        <td style="padding-left: 2px;">
                            <%=dr1["SendNum"].ToString()%>
                        </td>
                        <td style="padding-left: 2px;">
                            <%=dr1["SaveNum"].ToString()%>
                        </td>
                        <td style="padding-left: 2px;">
                            <%=dr1["ArchiveNum"].ToString()%>
                        </td>
                        <td style="padding-left: 2px;">
                            <%=dr1["BZ"].ToString()%>
                        </td>
                    </tr>
                    <%}  %>
                    <tr>
                        <td>说明
                        </td>
                        <td colspan="6" style="height: 45px;"></td>
                    </tr>
                </tbody>
            </table>
            <table class="printtable">
                <tr style="height: 65px">
                    <td class="td-r" style="border-top: none  0px solid;">经营处负责人 
                    </td>
                    <td class="td-l" style="border-top: none  0px solid;">
                        <%=ShowJYPeople %>
                    </td>
                    <td class="td-r" style="border-top: none  0px solid;">生产处（总工）负责人 
                    </td>
                    <td class="td-l" style="border-top: none  0px solid;">
                        <%=ShowSCPeople %>
                    </td>
                    <td class="td-r" style="border-top: none  0px solid;">分院负责人
                    </td>
                    <td class="td-l" style="border-top: none  0px solid;">
                        <%=ShowFYPeople %>
                    </td>
                </tr>
                <tr style="height: 65px">
                    <td>合同确认 
                    </td>
                    <td>
                        <%=ShowHTQRPeople %>
                    </td>
                    <td class="td-r">归档确认
                    </td>
                    <td class="td-l">
                        <%=ShowGDQRPeople %>
                    </td>
                    <td class="td-r">申请人
                    </td>
                    <td class="td-l">
                        <%=ShowSQRPeople %>
                    </td>
                </tr>
            </table>
            <table class="fotertable">
                <tr>
                    <td class="td-r"></td>
                    <td class="td-r"></td>
                    <td class="td-r"></td>
                    <td class="td-r">日期：<%=ShowNowDate %>
                    </td>

                </tr>
            </table>
            <!-- 第一联结束 -->
        </div>
    </div>
    <input id="hiShowNum" runat="server" type="hidden" value="15" />
</asp:Content>
