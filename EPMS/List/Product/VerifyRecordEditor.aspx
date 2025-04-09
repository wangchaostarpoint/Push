<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerifyRecordEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Product.VerifyRecordEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    Title="成品校审统计信息" %>

<%@ Import Namespace="DAL.EPMS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                项目名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText runat="server" ID="txtProjectName" activestatus="(23.*)"
                    readonly="readonly" class="kpms-textbox" TableName="EPMS_WBSEntity" Field="ProjectName"
                    req="1">
                </zhongsoft:XHtmlInputText>
                <input type="hidden" runat="server" id="hiOrganizationID" tablename="EPMS_WBSEntity"
                    field="OrganizationID" />
            </td>
            <td class="td-l">
                项目编号<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(23.*)"
                    readonly="readonly" class="kpms-textbox" TableName="EPMS_WBSEntity" Field="ProjectCode"
                    req="1">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                项目规模
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbProjectScale" runat="server" readonly="readonly"
                    maxlength="128" class="kpms-textbox" activestatus="(23.?)" />
            </td>
            <td class="td-l">
                项目类别
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbProjectType" runat="server" readonly="readonly" maxlength="16"
                    class="kpms-textbox" activestatus="(23.?)" />
            </td>
            <td class="td-l">
                设计阶段
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbPhaseName" runat="server" readonly="readonly" maxlength="16"
                    class="kpms-textbox" activestatus="(23.?)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                卷册名称<span class="req-star" id="spanRoll">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtWBSName" activestatus="(23.?)" readonly="readonly"
                    class="kpms-textbox" TableName="EPMS_WBSEntity" Field="WBSName" req="1">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                卷册编号
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText runat="server" ID="txtWBSCode" activestatus="(23.?)" readonly="readonly"
                    field="WBSCode" tablename="EPMS_WBSEntity" class="kpms-textbox" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                主设人
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtMainDesigner" activestatus="(23.?)"
                    readonly="readonly" class="kpms-textbox">
                </zhongsoft:XHtmlInputText>
                <input type="hidden" runat="server" id="hiExecSpecialtyID" field="ExecSpecialtyID"
                    tablename="EPMS_WBSEntity" />
            </td>
            <td class="td-l">
                新制图标准（张）
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtNewStandardMapSum" activestatus="(23.?)"
                    style="text-align: right" readonly="readonly" class="kpms-textbox">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                一般性差错率
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtCommonMistakeRate" activestatus="(23.?)"
                    style="text-align: right" readonly="readonly" class="kpms-textbox">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td colspan="6">
            </td>
        </tr>
    </table>
    <table style="width: 100%; border-style: hidden" class="tz-table">
        <tr>
            <th class="td-l" style="text-align: center">
                差错性质
            </th>
            <th class="td-l" style="text-align: center">
                校核
            </th>
            <th class="td-l" style="text-align: center">
                审核
            </th>
            <th class="td-l" style="text-align: center">
                批准
            </th>
            <th class="td-l" style="text-align: center">
                合计
            </th>
        </tr>
        <tr>
            <td class="td-l" style="text-align: center">
                原则性（A）
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtCollateA" activestatus="(23.?)" readonly="readonly"
                    style="text-align: right" class="kpms-textbox">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtAuditingA" activestatus="(23.?)"
                    style="text-align: right" readonly="readonly" class="kpms-textbox">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtRatifyA" activestatus="(23.?)" readonly="readonly"
                    style="text-align: right" class="kpms-textbox">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtGrossA" activestatus="(23.?)" readonly="readonly"
                    style="text-align: right" class="kpms-textbox">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l" style="text-align: center">
                技术性（B）
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtCollateB" activestatus="(23.?)" readonly="readonly"
                    style="text-align: right" class="kpms-textbox">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtAuditingB" activestatus="(23.?)"
                    style="text-align: right" readonly="readonly" class="kpms-textbox">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtRatifyB" activestatus="(23.?)" readonly="readonly"
                    style="text-align: right" class="kpms-textbox">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtGrossB" activestatus="(23.?)" readonly="readonly"
                    style="text-align: right" class="kpms-textbox">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l" style="text-align: center">
                一般性（C）
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtCollateC" activestatus="(23.?)" readonly="readonly"
                    style="text-align: right" class="kpms-textbox">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtAuditingC" activestatus="(23.?)"
                    style="text-align: right" readonly="readonly" class="kpms-textbox">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtRatifyC" activestatus="(23.?)" readonly="readonly"
                    style="text-align: right" class="kpms-textbox">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtGrossC" activestatus="(23.?)" readonly="readonly"
                    style="text-align: right" class="kpms-textbox">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l" style="text-align: center">
                一般差错率（个/张）
            </td>
            <td>
                <zhongsoft:XHtmlInputText runat="server" ID="txtCollateRatio" activestatus="(23.?)"
                    style="text-align: right" readonly="readonly" class="kpms-textbox">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtAuditingRatio" activestatus="(23.?)"
                    style="text-align: right" readonly="readonly" class="kpms-textbox">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtRatifyRatio" activestatus="(23.?)"
                    style="text-align: right" readonly="readonly" class="kpms-textbox">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtGrossRatio" activestatus="(23.?)"
                    style="text-align: right" readonly="readonly" class="kpms-textbox">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l" style="text-align: center">
                成品质量等级
            </td>
            <td class="td-r">
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlAuditingQLevel" Enabled="false">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlRatifyQLevel" Enabled="false">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlGrossQLevel" Enabled="false">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                链接相关信息
            </td>
            <td colspan="4">
                <asp:LinkButton ID="lbtnVerifyInfo" runat="server" Text="校审信息" EnableTheming="false"
                    Style="text-decoration: underline; color: Blue">校审信息 </asp:LinkButton>
                <asp:LinkButton ID="lbtnProductList" runat="server" Text="成品清单" EnableTheming="false" OnClientClick="return viewProductList()"
                    Style="text-decoration: underline; color: Blue">成品清单 </asp:LinkButton>
                <asp:LinkButton ID="lbtnInnerFile" runat="server" Text="内部资料" EnableTheming="false"
                    OnClientClick="return viewInnerFile()" Style="text-decoration: underline; color: Blue">内部资料 </asp:LinkButton>
                <asp:LinkButton ID="lbtnExtendFile" runat="server" Text="外部资料" EnableTheming="false"
                    OnClientClick="return viewExtendFile()" Style="text-decoration: underline; color: Blue">外部资料 </asp:LinkButton>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiWBSID" field="WBSID" tablename="EPMS_WBSEntity" />
    <script type="text/javascript">
        function viewForm(bizId, extendedAttribute) {
            var url = '/Custom/List/C_FormDetailLoading.aspx';
            var json = { bizId: bizId, IsOld: 2, ExtendedAttribute: extendedAttribute };
            url = buildQueryUrl(url, json);
            window.open(url);
            return false;
        }
        //查看项目清单
        function viewProductList() {
            var orgID = $("#<%=hiOrganizationID.ClientID %>").val();
            var rollID = $("#<%=hiWBSID.ClientID %>").val();
            var json = { OrganizationID: orgID, RollID: rollID, secid: 'B53E6C85-096B-4A6B-98D9-8A78774FC8CC' };
            var url = buildQueryUrl('/EPMS/List/Product/C_ProductList.aspx', json);
            showDivDialog(url, null, 1000, 550, null);
            return false;
        }

        //查看内部资料 
        function viewInnerFile() {
            var orgID = $("#<%=hiOrganizationID.ClientID %>").val();
            var rollID = $("#<%=hiWBSID.ClientID %>").val();
            var wbsState = "<%=(int)FileState.已提交 %>";
            var json = { OrganizationID: orgID, ReceiveRollID: rollID, QueryWBSState: wbsState, secid: '8D40FFFE-EA2A-4B71-A30A-2E665E3A668E' };
            var url = buildQueryUrl('/EPMS/List/WBS/C_MutualReceiveFileList.aspx', json);
            showDivDialog(url, null, 1000, 550, null);
        }

        //查看外部资料
        function viewExtendFile() {
            var orgID = $("#<%=hiOrganizationID.ClientID %>").val();
            var rollID = $("#<%=hiWBSID.ClientID %>").val();
            var json = { OrganizationID: orgID, RollID: rollID, secid: '58799F61-7761-43E8-961F-4CA93FA67039' };
            var url = buildQueryUrl('/EPMS/List/WBS/C_ExternalFileList.aspx', json);
            showDivDialog(url, null, 1000, 550, null);
        }
    </script>
</asp:Content>
