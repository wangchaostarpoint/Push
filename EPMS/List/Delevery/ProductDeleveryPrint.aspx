<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductDeleveryPrint.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Delevery.ProductDeleveryPrint" MasterPageFile="~/UI/Master/ObjectPrint.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPrint" runat="server">
    <style type="text/css">
        .print-noborder
        {
            border: none;
            width: 600px;
            border-collapse: collapse;
            border-spacing: 0px;
            padding: 0px;
            margin: 0px;
            line-height: 25px;
            margin: 0 auto;
        }
        .print-noborder td
        {
            border: none;
        }
        .kpms-table-inner td
        {
            font-size: 11pt !important;
        }
    </style>
    <script type="text/javascript">
        function printMargin() {
            return "22,20,23,25"
        }
        function printOrientation() {
            return false;
        }
    </script>
    <div id="divBill" runat="server">
        <font face="宋体"><span style="font-size: 10pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
            mso-ascii-font-family: 'Times New Roman'">
            <p class="MsoNormal" style="text-align: center" align="center">
                <b style="mso-bidi-font-weight: normal"><span style="font-size: 16pt; line-height: 150%;
                    font-family: 宋体; letter-spacing: 10pt; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">资料发送通知单</span></b><b style="mso-bidi-font-weight: normal"><span
                        lang="EN-US" style="font-size: 16pt; line-height: 150%; letter-spacing: 10pt">
                        <o:p></o:p>
                    </span></b>
            </p>
            <p class="MsoNormal" style="text-align: center" align="center">
                <span style="font-size: 10pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">广西壮族自治区水利电力勘测设计研究院有限责任公司</span><span lang="EN-US"><span
                        style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </span><span style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span
                        style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span
                            style="font-size: 10pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                            mso-ascii-font-family: 'Times New Roman'">冀电设密字
                            <asp:Label ID="lbDeliverBill" runat="server"></asp:Label></span><span style="font-size: 10pt;
                                font-family: 宋体; mso-hansi-font-family: 'Times New Roman'; mso-ascii-font-family: 'Times New Roman'">号</span></p>
            <p class="MsoNormal">
                <span style="font-size: 10pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lbCustomer" runat="server"></asp:Label>，下列成品现已晒印完毕随单寄上请查收。</span><span
                        lang="EN-US"><span style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </span></span><span style="font-size: 10pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                            mso-ascii-font-family: 'Times New Roman'">此致</span></p>
            <p class="MsoNormal" style="text-align: right" align="right">
                <span lang="EN-US">
                    <o:p><asp:label id="lbSendDate" runat="server"></asp:label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</o:p>
                </span>
            </p>
            <p class="MsoNormal" style="text-align: center">
                <asp:DataGrid ID="gvDeliverList" runat="server" Font-Size="10pt" Width="100%" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundColumn DataField="ProjectCode" HeaderText="项目编号">
                            <HeaderStyle HorizontalAlign="Center" Width="80px"></HeaderStyle>
                            <ItemStyle HorizontalAlign="left"></ItemStyle>
                        </asp:BoundColumn>
                        <asp:TemplateColumn HeaderText="项目名称">
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle HorizontalAlign="left"></ItemStyle>
                            <ItemTemplate>
                                <div style="word-break: break-all !important; white-space: normal !important; width: 210px;">
                                    <asp:Label ID="lbProjectName" Text='<%# Eval("ProjectName")%>' runat="server"></asp:Label></div>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <%-- <asp:BoundColumn DataField="ProjectName" HeaderText="项目名称">
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle HorizontalAlign="left"></ItemStyle>
                        </asp:BoundColumn>--%>
                        <asp:BoundColumn DataField="WBSCode" HeaderText="卷册编号">
                            <HeaderStyle HorizontalAlign="Center" Width="80px"></HeaderStyle>
                            <ItemStyle HorizontalAlign="left"></ItemStyle>
                        </asp:BoundColumn>
                        <%-- <asp:BoundColumn DataField="WBSName" HeaderText="卷册名称">
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle HorizontalAlign="left"></ItemStyle>
                        </asp:BoundColumn>--%>
                        <asp:TemplateColumn HeaderText="卷册名称">
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle HorizontalAlign="left"></ItemStyle>
                            <ItemTemplate>
                                <div style="word-break: break-all !important; white-space: normal !important; width: 210px;">
                                    <asp:Label ID="lbWBSName" Text='<%# Eval("WBSName")%>' runat="server"></asp:Label></div>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:BoundColumn DataField="CoverCount" HeaderText="套">
                            <HeaderStyle HorizontalAlign="Center" Width="30px"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Right"></ItemStyle>
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="DrawingCount" HeaderText="张">
                            <HeaderStyle HorizontalAlign="Center" Width="30px"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Right"></ItemStyle>
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="PageCount" HeaderText="本">
                            <HeaderStyle HorizontalAlign="Center" Width="30px"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Right"></ItemStyle>
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="Memo" HeaderText="备注">
                            <HeaderStyle HorizontalAlign="Center" Width="80px"></HeaderStyle>
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="Weight" HeaderText="公斤数<br/>(kg)">
                            <HeaderStyle HorizontalAlign="Center" Width="50px"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Right"></ItemStyle>
                        </asp:BoundColumn>
                    </Columns>
                </asp:DataGrid>
            </p>
            <p class="MsoNormal">
                <span style="font-size: 10pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">
                    <o:p>&nbsp;&nbsp;&nbsp;<asp:label id="lbMemo" runat="server"></asp:label></o:p>
                </span>
            </p>
            <p class="MsoNormal">
                <span style="font-size: 10pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">
                    <o:p>&nbsp;&nbsp;&nbsp;部门主管</o:p>
                </span>
            </p>
            <p class="MsoNormal">
                <span style="margin-left: 60%; font-size: 10pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">发送人：广西壮族自治区水利电力勘测设计研究院&nbsp;
                    <asp:Label ID="lbSendManName" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span
                        lang="EN-US">
                        <o:p></o:p>
                    </span>
            </p>
            <br />
            <p class="MsoNormal">
                <span style="margin-left: 60%; font-size: 10pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">接收人：
                    <asp:Label ID="lbReceiveManName" runat="server"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
            </p>
        </span></font>
    </div>
</asp:Content>
