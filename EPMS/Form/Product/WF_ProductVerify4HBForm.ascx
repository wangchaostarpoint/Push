<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ProductVerify4HBForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Product.WF_ProductVerify4HBForm" %>
<%@ Import Namespace="DAL.EPMS" %>
<!--任务的设计条件-->
<%@ Register Src="../../UI/Product/WBSConditonStats.ascx" TagName="WBSConditonStats"
    TagPrefix="uc1" %>
<!--任务的校审人-->
<%@ Register Src="../../UI/Product/WBSVerifyOperator.ascx" TagName="WBSVerifyOperator"
    TagPrefix="uc2" %>
<!--任务的校审成品清单-->
<%@ Register Src="../../UI/Product/ProductList.ascx" TagName="ProductList" TagPrefix="uc3" %>
<!--已验证的成品清单-->
<%@ Register Src="../../UI/Product/ProductAfterVerifyList.ascx" TagName="ProductAfterVerifyList" TagPrefix="uc12" %>
<!--校审意见清单-->
<%@ Register Src="../../UI/Product/ProductOpinion.ascx" TagName="ProductOpinionList"
    TagPrefix="uc4" %>
<!--校审要点-->
<%@ Register Src="../../UI/Product/WBSVerifyPoint.ascx" TagName="WBSVerifyPoint"
    TagPrefix="uc5" %>
<!--校审结论-->
<%@ Register Src="../../UI/Product/WBSQualityEvaluation.ascx" TagName="WBSQualityEvaluation"
    TagPrefix="uc11" %>
<!--强条-->
<%@ Register Src="../../UI/Product/WBSMandatory.ascx" TagName="WBSMandatory" TagPrefix="uc6" %>
<%@ Register Src="../../UI/Product/RollSignInfo.ascx" TagName="RollSignInfo" TagPrefix="uc7" %>
<%@ Register Src="../../UI/Product/JoinSignOperator.ascx" TagName="JoinSignOperator"
    TagPrefix="uc8" %>
<!---计算书信息--->
<%@ Register Src="../../UI/Product/CalculateInfoList.ascx" TagName="CalculateInfoList"
    TagPrefix="uc9" %>
<!---各专业成品校审修改列表--->
<%@ Register Src="../../UI/Product/ModifyProductList.ascx" TagName="ModifyProductList"
    TagPrefix="uc10" %>
<%@ Import Namespace="DAL.EPMS" %>
<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<%@ Import Namespace="Zhongsoft.Portal.EPMS.Handler" %>
<div>
    <table class="tz-table" width="100%">
        <tr id="wbsInfoHeader" style="display: none;">
            <td colspan="6" class="td-m flexible" onclick="openDetail('wbsInfo')">WBS基本信息&nbsp;<img src="../../themes/images/lright.png" />
            </td>
        </tr>
        <tr style="display: none">
            <td class="td-l">校审类型<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightDropDownList runat="server" ID="ddlVerifyType" activestatus="(23.建立校审单)"
                    req="1">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiVerifyType" tablename="EPMS_ProductVerifyForm"
                    field="VerifyType" />
            </td>
        </tr>

        <tr>
            <td class="td-l">项目名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
                    IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" OnClick="txtProjectName_OnClick"
                    PageWidth="850" EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                    FilterFunction="projFilter()" ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode','txtPhaseName':'PhaseName'}"
                    TableName="EPMS_ProductVerifyForm" Field="ProjectName" activestatus="(2.建立校审单)"
                    req="1"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiOrganizationID" tablename="EPMS_ProductVerifyForm"
                    field="OrganizationID" />
                <input type="hidden" runat="server" id="hiParamProjectTypeID" />
            </td>
            <td class="td-l">项目编号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(2.建立校审单)"
                    readonly="readonly" class="kpms-textbox" TableName="EPMS_ProductVerifyForm" Field="ProjectCode"
                    req="1" />
            </td>
        </tr>
        <tr>
            <td class="td-l">任务名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="txtWBSName" SourceMode="SelectorPage"
                    IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                    EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/WBSSelector.aspx"
                    ResultForControls="{'hiWBSID':'id','txtWBSCode':'WBSCode','txtBelongSpecialtyName':'ExecSpecialtyName','hiBelongSpecialtyID':'ExecSpecialtyID','hiBelongSpecialtyCode':'ExecSpecialtyCode','txtBelongDeptName':'BelongDeptName','hiBelongDeptID':'BelongDeptID','ddlWBSType':'ParamWBSTypeID','hiWBSType':'WBSType','hiWBSFlag':'WBSFlag'}"
                    activestatus="(2.建立校审单)" BeforeSelect="beforeSelectWbs()" FilterFunction="wbsFilter()"
                    req="1" AfterSelect="afterWBSSelect()" tablename="EPMS_ProductVerifyForm" field="WBSName"></zhongsoft:LightObjectSelector>
                <asp:LinkButton runat="server" ID="btnAfterSelectWBS" OnClick="btnAfterSelectWBS_Click"
                    Visible="false"></asp:LinkButton>
                <input type="hidden" runat="server" id="hiWBSID" tablename="EPMS_ProductVerifyForm"
                    field="WBSID" />
            </td>
            <td class="td-l">任务编号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtWBSCode" activestatus="(2.建立校审单)"
                    readonly="readonly" class="kpms-textbox" TableName="EPMS_ProductVerifyForm" Field="WBSCode"
                    req="1" />
            </td>
        </tr>
        <tr>
            <td class="td-l" style="display: none">任务类别<span class="req-star">*</span>
            </td>
            <td class="td-r" style="display: none">
                <zhongsoft:LightDropDownList runat="server" ID="ddlWBSType" TableName="EPMS_ProductVerifyForm"
                    Field="ParamWBSTypeID" activestatus="(2.建立校审单)" req="1">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiWBSType" tablename="EPMS_ProductVerifyForm"
                    field="WBSType" />
            </td>
            <td class="td-l">设计/编制人<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="hiWBSOwnerName" activestatus="(2.建立校审单)"
                    readonly="readonly" class="kpms-textbox" TableName="EPMS_ProductVerifyForm" Field="WBSOwnerName"
                    req="1" />
                <input type="hidden" runat="server" id="hiWBSOwnerId" tablename="EPMS_ProductVerifyForm"
                    field="WBSOwnerID" />
            </td>

            <td class="td-l">任务标识
            </td>
            <td class="td-r">
                <asp:CheckBoxList runat="server" ID="cblWBSFlag" RepeatDirection="Horizontal" activestatus="(23.建立校审单)(23.分配校审任务)(23.主任工校审)">
                </asp:CheckBoxList>
                <input type="hidden" runat="server" id="hiWBSFlag" field="WBSFlag" tablename="EPMS_ProductVerifyForm" />
                <asp:LinkButton runat="server" ID="lbtnRefreshProject" OnClick="lbtnRefreshProject_Click"
                    Style="display: none">
                </asp:LinkButton>
            </td>
            <td class="td-l">设计阶段
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtPhaseName" activestatus="(2.建立校审单)" readonly="readonly" class="kpms-textbox" />
            </td>
        </tr>
        <tr id="trCom" style="display: none;">
            <td class="td-l">选择关联卷册<asp:ImageButton ID="ibtnSelectReleWBS" runat="server" OnClientClick="return selectRelaWBS();"
                displaystatus="(23.建立校审单)" OnClick="btnReleWBS_Click" ImageUrl="~/themes/images/look-up.gif"
                ToolTip="您可以添加关联的卷册并行完成校审" />
            </td>
            <td colspan="5" class="td-m">
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvReleWBSList" AllowPaging="false"
                    PageSize="50" ShowExport="true" AutoGenerateColumns="false" AllowSorting="true"
                    DataKeyNames="WBSID" UseDefaultDataSource="true" BindGridViewMethod="BindRelateWBSList"
                    EmptyDataText="没有关联卷册信息" OnRowDataBound="gvReleWBSList_RowDataBound" OnRowCommand="gvReleWBSList_RowCommand">
                    <Columns>
                        <zhongsoft:LightTemplateField ItemStyle-Width="30px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <%--<zhongsoft:LightBoundField DataField="WBSCode" HeaderText="卷册编号" />--%>
                        <zhongsoft:LightTemplateField HeaderText="卷册编号">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbWBSCode" content="code" Text='<%# Eval("WBSCode") %>'></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField DataField="WBSName" HeaderText="卷册名称" />
                        <zhongsoft:LightBoundField DataField="WBSOwnerName" HeaderText="卷册负责人" />
                        <zhongsoft:LightTemplateField HeaderText="校审信息" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="ibtnViewFlow" EnableTheming="false" Visible="false">
                                                 <img alt="" style="cursor: pointer"  src="<%=WebAppPath%>/Themes/Images/btn_dg_detail.gif" />
                                </asp:LinkButton>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="修改状态">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbModifyInfo" content="value"></asp:Label>
                                <%-- <asp:LinkButton runat="server" ID="lbtnStartModifyFlow" OnClientClick="if(!confirm('确认要发起成品设计修改流程吗？')) return false;"
                                    Visible="false" EnableTheming="false" CommandArgument='<%#Eval("WBSID") %>' OnClick="lbtnStartModifyFlow_Click">发起成品修改流程</asp:LinkButton>--%>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightButtonField HeaderText="发起成品设计修改流程" EditItemClick="checkCanStartModify"
                            ImageUrl="../../../Themes/Images/ico_act_start.png" DataParamFields="ModifyInfo"
                            CommandName="StartModifiedFlow" />
                        <asp:TemplateField HeaderText="删除" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center"
                            Visible="false">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" ToolTip="删除" CommandName="del"
                                    CommandArgument='<%# Eval("WBSID") %>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="<%=this.WebAppPath %>/Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
        <tr>

            <td class="td-l">专业
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtBelongSpecialtyName" activestatus="(2.建立校审单)"
                    readonly="readonly" class="kpms-textbox" tablename="EPMS_ProductVerifyForm" field="BelongSpecialtyName" />
                <input type="hidden" runat="server" id="hiBelongSpecialtyID" field="BelongSpecialtyID"
                    tablename="EPMS_ProductVerifyForm" />
                <input type="hidden" runat="server" id="hiBelongSpecialtyCode" field="BelongSpecialtyCode"
                    tablename="EPMS_ProductVerifyForm" />
            </td>
            <td class="td-l">部门
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtBelongDeptName" activestatus="(2.建立校审单)"
                    readonly="readonly" class="kpms-textbox" field="BelongDeptName" tablename="EPMS_ProductVerifyForm" />
                <input type="hidden" runat="server" id="hiBelongDeptID" field="BelongDeptID" tablename="EPMS_ProductVerifyForm" />
            </td>
            <td class="td-l">产品级别<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlProductType" runat="server" activestatus="(23.建立校审单)" req="1" tablename="EPMS_ProductVerifyForm" field="ProductType" AutoPostBack="true" OnSelectedIndexChanged="ddlProductType_SelectedIndexChanged">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>

        <tr>
            <td class="td-l">产品分级说明
            </td>
            <td colspan="5" class="td-m">
                <a target="_blank" class="aStyle" href="<%=WebAppPath %>/Sys/Download/EPMS/院内产品分级表.pdf">院内产品分级表</a>
            </td>
        </tr>
        <tr>
            <td class="td-l">校核人<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtChecker" IsMutiple="false" Width="110px" req="1"
                    SelectPageMode="Dialog" SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                    ShowAttrs="name,UserCode" PageWidth="850" ResultForControls="{'hiCheckerId':'id'}" RoleName="校核人"
                    PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" activestatus="(23.建立校审单)" OnClick="txtChecker_Click"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiCheckerId" />
            </td>
            <td class="td-l">审查人<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtSCUser" IsMutiple="false" Width="110px" req="1"
                    SelectPageMode="Dialog" SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                    ShowAttrs="name,UserCode" PageWidth="850" ResultForControls="{'hiSCUserId':'id'}" RoleName="审查人"
                    PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" activestatus="(23.建立校审单)" OnClick="txtSCUser_Click"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiSCUserId" />
            </td>
            <td class="td-l">核定人<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtHDUser" IsMutiple="false" Width="110px" req="1"
                    SelectPageMode="Dialog" SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                    ShowAttrs="name,UserCode" PageWidth="850" ResultForControls="{'hiHDUserId':'id'}" RoleName="核定人"
                    PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" activestatus="(23.建立校审单)" OnClick="txtHDUser_Click"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiHDUserId" />
            </td>
        </tr>
        <tr>
            <td class="td-l">批准人<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtPZUser" IsMutiple="false" Width="110px" req="1"
                    SelectPageMode="Dialog" SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                    ShowAttrs="name,UserCode" PageWidth="850" ResultForControls="{'hiPZUserId':'id'}" RoleName="批准人"
                    PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" activestatus="(23.建立校审单)" OnClick="txtPZUser_Click"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiPZUserId" />
            </td>
            <td class="td-m" colspan="4"></td>
        </tr>
        <tr id="trSignUserInfo" style="display: none">
            <td class="td-l">会签人
            </td>
            <td class="td-m" colspan="5">
                <uc8:JoinSignOperator ID="UCJoinSignOperator" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="6" class="td-m" title="第一次使用此流程请点击“安装协同校审系统”链接安装协同校审程序,点击“启动协同校审系统”可直接启动CAD。">
                <a href="javascript:StartCAD();" id='cadStart' style="text-decoration: underline; color: Blue; display: none;">启动协同校审系统</a>
                <a href="javascript:InstallCAD();" id='cadInstall' style="text-decoration: underline; color: Blue; display: none;">安装协同校审系统</a>
                <span style="color: Red; font-weight: bold">使用协同校审时注意：</span> <span style="color: Red;">(1)(1/2)图纸符号请使用全角:（1／2）</span>
            </td>
        </tr>
    </table>
</div>
<div id="divSignIndo" runat="server" displaystatus="(*.签署确认)(*.自动批签及PLT确认)">
    <uc7:RollSignInfo ID="rollSignInfo" runat="server" />
</div>
<div style="height: 5px">
</div>
<div id="ouPutPorduct">
    <uc3:ProductList ID="ProductList" runat="server" OnDataChanged="ProductList_DataChanged" />
    <!-- 套用图数量-->
    <input type="hidden" runat="server" id="hiReuseCnt" value="0" />
</div>
<div style="height: 5px">
</div>
<div>
    <uc12:ProductAfterVerifyList ID="ProductAfterVerifyList" runat="server" />
</div>
<div style="height: 5px">
</div>
<div id="outPutOpinion">
    <uc4:ProductOpinionList ID="ProductOpinionList" runat="server" />
</div>
<div style="height: 5px">
</div>
<div id="divMdified" style="display: none">
    <uc10:ModifyProductList ID="ucModifyProductList" runat="server" />
</div>
<table class="tz-table" width="100%" id="tbEvaluation">
    <tr>
        <td colspan="6" class="flexible" onclick="openDetail('qualityEvaluation')">校审结论&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr id="qualityEvaluation">
        <td colspan="6">
            <uc11:WBSQualityEvaluation ID="WBSQualityEvaluation" runat="server" />
        </td>
    </tr>
</table>
<table class="tz-table" width="100%" id="tbVerifyPoint" style="display:none;">
    <tr id="verifyPointHeader">
        <td colspan="6" class="flexible" onclick="openDetail('verifyPoint')">校审要点&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr id="verifyPoint">
        <td colspan="6">
            <uc5:WBSVerifyPoint ID="WBSVerifyPoint" runat="server" />
        </td>
    </tr>
</table>
<div style="height: 5px">
</div>
<table class="tz-table" style="display:none;">
    <tr>
        <td colspan="6" class="flexible" onclick="openDetail('mandatory')">强制性条文&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr id="mandatory">
        <td colspan="6">
            <uc6:WBSMandatory ID="WBSMandatory" runat="server" />
        </td>
    </tr>
</table>
<div style="height: 5px">
</div>
<div id="divCalcuteList">
    <uc9:CalculateInfoList ID="ucCalculateInfoList" runat="server" />
</div>

<!--用于检查协同校审工具是否安装-->
<object id="CADActive" style="display: none" classid="clsid:F4B25887-127F-46A9-BF75-30332B826B51">
</object>
<!--主键-->
<input type="hidden" id="hiFormID" runat="server" tablename="EPMS_ProductVerifyForm"
    field="ProductVerifyFormID" />
<input type="hidden" runat="server" id="hiPublishFlag" value="交付" />
<!---海外事业部部门编号---->
<input type="hidden" runat="server" id="hiHWDeptCode" value="01017080" />
<!---施工图阶段---->
<input type="hidden" runat="server" id="hiPhaseName" value="施工图" />
<!---竣工图阶段---->
<input type="hidden" runat="server" id="hiZPhaseName" value="竣工图" />
<!---不满足校审条件时的提示---->
<input type="hidden" runat="server" id="hiAlertMsg" value="不具备条件的提示" />
<!---是否允许发起校审流程--->
<input type="hidden" runat="server" id="hiIsAllowStartFlow" value="1" />
<!---是否允许发起校审流程--->
<input type="hidden" runat="server" id="hiIsAllowStartVerify" field="IsAllowStartVerify"
    tablename="EPMS_ProductVerifyForm" />
<!---是否有特殊放行流程--->
<input type="hidden" runat="server" id="hiIsAllowFlowGo" />
<!--关联任务-->
<input runat="server" id="hiReleXml" type="hidden" />
<input type="hidden" runat="server" id="hiTechAgreeCode" value="9" />
<input type="hidden" runat="server" id="hiSurveryVerifyConAlert" value="项目存在未提交、未接收的资料项，为不具备条件，在此基础上若勾选“结束发起互提资料流程”，则具备校审条件。
\n当不具备条件时，只有走【特殊放行管理流程】审批意见为“允许”，才可以进行校审流程。
" />
<input type="hidden" runat="server" id="hiCollectVerifyConAlert" value="施工图阶段，如果没有综合计划书，为不具备条件，只有走【特殊放行管理流程】审批意见为“允许”，才可以进行校审流程；
\n其他阶段（除施工图、竣工图阶段），如果没有综合计划书或没有综合评审，系统提示设总“请完成综合计划书和综合评审流程”，允许进行校审流程
" />
<!-- 当前校审角色-->
<input type="hidden" runat="server" id="hiCurVerifyRole" field="CurVerifyRole" tablename="EPMS_ProductVerifyForm" />
<input type="hidden" runat="server" id="hiHasNotify" />
<!-- 签出提醒文字-->
<input type="hidden" runat="server" id="hiLockMsg" value="成品被{0}签出，无法撤回！" />
<!-- 不允许撤回提示信息-->
<input type="hidden" runat="server" id="hiNoRollBackMsg" />
<!-- 典型设计成品特定成品类别-->
<input type="hidden" runat="server" id="hiDesignProductType" value="典型设计成品" />
<%--全校人资质所关联的岗位/角色,通过这个角色获取资质,带出"校核人"--%>
<input type="hidden" runat="server" id="hiQJRRoleName" value="全校人" />
<%--档案号--%>
<input type="hidden" runat="server" id="hiArchiveCode">
<style type="text/css">
    .wpf_header div {
        background: url(../../Themes/Images/wp-header.png) no-repeat left top;
        height: 21px;
        line-height: 21px;
        padding-left: 35px;
        2px;
        clor: # cursor poin
    }

        .wpf_header div span {
            float: left;
        }
</style>
<script type="text/javascript">
    function initCustomerPlugin() {
        //检查是否安装了协同校审
        var object = document.all.CADActive.object;
        if (object == null || object == undefined) {
            $("#cadInstall").show();
        }
        else {
            $("#cadStart").show();
        }
        showOrHideByDifVerifyType();
        initVerifyType();
        $('#<%=ddlVerifyType.ClientID %>').bind('change', function () {
            initVerifyType();
        });

        if (typeof (initProductList) == 'function') {
            initProductList();
        }
        showVerifyConAlert();
        showOrHIdeZGInfo();

        initInvestment();

        //任务标识
        initWBSFlag();

        //第一步不显示校审意见
        if ($actName == "建立校审单") {
            $('#outPutOpinion').hide();
        }

        //解决意见控件高度自适应问题
        if (typeof (initOpinionTdHeight) == 'function') {
            initOpinionTdHeight();
        }
    }

    //阻止撤回
    function rollBack() {
        var noRollBackMsg = $('#<%=hiNoRollBackMsg.ClientID %>').val();
        if (noRollBackMsg != '') {
            alert(noRollBackMsg);
            return false;
        }
        return true;
    }

    //只有综合卷册才显示关联卷册信息
    function initVerifyType() {
        var verifyType = $('#<%=ddlVerifyType.ClientID %>').val();
        var hiType = $('#<%=hiVerifyType.ClientID %>').val();
        if (hiType == "")
            hiType = verifyType;
        //只有四级校审和勘测校审才显示计算书信息
        //只有综合校审才显示关联卷册及各专业修改卷册列表
        if (hiType == '<%=(int)ProductVerifyType.综合校审 %>') {
            $('#trCom').hide();
            $("#divMdified").hide();
            $("#divCalcuteList").hide();
            //成品是否有变化
            $('#trProductChange').hide();
            //是否满足强条要求
            $('#trIsWBSMandatory').hide();

            //质量评语
            $("#tbEvaluation").hide();
            $('#isNeedPassMan').hide();
        }
        else {
            if (hiType == '<%=(int)ProductVerifyType.设计成品校审 %>' || hiType == '<%=(int)ProductVerifyType.勘测成品校审 %>'
                || hiType == '<%=(int)ProductVerifyType.典型设计成品校审 %>') {
                $("#divCalcuteList").show();
            }
            else {
                $("#divCalcuteList").hide();
            }
            $('#trCom').hide();
            //if(hiType == '<%=(int)ProductVerifyType.设计成品校审 %>'){
            //    $("#trSignUserInfo").show();
            //}
            //成品是否有变化
            $('#trProductChange').show();
            if (hiType != '<%=(int)ProductVerifyType.典型设计成品校审 %>') {
                //是否满足强条要求
                $('#trIsWBSMandotry').show();
            }
            //质量评语
            if ((hiType == '<%=(int)ProductVerifyType.勘测成品校审 %>' || hiType == '<%=(int)ProductVerifyType.设计成品校审 %>') && $actName != "建立校审单") {
                $("#tbEvaluation").show();
            }
            else {
                $("#tbEvaluation").hide();
            }
        }

        if (hiType == '<%=(int)ProductVerifyType.典型设计成品校审 %>') {
            //典型设计成品隐藏校审要点、强条
            $('#tbVerifyPoint').hide();
            //隐藏是否具备校审条件相关内容
            $('[dflag="0"]').hide();
            $('[dflag="1"]').show();
            $('[dflag="2"]').hide();
        }
        else {
            $('[dflag="0"]').hide();
            $('[dflag="1"]').hide();
            $('[dflag="2"]').show();
            if (verifyType == "<%=(int)ProductVerifyType.竣工图校审%>") {
                $('#noShowInFinishVerify').hide();
                $('#trIsWBSMandatory').hide();
            }
        }
    }

    function initWBSFlag() {
        $("#<%=cblWBSFlag.ClientID %>").live("change", function () {

        });
    }

    //是否显示是否需要总工签署
    function showOrHIdeZGInfo() {
        var verifyType = $("#<%=hiVerifyType.ClientID %>").val();
        if (verifyType == "<%=(int)ProductVerifyType.设计成品校审 %>") {
            if (($action == "<%=(int)AccessLevel.Create %>" || $action == "<%=(int)AccessLevel.Update %>") && $actName == "建立校审单") {
                $("#trShowInVerify").hide();
            }
            else {
                $("#trShowInVerify").hide();
            }
        }
        else {
            $("#trShowInVerify").hide();
        }
    }

    function initInvestment() {
        var verifyType = $("#<%=hiVerifyType.ClientID %>").val();
        var speCode = $('#<%=hiBelongSpecialtyCode.ClientID %>').val();
        $('#trInvestment').hide();
        //成品四级校审、技经专业显示投资额信息
        if (verifyType == "<%=(int)ProductVerifyType.设计成品校审 %>" && speCode.toLowerCase() == 'e') {
            $('#trInvestment').show();
        }
    }

    function checkedRefreshProductList() {
        var wbsFlag = $("#<%=hiWBSFlag.ClientID %>").val();
        var checked = checkValueChecked("压力管道");
        if (wbsFlag.indexOf("压力管道") > -1 && !checked) {
            refreshProductList();
        }
        else if (wbsFlag.indexOf("压力管道") < 0 && checked) {
            refreshProductList();
        }
    }

    //启动协同校审
    function StartCAD() {
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
        var wbsId = $('#<%=hiWBSID.ClientID %>').val();
        if (orgId == "") {
            alert("-请先选择项目");
        }
        else {
            var url = "/Portal/EPMS/List/Product/ProductCADStart.aspx?OrganizationId=" + orgId + "&WBSId=" + wbsId;
            window.open(url);
        }
    }

    //安装在线助手
    function InstallCAD() {
        var strPath = "<%=WebAppPath %>/Sys/Download/ZSCheckoutin.rar";
        window.open(strPath);
    }

    ///查看关联任务的详细档案信息
    function releWBSDetail(wbsId) {

    }

    //选择任务之前的逻辑判断
    function beforeSelectWbs() {
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
        if (orgId == '' || orgId == undefined) {
            alert('请先选择项目，再选择卷册！');
            return false;
        }
        return true;
    }


    //选择互提资料之前的逻辑判断
    function beforeSelectFile() {
        var orgId = $('#<%=hiBelongSpecialtyID.ClientID %>').val();
        if (orgId == '' || orgId == undefined) {
            alert('请先选择卷册确定专业后再选择专业下资料！');
            return false;
        }
        return true;
    }


    //选择任务负责人前必须选择任务
    function beforeSelectOwner() {
        var wbsId = $('#<%=hiWBSID.ClientID %>').val();
        if (wbsId == '' || wbsId == undefined) {
            alert('请先选择校审任务，再选择任务负责人！');
            return false;
        }
        return true;
    }

    //选择任务的筛选条件
    function wbsFilter() {
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
        var ownerId = '<%=KPMSUser.Id %>';
        var formType = '<%=Zhongsoft.Portal.EPMS.Obsolete.WBSFormTypeSelect.校审.ToString() %>';//, WBSFormTypeSelect: formType
        return { OrganizationID: orgId, WBSType: '<%=WBSMode.任务管理.GetHashCode() %>', OwnerId: ownerId, IsShowMore: 1 };
    }

    //选择负责人的筛选
    function ownerFilter() {
        var projTypeId = $('#<%=hiParamProjectTypeID.ClientID %>').val();
        var specId = $('#<%=hiBelongSpecialtyID.ClientID %>').val();
        var roleId = '646F4096-E8DA-49F2-9C5E-42DDD22623F4'; //卷册负责人角色
        return { ProjectTypeID: projTypeId, SpecialtyID: specId, RoleID: roleId };
    }

    //互提资料筛选
    function filterMutualFilter() {
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
        //var rollId = $('#<%=hiWBSID.ClientID %>').val();
        var exeSpecialtyID = $('#<%=hiBelongSpecialtyID.ClientID %>').val();
        return { OrganizationID: orgId, ExeSpecialtyID: exeSpecialtyID, IsContainComplete: 0 };
    }

    ///选择关联任务，需要按项目、专业
    function selectRelaWBS() {
        var wbsId = $('#<%=hiWBSID.ClientID %>').val();
        if (wbsId == '' || wbsId == undefined) {
            alert('请先选择校审任务，再选择相关任务！');
            return false;
        }
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();

        var json = { OrganizationID: orgId, WBSType: '<%=(int)WBSMode.任务管理 %>', WBSState:'<%=WBSState.已完成.GetHashCode() %>' };

        //        var url = buildQueryUrl('/EPMS/Obsolete/WBSSelector.aspx', json);
        //        showDivDialog(url, null, 1050, 600, null);
        var param = new InputParamObject("m");
        getWBS("<%=hiReleXml.ClientID %>", param, json, afterReleSelect);
        return false;
    }

    //选择关联任务后
    function afterReleSelect() {
          <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.ibtnSelectReleWBS, "")%>;
    }

    function afterWBSSelect() {
         <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.btnAfterSelectWBS, "")%>;
    }

    function checkForm() {//原有方法: KPMSCheckSubmit
        var organizationId = $('#<%=hiOrganizationID.ClientID %>').val();
        var bizId = '<%=BusinessObjectId %>';
        //回退环节也要校验相关逻辑判断，比如回退也要进行签出校验
        if ($formAction == 0 || $formAction == 1) {//原有属性: $readyFormSend
            var result;
            var checkType = "VerifyLock";

            if ($actName == "建立校审单"
                || $actName == "参与人确认"
                || $actName == "汇总校审成品"
                || ($actName == "设计修改")) {
                //设计修改步骤成品有变化的情况下，也要验证成品类别必选
                checkType = "VerifyAll";

            }
            else if ($actName == "分配校审任务") {
                checkType = "VerifyOperator";
            }
            else if ($actName == "确定成品校核人") {
                checkType = "VerifyOperatorOnlyChecker";
            }
            else if ($actName == "签署确认" || $actName == "自动批签及PLT确认") {
                checkType = "CheckSignSuccess";
            }

            $.ajax({
                type: 'POST',
                url: buildQueryUrl("/EPMS/Handler/CheckCodeHandler.ashx", null),
                data: { 'checkType': checkType, 'OrganizationID': organizationId, 'BizID': bizId, 'CurUserId': '<%=KPMSUser.Id %>', 'WBSID': $("#<%=hiWBSID.ClientID %>").val() },
                async: false,
                cache: false,
                success: function (res) {
                    result = res;
                },
                error: function (err) {
                    //alert(err);
                }
            });

            if (result != "" && result != null && result != undefined) {
                if ($actName == "签署确认" || $actName == "自动批签及PLT确认") {
                    //alert("该卷册" + result + "，不能向下发送");
                    alert("请在CAD校审工具中签署并转PDF后，再发送流程");
                }
                else {
                    alert(result);
                }
                return false;
            }

            //修改步骤，判断是否有未选中的执行意见信息及选择“不执行”没有填写拒绝原因
            if ($actName.indexOf("修改") > -1) {
                var isAllExeSelected = checkHasChooseExeState();
                var isAllWrite = checkNoExeReason();
                if (!isAllExeSelected) {
                    alert("还存在没有填写修改情况的校审意见，请填写修改情况后再处理！");
                    return false;
                }
                else if (!isAllWrite) {
                    alert("还存在修改情况为“不执行”但没有填写不执行原因的校审意见，请填写后再处理！");
                    return false;
                }

                if ($('#<%=hiVerifyType.ClientID %>').val() == '<%=(int)ProductVerifyType.综合校审 %>') {
                    var rollValue = "";
                    var $Code = $('#<%=gvReleWBSList.ClientID %> [content="code"]');
                    var $State = $('#<%=gvReleWBSList.ClientID %> [content="value"]');
                    var len = $State.length;
                    for (var i = 0; i < len; i++) {
                        if ($State.eq(i).text() == '正在修改' || $State.eq(i).text() == '准备修改') {
                            rollValue = rollValue + $Code.eq(i).text() + ",";
                        }
                    }
                    if (rollValue != "") {
                        rollValue = rollValue.substring(0, rollValue.length - 1);
                        alert("关联卷册" + "\"" + rollValue + "\"" + "正在修改，请催促相关卷册负责人完成《成品设计修改》流程，再发送下一步骤。");
                        return false;
                    }
                }
            }

            var verifyType = $("#<%=hiVerifyType.ClientID %>").val();
            //校审流程发起后是否可以继续向下发送，若不具备校审条件，且没有特殊放行流程，不允许向下发送,竣工图没有控制
            if ($actName == "建立校审单" && verifyType != "<%=(int)ProductVerifyType.竣工图校审 %>" && verifyType != "<%=(int)ProductVerifyType.典型设计成品校审 %>") {
                //综合卷册校审，第一步骤时提醒是否选择了关联卷册信息
                if (verifyType == "<%=(int)ProductVerifyType.综合校审 %>") {
                    checkRefeRoll();
                    if (!checkRollSelectedFinished())
                        return false;
                }
            }



        } else if ($formAction = 2) {
            //新建状态下保存要验证项目信息必填
            if ($actName == '建立校审单') {
                if ($("[Field='ProjectName']").val() == "" || ($("[Field='WBSName']").text() == "" && $("[Field='WBSName']").val() == "")) {
                    if ($("[Field='ProjectName']").val() == "") {
                        $("[Field='ProjectName']").addClass("kpms-textboxred");
                    }
                    if ($("[Field='WBSName']").val() == "") {
                        $("[Field='WBSName']").addClass("kpms-textboxred");
                    }
                    alert("请先选择项目、资料名称，再进行保存。");
                    return false;
                }
            }
        }

        if (($actName.indexOf("校核") > -1 || $actName.indexOf("校审") > -1 || $actName.indexOf("审核") > -1
            || $actName.indexOf("审定") > -1 || $actName.indexOf("会签") > -1 || $actName.indexOf("批准") > -1)
            && $actName != '建立校审单' && $actName != '分配校审任务') {//验证排除建立校审单步骤
            var result;
            var checkType = '<%=CheckTypeEnum.CheckOpinion %>';//检查校审意见填写情况，确定发送还是回退
            if ($formAction == 0) {//发送
                $.ajax({
                    type: 'POST',
                    url: buildQueryUrl("/EPMS/Handler/CheckCodeHandler.ashx", null),
                    data: { 'checkType': checkType, 'OrganizationID': organizationId, 'BizID': bizId, 'CurUserId': '<%=KPMSUser.Id %>', 'WBSID': $("#<%=hiWBSID.ClientID %>").val() },
                    async: false,
                    cache: false,
                    success: function (res) {
                        result = res;
                    },
                    error: function (err) {
                        //alert(err);
                    }
                });
            }
            else if ($formAction == 1) {//回退
                $.ajax({
                    type: 'POST',
                    url: buildQueryUrl("/EPMS/Handler/CheckCodeHandler.ashx", null),
                    data: { 'checkType': checkType, 'OrganizationID': organizationId, 'BizID': bizId, 'CurUserId': '<%=KPMSUser.Id %>', 'WBSID': $("#<%=hiWBSID.ClientID %>").val() },
                    async: false,
                    cache: false,
                    success: function (res) {
                        result = res;
                    },
                    error: function (err) {
                        //alert(err);
                    }
                });
            }

            if (result != "" && result != null && result != undefined) {
                if ($formAction == 0) {//发送的时候
                    if (parseBool(result)) {
                        alert('您填写了校审意见，请点击需修改按钮回退到设计修改步骤进行修改！');
                        return false;
                    }
                }
                else if ($formAction == 1) {
                    if (!parseBool(result)) {//回退的时候
                        alert('您没有填写了校审意见，请点击发送按钮发送至下一校审人员进行校审！');
                        return false;
                    }
                }
            }
        }

        //检查校审步骤是否勾选了该卷册满足工程强制性标准要求
        if (($actName.indexOf("校核") > -1 || $actName.indexOf("校审") > -1 || $actName.indexOf("审核") > -1
            || $actName.indexOf("审定") > -1 || $actName.indexOf("会签") > -1 || $actName.indexOf("批准") > -1)
            && $actName != '建立校审单' && $actName != '分配校审任务') {//验证排除建立校审单步骤
            var result;

        }
        return true;
    }

    //接口资料下载页面
    function openFileDetail() {
        var releWBSID = $("#<%=hiWBSID.ClientID %>").val();
        var organizationID = $("#<%=hiOrganizationID.ClientID %>").val();
        var specialtyID = $("#<%=hiBelongSpecialtyID.ClientID %>").val();
        var json = { actionType: 1, ReleWBSID: releWBSID, OrganizationID: organizationID, SpecialtyID: specialtyID };
        var url = buildQueryUrl("/EPMS/List/WBS/WBSFileDownload.aspx", json);
        showDivDialog(url, null, 800, 600, null);
        return false;
    }

    //打开卷册档案袋
    function showWBSDetail() {
        var url ="<%=WebAppPath %>/Custom/List/Dashboard.aspx?ListId=494CE4A3-A401-4B85-A97D-3247C6D2F439&ViewId=3B413684-1588-4B7D-A3F7-D9307C23CE7B&secid=3B413684-1588-4B7D-A3F7-D9307C23CE7B&IsDashboard=1&ShowToolbar=0&IsShowHeader=2&ActionType=1";
        var json = { WBSID: $("#<%=hiWBSID.ClientID %>").val() };
        url = buildQueryUrl(url, json);
        window.open(url);
    }

    //压力管道
    function refreshProductList() {
        //<%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.lbtnRefreshProject, "")%>; 
    }

    //判断某个选项是否选中
    function checkValueChecked(checkedValue) {
        //如果需要出版，则是否需要总工签署不可编辑
        var isCheck = false;
        $("#<%=cblWBSFlag.ClientID %> :checkbox").each(function () {
            if ($(this)[0].checked) {
                if ($(this).next().text() == checkedValue)
                    isCheck = true;
            }
        });
        return isCheck;
    }

    //判断发起校审单后是否可以向下发送
    function checkCanStartFlow() {
        var isAllowStartFlow = $("#<%=hiIsAllowStartFlow.ClientID %>").val();
        var verifyType = $("#<%=hiVerifyType.ClientID %>").val();
        //是否有综合计划书
        //var isHavePlan = returnHavePlan();
        //是否有综合评审
        //var isHaveReview = returnHaveReview();
        var alterMsg = "";
        //不允许向下发送
        if (isAllowStartFlow == "0") {
            if (verifyType == "<%=(int)ProductVerifyType.设计成品校审 %>") {
                alterMsg = $('#spSJJS').text();
            }
            else if (verifyType == "<%=(int)ProductVerifyType.勘测成品校审 %>") {
                alterMsg = $('#spKCJS').text();
            }
            else if (verifyType == "<%=(int)ProductVerifyType.综合校审 %>") {
                alterMsg = $('#spZHJS').text();
            }
        }
        else {
            //使用最新的校审条件规则，以下规则不再使用，注释处理
            //var isAllowFlowGo = $("#<%=hiIsAllowFlowGo.ClientID %>").val();
            //if (verifyType == "<%=(int)ProductVerifyType.综合校审 %>") {
            //    var projectCode = $("#<%=txtProjectCode.ClientID %>").val();
            //    var rollCode = $("#<%=txtWBSCode.ClientID %>").val();
            //    //发电施工图司令图，没有综合评审
            //    if (isAllowFlowGo == "0" && projectCode.substring(projectCode.length - 1).toLowerCase() == "s" && projectCode.substring(0, 1).toLowerCase() == "f" && projectCode.toLowerCase().indexOf("e") == -1
            //        && strRollCode.indexOf("00") >= 0 && isHaveReview == "无")
            //        alert("-该项目还没有综合评审流程,请通知设总走完综合评审流程后再发起四级校审！");
            //    //只有非施工图、竣工图，无综合项目计划书
            //    if (isHavePlan == "无"
            //        && projectCode.substring(projectCode.length - 1).toLowerCase() != "s"
            //        && projectCode.substring(projectCode.length - 1).toLowerCase() != "z"
            //        && isAllowFlowGo == "0")
            //        alert("-该项目还没有综合项目计划书流程，请走完综合项目计划书流程后再发送校审流程！");
            //}
        }
        if (alterMsg != "") {
            alert(alterMsg);
            return false;
        }
        return true;
    }

    //展示是否具备校审条件的提示
    function showVerifyConAlert() {
        var hiType = $("#<%=ddlVerifyType.ClientID %>").val();
        var verifyType = $("#<%=hiVerifyType.ClientID %>").val();
        var spanConAlert = $("#spanConAlert");
        if (verifyType == "")
            verifyType = hiType;
        if (verifyType == "<%=(int)ProductVerifyType.勘测成品校审%>") {
            spanConAlert.text($("#<%=hiSurveryVerifyConAlert.ClientID %>").val());
        }
        else if (verifyType == "<%=(int)ProductVerifyType.综合校审 %>") {
            spanConAlert.html($("#<%=hiCollectVerifyConAlert.ClientID %>").val());
        }
    }

    //针对不同的校审类型，显示不同的校审信息
    function showOrHideByDifVerifyType() {
        var verifyType = $('#<%=ddlVerifyType.ClientID %>').val();
        var hiType = $('#<%=hiVerifyType.ClientID %>').val();
        if (verifyType == "")
            verifyType = hiType;
        //var verifyType = $("#<%=hiVerifyType.ClientID %>").val();
        if (verifyType == "<%=(int)ProductVerifyType.竣工图校审%>") {
            $("#notShowInFinishVerify").hide();
            $("#showInFinishVerify").hide();

            $("#noShowInFinishVerify").hide();
        }
        else {
            $("#showInFinishVerify").hide();
            $("#noShowInFinishVerify").show();

            $("#spSJJS").hide();
            $("#spKCJS").hide();
            $("#spZHJS").hide();
            if (verifyType == "<%=(int)ProductVerifyType.设计成品校审%>") {
                $("#spSJJS").show();
            }
            else if (verifyType == "<%=(int)ProductVerifyType.勘测成品校审%>") {
                $("#spKCJS").show();
            }
            else if (verifyType == "<%=(int)ProductVerifyType.综合校审%>") {
                $("#spZHJS").show();
            }
        }
    }

    //检测必须填写关联卷册
    function checkRefeRoll() {
        var relRollInfo = $("#<%=gvReleWBSList.ClientID %> [id$=ibtnViewFlow]").length;
        if (relRollInfo != null) {
            if (relRollInfo.length == 0) {
                alert("请选择关联卷册");
                alert("如果您确实没有关联卷册，可以强制发送，但是请您确保要出版的成品已经在成品列表中存在！");
                return true;
            }
            else {
                return true;
            }
        }
        return false;
    }

    // 确认提示，关联卷册是否都选择了
    function checkRollSelectedFinished() {
        return confirm('请确认需要汇总的专业卷册都已选择！\n\n点击【确定】提交流程；\n点击【取消】停止发送，继续选择“关联卷册”。');
    }

    function getZGRoleName() {
        var verifyType = $("#<%=hiVerifyType.ClientID %>").val();
        var roleName = '';
        if (verifyType == "<%=(int)ProductVerifyType.设计成品校审 %>" && $actName == "签署") {
            roleName ="<%=ProjectRole.主管总工 %>";
        }
        return roleName;
    }

    //发起特殊放行流程
    function startAllowGoFlow() {
        var url = '<%=WebAppPath %>/Sys/Workflow/FormDetail.aspx?actionType=2&packageName=EPMSAllowGoFlow.xpdl&xpdlId=EPMSAllowGoFlow_wp1&formId=226&ver=|';
        var json = { WBSIDQueryID: $("#<%=hiWBSID.ClientID %>").val() };
        url = buildQueryUrl(url, json);
        window.open(url);
        return false;
    }

    function startProductmodify() {
        var url = '<%=WebAppPath %>/Sys/Workflow/FormDetail.aspx?actionType=2&packageName=EPMSProductModify.xpdl&xpdlId=EPMSProductModify_wp1&formId=232&ver=|';
        var json = { WBSID: $("#<%=hiWBSID.ClientID %>").val() };
        url = buildQueryUrl(url, json);
        window.open(url);
        return false;
    }

    function viewForm(bizId, extendedAttribute) {
        var url = '/Custom/List/C_FormDetailLoading.aspx';
        var json = { bizId: bizId, IsOld: 2, ExtendedAttribute: extendedAttribute };
        url = buildQueryUrl(url, json);
        window.open(url);
        return false;
    }

    //提示启动流程
    function checkCanStartModify(reworkState) {
        if (reworkState == "" || reworkState == "1") {
            return confirm("您确定给卷册负责人发起成品设计修改流程吗？");
        }
        else {
            alert("此卷册的成品设计修改流程还没有结束，不能再发起成品设计修改流程");
            return false;
        }
    }

    //项目选择条件
    function projFilter() {
        //针对典型设计成品校审，选择典型设计项目
        if ($('#<%=hiVerifyType.ClientID %>').val() == '<%=(int)ProductVerifyType.典型设计成品校审 %>') {
            return { 'IsDesignProject': '1' };
        }
        else {
            return { 'IsDesignProject': '0' };
        }
        return {};
    }
</script>
