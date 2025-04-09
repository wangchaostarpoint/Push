<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RollFileBag.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.WBS.RollFileBag"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" Title="任务档案袋" %>

<%@ Register Src="~/EPMS/UI/WBS/DesignTaskInfo.ascx" TagName="DesignTaskInfo" TagPrefix="uc1" %>
<%@ Register Src="../../UI/WBS/WBSPartakerList.ascx" TagName="WBSPartakerList" TagPrefix="uc2" %>
<%@ Register Src="../../UI/WBS/FileItemList.ascx" TagName="FileItemList" TagPrefix="uc3" %>
<%@ Register Src="../../UI/Product/CalculateInfoList.ascx" TagName="CalculateInfoList"
    TagPrefix="uc4" %>
<%@ Register Src="../../UI/WBS/FileReceiveWBSList.ascx" TagName="FileReceiveWBSList"
    TagPrefix="uc5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" width="100%">
        <tr>
            <td class="td-l">项目名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText runat="server" ID="txtProjectName" activestatus="(23.?)"
                    readonly="readonly" class="kpms-textbox" TableName="EPMS_WBSEntity" Field="ProjectName" />
                <input type="hidden" runat="server" id="hiOrganizationID" field="OrganizationID"
                    tablename="EPMS_WBSEntity" />
            </td>
            <td class="td-l">项目编号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(23.?)"
                    readonly="readonly" class="kpms-textbox" TableName="EPMS_WBSEntity" Field="ProjectCode" />
            </td>
        </tr>
        <tr>
            <td class="td-l">任务名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText runat="server" ID="txtRollName" activestatus="(23.?)" readonly="readonly"
                    class="kpms-textbox" TableName="EPMS_WBSEntity" Field="WBSName" />
                <input type="hidden" runat="server" id="hiWBSID" tablename="EPMS_WBSEntity" field="WBSID" />
            </td>
            <td class="td-l">任务编号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtWBSCode" activestatus="(23.?)" tablename="EPMS_WBSEntity"
                    field="WBSCode" readonly="readonly" class="kpms-textbox" />
            </td>
        </tr>
        <tr>
            <td class="td-l">专业
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtPutSpecialtyName" activestatus="(23.?)"
                    readonly="readonly" class="kpms-textbox" tablename="EPMS_WBSEntity" field="ExecSpecialtyName" />
                <input type="hidden" runat="server" id="hiExecSpecialtyID" field="ExecSpecialtyID"
                    tablename="EPMS_WBSEntity" />
            </td>
            <td class="td-l">所属部门
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText runat="server" ID="txtBelongDeptName" activestatus="(23.?)"
                    readonly="readonly" class="kpms-textbox" field="BelongDeptName" tablename="EPMS_WBSEntity" />
                <input type="hidden" runat="server" id="hiBelongDeptID" field="BelongDeptID" tablename="EPMS_WBSEntity" />
            </td>
        </tr>
        <tr>
            <td class="td-l">项目设总
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtProjectMaster" activestatus="(23.?)"
                    readonly="readonly" class="kpms-textbox" />
            </td>
            <td class="td-l">项目阶段
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText runat="server" ID="txtPhaseName" activestatus="(23.?)"
                    readonly="readonly" class="kpms-textbox" />
            </td>
        </tr>
        <tr>
            <td class="td-l">主设人
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtPutUser" activestatus="(23.?)" readonly="readonly"
                    class="kpms-textbox" />
            </td>
            <td class="td-l">主任工
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtReCheckUser" activestatus="(23.?)"
                    readonly="readonly" class="kpms-textbox" />
            </td>
            <td class="td-l">任务负责人<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtWBSOwnerName" activestatus="(23.?)"
                    readonly="readonly" class="kpms-textbox" field="WBSOwnerName" tablename="EPMS_WBSEntity" />
                <input type="hidden" runat="server" id="hiWBSOwnerID" tablename="EPMS_WBSEntity"
                    field="WBSOwnerID" />
            </td>
        </tr>
        <tr>
            <td class="td-l">计划开始时间
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtPlanStartTime" activestatus="(23.?)"
                    readonly="readonly" class="kpms-textbox-date" TableName="EPMS_WBSEntity" Field="PlanStartTime">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l" style="display: none">计划室交出时间
            </td>
            <td class="td-r" style="display: none">
                <zhongsoft:XHtmlInputText runat="server" ID="txtPlanRecheckTime1" activestatus="(23.?)"
                    readonly="readonly" class="kpms-textbox-date">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">计划完成时间
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtPlanCompleteTime" activestatus="(23.?)"
                    readonly="readonly" class="kpms-textbox-date" TableName="EPMS_WBSEntity" Field="PlanCompleteTime">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-m" colspan="2"></td>
        </tr>
        <tr itemshow="sgt">
            <td class="td-l">设计依据及主要原则
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbBasisOrConditions" TextMode="MultiLine"
                    EnableTheming="false" CssClass="kpms-textarea" activestatus="(23.?)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr itemshow="sgt">
            <td class="td-l" style="white-space: nowrap;">设计内容及分工
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbContentOrRange" TextMode="MultiLine"
                    EnableTheming="false" CssClass="kpms-textarea" activestatus="(23.?)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr itemshow="sgt">
            <td class="td-l">技术组织措施
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbPrincipleOrRequire" TextMode="MultiLine"
                    EnableTheming="false" CssClass="kpms-textarea" activestatus="(23.?)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="flexible" colspan="6">任务设计输入
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <uc3:FileItemList ID="inFile" runat="server" WBSType="内部专业间提资" WBSTypeID="1" CallType="1"
                    IsShowAllDownload="true" />
            </td>
        </tr>
        <tr>
            <td class="flexible" colspan="6">任务设计输出
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <uc3:FileItemList ID="mutualFile" runat="server" WBSType="内部专业间提资" WBSTypeID="1"
                    CallType="2" AddFileBtnName="添加提出资料" IsShowAllDownload="true" />
            </td>
        </tr>
        <tr>
            <td class="flexible" colspan="6">外部资料
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <uc3:FileItemList ID="externalFile" runat="server" WBSType="外部接口资料接收" WBSTypeID="2"
                    CallType="3" AddFileBtnName="添加外部资料" IsShowAllDownload="true" />
            </td>
        </tr>
        <tr>
            <td class="flexible" onclick="openDetail('partakerList')" colspan="6">设计参与人&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
            </td>
        </tr>
        <tr id="partakerList" style="display: none">
            <td colspan="6">
                <uc2:WBSPartakerList ID="wbsPartaker" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="flexible" onclick="openDetail('qualityUsingList')" colspan="6">质量信息及克服常见差错措施&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
            </td>
        </tr>
        <tr id="qualityUsingList" style="display: none">
            <td colspan="6">
                <span style="float: right;" id="spAdd" runat="server">
                    <asp:LinkButton runat="server" ID="lbtnAddQuality" CssClass="subtoolbarlink" EnableTheming="false"
                        OnClientClick="return addQualityDetail()" OnClick="lbtnAddQuality_Click">
                        <span>
                            <img runat="server" id="imgAdd" src="~/Themes/Images/btn_add.gif" alt="新增质量信息" width="16"
                                height="16" />新增质量信息 </span>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnSelQuality" CssClass="subtoolbarlink" EnableTheming="false"
                        OnClientClick="return selQualityInfo()" OnClick="lbtnSelQuality_Click">
                        <span>
                            <img id="Img1" runat="server" src="~/Themes/Images/btn_add.gif" alt="选择质量信息" width="16"
                                height="16" />选择质量信息</span>
                    </asp:LinkButton>
                </span>
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvQualityUsing" AllowPaging="True"
                    PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                    DataKeyNames="QualityUsingID" UseDefaultDataSource="true" BindGridViewMethod="BindQualityInfo"
                    OnRowCommand="gvQualityUsing_RowCommand">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="序号" HeaderStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField DataField="QualityTheme" HeaderText="主题词" ShowToolTip="true"
                            HeaderStyle-Width="180px">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="QualitySource" HeaderText="信息来源" Width="70">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="QualityContent" HeaderText="信息内容" ShowToolTip="true"
                            ItemStyle-Width="150px">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="QualityMeasure" HeaderText="预防措施" ShowToolTip="true"
                            ItemStyle-Width="230px">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightButtonField HeaderText="编辑" EditItemClick="editQualityDetail" DataParamFields="QualityUsingID"
                            CommandName="EditData" />
                        <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="viewQualityDetail" DataParamFields="QualityUsingID"
                            CommandName="ViewData" />
                        <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" DeleteText="您确认删除该质量信息吗？">
                        </zhongsoft:LightButtonField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <uc4:CalculateInfoList ID="ucCalculateInfoList" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="flexible" onclick="openDetail('surveryTaskList')" colspan="6">勘测任务信息&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
            </td>
        </tr>
        <tr id="surveryTaskList" style="display: none">
            <td colspan="6">
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvSurveryTask" AllowPaging="True"
                    PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                    UseDefaultDataSource="true" BindGridViewMethod="BindSurveryTask" OnRowDataBound="gvSurveryTask_RowDataBound">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="序号" HeaderStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField DataField="ExecSpecialtyName" HeaderText="任务所在专业" ShowToolTip="true"
                            HeaderStyle-Width="180px">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="PutUserName" HeaderText="提出人" Width="70">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="PutDate" HeaderText="提出日期" DataFormatString="{0:yyyy-MM-dd}"
                            Width="70">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="PlanCompleteTime" HeaderText="要求完成日期" DataFormatString="{0:yyyy-MM-dd}"
                            Width="70">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="ReceiveSpecialtyName" HeaderText="接收专业" ShowToolTip="true"
                            Width="150">
                        </zhongsoft:LightBoundField>
                        <%--     <zhongsoft:LightBoundField DataField="" HeaderText="任务负责人">
                    </zhongsoft:LightBoundField>--%>
                        <zhongsoft:LightBoundField DataField="ContentOrRange" HeaderText="任务内容" ShowToolTip="true"
                            Width="230">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="勘测大纲" ItemStyle-HorizontalAlign="Center"
                            ItemStyle-Width="50px">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false" ToolTip="查看" OnClientClick="return viewSurveyDetail()">
                                    <img alt="查看" src="<%=this.WebAppPath %>/Themes/Images/btn_dg_detail.gif" />
                                </asp:LinkButton>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <%--<zhongsoft:LightButtonField HeaderText="查看" EditItemClick="viewForm" CommandName="ViewData"
                            DataParamFields="WBSBookID,ExtendedAttribute" />--%>
                        <zhongsoft:LightTemplateField HeaderText="查看" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton ID="ibtnViewFlow" runat="server" EnableTheming="false" ToolTip="查看">
                                    <img alt="查看" src="<%=this.WebAppPath %>/Themes/Images/btn_dg_detail.gif" />
                                </asp:LinkButton>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
        <tr>
            <td class="flexible" colspan="6">
                <asp:LinkButton ID="lbtnVerifyInfo" runat="server" Text="校审信息" EnableTheming="false">校审信息<img src="<%=WebAppPath%>/themes/images/lright.png" /> </asp:LinkButton>
            </td>
        </tr>
        <tr class="flexible" onclick="openDetail('speReviewList')">
            <td class="flexible" colspan="6">专业内部评审信息&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
            </td>
        </tr>
        <tr id="speReviewList" style="display: none">
            <td colspan="6">
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvSpeReview" AllowPaging="True"
                    PageSize="10" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                    UseDefaultDataSource="true" BindGridViewMethod="BindSpeReview" OnRowDataBound="gvSpeReview_RowDataBound">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="序号" HeaderStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField DataField="Theme" HeaderText="评审内容" ShowToolTip="true"
                            Width="230">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="JudgeOpinion" HeaderText="评审意见" ShowToolTip="true"
                            Width="230">
                        </zhongsoft:LightBoundField>
                        <%-- <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="viewForm" DataParamFields="QualityActivityOfProjectID,ExtendedAttribute"
                            CommandName="ViewData" />--%>
                        <zhongsoft:LightTemplateField HeaderText="查看" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnViewForm" runat="server" EnableTheming="false" ToolTip="查看">
                                    <img alt="查看" src="<%=this.WebAppPath %>/Themes/Images/btn_dg_detail.gif" />
                                </asp:LinkButton>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
        <tr class="flexible" onclick="openDetail('relExtendData')" style="display: none">
            <td colspan="6">关联外部资料&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
            </td>
        </tr>
        <tr id="relExtendData" style="display: none">
            <td colspan="6">
                <uc5:FileReceiveWBSList ID="fileWBSList" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="flexible" onclick="openDetail('spePlanBookList')">专业设计计划&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
            </td>
        </tr>
        <tr id="spePlanBookList" style="display: none">
            <td colspan="6">
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvSpePlanBook" AllowPaging="True"
                    PageSize="10" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                    UseDefaultDataSource="true" BindGridViewMethod="BindSpePlanBook">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="序号" HeaderStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="工程编号">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="名称">
                            <ItemTemplate>
                                <div style="word-break: break-all !important; white-space: normal !important; width: 200px">
                                    <asp:LinkButton runat="server" ID="lbPlanBookTheme" EnableTheming="false" Style="text-decoration: underline; color: Blue !important"
                                        OnClientClick='<%# String.Format("return viewForm(\"{0}\",\"{1}\")", Eval("ProjectPlanBookID"), Eval("ExtendedAttribute")) %>'>
                                 <span><%#Eval("PlanBookTheme")%></span></asp:LinkButton>
                                </div>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField DataField="PlanBookContent" HeaderText="内容" ShowToolTip="true"
                            Width="200">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="流程状态">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbHasHandle" Text='<%#Convert.ToInt16(Eval("Flag"))==1?"结束":"进行中" %>'></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField DataField="CreateUserName" HeaderText="创建人">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="CreateDate" HeaderText="创建时间" DataFormatString="{0:yyyy-MM-dd}">
                        </zhongsoft:LightBoundField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
        <tr>
            <td class="flexible" onclick="openDetail('inUpgradeRollList')" colspan="6" style="display: none">内审版任务档案袋&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
            </td>
        </tr>
        <tr id="inUpgradeRollList" style="display: none">
            <td colspan="6">
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvInUpgradeRoll" AllowPaging="True"
                    PageSize="10" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                    UseDefaultDataSource="true" BindGridViewMethod="BindInUpgradeRoll">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="序号" HeaderStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="任务编号">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="WBSName" HeaderText="任务名称" ShowToolTip="true"
                            Width="300">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="版次" HeaderText="版次">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="档案袋" ItemStyle-Width="70px" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton ID="lkRollBag" runat="server" OnClientClick='<%# String.Format("return viewRollInfo(\"{0}\")", Eval("WBSID")) %>'
                                    EnableTheming="false" ForeColor="Blue">  <img alt="查看" src="<%=this.WebAppPath %>/Themes/Images/btn_dg_detail.gif" /></asp:LinkButton>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
        <tr>
            <td class="flexible" onclick="openDetail('rollVersionList')" colspan="6">任务版本&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
            </td>
        </tr>
        <tr id="rollVersionList" style="display: none">
            <td colspan="6">
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvRollVersion" AllowPaging="True"
                    PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                    UseDefaultDataSource="true" BindGridViewMethod="BindRollVersion">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="序号" HeaderStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="任务编号">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="WBSName" HeaderText="任务名称" ShowToolTip="true"
                            Width="250">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="版次" HeaderText="版次">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="档案袋" ItemStyle-Width="70px" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton ID="lkRollBag" runat="server" OnClientClick='<%# String.Format("return viewRollInfo(\"{0}\")", Eval("WBSID")) %>'
                                    EnableTheming="false" ForeColor="Blue">  <img alt="查看" src="<%=this.WebAppPath %>/Themes/Images/btn_dg_detail.gif" /></asp:LinkButton>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <asp:Button runat="server" ID="btnBindMutualFile" OnClick="btnBindMutualFile_Click"
        Style="display: none" />
    <asp:Button runat="server" ID="btnBindInFile" OnClick="btnBindInFile_Click" Style="display: none" />
    <asp:Button runat="server" ID="btnBindExternalFile" OnClick="btnBindExternalFile_Click"
        Style="display: none" />
    <input type="hidden" runat="server" id="hiFileXML" />
    <input type="hidden" runat="server" id="hiQualityXml" />
    <input type="hidden" runat="server" id="hiSurveryBreifID" />
    <input type="hidden" runat="server" id="hiSurveryBreifExtendID" />
    <input type="hidden" runat="server" id="hiProjectPhaseName" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            if (typeof (initDesignTaskInfo) == "function") {
                initDesignTaskInfo();
            }
            initFileWbs<%=fileWBSList.ClientID %>();
        //非施工图阶段，不显示设计依据及主要原则、设计内容及分工、技术组织措施
        var phaseName = $("#<%=hiProjectPhaseName.ClientID %>").val();
            if (phaseName != "施工图") {
                $('[itemshow=sgt]').hide();
            }
            $("#calculateInfoList").hide();
        }

        //根据业务类型确定后台调用
        function initCallBack(callType) {
            if (callType == "1") {
                //输入资料
                return bindInFile;
            }
            else if (callType == "2") {
                //输出资料
                return bindMutualFile;
            }
            else if (callType == "3") {
                //外部资料
                return bindExternalFile;
            }
            else {
                return bindWbs;
            }
        }

        //为多个同一Control页面提供调用

        function bindMutualFile() {
        <%=Page.ClientScript.GetPostBackEventReference(this.btnBindMutualFile,"")%>;
        }

        function bindInFile() {
        <%=Page.ClientScript.GetPostBackEventReference(this.btnBindInFile,"")%>;
        }

        function bindExternalFile() {
        <%=Page.ClientScript.GetPostBackEventReference(this.btnBindExternalFile,"")%>;
        }

        //选择输入资料
        function selInFile(callType, orgId) {
            var param = new InputParamObject("m");
            var filter = { OrganizationID: orgId, IsContainComplete: '0' };
            getFileItem('<%=hiFileXML.ClientID %>', param, filter, bindInFile);
            return false;
        }

        function viewMandatory(bizId) {
            var json = { bizId: bizId, actionType: 1 };
            var url = buildQueryUrl('EPMS/List/Sys/MandatoryTemplateEditor.aspx', json);
            showDivDialog(url, null, 850, 450, null);
            return false;
        }

        //end 为多个同一Control页面提供调用

        function showQualityDetail(bizId, actionType) {
            var wbsID = $("#<%=hiWBSID.ClientID %>").val();
            var json = { wbsID: wbsID };
            var url = buildBizUrl(actionType, bizId, "EPMS/List/WBS/QualityUsingEditor.aspx", json);
            var callBack = null;
            if (actionType != "1")
                callBack = bindQuality;
            showDivDialog(url, null, 750, 1150, callBack);
            return false;
        }

        function editQualityDetail(bizId) {
            return showQualityDetail(bizId, 3);
        }

        function addQualityDetail() {
            return showQualityDetail("", 2);
        }

        function viewQualityDetail(bizId) {
            return showQualityDetail(bizId, 1);
        }

        //选择质量信息
        function selQualityInfo() {
            var param = new InputParamObject("m");
            var orgId = $("#<%=hiOrganizationID.ClientID %>").val();
        var wbsId = $("#<%=hiWBSID.ClientID %>").val();
        var filter = { OrganizationID: orgId, WBSID: wbsId };
        getQualityInfo('<%=hiQualityXml.ClientID %>', param, filter, resetBindQuality);
            return false;
        }

        function bindQuality() {
        <%=Page.ClientScript.GetPostBackEventReference(this.lbtnAddQuality,"")%>;
        }

        function resetBindQuality() {
        <%=Page.ClientScript.GetPostBackEventReference(this.lbtnSelQuality,"")%>;
        }

        //查看勘测大纲信息
        function viewSurveyDetail() {
            var briefID = $("#<%=hiSurveryBreifID.ClientID %>").val();
        if (briefID == "") {
            alert("没有相关的勘测大纲流程");
        }
        else {
            var briefExtendID = $("#<%=hiSurveryBreifExtendID.ClientID %>").val();
                viewForm(briefID, briefExtendID);
            }
        }

        function viewForm(bizId, extendedAttribute) {
            var url = '/Custom/List/C_FormDetailLoading.aspx';
            var json = { bizId: bizId, IsOld: 2, ExtendedAttribute: extendedAttribute };
            url = buildQueryUrl(url, json);
            window.open(url);
            return false;
        }

        function viewRollInfo(wbsid) {
            var url = buildQueryUrl("/EPMS/List/WBS/RollFileBag.aspx", { actionType: 1, bizId: wbsid });
            showDivDialog(url, null, 900, 600, null);
            return false;
        }
    </script>
</asp:Content>
