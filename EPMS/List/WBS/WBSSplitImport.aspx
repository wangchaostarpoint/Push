﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WBSSplitImport.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.WBS.WBSSplitImport" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    Title="任务导入" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table width="100%" class="tz-table">
        <tr>
            <td class="td-l">请选择导入文件</td>
            <td align="center" style="font-weight: bold" class="td-r">
                <asp:FileUpload ID="fileUploadWbs" runat="server" Width="80%" />
            </td>
        </tr>
        <tr>
            <td align="center" class="td-m" colspan="2">
                <asp:LinkButton runat="server" ID="lbtnInport" CssClass="subtoolbarlink" EnableTheming="false"
                    OnClick="btnImport_Click" OnClientClick="return inport();">
                    <span>
                        <img runat="server" id="img3" src="~/Themes/Images/ico_excel.gif" alt="导入" width="16"
                            height="16" />确定导入</span>
                </asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="td-m" align="center" style="font-weight: bold">提示信息</td>
        </tr>
        <tr>
            <td colspan="2" class="td-m">
                <zhongsoft:LightTextBox ID="tbMessage" runat="server" TextMode="MultiLine" Rows="4" EnableTheming="false" Width="100%"
                    CssClass="kpms-textarea"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="td-m" align="center" style="font-weight: bold">导入失败信息列表</td>
        </tr>
        <tr>
            <td colspan="2" class="td-m">
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
                    AutoGenerateColumns="false" ShowExport="true" DataKeyNames="WBSCode" UseDefaultDataSource="true"
                    BindGridViewMethod="BindDataGrid" EmptyDataText="没有要查找的数据">
                    <Columns>
                        <zhongsoft:LightBoundField HeaderText="编号" DataField="WBSCode">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="导入失败原因">
                            <ItemTemplate>
                                <div style="word-break: break-all !important; white-space: normal !important;">
                                    <asp:Label ID="lbFailedReason" runat="server"><%#Eval("FailedReason") %></asp:Label>
                                </div>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <%-- 发电工程公司ID --%>
    <input type="hidden" runat="server" id="hiFDGSID" value="D7ACCF09-32B2-4706-9522-0CF6570A315E" />
    <div id="inport-loading" style="display: none;text-align: center;">
        <span><strong>根据导入数据多少，大概需要几十秒到几分钟时间，请耐心等待，不需要关闭页面。</strong></span>
        <br />
        <span style="text-align: center;">
            <img src="<%=WebAppPath %>/themes/Images/loading.gif" alt="数据处理中" /></span>
        <br />
        <span><%=AppConfig.Instance.BaseOrgUnitName%></span>
        <br />
        <span>技术支持：北京众城比泰科技有限责任公司</span>
        <br />
    </div>
    <script type="text/javascript">
        function inport() {
            $('#inport-loading').dialog('open');
            parent.returnValue = "Inported";
            
        }

        function initCustomerPlugin() {
            $('#inport-loading').dialog({ height: 130, width: 270, resizable: false });
            $('#inport-loading').dialog('close');
        }

    </script>
</asp:Content>
