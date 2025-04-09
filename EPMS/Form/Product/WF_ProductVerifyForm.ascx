<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ProductVerifyForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Product.WF_ProductVerifyForm" %>
<%@ Import Namespace="DAL.EPMS" %>
<!--任务的设计条件-->
<%@ Register Src="../../UI/Product/WBSConditonStats.ascx" TagName="WBSConditonStats"
    TagPrefix="uc1" %>
<!--任务的校审人-->
<%@ Register Src="../../UI/Product/WBSVerifyOperator.ascx" TagName="WBSVerifyOperator"
    TagPrefix="uc2" %>
<!--任务的校审成品清单-->
<%@ Register Src="../../UI/Product/ProductList.ascx" TagName="ProductList" TagPrefix="uc3" %>
<!--校审意见清单-->
<%@ Register Src="../../UI/Product/ProductOpinionList.ascx" TagName="ProductOpinionList"
    TagPrefix="uc4" %>
<!--校审要点-->
<%@ Register Src="../../UI/Product/WBSVerifyPoint.ascx" TagName="WBSVerifyPoint"
    TagPrefix="uc5" %>
<!--质量评语-->
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
<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<%@ Import Namespace="DAL.EPMS" %>
<%--<div class="wpf_header" id="wbsInfoHeader">
    <div onclick="openDetail('wbsInfo')">
        <span>WBS基本信息</span>
    </div>
</div>--%>
<div>
    <table class="tz-table" width="100%">
        <tr id="wbsInfoHeader" style="display: none;">
            <td colspan="6" class="flexible" onclick="openDetail('wbsInfo')">
                WBS基本信息&nbsp;<img src="../../themes/images/lright.png" />
            </td>
        </tr>
        <%--        <tr>
            <td style="border-right: 1px solid #cbccce;">
                <table width="100%" id="wbsInfo">--%>
        <tr style="display: none">
            <td class="td-l">
                校审类型<span class="req-star">*</span>
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
            <td class="td-l">
                任务类别<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlWBSType" TableName="EPMS_ProductVerifyForm"
                    Field="ParamWBSTypeID" activestatus="(2.建立校审单)" req="1">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiWBSType" tablename="EPMS_ProductVerifyForm"
                    field="WBSType" />
            </td>
            <td class="td-l">
                任务标识
            </td>
            <td class="td-m" colspan="3">
                <asp:CheckBoxList runat="server" ID="cblWBSFlag" RepeatDirection="Horizontal" activestatus="(23.建立校审单)">
                </asp:CheckBoxList>
                <input type="hidden" runat="server" id="hiWBSFlag" field="WBSFlag" tablename="EPMS_ProductVerifyForm" />
                <asp:LinkButton runat="server" ID="lbtnRefreshProject" OnClick="lbtnRefreshProject_Click"
                    Style="display: none"></asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                项目名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
                    IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                    PageWidth="850" EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                    ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode'}"
                    TableName="EPMS_ProductVerifyForm" Field="ProjectName" activestatus="(2.建立校审单)"
                    req="1"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiOrganizationID" tablename="EPMS_ProductVerifyForm"
                    field="OrganizationID" />
                <input type="hidden" runat="server" id="hiParamProjectTypeID" />
            </td>
            <td class="td-l">
                项目编号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(2.建立校审单)"
                    readonly="readonly" class="kpms-textbox" TableName="EPMS_ProductVerifyForm" Field="ProjectCode"
                    req="1" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                卷册/成品名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="txtWBSName" SourceMode="SelectorPage"
                    IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                    EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/WBSSelector.aspx"
                    ResultForControls="{'hiWBSID':'id','txtWBSCode':'WBSCode','txtBelongSpecialtyName':'ExecSpecialtyName','hiBelongSpecialtyID':'ExecSpecialtyID','hiBelongSpecialtyCode':'ExecSpecialtyCode','txtBelongDeptName':'BelongDeptName','hiBelongDeptID':'BelongDeptID','ddlWBSType':'ParamWBSTypeID','hiWBSType':'WBSType','hiWBSFlag':'WBSFlag'}"
                    activestatus="(2.建立校审单)" BeforeSelect="beforeSelectWbs()" FilterFunction="wbsFilter()"
                    req="1" AfterSelect="afterWBSSelect()" tablename="EPMS_ProductVerifyForm" field="WBSName">
                </zhongsoft:LightObjectSelector>
                <asp:LinkButton runat="server" ID="btnAfterSelectWBS" OnClick="btnAfterSelectWBS_Click"
                    Visible="false"></asp:LinkButton>
                <input type="hidden" runat="server" id="hiWBSID" tablename="EPMS_ProductVerifyForm"
                    field="WBSID" />
            </td>
            <td class="td-l">
                卷册/成品编号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtWBSCode" activestatus="(2.建立校审单)"
                    readonly="readonly" class="kpms-textbox" TableName="EPMS_ProductVerifyForm" Field="WBSCode"
                    req="1" />
            </td>
        </tr>
        <tr id="trCom">
            <td class="td-l">
                选择关联卷册/成品<asp:ImageButton ID="ibtnSelectReleWBS" runat="server" OnClientClick="return selectRelaWBS();"
                    displaystatus="(3.建立校审单)" OnClick="btnReleWBS_Click" ImageUrl="~/themes/images/look-up.gif"
                    ToolTip="您可以添加关联的卷册/成品并行完成校审" />
            </td>
            <td colspan="5" class="td-m">
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvReleWBSList" AllowPaging="false"
                    PageSize="50" ShowExport="true" AutoGenerateColumns="false" AllowSorting="true"
                    DataKeyNames="WBSID" UseDefaultDataSource="true" BindGridViewMethod="BindRelateWBSList"
                    EmptyDataText="没有关联卷册/成品信息" OnRowDataBound="gvReleWBSList_RowDataBound" OnRowCommand="gvReleWBSList_RowCommand">
                    <Columns>
                        <zhongsoft:LightTemplateField ItemStyle-Width="30px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="卷册编号" />
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
                                <asp:Label runat="server" ID="lbModifyInfo"></asp:Label>
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
            <td class="td-l">
                所属类别
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlRollType" Width="100px" activestatus="(2.*)(3.建立校审单)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                定额工日
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText runat="server" ID="txtWorkDayOfConfirm" activestatus="(23.?)"
                    readonly="readonly" class="kpms-textbox" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                设计/编制人<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="hiWBSOwnerName" activestatus="(2.建立校审单)"
                    readonly="readonly" class="kpms-textbox" TableName="EPMS_ProductVerifyForm" Field="WBSOwnerName"
                    req="1" />
                <%--  <zhongsoft:LightObjectSelector runat="server" ID="txtWBSOwnerName" IsMutiple="false"
                    EnableTheming="false" activestatus="(23.建立校审单)(3.分配校审任务)" SourceMode="SelectorPage"
                    ShowJsonRowColName="true" SelectPageMode="Dialog" DoCancel="true" ResultAttr="name"
                    ResultForControls="{'hiWBSOwnerId':'id'}" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx"
                    BeforeSelect="beforeSelectOwner()" FilterFunction="ownerFilter()" TableName="EPMS_ProductVerifyForm"
                    Field="WBSOwnerName" req="1"></zhongsoft:LightObjectSelector>--%>
                <%--   <zhongsoft:LightObjectSelector runat="server" ID="txtWBSOwnerName" IsMutiple="false"
                    EnableTheming="false" activestatus="(2.建立校审单)" SourceMode="SelectorPage"
                    ShowJsonRowColName="true" SelectPageMode="Dialog" DoCancel="true" ResultAttr="name"
                    ResultForControls="{'hiWBSOwnerId':'id'}" PageUrl="~/Sys/OrgUsers/UserSelector.aspx"
                    BeforeSelect="beforeSelectOwner()" FilterFunction="ownerFilter()" TableName="EPMS_ProductVerifyForm"
                    Field="WBSOwnerName" req="1"></zhongsoft:LightObjectSelector>--%>
                <input type="hidden" runat="server" id="hiWBSOwnerId" tablename="EPMS_ProductVerifyForm"
                    field="WBSOwnerID" />
            </td>
            <td class="td-l">
                专业
            </td>
            <td class="td-r" style="width: 100px">
                <zhongsoft:XHtmlInputText runat="server" ID="txtBelongSpecialtyName" activestatus="(2.建立校审单)"
                    readonly="readonly" class="kpms-textbox" tablename="EPMS_ProductVerifyForm" field="BelongSpecialtyName" />
                <input type="hidden" runat="server" id="hiBelongSpecialtyID" field="BelongSpecialtyID"
                    tablename="EPMS_ProductVerifyForm" />
                <input type="hidden" runat="server" id="hiBelongSpecialtyCode" field="BelongSpecialtyCode"
                    tablename="EPMS_ProductVerifyForm" />
            </td>
            <td class="td-l">
                部门
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtBelongDeptName" activestatus="(2.建立校审单)"
                    readonly="readonly" class="kpms-textbox" field="BelongDeptName" tablename="EPMS_ProductVerifyForm" />
                <input type="hidden" runat="server" id="hiBelongDeptID" field="BelongDeptID" tablename="EPMS_ProductVerifyForm" />
            </td>
        </tr>
        <tr id="notShowInFinishVerify">
            <td rowspan="2" class="td-l">
                <asp:LinkButton ID="lkbFiles" runat="server" OnClientClick="return openFileDetail()"
                    EnableTheming="false" ForeColor="Blue">
                接口资料
                </asp:LinkButton>
            </td>
            <td class="td-r" rowspan="2">
                <uc1:WBSConditonStats ID="wbsCondition" runat="server" />
            </td>
            <td class="td-l" rowspan="2">
                校审条件
            </td>
            <td colspan="2" class="td-m" rowspan="2">
                <span class="req-star">是否具备校审条件：<asp:Label runat="server" ID="lbIsHaveCondition"></asp:Label></span>
                </br> <span style="color: Red" id="span1">说明：卷册存在没有提交、没有接收的资料项或者项目没有综合项目计划书，为不具备条件，如果要开始校审，必须经过主任工、设总或部长允许</span>
            </td>
            <td rowspan="2" colspan="2" class="td-r" nowrap>
                <table width="100%">
                    <tr>
                        <td>
                            <a runat="server" id="aStartAllowGoFlow" class="aStyle" onclick="startAllowGoFlow()"
                                target="_blank">发起特殊放行管理流程</a> <a runat="server" id="aViewAllowGoFlow" title="点击查看特殊放行管理流程"
                                    class="aStyle">点击查看特殊放行管理流程</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a class="aStyle" href="<%=WebAppPath %>/EPMS/List/Sys/ProjVerifyRange.aspx?VerifyType=big"
                                target="_blank">大型工程勘测设计成品审签范围表</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a class="aStyle" href="<%=WebAppPath %>/EPMS/List/Sys/ProjVerifyRange.aspx?VerifyType=mid"
                                target="_blank">中小型工程勘测设计成品审签范围表</a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr id="showInFinishVerify">
            <td colspan="6" class="td-r" nowrap>
                <table width="100%">
                    <tr>
                        <td>
                            <a class="aStyle" href="<%=WebAppPath %>/EPMS/List/Sys/ProjVerifyRange.aspx?VerifyType=big"
                                target="_blank">大型工程勘测设计成品审签范围表</a>
                        </td>
                        <td>
                            <a class="aStyle" href="<%=WebAppPath %>/EPMS/List/Sys/ProjVerifyRange.aspx?VerifyType=mid"
                                target="_blank">中小型工程勘测设计成品审签范围表</a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%--  <tr>
            <td colspan="6">
                <asp:TextBox runat="server" ID="wer"></asp:TextBox>
                <span style="color: Red" id="spanConAlert">说明：卷册存在没有提交、没有接收的资料项或者项目没有综合项目计划书，为不具备条件，如果要开始校审，必须经过主任工、设总或部长允许</span>
            </td>
        </tr>--%>
        <tr>
            <%--<td class="td-l">
                发起校审
            </td>
            <td class="td-r" title="如果存在未提交、接收的资料项，主任工或项目经理有权限允许负责人发起校审；如果没有综合项目计划书，设总和生产组织部门部长有权限允许卷册负责人发起四级校审 ">
                <asp:RadioButtonList runat="server" ID="RadioButtonList1" RepeatDirection="Horizontal"
                    activestatus="(23.*)">
                    <asp:ListItem Value="0">不允许</asp:ListItem>
                    <asp:ListItem Value="1">允许</asp:ListItem>
                </asp:RadioButtonList>
            </td>--%>
        </tr>
        <tr runat="server" id="trOuter" visible="false">
            <td class="td-l">
                是否发起出版流程<span class="req-star" id="reqPublish" runat="server" visible="false">*</span>
            </td>
            <td class="td-m" colspan="5">
                <asp:RadioButtonList runat="server" ID="rblIsNeedCreatePublishFlow" RepeatDirection="Horizontal"
                    activestatus="(23.建立校审单)" field="IsNeedCreatePublishFlow" tablename="EPMS_ProductVerifyForm">
                    <asp:ListItem Value="0">不发起</asp:ListItem>
                    <asp:ListItem Value="1">发起</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr runat="server" id="trNeedSign" visible="false">
            <td class="td-l">
                批签而不出版
            </td>
            <td class="td-m" colspan="6">
                <asp:CheckBox ID="chbIsNeedSign" activestatus="(23.建立校审单)" runat="server" ForeColor="Red"
                    Text="海外需要批签而不出版的卷册请勾选此项" Field="IsNeedSign" TableName="EPMS_ProductVerifyForm" />
            </td>
        </tr>
        <tr runat="server" id="trSurveryVerify" visible="false">
            <td class="td-l">
                结束发起流程
            </td>
            <td class="td-m" colspan="3">
                <asp:CheckBox ID="ckbIsCreateMutualFileFlow" Text="发起互提资料提交流程" activestatus="(23.建立校审单)"
                    Field="IsCreateMutualFileFlow" TableName="EPMS_ProductVerifyForm" runat="server"
                    AutoPostBack="true" OnCheckedChanged="ckbIsCreateMutualFileFlow_CheckedChanged" />
                <font color="#ff0000">注意：如果结束时需要自动发起互提资料流程请勾选此项</font>
            </td>
            <td class="td-l">
                互提资料
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsSelMutual" SourceMode="SelectorPage"
                    IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                    EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/FileItemSelector.aspx"
                    ResultForControls="{'hiMutualFileId':'id','hiMututalFileCode':'WBSCode'}" activestatus="(23.建立校审单)"
                    BeforeSelect="beforeSelectWbs()" FilterFunction="filterMutualFilter()" AfterSelect="afterFileSelect()"
                    tablename="EPMS_ProductVerifyForm" field="MutualFileName"></zhongsoft:LightObjectSelector>
                <input type="hidden" id="hiMutualFileId" runat="server" name="hiMutualFileId" field="MutualFilePlanID"
                    tablename="EPMS_ProductVerifyForm" />
                <input type="hidden" runat="server" id="hiMututalFileCode" />
            </td>
        </tr>
        <tr id="trShowInVerify">
            <td class="td-l">
                是否需总工签署
            </td>
            <td class="td-m" colspan="5">
                <asp:RadioButtonList runat="server" ID="rbIsNeedZgzgSign" RepeatDirection="Horizontal"
                    activestatus="(23.建立校审单)(3.设计修改)" field="IsNeedZgzgSign" tablename="EPMS_ProductVerifyForm">
                    <asp:ListItem Value="0">不需要</asp:ListItem>
                    <asp:ListItem Value="1">需要</asp:ListItem>
                </asp:RadioButtonList>
                <span style="color: Red">注意：如果卷册不出版但需要总工签署，卷册负责人需要手动选择！</span><br />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                校审人
            </td>
            <td class="td-m" colspan="5">
                <uc2:WBSVerifyOperator ID="WBSVerifyOperator" runat="server" />
            </td>
        </tr>
        <tr id="trSignUserInfo" style="display: none">
            <td class="td-l">
                会签人
            </td>
            <td class="td-m" colspan="5">
                <uc8:JoinSignOperator ID="UCJoinSignOperator" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="6" class="td-m" title="第一次使用此流程请点击“安装协同校审系统”链接安装协同校审程序,点击“启动协同校审系统”可直接启动CAD。">
                <a href="javascript:StartCAD();" id='cadStart' style="text-decoration: underline;
                    color: Blue; display: none;">启动协同校审系统</a> <a href="javascript:InstallCAD();" id='cadInstall'
                        style="text-decoration: underline; color: Blue; display: none;">安装协同校审系统</a>
                <span style="color: Red; font-weight: bold">使用协同校审时注意：</span> <span style="color: Red;">
                    (1)(1/2)图纸符号请使用全角:（1／2）</span>
            </td>
        </tr>
        <%--                </table>
            </td>
        </tr>--%>
    </table>
</div>
<div id="divSignIndo" runat="server" displaystatus="(*.签署确认)">
    <uc7:RollSignInfo ID="rollSignInfo" runat="server" />
</div>
<div style="height: 5px">
</div>
<%--<div class="wpf_header" id="verifyPointHeader">
    <div onclick="openDetail('verifyPoint')">
        <span>WBS校审要点</span>
    </div>
</div>--%>
<table class="tz-table" width="100%">
    <tr id="verifyPointHeader">
        <td colspan="6" class="flexible" onclick="openDetail('verifyPoint')">
            校审要点&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
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
<%--<div class="wpf_header" id="mandatoryHeader">
    <div onclick="openDetail('mandatory')">
        <span>WBS执行强条</span>
    </div>
</div>--%>
<table class="tz-table" width="100%" style="display: none;">
    <tr id="mandatoryHeader">
        <td colspan="6" class="flexible" onclick="openDetail('mandatory')">
            执行强条&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
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
<%--<div class="wpf_header" id="productHeader">
    <div onclick="openDetail('ouPutPorduct')">
        <span>成品清单</span>
    </div>
</div>--%>
<div id="ouPutPorduct">
    <uc3:ProductList ID="ProductList" runat="server" OnDataChanged="ProductList_DataChanged" />
</div>
<div style="height: 5px">
</div>
<div id="divCalcuteList">
    <uc9:CalculateInfoList ID="ucCalculateInfoList" runat="server" />
</div>
<div style="height: 5px">
</div>
<%--<div class="wpf_header" id="opinionHeader">
    <div onclick="openDetail('outPutOpinion')">
        <span>意见清单</span>
    </div>
</div>--%>
<div id="outPutOpinion">
    <uc4:ProductOpinionList ID="ProductOpinionList" runat="server" />
</div>
<div style="height: 5px">
</div>
<div id="divMdified" style="display: none">
    <uc10:ModifyProductList ID="ucModifyProductList" runat="server" />
</div>
<table class="tz-table" width="100%">
    <tr id="Tr1">
        <td colspan="6" class="flexible" onclick="openDetail('qualityEvaluation')">
            质量评语&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr id="qualityEvaluation">
        <td colspan="6">
            <uc11:WBSQualityEvaluation ID="WBSQualityEvaluation" runat="server" />
        </td>
    </tr>
</table>
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
<!---是否有特殊放行流程--->
<input type="hidden" runat="server" id="hiIsAllowFlowGo" />
<!--关联任务-->
<input runat="server" id="hiReleXml" type="hidden" />
<input type="hidden" runat="server" id="hiTechAgreeCode" value="90" />
<input type="hidden" runat="server" id="hiSurveryVerifyConAlert" value="项目存在未提交、未接收的资料项，为不具备条件，在此基础上若勾选“结束发起互提资料流程”，则具备校审条件。
\n当不具备条件时，只有走【特殊放行管理流程】审批意见为“允许”，才可以进行校审流程。
" />
<input type="hidden" runat="server" id="hiCollectVerifyConAlert" value="施工图阶段，如果没有综合计划书，为不具备条件，只有走【特殊放行管理流程】审批意见为“允许”，才可以进行校审流程；
\n其他阶段（除施工图、竣工图阶段），如果没有综合计划书或没有综合评审，系统提示设总“请完成综合计划书和综合评审流程”，允许进行校审流程
" />
<style type="text/css">
    .wpf_header div
    {
        background: url(../../Themes/Images/wp-header.png) no-repeat left top;
        height: 21px;
        line-height: 21px;
        padding-left: 35px;
        font-size: 12px;
        color: #fff;
        cursor: pointer;
    }
    .wpf_header div span
    {
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

        initVerifyType();
        $('#<%=ddlVerifyType.ClientID %>').bind('change', function () {
            initVerifyType();
        });

        if (typeof (initProductList) == 'function') {
            initProductList();
        }
        showVerifyConAlert();
        showOrHIdeZGInfo();
        showOrHideByDifVerifyType();
    }

    //只有综合卷册才显示关联卷册信息
    function initVerifyType() {
        var verifyType = $('#<%=ddlVerifyType.ClientID %>').val();
        var hiType = $('#<%=hiVerifyType.ClientID %>').val();
        if(hiType=="")
            hiType=verifyType;
        //只有四级校审和勘测校审才显示计算书信息
        //只有综合校审才显示关联卷册及各专业修改卷册列表
        if (hiType == '<%=(int)ProductVerifyType.综合校审 %>') {
            $('#trCom').show();
            $("#divMdified").show();
            $("#divCalcuteList").hide();
        }
        else {
            if (hiType == '<%=(int)ProductVerifyType.设计成品校审 %>' || hiType == '<%=(int)ProductVerifyType.勘测成品校审 %>') {
                $("#divCalcuteList").show();
            }
            else{
                $("#divCalcuteList").hide();
            }
            $('#trCom').hide();
            if(hiType == '<%=(int)ProductVerifyType.设计成品校审 %>')
              $("#trSignUserInfo").show();
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
            var url = "/Portal/EPMS/List/Product/ProductCADStart.aspx?OrganizationId=" + orgId + "&WBSId="+wbsId;
            window.open(url);
        }
    }

    //安装在线助手
    function InstallCAD() {
        var strPath = "<%=WebAppPath %>/Sys/Download/协同校审安装包.rar";
        window.open(strPath);
    }

    ///查看关联任务的详细档案信息
    function releWBSDetail(wbsId) {

    }

    //选择任务之前的逻辑判断
    function beforeSelectWbs() {
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
        if (orgId == '' || orgId == undefined) {
            alert('请先选择项目，再选择任务！');
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
        var formType = '<%=Zhongsoft.Portal.EPMS.Obsolete.WBSFormTypeSelect.校审.ToString() %>';
        return { OrganizationID: orgId, WBSType: '<%=WBSMode.任务管理.GetHashCode() %>',WBSFormTypeSelect: formType,OwnerId: ownerId, IsShowMore: 1 };
    }

    //选择负责人的筛选
    function ownerFilter() {
        var projTypeId = $('#<%=hiParamProjectTypeID.ClientID %>').val();
        var specId = $('#<%=hiBelongSpecialtyID.ClientID %>').val();
        var roleId = '646F4096-E8DA-49F2-9C5E-42DDD22623F4'; //卷册负责人角色
        return { ProjectTypeID: projTypeId, SpecialtyID: specId, RoleID: roleId };
    }
    //互提资料筛选
    function filterMutualFilter(){
       var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
       var rollId=$('#<%=hiWBSID.ClientID %>').val();
       return { OrganizationID: orgId, ParentID: rollId };
    }

    ///选择关联任务，需要按项目、专业
    function selectRelaWBS() {
        var wbsId = $('#<%=hiWBSID.ClientID %>').val();
        if (wbsId == '' || wbsId == undefined) {
            alert('请先选择校审任务，再选择相关任务！');
            return false;
        }
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();

        var json = { OrganizationID: orgId, WBSType: '<%=(int)WBSMode.任务管理 %>' };

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

    //选择互提资料任务后
    function afterFileSelect() {
        var mutualFileName = $("#<%=lbsSelMutual.ClientID %>").val();
        if (mutualFileName != "") {
            $("#<%=ckbIsCreateMutualFileFlow.ClientID %>").attr("checked", "checked");
            //默认选中流程结束后发起互提资料提交流程
            var mututalFileCode = $("#<%=hiMututalFileCode.ClientID %>").val();
            $("#<%=lbsSelMutual.ClientID %>").val(mututalFileCode + "-" + mutualFileName);
            $("#<%=lbsSelMutual.ClientID %>").next.val(mututalFileCode + "-" + mutualFileName);
        }
        return false;
    }

    function checkForm() {//原有方法: KPMSCheckSubmit       
        if ($formAction == 0) {//原有属性: $readyFormSend
            var organizationId = $('#<%=hiOrganizationID.ClientID %>').val();
            var bizId = '<%=BusinessObjectId %>';
            var result;
            var checkType = "VerifyLock";
             
            if ($actName == "建立校审单"
             || $actName == "参与人确认"
             || $actName == "汇总校审成品") {
                checkType = "VerifyAll";
            }
            else if ($actName == "分配校审任务") {
                checkType = "VerifyOperator";
            }
            else if($actName == "签署确认"){
                checkType = "CheckSignSuccess"; 
            }
           
            $.ajax({
                type: 'POST',
                url: buildQueryUrl("/EPMS/Handler/CheckCodeHandler.ashx", null),
                data: { 'checkType': checkType, 'OrganizationID': organizationId, 'BizID': bizId, 'CurUserId': '<%=KPMSUser.Id %>', 'WBSID': $("#<%=hiWBSID.ClientID %>").val()  },
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
                if ($actName == "签署确认") {
                   alert("该卷册" + result + "，不能向下发送");
                }
                else {
                   alert(result);
                }
                return false;
            }

            //修改步骤，判断是否有未选中的执行意见信息
            if($actName.indexOf("修改") > -1){
                var isAllExeSelected = checkHasChooseExeState();
                if(!isAllExeSelected){
                    alert("还存在没有填写修改情况的校审意见，请填写修改情况后再处理！");
                    return false;
                }
            }
            
            var verifyType = $("#<%=hiVerifyType.ClientID %>").val();
            //校审流程发起后是否可以继续向下发送，若不具备校审条件，且没有特殊放行流程，不允许向下发送,竣工图没有控制
            if ($actName == "建立校审单"&&verifyType != "<%=(int)ProductVerifyType.竣工图校审 %>") {
                 if(!checkCanStartFlow())
                    return false;
                //综合卷册校审，第一步骤时提醒是否选择了关联卷册信息
                if(verifyType == "<%=(int)ProductVerifyType.综合校审 %>"){
                    checkRefeRoll();
                    if(!checkRollSelectedFinished())
                       return false;
                }
            }
        }
        return true;
    }

    var $checkbox = $(':checkbox:not(":enabled")');
    var $input = $(':input:not(":enabled")');
    $input.css({ 'behavior': 'none', 'background': '#dddddd', 'color': '#000000' });
    $checkbox.css('background', '#fff');
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
    //是否显示是否需要总工签署
    function showOrHIdeZGInfo() {
        var verifyType = $("#<%=hiVerifyType.ClientID %>").val();
        checkIsNeedSGSign();
        if (verifyType == "<%=(int)ProductVerifyType.设计成品校审 %>") {
            //总工签署是否可编辑
            if ($action == "<%=(int)AccessLevel.Update %>" && ($actName == "建立校审单" || $actName.indexOf("修改") > -1)) {
                checkIsNeedSGSign();
                $("#<%=cblWBSFlag.ClientID %>").live("change", function () { checkIsNeedSGSign();checkedRefreshProductList(); })
            }
        }
        else {
            $("#trShowInVerify").hide();
              //总工签署是否可编辑
            if ($action == "<%=(int)AccessLevel.Update %>" && ($actName == "建立校审单" || $actName.indexOf("修改") > -1)) {
                $("#<%=cblWBSFlag.ClientID %>").live("change", function () {  checkedRefreshProductList(); })
            }
        }
    }

    function checkedRefreshProductList(){
         var wbsFlag= $("#<%=hiWBSFlag.ClientID %>").val();
         var checked= checkValueChecked("压力管道");
         if(wbsFlag.indexOf("压力管道")>-1&&!checked){
             refreshProductList();
         }
         else if(wbsFlag.indexOf("压力管道")<0&&checked){
            refreshProductList();
        }
    }

    function refreshProductList(){
       <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.lbtnRefreshProject, "")%>; 
    }

    //判断是否需要总工签署是否可编辑
    function checkIsNeedSGSign() {
        //如果需要出版，则是否需要总工签署不可编辑
        var isPublish =checkValueChecked("交付");
        //不需要出版，是否需要总工签署可以编辑
        if (!isPublish) {
            $("#<%=rbIsNeedZgzgSign.ClientID %>").removeAttr("disabled");
        }else{
            $("#<%=rbIsNeedZgzgSign.ClientID %> input:checked").removeAttr("checked");
        }
    }

    function checkValueChecked(checkedValue){
       //如果需要出版，则是否需要总工签署不可编辑
        var isCheck = false;
        $("#<%=cblWBSFlag.ClientID %> :checkbox").each(function () {
            if ($(this)[0].checked) {
                if($(this).next().text() == checkedValue)
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
        var isHavePlan = returnHavePlan();
        //是否有综合评审
        var isHaveReview = returnHaveReview();
        var alterMsg = "";
        //不允许向下发送
        if (isAllowStartFlow == "0") {
            if (verifyType == "<%=(int)ProductVerifyType.设计成品校审 %>") {
                if (isHavePlan == "无")
                    alterMsg = "-提醒您，校审不具备条件。除竣工图和子设计阶段的项目，其他阶段项目的设计卷册校审之前必须完成综合项目计划书，请通知设总发起综合项目计划书流程或者手动发起特殊放行流程\n";
                if (isHaveReview == "无")
                    alterMsg += "-提醒您,校审不具备条件。发电施工图的司令图卷册校审之前必须进行综合评审,请通知设总发起综合评审流程或者手动发起特殊放行流程";
                if (alterMsg == "")
                    alterMsg = "-提醒您，校审不具备条件,请手动发起特殊放行流程";
            }
            else if (verifyType == "<%=(int)ProductVerifyType.勘测成品校审 %>") {
                alterMsg = "-提醒您，校审不具备条件,请手动发起特殊放行流程";
            }
            else if (verifyType == "<%=ProductVerifyType.综合校审.ToString() %>") {
                alterMsg = "-提醒您，校审不具备条件。施工图卷册校审之前必须完成综合项目计划书，请通知设总发起综合项目计划书流程或者手动发起特殊放行流程";
            }
        }
        else {
            var isAllowFlowGo = $("#<%=hiIsAllowFlowGo.ClientID %>").val();
            if (verifyType == "<%=(int)ProductVerifyType.综合校审 %>") {
                var projectCode = $("#<%=txtProjectCode.ClientID %>").val();
                var rollCode = $("#<%=txtWBSCode.ClientID %>").val();
                //发电施工图司令图，没有综合评审
                if (isAllowFlowGo == "0" && projectCode.substring(projectCode.length - 1).toLowerCase() == "s" && projectCode.substring(0, 1).toLowerCase() == "f" && projectCode.toLowerCase().indexOf("e") == -1
                    && strRollCode.indexOf("00") >= 0 && isHaveReview == "无")
                    alert("-该项目还没有综合评审流程,请通知设总走完综合评审流程后再发起四级校审！");
                //只有非施工图、竣工图，无综合项目计划书
                if (isHavePlan == "无"
                    && projectCode.substring(projectCode.length - 1).toLowerCase() != "s"
                    && projectCode.substring(projectCode.length - 1).toLowerCase() != "z"
                    && isAllowFlowGo == "0")
                    alert("-该项目还没有综合项目计划书流程，请走完综合项目计划书流程后再发送校审流程！");
            }
        }
        if (alterMsg != "") {
            alert(alterMsg);
            return false;
        }
        return true;
    }
    //展示是否具备校审条件的提示
    function showVerifyConAlert() {
        var hiType=$("#<%=ddlVerifyType.ClientID %>").val();
        var verifyType = $("#<%=hiVerifyType.ClientID %>").val();
        var spanConAlert=$("#spanConAlert");
        if(verifyType=="")
           verifyType=hiType;
        if (verifyType == "<%=(int)ProductVerifyType.勘测成品校审%>") {
            spanConAlert.text($("#<%=hiSurveryVerifyConAlert.ClientID %>").val());
        }
        else if (verifyType == "<%=(int)ProductVerifyType.综合校审 %>") {
            spanConAlert.html($("#<%=hiCollectVerifyConAlert.ClientID %>").val());
        }
    }
    //针对不同的校审类型，显示不同的校审信息
    function showOrHideByDifVerifyType() {
        var verifyType = $("#<%=hiVerifyType.ClientID %>").val();
        if (verifyType == "<%=(int)ProductVerifyType.竣工图校审%>") {
            $("#notShowInFinishVerify").hide();
            $("#showInFinishVerify").show();
        }
        else 
        {
            $("#showInFinishVerify").hide();
        }
    }

   // 检测必须填写关联卷册
	function checkRefeRoll()
	{
        var relRollInfo = $("#<%=gvReleWBSList.ClientID %> [id$=ibtnViewFlow]" ).length;                
        if(relRollInfo != null)
        {
            if(relRollInfo.length ==0)
            {
                alert("请选择关联卷册");
                alert("如果您确实没有关联卷册，可以强制发送，但是请您确保要出版的成品已经在成品列表中存在！");
                return true;
            }
            else
            {
                return true;
            }
        }
        return false;
    }

     // 确认提示，关联卷册是否都选择了
    function checkRollSelectedFinished() {
        return confirm('请确认需要汇总的专业卷册都已选择！\n\n点击【确定】提交流程；\n点击【取消】停止发送，继续选择“关联卷册”。');
    }

    function getZGRoleName(){
        var verifyType = $("#<%=hiVerifyType.ClientID %>").val();
        var roleName='';
        if (verifyType == "<%=(int)ProductVerifyType.设计成品校审 %>"&&$actName=="签署") {
             roleName="<%=ProjectRole.主管总工 %>";
        }
        return roleName;
    }
    //发起特殊放行流程
    function startAllowGoFlow(){
        var url = '<%=WebAppPath %>/Sys/Workflow/FormDetail.aspx?actionType=2&packageName=EPMSAllowGoFlow.xpdl&xpdlId=EPMSAllowGoFlow_wp1&formId=226&ver=';
        var json = { WBSIDQueryID: $("#<%=hiWBSID.ClientID %>").val() };
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
</script>
