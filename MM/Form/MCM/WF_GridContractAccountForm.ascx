<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_GridContractAccountForm.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.Form.MCM.WF_GridContractAccountForm" %>
<%@ Register TagPrefix="uc1" TagName="UCContractRelFile" Src="../../UI/Controls/UCContractRelFile.ascx" %>
<%@ Register TagPrefix="uc3" TagName="UCContractRelProjectInfo" Src="../../UI/Controls/UCContractRelProjectInfo.ascx" %>
<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<%@ Import Namespace="Zhongsoft.Portal" %>
<table class="tz-table">
    <tr>
        <td class="td-l">
            合同编号
        </td>
        <td class="td-l">
            <zhongsoft:XHtmlInputText ID="txtContractCode" runat="server" type="text" class="kpms-textbox"
                style="width: 120px" tablename="MCM_GRIDCONACCONTFORM" field="CONTRACTCODE" readonly="readonly"
                activestatus="(23.填写批概合同额相关信息)(3.修改批概合同额相关信息)" />
        </td>
        <td class="td-l">
            合同名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtContractName" field="CONTRACTNAME"
                tablename="MCM_GRIDCONACCONTFORM" activestatus="(2.填写批概合同额相关信息)" SourceMode="SelectorPage"
                ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" EnableTheming="false"
                PageWidth="850" Writeable="false" ShowAttrs="name,UserCode" ResultForControls="{'hiContractID':'id','txtContractCode':'CONTRACTCODE','txtHadCompleteValue':'HADCOMPLETEVALUE','txtContractAmount':'CONTRACTVALUE','hiNotBuild':'NOTBUILD'}"
                Filter="{IsReturn:'1'}" PageUrl="~/MM/Obsolete/ContractSelector.aspx" req="1"
                OnClick="btnSelectContract_OnClick"></zhongsoft:LightObjectSelector>
            <input id="hiContractID" type="hidden" field="CONTRACTID" runat="server" tablename="MCM_GRIDCONACCONTFORM" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            合同总额(万元)
        </td>
        <td>
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtContractAmount" tablename="MCM_GRIDCONACCONTFORM"
                readonly="readonly" class="kpms-textbox-money" field="CONTRACTVALUE" activestatus="(23.填写批概合同额相关信息)(3.修改批概合同额相关信息)" />
        </td>
        <td class="td-l">
            已完成合同额(万元)
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtHadCompleteValue" tablename="MCM_GRIDCONACCONTFORM"
                readonly="readonly" class="kpms-textbox-money" field="HADCOMPLETEVALUE" activestatus="(23.填写批概合同额相关信息)(3.修改批概合同额相关信息)" />
        </td>
    </tr>
    <tr>
        <td class="td-l" nowrap>
            批准概算合同额(万元)
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtEstimateValue" tablename="MCM_GRIDCONACCONTFORM"
                readonly="readonly" class="kpms-textbox-money" field="ESTIMATEVAULE" activestatus="(23.填写批概合同额相关信息)(3.修改批概合同额相关信息)" />
        </td>
        <td class="td-l" nowrap>
            批概后完成合同额(万元)
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtAfterEstimateValue" tablename="MCM_GRIDCONACCONTFORM"
                readonly="readonly" class="kpms-textbox-money" field="AFTERESTIMATEVAULE" activestatus="(23.填写批概合同额相关信息)(3.修改批概合同额相关信息)" />
        </td>
    </tr>
    <tr class="trProject">
        <td colspan="6">
            <uc3:UCContractRelProjectInfo ID="ucRelProjectInfo" runat="server" OnProjectChange="ucRelProjectInfo_ProjectChange">
            </uc3:UCContractRelProjectInfo>
        </td>
    </tr>
    <%-- <tr id="Tr1" class="trProject" runat="server">
        <td class="td-m" colspan="6" height="25" style="font-weight: bold; text-align: center">
            合同关联项目
        </td>
    </tr>
    <tr class="trProject">
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvProjectPhaseList" runat="server" AllowPaging="true"
                ShowExport="true" AutoGenerateColumns="false" UseDefaultDataSource="true" DataKeyNames="CONTRACTRELPROJECTID"
                OnRowCommand="gvProjectPhaseList_RowCommond" BindGridViewMethod="BindMarketProject">
                <Columns>
                    <zhongsoft:LightBoundField DataField="TASKCODE" HeaderText="委托书编号" ItemStyle-Width="100px" />
                    <zhongsoft:LightBoundField DataField="GPROJECTCODE" HeaderText="工程编号" ItemStyle-Width="100px" />
                    <zhongsoft:LightBoundField DataField="GPROJECTNAME" HeaderText="工程名称" ItemStyle-Width="250px" />
                    <zhongsoft:LightBoundField DataField="PROJECTTYPENAME" HeaderText="工程类别" ItemStyle-Width="100px" />
                    <zhongsoft:LightBoundField DataField="PHASENAME" HeaderText="设计阶段" ItemStyle-HorizontalAlign="Left" />
                    <zhongsoft:LightBoundField DataField="PROJECTCODE" HeaderText="项目编号" ItemStyle-Wrap="false" />
                    <zhongsoft:LightBoundField DataField="PROJECTNAME" HeaderText="项目名称" MaxLength="15" />
                    <zhongsoft:LightButtonField HeaderText="拆分" EditItemClick="showDetail" DataParamFields="PROJECTID,CONTRACTSIGNTEMPID"
                        CommandName="EditData">
                    </zhongsoft:LightButtonField>
                    <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="viewDetail" DataParamFields="PROJECTID,CONTRACTSIGNTEMPID"
                        ItemStyle-HorizontalAlign="Center" CommandName="ViewData" />
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr id="Tr2" class="trProject" runat="server">
        <td class="td-m" colspan="6" height="25" style="font-weight: bold; text-align: center">
            统计列表
        </td>
    </tr>
    <tr class="trProject">
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvStatistics" runat="server" AllowPaging="true"
                ShowExport="true" AutoGenerateColumns="false" UseDefaultDataSource="true"
                BindGridViewMethod="BindPhaseProject" OnRowDataBound="gvStatistics_RowDataBound">
                <Columns>
                    <zhongsoft:LightBoundField DataField="PROJECTCODE" HeaderText="项目编号" ItemStyle-Width="100px" />
                    <zhongsoft:LightBoundField DataField="PROJECTNAME" HeaderText="项目名称" ItemStyle-Width="250px" />
                    <zhongsoft:LightBoundField DataField="ITEMVALUE" HeaderText="批准概算阶段<br/>项目合同额(万元)"
                        ItemStyle-HorizontalAlign="Right" ItemStyle-Width="100px" HtmlEncode="false" />
                    <zhongsoft:LightBoundField DataField="COMPLETEVALUE" HeaderText="批概后阶段<br/>项目完成合同额(万元)"
                        ItemStyle-HorizontalAlign="Right" ItemStyle-Width="100px" HtmlEncode="false" />
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>--%>
    <tr>
        <td colspan="6">
            <uc1:UCContractRelFile ID="ucContractRelFile" runat="server"></uc1:UCContractRelFile>
        </td>
    </tr>
</table>
<!--流程主键ID-->
<input type="hidden" runat="server" id="hiGridContractAccountID" field="GRIDCONTRACTACCONTID"
    tablename="MCM_GRIDCONACCONTFORM" />
<!----记录要中止的合同是否 生产不立项----->
<input type="hidden" runat="server" id="hiNotBuild" field="NOTBUILD" tablename="MCM_GRIDCONACCONTFORM" />
<script>
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
        accessOfProjectDisplay();
        accessOfAddProDisplay();
        accessOfFileAddDisplay();
        if (typeof (ucContractRelProject_Init) == "function") {
            ucContractRelProject_Init();
        }
    }

    function checkForm() {
        if (($actName == "填写批概合同额相关信息" || $actName == "修改批概合同额相关信息") && $formAction == 0) {
            if (!checkIsSame()) {
                alert("批准概算合同额与批概后完成合同额不相等");
                return false;
            }
        }
        return true;
    }

    //验证批准概算阶段项目合同额是否与批概后阶段项目完成合同额相等
    function checkIsSame() {
        var contractValue = $("#<%=txtEstimateValue.ClientID %>").val();
        var completeValue = $("#<%=txtAfterEstimateValue.ClientID %>").val();
        if (isMoney(contractValue)) {
            contractValue = parseFloat(contractValue) * 10000;
        }
        else {
            contractValue = 0;
        }
        if (isMoney(completeValue)) {
            completeValue = parseFloat(completeValue) * 10000;
        }
        else {
            completeValue = 0;
        }
        if (completeValue - contractValue == 0) {
            return true;
        }
        return false;
    }

    //当合同只是 生产不立项时，不需要将合同额拆分到项目
    function accessOfProjectDisplay() {
        var isNotBuild = $("#<%=hiNotBuild.ClientID %>").val();
        if (isNotBuild == "<%=(int)BoolType.是 %>") {
            $('.trProject').hide();
        }
    }
</script>
