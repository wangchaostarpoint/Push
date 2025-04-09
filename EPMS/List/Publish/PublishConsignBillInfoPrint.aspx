<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PublishConsignBillInfoPrint.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Publish.PublishConsignBillInfoPrint" MasterPageFile="~/UI/Master/ObjectPrint.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPrint" runat="server">
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
                        <asp:Label ID="lbTitle" runat="server" Text="正式图纸资料出版委托单"></asp:Label>
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
                mso-border-alt: solid windowtext .5pt" width="117" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">委托人</span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: windowtext 1pt solid;
                padding-left: 2.85pt; border-left: medium none; width: 146.7pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt"
                width="196" colspan="4" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">
                    <o:p><SPAN style="FONT-SIZE: 12pt; FONT-FAMILY: 宋体; mso-hansi-font-family: 'Times New Roman'; mso-ascii-font-family: 'Times New Roman'"><o:p><asp:label id="lbUserName" runat="server"></asp:label>
										</o:p></SPAN></o:p>
                </span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: windowtext 1pt solid;
                padding-left: 2.85pt; border-left: medium none; width: 117.35pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt"
                width="156" colspan="4" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">委托部门</span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: windowtext 1pt solid;
                padding-left: 2.85pt; border-left: medium none; width: 351.75pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt"
                width="469" colspan="10" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">
                    <o:p><SPAN style="FONT-SIZE: 12pt; FONT-FAMILY: 宋体; mso-hansi-font-family: 'Times New Roman'; mso-ascii-font-family: 'Times New Roman'"><o:p></o:p></SPAN><SPAN style="FONT-SIZE: 12pt; FONT-FAMILY: 宋体; mso-hansi-font-family: 'Times New Roman'; mso-ascii-font-family: 'Times New Roman'"><o:p><SPAN style="FONT-SIZE: 12pt; FONT-FAMILY: 宋体; mso-hansi-font-family: 'Times New Roman'; mso-ascii-font-family: 'Times New Roman'"><o:p><SPAN style="FONT-SIZE: 12pt; FONT-FAMILY: 宋体; mso-hansi-font-family: 'Times New Roman'; mso-ascii-font-family: 'Times New Roman'"><o:p><asp:label id="lbDeptName" runat="server"></asp:label>
														</o:p></SPAN></o:p></SPAN></o:p></SPAN></o:p>
                </span>
            </td>
        </tr>
        <tr style="mso-yfti-irow: 1; height: 18pt;">
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: windowtext 1pt solid; width: 87.8pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt"
                width="117" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">项目编号</span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 146.7pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="196" colspan="4" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">
                    <o:p><SPAN style="FONT-SIZE: 12pt; FONT-FAMILY: 宋体; mso-hansi-font-family: 'Times New Roman'; mso-ascii-font-family: 'Times New Roman'"><o:p><asp:label id="lbProjectCode" runat="server"></asp:label>
										</o:p></SPAN></o:p>
                </span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 117.35pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="156" colspan="4" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">项目名称</span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 351.75pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="469" colspan="10" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">
                    <o:p><SPAN style="FONT-SIZE: 12pt; FONT-FAMILY: 宋体; mso-hansi-font-family: 'Times New Roman'; mso-ascii-font-family: 'Times New Roman'"><o:p><SPAN style="FONT-SIZE: 12pt; FONT-FAMILY: 宋体; mso-hansi-font-family: 'Times New Roman'; mso-ascii-font-family: 'Times New Roman'"><o:p></o:p></SPAN></o:p></SPAN><SPAN style="FONT-SIZE: 12pt; FONT-FAMILY: 宋体; mso-hansi-font-family: 'Times New Roman'; mso-ascii-font-family: 'Times New Roman'"><o:p><asp:label id="lbProjectName" runat="server"></asp:label>
										</o:p></SPAN></o:p>
                </span>
            </td>
        </tr>
        <tr style="mso-yfti-irow: 2; height: 18pt;">
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: windowtext 1pt solid; width: 87.8pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt"
                width="117" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">卷册编号</span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 146.7pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="196" colspan="4" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">
                    <o:p><SPAN style="FONT-SIZE: 12pt; FONT-FAMILY: 宋体; mso-hansi-font-family: 'Times New Roman'; mso-ascii-font-family: 'Times New Roman'"><o:p><asp:label id="lbRollCode" runat="server"></asp:label>
										</o:p></SPAN></o:p>
                </span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 117.35pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="156" colspan="4" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">卷册名称</span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 351.75pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="469" colspan="10" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">
                    <o:p><SPAN style="FONT-SIZE: 12pt; FONT-FAMILY: 宋体; mso-hansi-font-family: 'Times New Roman'; mso-ascii-font-family: 'Times New Roman'"><o:p><asp:label id="lbRollName" runat="server"></asp:label>
										</o:p></SPAN></o:p>
                </span>
            </td>
        </tr>
        <tr style="mso-yfti-irow: 3; height: 18pt;">
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: windowtext 1pt solid; width: 87.8pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt"
                width="117" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">新</span><span style="font-size: 12pt; font-family: 宋体;
                        mso-hansi-font-family: 'Times New Roman'; mso-ascii-font-family: 'Times New Roman'"><span
                            style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp; </span></span><span style="font-size: 12pt;
                                font-family: 宋体; mso-hansi-font-family: 'Times New Roman'; mso-ascii-font-family: 'Times New Roman'">
                                制</span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 55.95pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="75" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">0#
                    <asp:Label ID="lb0" runat="server"></asp:Label></span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 56pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="75" colspan="2" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">1#
                    <asp:Label ID="lb1" runat="server"></asp:Label></span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 55.95pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="75" colspan="2" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">2#
                    <asp:Label ID="lb2" runat="server"></asp:Label></span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 56pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="75" colspan="2" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">3#
                    <asp:Label ID="lb3" runat="server"></asp:Label></span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 56pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="75" colspan="2" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">4#
                    <asp:Label ID="lb4" runat="server"></asp:Label></span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 55.95pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="75" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">标准张</span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 56pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="75" colspan="2" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">
                    <o:p><asp:label id="lbPrintSum" runat="server"></asp:label>
									<FONT face="宋体">张</FONT>
								</o:p>
                </span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 56pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="75" colspan="2" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">活用</span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 55.95pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="75" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">
                    <o:p><SPAN style="FONT-SIZE: 12pt; FONT-FAMILY: 宋体; mso-hansi-font-family: 'Times New Roman'; mso-ascii-font-family: 'Times New Roman'"><o:p><asp:label id="lbActiveSum" runat="server"></asp:label>
											<FONT face="宋体">张</FONT>
										</o:p></SPAN></o:p>
                </span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 56pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="75" colspan="2" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">目录</span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 56pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="75" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">
                    <o:p><SPAN style="FONT-SIZE: 12pt; FONT-FAMILY: 宋体; mso-hansi-font-family: 'Times New Roman'; mso-ascii-font-family: 'Times New Roman'"><o:p><asp:label id="lbCatalogSum" runat="server"></asp:label>
											<FONT face="宋体">张</FONT>
										</o:p></SPAN></o:p>
                </span>
            </td>
        </tr>
        <tr style="mso-yfti-irow: 4; height: 18pt;">
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: windowtext 1pt solid; width: 87.8pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt"
                width="117" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">设备清册</span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 87.95pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="117" colspan="2" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">
                    <o:p><asp:label id="lbVolumnPages" runat="server"></asp:label>
									<FONT face="宋体">张 </FONT>
									<asp:label id="lbVolumnSum" runat="server"></asp:label>
									<FONT face="宋体">份</FONT></o:p>
                </span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 88pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="117" colspan="4" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">说明书</span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 100pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="117" colspan="2" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">
                    <o:p><SPAN style="FONT-SIZE: 12pt; FONT-FAMILY: 宋体; mso-hansi-font-family: 'Times New Roman'; mso-ascii-font-family: 'Times New Roman'"><o:p><asp:label id="lbInstructionPages" runat="server"></asp:label>
											<FONT face="宋体">张</FONT>
											<asp:label id="lbInstructionSum" runat="server"></asp:label>
											<FONT face="宋体">份</FONT></o:p></SPAN>&nbsp;</o:p>
                </span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 87.9pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="117" colspan="3" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">概算</span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 87.9pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="117" colspan="2" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">
                    <o:p><SPAN style="FONT-SIZE: 12pt; FONT-FAMILY: 宋体; mso-hansi-font-family: 'Times New Roman'; mso-ascii-font-family: 'Times New Roman'"><o:p><asp:label id="lbSummaryPages" runat="server"></asp:label>
											<FONT face="宋体">张</FONT>
											<asp:label id="lbSummarySum" runat="server"></asp:label>
											<FONT face="宋体">份</FONT></o:p></SPAN></o:p>
                </span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 87.9pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="117" colspan="3" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">卷册负责人</span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 87.9pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="117" colspan="2" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">
                    <o:p><SPAN style="FONT-SIZE: 12pt; FONT-FAMILY: 宋体; mso-hansi-font-family: 'Times New Roman'; mso-ascii-font-family: 'Times New Roman'"><o:p><asp:label id="lbMasterDesigner" runat="server"></asp:label>
										</o:p></SPAN></o:p>
                </span>
            </td>
        </tr>
        <tr style="mso-yfti-irow: 5; height: 18pt;">
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: windowtext 1pt solid; width: 87.8pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt"
                width="117" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">送交出版日期</span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 87.95pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="117" colspan="2" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">
                    <o:p><asp:label id="lbSendDate" runat="server"></asp:label>
								</o:p>
                </span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 88pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="117" colspan="4" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">要求出版日期</span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 88.1pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="117" colspan="2" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">
                    <o:p><SPAN style="FONT-SIZE: 12pt; FONT-FAMILY: 宋体; mso-hansi-font-family: 'Times New Roman'; mso-ascii-font-family: 'Times New Roman'"><o:p><asp:label id="lbRequestDate" runat="server"></asp:label>
										</o:p></SPAN>&nbsp;</o:p>
                </span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 87.9pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="117" colspan="3" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">要求送图日期</span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 87.9pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="117" colspan="2" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">
                    <o:p><SPAN style="FONT-SIZE: 12pt; FONT-FAMILY: 宋体; mso-hansi-font-family: 'Times New Roman'; mso-ascii-font-family: 'Times New Roman'"><o:p><asp:label id="lbFinishDate" runat="server"></asp:label>
										</o:p></SPAN>&nbsp;</o:p>
                </span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 87.95pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="117" colspan="3" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">出版完成日期</span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 88pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="117" colspan="2" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">
                    <o:p><SPAN style="FONT-SIZE: 12pt; FONT-FAMILY: 宋体; mso-hansi-font-family: 'Times New Roman'; mso-ascii-font-family: 'Times New Roman'"><o:p><asp:label id="lbPFinishDate" runat="server"></asp:label>
										</o:p></SPAN>&nbsp;</o:p>
                </span>
            </td>
        </tr>
        <tr style="mso-yfti-irow: 6; height: 18pt;">
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: windowtext 1pt solid; width: 87.8pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt"
                width="117" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">出版编号</span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 87.95pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="117" colspan="2" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">
                    <o:p><asp:label id="lbPublishCode" runat="server" Font-Bold="True"></asp:label>
								</o:p>
                </span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 87.95pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="117" colspan="4" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">图纸总计</span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 88pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="117" colspan="2" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">
                    <o:p><asp:label id="lbTotal" runat="server"></asp:label>&nbsp;<FONT face="宋体">
										张</FONT></o:p>
                </span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 88pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="117" colspan="3" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">份数</span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 88.1pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="117" colspan="2" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">
                    <o:p><asp:label id="lbConsignSum" runat="server"></asp:label><FONT face="宋体">
										&nbsp;份</FONT>&nbsp;</o:p>
                </span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 87.95pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="117" colspan="3" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">缓急程度</span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 88pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="117" colspan="2" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">
                    <o:p><SPAN style="FONT-SIZE: 12pt; FONT-FAMILY: 宋体; mso-hansi-font-family: 'Times New Roman'; mso-ascii-font-family: 'Times New Roman'"><o:p><asp:label id="lbImportLevel" runat="server"></asp:label>
										</o:p></SPAN>&nbsp;</o:p>
                </span>
            </td>
        </tr>
        <tr style="mso-yfti-irow: 7; height: 18pt;">
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: windowtext 1pt solid; width: 87.8pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext .5pt"
                width="117" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">备</span><span style="font-size: 12pt; font-family: 宋体;
                        mso-hansi-font-family: 'Times New Roman'; mso-ascii-font-family: 'Times New Roman'"><span
                            style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp; </span></span><span style="font-size: 12pt;
                                font-family: 宋体; mso-hansi-font-family: 'Times New Roman'; mso-ascii-font-family: 'Times New Roman'">
                                注</span>
            </td>
            <td style="border-right: windowtext 1pt solid; padding-right: 2.85pt; border-top: medium none;
                padding-left: 2.85pt; border-left: medium none; width: 615.8pt; border-bottom: windowtext 1pt solid;
                mso-border-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt;
                mso-border-top-alt: solid windowtext .5pt" width="821" colspan="18" align="center">
                <span style="font-size: 12pt; font-family: 宋体; mso-hansi-font-family: 'Times New Roman';
                    mso-ascii-font-family: 'Times New Roman'">
                    <o:p><asp:label id="lbConsignContent" runat="server"></asp:label>
								</o:p>
                </span>
            </td>
        </tr>
        <tr style="height: 18.95pt; mso-yfti-irow: 8; mso-yfti-lastrow: yes">
            <td colspan="19">
                <asp:DataGrid ID="dgList" runat="server" Font-Size="12pt" Width="100%" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundColumn DataField="WorkTypeName" HeaderText="工种">
                            <HeaderStyle HorizontalAlign="Center" Width="120px"></HeaderStyle>
                        </asp:BoundColumn>
                        <%-- <asp:BoundColumn DataField="WorkContent" HeaderText="工作内容">
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                        </asp:BoundColumn>--%>
                        <asp:TemplateColumn HeaderText="工作内容" HeaderStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:TextBox runat="server" ID="tbWorkContent" CssClass="kpms-textareaNew" EnableTheming="false" 
                                    Style="background-color: White; border: none; font-size:large; color: Black; width: 84.5%;" TextMode="MultiLine"
                                    Text='<%#Eval("WorkContent") %>'></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:BoundColumn DataField="Amount" HeaderText="数量">
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Right"></ItemStyle>
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="ReceiveDate" HeaderText="接受日期" DataFormatString="{0:yyyy-MM-dd}">
                            <HeaderStyle HorizontalAlign="Center" Width="80px"></HeaderStyle>
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="CompleteDate" HeaderText="完成日期" DataFormatString="{0:yyyy-MM-dd}">
                            <HeaderStyle HorizontalAlign="Center" Width="80px"></HeaderStyle>
                        </asp:BoundColumn>
                        <asp:BoundColumn DataField="ChargeUserName" HeaderText="完成人">
                            <HeaderStyle HorizontalAlign="Center" Width="80px"></HeaderStyle>
                        </asp:BoundColumn>
                    </Columns>
                </asp:DataGrid>
            </td>
        </tr>
        <tr height="0">
            <td style="border-right: medium none; border-top: medium none; border-left: medium none;
                border-bottom: medium none" width="92">
                <font face="宋体"></font>
            </td>
            <td style="border-right: medium none; border-top: medium none; border-left: medium none;
                border-bottom: medium none" width="61">
                <font face="宋体"></font>
            </td>
            <td style="border-right: medium none; border-top: medium none; border-left: medium none;
                border-bottom: medium none" width="35">
                <font face="宋体"></font>
            </td>
            <td style="border-right: medium none; border-top: medium none; border-left: medium none;
                border-bottom: medium none" width="26">
                <font face="宋体"></font>
            </td>
            <td style="border-right: medium none; border-top: medium none; border-left: medium none;
                border-bottom: medium none" width="37">
            </td>
            <td style="border-right: medium none; border-top: medium none; border-left: medium none;
                border-bottom: medium none" width="23">
            </td>
            <td style="border-right: medium none; border-top: medium none; border-left: medium none;
                border-bottom: medium none" width="9">
            </td>
            <td style="border-right: medium none; border-top: medium none; border-left: medium none;
                border-bottom: medium none" width="52">
            </td>
            <td style="border-right: medium none; border-top: medium none; border-left: medium none;
                border-bottom: medium none" width="44">
            </td>
            <td style="border-right: medium none; border-top: medium none; border-left: medium none;
                border-bottom: medium none" width="17">
            </td>
            <td style="border-right: medium none; border-top: medium none; border-left: medium none;
                border-bottom: medium none" width="61">
            </td>
            <td style="border-right: medium none; border-top: medium none; border-left: medium none;
                border-bottom: medium none" width="16">
            </td>
            <td style="border-right: medium none; border-top: medium none; border-left: medium none;
                border-bottom: medium none" width="40">
            </td>
            <td style="border-right: medium none; border-top: medium none; border-left: medium none;
                border-bottom: medium none" width="52">
            </td>
            <td style="border-right: medium none; border-top: medium none; border-left: medium none;
                border-bottom: medium none" width="9">
            </td>
            <td style="border-right: medium none; border-top: medium none; border-left: medium none;
                border-bottom: medium none" width="57">
            </td>
            <td style="border-right: medium none; border-top: medium none; border-left: medium none;
                border-bottom: medium none" width="26">
            </td>
            <td style="border-right: medium none; border-top: medium none; border-left: medium none;
                border-bottom: medium none" width="35">
            </td>
            <td style="border-right: medium none; border-top: medium none; border-left: medium none;
                border-bottom: medium none" width="57">
            </td>
        </tr>
    </table>
    <script type="text/javascript">
        function printMargin() {
            return "22,20,20,25"
        }

        function initCustomerPlugin() {
            fitTextArea();
        }
        function fitTextArea() {
            $.each($('[class^="kpms-textareaNew"]'), function (i, n) {
                this.style.height = this.scrollHeight + 'px'
                $(this).bind({
                    propertychange: function () {
                        this.style.height = this.scrollHeight + 'px';
                    },
                    input: function () {
                        this.style.height = this.scrollHeight + 'px';
                    }
                });
                $(this).css('overflow', 'hidden').css('word-wrap', 'break-word');
            });
        }
    </script>
</asp:Content>
