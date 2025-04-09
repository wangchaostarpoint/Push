<%@ Page Title="投标项目详细" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="TenderEditor.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.MM.TenderEditor" %>

<%@ Register Src="../../../Sys/FileDocument/AttachmentView.ascx" TagName="UpLoadFile"
    TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">工程名称</td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbProjectName" runat="server" MaxText="128" TableName="MM_TenderEntity" Field="ProjectName" ActiveStatus="(23.*)" ReadOnly="True" />
                <input type="hidden" id="hiMarketInfoID" name="hiMarketInfoID" runat="server" tablename="MM_TenderEntity" field="MarketInfoID" />
            </td>
            <td class="td-l">投标编号</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbBidNumber" runat="server" MaxText="64" TableName="MM_TenderEntity" Field="BidNumber" ActiveStatus="(23.*)" ReadOnly="True" />
            </td>
        </tr>
        <tr>
            <td class="td-l">工程地点</td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbProjectPlace" runat="server" MaxText="128" TableName="MM_TenderEntity" Field="ProjectPlace" ActiveStatus="(23.*)" ReadOnly="True" />
            </td>
        </tr>
        <tr>
            <td class="td-l">投标类别</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbTenderType" runat="server" MaxText="8" TableName="MM_TenderEntity" Field="TenderType" ActiveStatus="(23.*)" ReadOnly="True" />
            </td>
            <td class="td-l">投标性质</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbTenderNature" runat="server" MaxText="8" TableName="MM_TenderEntity" Field="TenderNature" ActiveStatus="(23.*)" ReadOnly="True" />
            </td>
            <td class="td-m" colspan="2"></td>
        </tr>
        <tr>
            <td class="td-l">招标单位</td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbBidUnitName" runat="server" MaxText="128" TableName="MM_TenderEntity" Field="BidUnitName" ActiveStatus="(23.*)" ReadOnly="True" />
                <input type="hidden" id="hiBidUnitID" name="hiBidUnitID" runat="server" tablename="MM_TenderEntity" field="BidUnitID" />
            </td>
        </tr>
        <tr>
            <td class="td-l">招标单位联系人</td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsContacterName" Writeable="True" PageUrl="~/MM/Obsolete/CustomerContactSelector.aspx" FilterFunction="contactFilter()" TableName="MM_TenderEntity" Field="ContacterName" ResultForControls="{'tbContacterPhone':'Phone'}" EnableTheming="false" ActiveStatus="(23.*)" SelectPageMode="Dialog" />
            </td>
            <td class="td-l">联系电话</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbContacterPhone" runat="server" MaxText="8" TableName="MM_TenderEntity" Field="ContacterPhone" ActiveStatus="(23.*)" />
            </td>
            <td class="td-m" colspan="2"></td>
        </tr>
        <tr>
            <td class="td-l">招标代理单位</td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbAgentUnitName" runat="server" MaxText="64" TableName="MM_TenderEntity" Field="AgentUnitName" ActiveStatus="(23.*)" />
                <input type="hidden" id="hiAgentUnitID" name="hiAgentUnitID" runat="server" tablename="MM_TenderEntity" field="AgentUnitID" />
            </td>
        </tr>
        <tr>
            <td class="td-l">招标代理单位联系人</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbAgentContacterName" runat="server" MaxText="16" TableName="MM_TenderEntity" Field="AgentContacterName" ActiveStatus="(23.*)" />
            </td>
            <td class="td-l">招标代理单位联系电话</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbAgentContacterPhone" runat="server" MaxText="8" TableName="MM_TenderEntity" Field="AgentContacterPhone" ActiveStatus="(23.*)" />
            </td>
            <td class="td-m" colspan="2"></td>
        </tr>
        <tr>
            <td class="td-l">开标日期</td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtBidOpenDate" runat="server" readonly="readonly" TableName="MM_TenderEntity" Field="BidOpenDate" ActiveStatus="(23.*)" />
            </td>
            <td class="td-l">开标地点</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbBidOpenPlace" runat="server" MaxText="128" TableName="MM_TenderEntity" Field="BidOpenPlace" ActiveStatus="(23.*)" />
            </td>
            <td class="td-m" colspan="2"></td>
        </tr>
        <tr>
            <td class="td-l">投标限价（万元）</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbBidLimitPrice" runat="server" EnableTheming="False" CssClass="kpms-textbox-money" TableName="MM_TenderEntity" DataType="Decimal6" Field="BidLimitPrice" ActiveStatus="(23.*)" />
            </td>
            <td class="td-l">预计标底（万元）</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbEstimateTenderBase" EnableTheming="False" CssClass="kpms-textbox-money" runat="server" MaxText="5" DataType="Decimal6" TableName="MM_TenderEntity" Field="EstimateTenderBase" ActiveStatus="(23.*)" />
            </td>
            <td class="td-l">工期（日历天）</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbProjectTime" runat="server" EnableTheming="False" CssClass="kpms-textbox-money" DataType="Integer" TableName="MM_TenderEntity" Field="ProjectTime" ActiveStatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">项目投资（万元）</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbProjectInvestment" runat="server" EnableTheming="False" CssClass="kpms-textbox-money" DataType="Decimal6" TableName="MM_TenderEntity" Field="ProjectInvestment" ActiveStatus="(23.*)" />
            </td>
            <td class="td-l">资金来源</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbFundingSource" runat="server" MaxText="16" TableName="MM_TenderEntity" Field="FundingSource" ActiveStatus="(23.*)" />
            </td>
            <td class="td-l">资金到位情况</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbFundsInPlace" runat="server" MaxText="16" TableName="MM_TenderEntity" Field="FundsInPlace" ActiveStatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">投标保证金（万元）</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbBidBond" runat="server" DataType="Decimal6" EnableTheming="False" CssClass="kpms-textbox-money" TableName="MM_TenderEntity" Field="BidBond" ActiveStatus="(23.*)" />
            </td>
            <td class="td-l">是否已归还</td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblIsReturn" TableName="MM_TenderEntity" RepeatDirection="Horizontal" Field="IsReturn" ActiveStatus="(23.*)" />
            </td>
            <td class="td-m" colspan="2"></td>
        </tr>
        <tr>
            <td class="td-l">招标内容</td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbTenderContent" runat="server" MaxText="512" TableName="MM_TenderEntity" Field="TenderContent" ActiveStatus="(23.*)" TextMode="MultiLine" Rows="3" CssClass="kpms-textarea" EnableTheming="false" />
            </td>
        </tr>
        <tr>
            <td class="td-l">其他说明</td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbOtherInstruction" runat="server" MaxText="512" TableName="MM_TenderEntity" Field="OtherInstruction" ActiveStatus="(23.*)" TextMode="MultiLine" Rows="3" CssClass="kpms-textarea" EnableTheming="false" />
            </td>
        </tr>
        <tr>
            <td class="td-l">负责部门</td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsDutyDeptName" Writeable="False" PageUrl="~/Sys/OrgUsers/OrgSelector.aspx" SelectPageMode="Dialog" TableName="MM_TenderEntity" Field="DutyDeptName" ResultForControls="{'hiDutyDeptID':'id'}" EnableTheming="false" ActiveStatus="(23.*)" />
                <input type="hidden" id="hiDutyDeptID" name="hiDutyDeptID" runat="server" tablename="MM_TenderEntity" field="DutyDeptID" />
            </td>
            <td class="td-l">承办人</td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsUndertakeUserName" Writeable="False" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" FilterFunction="UndertakeUserNameFilter()" TableName="MM_TenderEntity" Field="UndertakeUserName" SelectPageMode="Dialog" ResultForControls="{'hiUndertakeUserID':'id','tbUndertakeUserPhone':'Phone'}" EnableTheming="false" ActiveStatus="(23.*)" />
                <input type="hidden" id="hiUndertakeUserID" name="hiUndertakeUserID" runat="server" tablename="MM_TenderEntity" field="UndertakeUserID" />
            </td>
            <td class="td-l">电话</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbUndertakeUserPhone" runat="server" MaxText="8" TableName="MM_TenderEntity" Field="UndertakeUserPhone" ActiveStatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">投标总负责人</td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsHeaderName" Writeable="False" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" SelectPageMode="Dialog" TableName="MM_TenderEntity" Field="HeaderName" ResultForControls="{'hiHeaderID':'id'}" EnableTheming="false" ActiveStatus="(23.*)" />
                <input type="hidden" id="hiHeaderID" name="hiHeaderID" runat="server" tablename="MM_TenderEntity" field="HeaderID" />
            </td>
            <td class="td-l">投标商务负责人</td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsBusinessDirectorName" Writeable="False" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" TableName="MM_TenderEntity" Field="BusinessDirectorName" ResultForControls="{'hiBusinessDirectorID':'id'}" EnableTheming="false" ActiveStatus="(23.*)" SelectPageMode="Dialog" />
                <input type="hidden" id="hiBusinessDirectorID" name="hiBusinessDirectorID" runat="server" tablename="MM_TenderEntity" field="BusinessDirectorID" />
            </td>
            <td class="td-l">投标技术负责人</td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsTechnicalDirectorName" Writeable="False" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" TableName="MM_TenderEntity" Field="TechnicalDirectorName" SelectPageMode="Dialog" ResultForControls="{'hiTechnicalDirectorID':'id'}" EnableTheming="false" ActiveStatus="(23.*)" />
                <input type="hidden" id="hiTechnicalDirectorID" name="hiTechnicalDirectorID" runat="server" tablename="MM_TenderEntity" field="TechnicalDirectorID" />
            </td>
        </tr>
        <tr>
            <td class="td-l">是否设计竞赛</td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblIsDesignCompetition" TableName="MM_TenderEntity" Field="IsDesignCompetition" RepeatDirection="Horizontal" ActiveStatus="(23.*)" />
            </td>
            <td class="td-m" colspan="4"></td>
        </tr>
        <tr>

            <td class="td-l">投标状态</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbTenderResult" runat="server" MaxText="16" TableName="MM_TenderEntity" Field="TenderResult" ActiveStatus="(23.*)" ReadOnly="True" />
            </td>
            <td class="td-l">中标价（万元）</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbGainSum" runat="server" DataType="Decimal6" EnableTheming="False" CssClass="kpms-textbox-money" TableName="MM_TenderEntity" Field="GainSum" ActiveStatus="(23.*)" ReadOnly="True" />
            </td>
            <td class="td-m" colspan="2"></td>
        </tr>
        <tr style="display: none">
            <td class="td-l">中止原因</td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbCancelReason" runat="server" MaxText="512" TableName="MM_TenderEntity" Field="CancelReason" ActiveStatus="(23.*)" ReadOnly="True" TextMode="MultiLine" Rows="3" CssClass="kpms-textarea" EnableTheming="false" />
            </td>
        </tr>
        <tr>
            <td class="td-l">中标单位名称</td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbGainCustomerName" runat="server" MaxText="64" TableName="MM_TenderEntity" Field="GainCustomerName" ActiveStatus="(23.*)" ReadOnly="True" />
                <input type="hidden" id="hiGainCustomerID" name="hiGainCustomerID" runat="server" tablename="MM_TenderEntity" field="GainCustomerID" />
            </td>
        </tr>
        <tr>
            <td class="td-l">投标评审记录
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightFileUploader runat="server" ID="lbtnUpload" EnableTheming="false"
                    DisplayStatus="(3.*)" OnClick="lbtnUpload_Click"><img src="../../../Themes/Images/btn_upload.gif" />
                        <span>上传附件</span></zhongsoft:LightFileUploader><span class="req-star" style="float: right;"
                            id="Span2" runat="server" displaystatus="(2.*)"> 请先保存再上传附件</span>
                <uc3:UpLoadFile ID="uploadFile" runat="server" />
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiTenderEntityID" tablename="MM_TenderEntity" field="TenderEntityID" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

        //招标单位联系人筛选条件
        function contactFilter() {
            var customerID = $("#<%=hiBidUnitID.ClientID %>").val();
            return { CustomerID: customerID }
        }
        //招标单位联系人筛选条件
        function UndertakeUserNameFilter() {
            var organizationId = $("#<%=hiDutyDeptID.ClientID %>").val();
            return { OrganizationId: organizationId }
        }
    </script>
</asp:Content>
