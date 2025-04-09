<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MapChargeInfoPrint.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Publish.MapChargeInfoPrint" MasterPageFile="~/UI/Master/ObjectPrint.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPrint" runat="server">
    <script type="text/javascript">
        function printMargin() {
            return "22,20,20,25"
        }
    </script>
    <table class="MsoTableGrid" id="Table1" style="border-right: medium none; border-top: medium none;
        border-left: medium none; border-bottom: medium none; border-collapse: collapse;
        mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 480; mso-padding-alt: 2.85pt 2.85pt 2.85pt 2.85pt;
        mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext"
        cellspacing="0" cellpadding="0">
        <tr style="mso-yfti-irow: 0; mso-yfti-firstrow: yes">
            <td style="padding-right: 0cm; padding-left: 0cm; padding-bottom: 0cm; width: 800.35pt;
                padding-top: 0cm" valign="top" width="800">
                <div align="center">
                    <b style="mso-bidi-font-weight: normal"><span style="font-size: 25pt; font-family: 宋体;
                        letter-spacing: 5pt; mso-ascii-font-family: 'Times New Roman'; mso-hansi-font-family: 'Times New Roman'">
                        <asp:Label ID="lbTitle" runat="server" Text="绘图委托单"></asp:Label>
                    </span></b><b style="mso-bidi-font-weight: normal"><span lang="EN-US" style="font-size: 14pt;
                        letter-spacing: 5pt">
                        <o:p></o:p>
                    </span></b>
                </div>
                <br />
            </td>
        </tr>
    </table>
    <table class="MsoTableGrid" id="Table2" style="border-right: medium none; border-top: medium none;
        border-left: medium none; border-bottom: medium none; border-collapse: collapse;
        mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 480; mso-padding-alt: 2.85pt 2.85pt 2.85pt 2.85pt;
        mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext"
        cellspacing="0" cellpadding="0" border="1">
        <tr style="mso-yfti-irow: 0; mso-yfti-firstrow: yes; height: 18pt;">
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: windowtext 1pt solid;
                padding-left: 2.85pt; border-left: windowtext 1pt solid; width: 87.8pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt" width="117">
                <p class="MsoNormal" style="text-align: center" align="center">
                    <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                        mso-ascii-font-family: 'Times New Roman'">委托人</span></p>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: windowtext 1pt solid;
                padding-left: 2.85pt; border-left: medium none; width: 146.7pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt"
                width="196" colspan="4">
                <p class="MsoNormal" style="text-align: center" align="center">
                    <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                        mso-ascii-font-family: 'Times New Roman'">
                        <o:p><SPAN style="FONT-SIZE: 12pt; FONT-FAMILY: 宋体; mso-hansi-font-family: 'Times New Roman'; mso-ascii-font-family: 'Times New Roman'"><o:p><asp:label id="lbUserName" runat="server"></asp:label>
										</o:p></SPAN></o:p>
                    </span>
                </p>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: windowtext 1pt solid;
                padding-left: 2.85pt; border-left: medium none; width: 117.35pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt"
                width="156" colspan="4">
                <p class="MsoNormal" style="text-align: center" align="center">
                    <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                        mso-ascii-font-family: 'Times New Roman'">委托部门</span></p>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: windowtext 1pt solid;
                padding-left: 2.85pt; border-left: medium none; width: 351.75pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt"
                width="469" colspan="10">
                <p class="MsoNormal" style="text-align: center" align="center">
                    <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                        mso-ascii-font-family: 'Times New Roman'">
                        <o:p><SPAN style="FONT-SIZE: 12pt; FONT-FAMILY: 宋体; mso-hansi-font-family: 'Times New Roman'; mso-ascii-font-family: 'Times New Roman'"><o:p></o:p></SPAN><SPAN style="FONT-SIZE: 12pt; FONT-FAMILY: 宋体; mso-hansi-font-family: 'Times New Roman'; mso-ascii-font-family: 'Times New Roman'"><o:p><SPAN style="FONT-SIZE: 12pt; FONT-FAMILY: 宋体; mso-hansi-font-family: 'Times New Roman'; mso-ascii-font-family: 'Times New Roman'"><o:p><SPAN style="FONT-SIZE: 12pt; FONT-FAMILY: 宋体; mso-hansi-font-family: 'Times New Roman'; mso-ascii-font-family: 'Times New Roman'"><o:p><asp:label id="lbDeptName" runat="server"></asp:label>
														</o:p></SPAN></o:p></SPAN></o:p></SPAN></o:p>
                    </span>
                </p>
            </td>
        </tr>
        <tr style="mso-yfti-irow: 1; height: 18pt;">
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: windowtext 1pt solid; width: 87.8pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt"
                width="117">
                <p class="MsoNormal" style="text-align: center" align="center">
                    <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                        mso-ascii-font-family: 'Times New Roman'">绘图类型</span></p>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 146.7pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="196" colspan="4">
                <p class="MsoNormal" style="text-align: center" align="left">
                    <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                        mso-ascii-font-family: 'Times New Roman'">
                        <o:p><SPAN style="FONT-SIZE: 12pt; FONT-FAMILY: 宋体; mso-hansi-font-family: 'Times New Roman'; mso-ascii-font-family: 'Times New Roman'"><o:p><asp:label id="lbFileType" runat="server"></asp:label>
										</o:p></SPAN></o:p>
                    </span>
                </p>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 117.35pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="156" colspan="4">
                <p class="MsoNormal" style="text-align: center" align="center">
                    <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                        mso-ascii-font-family: 'Times New Roman'">负责人</span></p>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 351.75pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="469" colspan="10">
                <p class="MsoNormal" style="text-align: center" align="left">
                    <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                        mso-ascii-font-family: 'Times New Roman'">
                        <o:p><SPAN style="FONT-SIZE: 12pt; FONT-FAMILY: 宋体; mso-hansi-font-family: 'Times New Roman'; mso-ascii-font-family: 'Times New Roman'"><o:p><SPAN style="FONT-SIZE: 12pt; FONT-FAMILY: 宋体; mso-hansi-font-family: 'Times New Roman'; mso-ascii-font-family: 'Times New Roman'"><o:p></o:p></SPAN></o:p></SPAN><SPAN style="FONT-SIZE: 12pt; FONT-FAMILY: 宋体; mso-hansi-font-family: 'Times New Roman'; mso-ascii-font-family: 'Times New Roman'"><o:p><asp:label id="lbChargerName" runat="server"></asp:label>
										</o:p></SPAN></o:p>
                    </span>
                </p>
            </td>
        </tr>
        <tr style="mso-yfti-irow: 2; height: 18pt;">
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: windowtext 1pt solid; width: 87.8pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt"
                width="117">
                <p class="MsoNormal" style="text-align: center" align="center">
                    <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                        mso-ascii-font-family: 'Times New Roman'">资料名称</span></p>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 146.7pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="821" colspan="18">
                <p class="MsoNormal" style="text-align: center" align="left">
                    <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                        mso-ascii-font-family: 'Times New Roman'">
                        <o:p><SPAN style="FONT-SIZE: 12pt; FONT-FAMILY: 宋体; mso-hansi-font-family: 'Times New Roman'; mso-ascii-font-family: 'Times New Roman'"><o:p><asp:label id="lbRollName" runat="server"></asp:label>
										</o:p></SPAN></o:p>
                    </span>
                </p>
            </td>
        </tr>
        <tr style="mso-yfti-irow: 7; height: 18pt;">
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: windowtext 1pt solid; width: 87.8pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt"
                width="117">
                <p class="MsoNormal" style="text-align: center" align="center">
                    <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                        mso-ascii-font-family: 'Times New Roman'">备</span><span style="font-size: 12pt; font-family: 宋体;
                            mso-hansi-font-family: 'Times New Roman'; mso-ascii-font-family: 'Times New Roman'"><span
                                style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp; </span></span><span style="font-size: 12pt;
                                    font-family: 宋体; mso-hansi-font-family: 'Times New Roman'; mso-ascii-font-family: 'Times New Roman'">
                                    注</span></p>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 146.7pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="821" colspan="18">
                <p class="MsoNormal" style="text-align: center" align="left">
                    <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                        mso-ascii-font-family: 'Times New Roman'">
                        <o:p><asp:label id="lbConsignContent" runat="server"></asp:label>
								</o:p>
                    </span>
                </p>
            </td>
        </tr>
        <tr style="mso-yfti-irow: 5; height: 18pt;">
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: windowtext 1pt solid; width: 87.8pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt"
                width="117">
                <p class="MsoNormal" style="text-align: center" align="center">
                    <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                        mso-ascii-font-family: 'Times New Roman'">委托日期</span></p>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 87.95pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="196" colspan="4">
                <p class="MsoNormal" style="text-align: center" align="center">
                    <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                        mso-ascii-font-family: 'Times New Roman'">
                        <o:p><asp:label id="lbSendDate" runat="server"></asp:label>
								</o:p>
                    </span>
                </p>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 88pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="117" colspan="4">
                <p class="MsoNormal" style="text-align: center" align="center">
                    <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                        mso-ascii-font-family: 'Times New Roman'">完成日期</span></p>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 87.95pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="469" colspan="10">
                <p class="MsoNormal" style="text-align: center" align="center">
                    <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                        mso-ascii-font-family: 'Times New Roman'">
                        <o:p><asp:label id="lbRequestDate" runat="server"></asp:label>
										</o:p>
                    </span>
                </p>
            </td>
        </tr>
        <tr style="height: 18pt;">
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: windowtext 1pt solid; width: 87.9pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="117">
                <p class="MsoNormal" style="text-align: center" align="center">
                    <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                        mso-ascii-font-family: 'Times New Roman'">计费日期</span></p>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 87.9pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="196" colspan="4">
                <p class="MsoNormal" style="text-align: center" align="center">
                    <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                        mso-ascii-font-family: 'Times New Roman'">
                        <o:p><SPAN style="FONT-SIZE: 12pt; FONT-FAMILY: 宋体; mso-hansi-font-family: 'Times New Roman'; mso-ascii-font-family: 'Times New Roman'"><o:p><asp:label id="lbFinishDate" runat="server"></asp:label>
										</o:p></SPAN>&nbsp;</o:p>
                    </span>
                </p>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: windowtext 1pt solid; width: 87.8pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt"
                width="117" colspan="4">
                <p class="MsoNormal" style="text-align: center" align="center">
                    <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                        mso-ascii-font-family: 'Times New Roman'">流水号</span></p>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 87.95pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="469" colspan="10">
                <p class="MsoNormal" style="text-align: center" align="center">
                    <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                        mso-ascii-font-family: 'Times New Roman'">
                        <o:p><asp:label id="lbPublishCode" runat="server" ></asp:label>
								</o:p>
                    </span>
                </p>
            </td>
        </tr>
        <tr style="height: 18pt;">
            <td colspan="22" style="text-align: center; font-size: 12pt; font-family: 宋体;">
                收费项目列表&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;总金额&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;元
            </td>
        </tr>
        <tr style="height: 18.95pt; mso-yfti-irow: 8; mso-yfti-lastrow: yes">
            <td colspan="19">
                <asp:DataGrid ID="dgList" runat="server" Font-Size="12pt" Width="100%" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundColumn DataField="CostItemName" HeaderText="项目">
                            <HeaderStyle HorizontalAlign="center" Width="80px"></HeaderStyle>
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="UnitName" HeaderText="规格单位">
                            <HeaderStyle HorizontalAlign="center" Width="80px"></HeaderStyle>
                        </asp:BoundColumn>
                        <asp:TemplateColumn HeaderText="加长" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Width="80px">
                            <ItemTemplate>
                                <asp:Label ID="lbIsLentgh" runat="server" Text='<%#string.IsNullOrEmpty(Eval("IsLengthen").ToString())? "":(Convert.ToInt32(Eval("IsLengthen"))==0? "否":"是")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:BoundColumn DataField="Amount" HeaderText="数量">
                            <HeaderStyle HorizontalAlign="center" Width="80px"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundColumn>
                    </Columns>
                </asp:DataGrid>
            </td>
        </tr>
    </table>
</asp:Content>
