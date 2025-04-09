<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="IntegrateProjItemList.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Plan.IntegrateProjItemList" %>
<%@ Import Namespace="Zhongsoft.Portal.EPMS" %>
<%@ Register Src="~/EPMS/UI/Plan/WBSMandatoryForPlan.ascx" TagName="WBSMandatoryForPlan"
    TagPrefix="uc1" %>
<table class="tz-table">
    <tr class="trMilestoneNew">
        <td class="flexible" onclick="openDetail('trMilestoneNew')">设计综合进度&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr id="trMilestoneNew">
        <td>
            <table class="tz-table">
                <tr class="addOperate">
                    <td>
                        <span id="Span9" runat="server" style="float: right">
                            <asp:LinkButton runat="server" ID="lbtnAddMilestoneNew" CssClass="subtoolbarlink"
                                EnableTheming="false" OnClientClick="return addMilestoneNew()" OnClick="btnAddMilestoneNew_Click">
                                <span>
                                    <img runat="server" id="img1" src="~/Themes/Images/btn_add.gif" alt="新增设计综合进度" width="16"
                                        height="16" />新增</span>
                            </asp:LinkButton>
                            <asp:LinkButton runat="server" ID="lbtnBatchDelMilestone" OnClientClick="return confirm('确定要删除吗？');"
                                CssClass="subtoolbarlink" EnableTheming="false" OnClick="lbtnBatchDelMilestone_OnClick">
                                <span>
                                    <img runat="server" id="img13" src="~/Themes/Images/btn_dg_delete.gif" alt="批量删除"
                                        width="16" height="16" />批量删除</span>
                            </asp:LinkButton>
                        </span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvMilestoneNew" AllowPaging="true"
                            PageSize="10" AutoGenerateColumns="false" ShowExport="true" DataKeyNames="MilestoneDetailID"
                            UseDefaultDataSource="true" OnRowCommand="gvMilestoneNew_RowCommand" BindGridViewMethod="UserControl.BindMilestoneNew">
                            <Columns>
                                <zhongsoft:LightCheckField HeaderText="" ItemStyle-Width="30px">
                                </zhongsoft:LightCheckField>
                                <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <%--<zhongsoft:LightBoundField DataField="MilestoneType" HeaderText="节点类型" Width="200"
                                    ShowToolTip="true">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="MilestoneTopic" HeaderText="节点主题" Width="100"
                                    ShowToolTip="true">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="MilestoneContent" HeaderText="节点内容" ShowToolTip="true"
                                    Width="250">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="PlanStartTime" HeaderText="计划开始日期" DataFormatString="{0:yyyy-MM-dd}"
                                    Width="70">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="PlanEndTime" HeaderText="计划结束日期" DataFormatString="{0:yyyy-MM-dd}"
                                    Width="70">
                                </zhongsoft:LightBoundField>--%>
                                <zhongsoft:LightBoundField DataField="MilestoneTopic" HeaderText="阶段名称" Width="600" ShowToolTip="true" />
                                <zhongsoft:LightBoundField DataField="PlanStartTime" HeaderText="日期" DataFormatString="{0:yyyy-MM-dd}" />
                                <zhongsoft:LightButtonField HeaderText="编辑" EditItemClick="editMilestoneNew" DataParamFields="MilestoneDetailID"
                                    CommandName="EditData" />
                                <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="viewMilestoneNew" DataParamFields="MilestoneDetailID"
                                    CommandName="ViewData" />
                                <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除">
                                </zhongsoft:LightButtonField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr style="display: none">
        <td class="flexible" onclick="openDetail('trReview')">评审计划&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr id="trReview" style="display: none">
        <td>
            <table class="tz-table">
                <tr class="addOperate">
                    <td>
                        <span id="Span8" runat="server" style="float: right">
                            <%-- <asp:LinkButton runat="server" ID="lbtnAddReview" CssClass="subtoolbarlink" EnableTheming="false"
                                OnClientClick="return addWBSItem()">
                                <span>
                                    <img runat="server" id="img1" src="~/Themes/Images/btn_add.gif" alt="新增评审计划" width="16"
                                        height="16" />新增评审计划</span></asp:LinkButton>--%>
                            <asp:LinkButton runat="server" ID="lbtnAddNewReview" CssClass="subtoolbarlink" EnableTheming="false"
                                OnClientClick="return addReviewInfo()" OnClick="lbtnAddNewReview_Click">
                                <span>
                                    <img runat="server" id="img8" src="~/Themes/Images/btn_add.gif" alt="新增评审计划" width="16"
                                        height="16" />新增</span>
                            </asp:LinkButton>
                            <!------->
                            <asp:LinkButton runat="server" ID="lbtnBatchDelReview" OnClientClick="return confirm('确定要删除吗？');"
                                CssClass="subtoolbarlink" EnableTheming="false" OnClick="lbtnBatchDelReview_OnClick">
                                <span>
                                    <img runat="server" id="img15" src="~/Themes/Images/btn_dg_delete.gif" alt="批量删除"
                                        width="16" height="16" />批量删除</span>
                            </asp:LinkButton>
                            <!------->
                        </span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvReview" AllowPaging="true"
                            PageSize="10" AutoGenerateColumns="false" ShowExport="true" DataKeyNames="WBSID"
                            UseDefaultDataSource="true" OnRowCommand="gvMilestone_RowCommand" OnRowDataBound="gvReview_RowDataBound"
                            BindGridViewMethod="UserControl.BindReview">
                            <Columns>
                                <zhongsoft:LightCheckField HeaderText="" ItemStyle-Width="40px">
                                </zhongsoft:LightCheckField>
                                <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightBoundField DataField="WBSType" HeaderText="评审分类">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="PlanStartTime" HeaderText="计划开始时间" DataFormatString="{0:yyyy-MM-dd}"
                                    Width="70">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="PlanCompleteTime" HeaderText="计划结束时间" DataFormatString="{0:yyyy-MM-dd}"
                                    Width="70">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="ExecSpecialtyName" HeaderText="评审专业" Width="70">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightTemplateField HeaderText="相关专业">
                                    <ItemTemplate>
                                        <div class="autoskip" style="width: 150px" id="divSpecialtyName" runat="server">
                                            <asp:Label runat="server" ID="lbSpecialtyName"></asp:Label>
                                        </div>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightBoundField DataField="Content" HeaderText="计划情况" ShowToolTip="true"
                                    Width="150">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="WBSName" HeaderText="评审内容" ShowToolTip="true"
                                    Width="150">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightButtonField HeaderText="编辑" EditItemClick="editReviewDetail" DataParamFields="WBSID"
                                    CommandName="EditData" />
                                <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="viewReviewDetail" DataParamFields="WBSID"
                                    CommandName="ViewData" />
                                <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除">
                                </zhongsoft:LightButtonField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr class="trProjectPlanTarget">
        <td class="flexible" onclick="openDetail('trProjectPlanTarget')">产品质量、环境和职业健康安全管理目标、措施及测评表&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr id="trProjectPlanTarget">
        <td>
            <table class="tz-table">
                <tr class="addOperate">
                    <td>
                        <span id="spanProjectTarget" runat="server" style="float: right">
                            <asp:LinkButton runat="server" ID="lbtnAddTarget" CssClass="subtoolbarlink" EnableTheming="false"
                                OnClientClick="return addProjectTarget()" OnClick="lbtnAddTarget_OnClick">
                                <span>
                                    <img runat="server" id="img22" src="~/Themes/Images/btn_add.gif" alt="新增目标" width="16"
                                        height="16" />新增</span>
                            </asp:LinkButton>
                            <asp:LinkButton runat="server" ID="lbtnAddTargetMB" CssClass="subtoolbarlink"
                                EnableTheming="false" OnClientClick="return selProjectTargetMB()" OnClick="lbtnAddTargetMB_OnClick">
                                <span>
                                    <img runat="server" id="img24" src="~/Themes/Images/btn_add.gif" alt="从模板中选择目标" width="16"
                                        height="16" />从模板中选择</span>
                            </asp:LinkButton>
                            <asp:LinkButton runat="server" ID="lbtnBatchDelTarget" OnClientClick="return confirm('确定要删除吗？');"
                                CssClass="subtoolbarlink" EnableTheming="false" OnClick="lbtnBatchDelTarget_OnClick">
                                <span>
                                    <img runat="server" id="img23" src="~/Themes/Images/btn_dg_delete.gif" alt="批量删除"
                                        width="16" height="16" />批量删除</span>
                            </asp:LinkButton>
                        </span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvListTarget" AllowPaging="true"
                            PageSize="10" AutoGenerateColumns="false" ShowExport="true" DataKeyNames="ProjectPlanTargetID"
                            UseDefaultDataSource="true" BindGridViewMethod="UserControl.BindProjectPlanTarget" OnRowCommand="gvListTarget_OnRowCommand">
                            <Columns>
                                <zhongsoft:LightCheckField HeaderText="" ItemStyle-Width="40px" />
                                <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightBoundField HeaderText="目标分类" DataField="TargetType" />
                                <zhongsoft:LightTemplateField HeaderText="目标内容">
                                    <ItemTemplate>
                                        <div style="width: 100%; white-space: normal; word-break: break-all; word-wrap: break-word;">
                                            <%# Eval("TargetContent") %>
                                        </div>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="目标分解">
                                    <ItemTemplate>
                                        <div style="width: 100%; white-space: normal; word-break: break-all; word-wrap: break-word;">
                                            <%# Eval("TargetResolve") %>
                                        </div>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="实施措施">
                                    <ItemTemplate>
                                        <div style="width: 100%; white-space: normal; word-break: break-all; word-wrap: break-word;">
                                            <%# Eval("ImplementingMeasures") %>
                                        </div>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightBoundField DataField="DutyUserName" HeaderText="责任人" Width="70">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="FinishDate" HeaderText="计划完成时间" Width="70" DataFormatString="{0:yyyy-MM-dd}" />
                                <zhongsoft:LightButtonField HeaderText="编辑" EditItemClick="editTargetDetail" DataParamFields="ProjectPlanTargetID"
                                    CommandName="EditData" />
                                <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="viewTargetDetail" DataParamFields="ProjectPlanTargetID"
                                    CommandName="ViewData" />
                                <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除">
                                </zhongsoft:LightButtonField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>

    <tr class="trMilestone" style="display: none" flag="不使用">
        <td class="flexible" onclick="openDetail('trMilestone')">里程碑节点&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr id="trMilestone" style="display: none">
        <td>
            <table class="tz-table">
                <tr class="addOperate" style="display: none">
                    <td>
                        <span id="Span7" runat="server" style="float: right">
                            <asp:LinkButton runat="server" ID="lbtnAddMilestone" CssClass="subtoolbarlink" EnableTheming="false"
                                Visible="false" OnClientClick="return addMilestoneNew()" OnClick="btnAddMilestone_Click">
                                <span>
                                    <img runat="server" id="imgAdd" src="~/Themes/Images/btn_add.gif" alt="新增里程碑节点" width="16"
                                        height="16" />新增里程碑节点</span>
                            </asp:LinkButton></span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvMilestone" AllowPaging="true"
                            PageSize="10" AutoGenerateColumns="false" ShowExport="true" DataKeyNames="WBSID"
                            UseDefaultDataSource="true" OnRowCommand="gvMilestone_RowCommand" BindGridViewMethod="UserControl.BindMilestone">
                            <Columns>
                                <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightBoundField DataField="ExecSpecialtyName" HeaderText="专业名称">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="WBSType" HeaderText="节点类型" Width="100">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="WBSName" HeaderText="节点内容" ShowToolTip="true"
                                    Width="250">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="PlanStartTime" HeaderText="计划开始日期" DataFormatString="{0:yyyy-MM-dd}"
                                    Width="70">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="PlanCompleteTime" HeaderText="计划结束日期" DataFormatString="{0:yyyy-MM-dd}"
                                    Width="70">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightButtonField HeaderText="编辑" EditItemClick="editDetail" DataParamFields="WBSID"
                                    CommandName="EditData" />
                                <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除">
                                </zhongsoft:LightButtonField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>

    <tr style="display: none">
        <td class="flexible" onclick="openDetail('trLaw')">法律法规清单列表&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr id="trLaw" style="display: none">
        <td>
            <table class="tz-table">
                <tr class="addOperate">
                    <td>
                        <span id="Span1" runat="server" style="float: right">
                            <asp:LinkButton runat="server" ID="lbtnAddLaw" CssClass="subtoolbarlink" EnableTheming="false"
                                OnClientClick="return addLawItem()" OnClick="lbtnAddLaw_Click">
                                <span>
                                    <img runat="server" id="img2" src="~/Themes/Images/btn_add.gif" alt="新增法律法规" width="16"
                                        height="16" />新增法律法规</span>
                            </asp:LinkButton>
                            <!------->
                            <asp:LinkButton runat="server" ID="lbtnBatchDelLaw" OnClientClick="return confirm('确定要删除吗？');"
                                CssClass="subtoolbarlink" EnableTheming="false" OnClick="lbtnBatchDelLaw_OnClick">
                                <span>
                                    <img runat="server" id="img16" src="~/Themes/Images/btn_dg_delete.gif" alt="批量删除"
                                        width="16" height="16" />批量删除</span>
                            </asp:LinkButton>
                            <!------->
                        </span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvLawList" AllowPaging="true"
                            PageSize="10" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                            DataKeyNames="RegulationItemDetailID" UseDefaultDataSource="true" OnRowCommand="gvList_RowCommand"
                            BindGridViewMethod="UserControl.BindLawList">
                            <Columns>
                                <zhongsoft:LightCheckField HeaderText="" ItemStyle-Width="40px">
                                </zhongsoft:LightCheckField>
                                <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightBoundField DataField="Classification" HeaderText="法律法规分类" Width="100">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="ItemName" HeaderText="法律法规名称" ShowToolTip="true"
                                    Width="300">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="ImplementationDate" HeaderText="发布日期" DataFormatString="{0:yyyy-MM-dd}"
                                    Width="70">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="ApprovalDepartment" HeaderText="发布/批准部门" ShowToolTip="true"
                                    Width="200">
                                </zhongsoft:LightBoundField>
                                <%-- <zhongsoft:LightBoundField DataField="ItemLevel" HeaderText="级别">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="FillUserName" HeaderText="填写人">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="FillDeptName" HeaderText="填写部门">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="FillDate" HeaderText="填写日期" DataFormatString="{0:yyyy-MM-dd}"
                        Width="70">
                    </zhongsoft:LightBoundField>--%>
                                <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="showRegulationDetail"
                                    DataParamFields="ParamRegulationItemID,ItemType" CommandName="ViewData" />
                                <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除">
                                </zhongsoft:LightButtonField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                        <input type="hidden" runat="server" id="hiLawRowCount" value="0" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr style="display: none">
        <td class="flexible" onclick="openDetail('trRegulation')">规程规范列表&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr id="trRegulation" style="display: none">
        <td>
            <table class="tz-table">
                <tr class="addOperate">
                    <td>
                        <span id="Span2" runat="server" style="float: right">
                            <asp:LinkButton runat="server" ID="lbtnAddRegulation" CssClass="subtoolbarlink" EnableTheming="false"
                                OnClientClick="return addRegulationItem()" OnClick="lbtnAddRegulation_Click">
                                <span>
                                    <img runat="server" id="img3" src="~/Themes/Images/btn_add.gif" alt="新增规程规范" width="16"
                                        height="16" />新增规程规范</span>
                            </asp:LinkButton>
                            <!------->
                            <asp:LinkButton runat="server" ID="lbtnBatchDelRegulation" OnClientClick="return confirm('确定要删除吗？');"
                                CssClass="subtoolbarlink" EnableTheming="false" OnClick="lbtnBatchDelRegulation_OnClick">
                                <span>
                                    <img runat="server" id="img17" src="~/Themes/Images/btn_dg_delete.gif" alt="批量删除"
                                        width="16" height="16" />批量删除</span>
                            </asp:LinkButton>
                            <!------->
                        </span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvRegulationList" AllowPaging="true"
                            PageSize="10" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                            DataKeyNames="RegulationItemDetailID" UseDefaultDataSource="true" OnRowCommand="gvList_RowCommand"
                            BindGridViewMethod="UserControl.BindRegulationList">
                            <Columns>
                                <zhongsoft:LightCheckField HeaderText="" ItemStyle-Width="40px">
                                </zhongsoft:LightCheckField>
                                <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightBoundField DataField="SpecialtyName" HeaderText="专业" ItemStyle-Width="100px">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="ItemName" HeaderText="规程规范名称" ShowToolTip="true"
                                    Width="250">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="VersionInfo" HeaderText="版本号">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="ImplementationDate" HeaderText="实施日期" DataFormatString="{0:yyyy-MM-dd}"
                                    Width="70">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="ReplaceFile" HeaderText="替代文件或版本" ShowToolTip="true"
                                    Width="150">
                                </zhongsoft:LightBoundField>
                                <%--<zhongsoft:LightBoundField DataField="ItemLevel" HeaderText="级别">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="FillUserName" HeaderText="填写人">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="FillDeptName" HeaderText="填写部门">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="FillDate" HeaderText="填写日期" DataFormatString="{0:yyyy-MM-dd}"
                        Width="70">
                    </zhongsoft:LightBoundField>--%>
                                <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="showRegulationDetail"
                                    DataParamFields="ParamRegulationItemID,ItemType" CommandName="ViewData" />
                                <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除">
                                </zhongsoft:LightButtonField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                        <input type="hidden" runat="server" id="hiRegularRowCount" value="0" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="flexible" onclick="openDetail('trEnvironmental')">环境因素识别评价表&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr id="trEnvironmental">
        <td>
            <table class="tz-table">
                <tr class="addOperate">
                    <td>
                        <span id="Span5" runat="server" style="float: right">
                            <asp:LinkButton runat="server" ID="lbtnAddEnvironmentalC" CssClass="subtoolbarlink" EnableTheming="false"
                                OnClientClick="return addDetailItemC(2)" OnClick="lbtnAddEnvironmentalC_OnClick">
                                <span>
                                    <img runat="server" id="img27" src="~/Themes/Images/btn_add.gif" alt="新增环境因素识别" width="16"
                                        height="16" />新增</span>
                            </asp:LinkButton>
                            <asp:LinkButton runat="server" ID="lbtnAddEnvironmental" CssClass="subtoolbarlink"
                                EnableTheming="false" OnClientClick="return addEnvironmentalItem()" OnClick="lbtnAddEnvironmental_Click">
                                <span>
                                    <img runat="server" id="img6" src="~/Themes/Images/btn_add.gif" alt="从模板中选择环境因素识别" width="16"
                                        height="16" />从模板中选择</span>
                            </asp:LinkButton>
                            <!------->
                            <asp:LinkButton runat="server" ID="lbtnBatchDelEnvironmental" OnClientClick="return confirm('确定要删除吗？');"
                                CssClass="subtoolbarlink" EnableTheming="false" OnClick="lbtnBatchDelEnvironmental_OnClick">
                                <span>
                                    <img runat="server" id="img18" src="~/Themes/Images/btn_dg_delete.gif" alt="批量删除"
                                        width="16" height="16" />批量删除</span>
                            </asp:LinkButton>
                            <!------->
                        </span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvEnvironmentalList"
                            AllowPaging="true" PageSize="10" AutoGenerateColumns="false" ShowExport="true"
                            AllowSorting="true" DataKeyNames="IdentiyItemDetailID" UseDefaultDataSource="true"
                            OnRowCommand="gvDangerList_RowCommand" BindGridViewMethod="UserControl.BindEnvironmentalList">
                            <Columns>
                                <zhongsoft:LightCheckField HeaderText="" ItemStyle-Width="40px">
                                </zhongsoft:LightCheckField>
                                <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightBoundField DataField="Place" HeaderText="活动/生产/服务场所" ShowToolTip="true"
                                    Width="120">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="ItemReource" HeaderText="环境因素" ShowToolTip="true"
                                    Width="150">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="ItemRiskAndInfluence" HeaderText="环境影响" ShowToolTip="true"
                                    Width="120">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="EvaluationMethod" HeaderText="评价方法" ShowToolTip="true"
                                    Width="120" />
                                <zhongsoft:LightBoundField DataField="Important" HeaderText="评价结果">
                                </zhongsoft:LightBoundField>
                                <%-- <zhongsoft:LightBoundField DataField="ItemLevel" HeaderText="级别">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="FillUserName" HeaderText="填写人">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="FillDeptName" HeaderText="填写部门">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="FillDate" HeaderText="填写日期" DataFormatString="{0:yyyy-MM-dd}"
                        Width="70">
                    </zhongsoft:LightBoundField>--%>
                                <zhongsoft:LightButtonField HeaderText="编辑" EditItemClick="editIdentityDetail" DataParamFields="IdentiyItemDetailID,ItemType"
                                    CommandName="EditData" />
                                <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="showIdentityDetail" DataParamFields="IdentiyItemDetailID,ItemType"
                                    CommandName="ViewData" />
                                <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除">
                                </zhongsoft:LightButtonField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="flexible" onclick="openDetail('trImportantFactors')">重要环境因素控制表&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr id="trImportantFactors">
        <td>
            <table class="tz-table">
                <tr class="addOperate">
                    <td>
                        <span id="Span11" runat="server" style="float: right">
                            <asp:LinkButton runat="server" ID="lbtnAddImportantFactorsC" CssClass="subtoolbarlink" EnableTheming="false"
                                OnClientClick="return addDetailItemC(3)" OnClick="lbtnAddImportantFactorsC_OnClick">
                                <span>
                                    <img runat="server" id="img28" src="~/Themes/Images/btn_add.gif" alt="新增重要环境因素" width="16"
                                        height="16" />新增</span>
                            </asp:LinkButton>
                            <asp:LinkButton runat="server" ID="lbtnAddImportantFactors" CssClass="subtoolbarlink"
                                EnableTheming="false" OnClientClick="return addImportantFactorsItem()" OnClick="lbtnAddImportantFactors_OnClick">
                                <span>
                                    <img runat="server" id="img25" src="~/Themes/Images/btn_add.gif" alt="从模板中选择环重要环境因素" width="16"
                                        height="16" />从模板中选择</span>
                            </asp:LinkButton>
                            <!------->
                            <asp:LinkButton runat="server" ID="lbtnBatchDelImportantFactors" OnClientClick="return confirm('确定要删除吗？');"
                                CssClass="subtoolbarlink" EnableTheming="false" OnClick="lbtnBatchDelImportantFactors_OnClick">
                                <span>
                                    <img runat="server" id="img26" src="~/Themes/Images/btn_dg_delete.gif" alt="批量删除"
                                        width="16" height="16" />批量删除</span>
                            </asp:LinkButton>
                            <!------->
                        </span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvImportantFactorsList"
                            AllowPaging="true" PageSize="10" AutoGenerateColumns="false" ShowExport="true"
                            AllowSorting="true" DataKeyNames="IdentiyItemDetailID" UseDefaultDataSource="true"
                            OnRowCommand="gvDangerList_RowCommand" BindGridViewMethod="UserControl.BindImportantFactorsList">
                            <Columns>
                                <zhongsoft:LightCheckField HeaderText="" ItemStyle-Width="40px">
                                </zhongsoft:LightCheckField>
                                <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightBoundField DataField="Place" HeaderText="活动/生产/服务场所" ShowToolTip="true"
                                    Width="120">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="ItemReource" HeaderText="重要环境因素" ShowToolTip="true"
                                    Width="150" />
                                <zhongsoft:LightBoundField DataField="ControlDetailInfo" HeaderText="控制措施" ShowToolTip="true"
                                    Width="150" />
                                <zhongsoft:LightBoundField HeaderText="完成时间" DataField="CompleteTime" DataFormatString="{0:yyyy-MM-dd}" />
                                <zhongsoft:LightBoundField DataField="ProgressStatus" HeaderText="实施情况" ShowToolTip="true"
                                    Width="150">
                                </zhongsoft:LightBoundField>


                                <%-- <zhongsoft:LightBoundField DataField="ItemLevel" HeaderText="级别">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="FillUserName" HeaderText="填写人">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="FillDeptName" HeaderText="填写部门">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="FillDate" HeaderText="填写日期" DataFormatString="{0:yyyy-MM-dd}"
                        Width="70">
                    </zhongsoft:LightBoundField>--%>
                                <zhongsoft:LightButtonField HeaderText="编辑" EditItemClick="editIdentityDetail" DataParamFields="IdentiyItemDetailID,ItemType"
                                    CommandName="EditData" />
                                <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="showIdentityDetail" DataParamFields="IdentiyItemDetailID,ItemType"
                                    CommandName="ViewData" />
                                <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除">
                                </zhongsoft:LightButtonField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="flexible" onclick="openDetail('trDanger')">隐患排查/危险源辨识、风险评价及控制措施表&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr id="trDanger">
        <td>
            <table class="tz-table">
                <tr class="addOperate">
                    <td>
                        <span id="Span4" runat="server" style="float: right">
                            <asp:LinkButton runat="server" ID="lbtnAddDangerC" CssClass="subtoolbarlink" EnableTheming="false"
                                OnClientClick="return addDetailItemC(1)" OnClick="lbtnAddDangerC_OnClick">
                                <span>
                                    <img runat="server" id="img29" src="~/Themes/Images/btn_add.gif" alt="新增危险源辨识" width="16"
                                        height="16" />新增</span>
                            </asp:LinkButton>
                            <asp:LinkButton runat="server" ID="lbtnAddDanger" CssClass="subtoolbarlink" EnableTheming="false"
                                OnClientClick="return addDangerItem()" OnClick="lbtnAddDanger_Click">
                                <span>
                                    <img runat="server" id="img5" src="~/Themes/Images/btn_add.gif" alt="从模板中选择危险源辨识" width="16"
                                        height="16" />从模板中选择</span>
                            </asp:LinkButton>
                            <!------->
                            <asp:LinkButton runat="server" ID="lbtnBatchDelDanger" OnClientClick="return confirm('确定要删除吗？');"
                                CssClass="subtoolbarlink" EnableTheming="false" OnClick="lbtnBatchDelDanger_OnClick">
                                <span>
                                    <img runat="server" id="img19" src="~/Themes/Images/btn_dg_delete.gif" alt="批量删除"
                                        width="16" height="16" />批量删除</span>
                            </asp:LinkButton>
                            <!------->
                        </span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvDangerList" AllowPaging="true"
                            PageSize="10" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                            DataKeyNames="IdentiyItemDetailID" UseDefaultDataSource="true" OnRowCommand="gvDangerList_RowCommand"
                            BindGridViewMethod="UserControl.BindDangerList">
                            <Columns>
                                <zhongsoft:LightCheckField HeaderText="" ItemStyle-Width="40px">
                                </zhongsoft:LightCheckField>
                                <zhongsoft:LightTemplateField ItemStyle-Width="10px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightBoundField DataField="Place" HeaderText="活动/生产/<br/>服务场所" ShowToolTip="true" HtmlEncode="false"
                                    Width="120">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="ItemReource" HeaderText="危险源" ShowToolTip="true"
                                    Width="120">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="ItemRiskAndInfluence" HeaderText="风险" ShowToolTip="true"
                                    Width="120">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="ControlDetailInfo" HeaderText="控制措施" ShowToolTip="true"
                                    Width="140">
                                </zhongsoft:LightBoundField>
                                <%-- <zhongsoft:LightBoundField DataField="FurtherControl" HeaderText="进一步控制措施" ShowToolTip="true"
                                    Width="150">
                                </zhongsoft:LightBoundField>--%>
                                <%-- <zhongsoft:LightBoundField DataField="ItemLevel" HeaderText="级别">
                    </zhongsoft:LightBoundField>--%>
                                <%-- <zhongsoft:LightBoundField DataField="FillUserName" HeaderText="填写人">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="FillDeptName" HeaderText="填写部门">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="FillDate" HeaderText="填写日期" DataFormatString="{0:yyyy-MM-dd}"
                        Width="70">
                    </zhongsoft:LightBoundField>--%>
                                <zhongsoft:LightButtonField HeaderText="编辑" EditItemClick="editIdentityDetail" DataParamFields="IdentiyItemDetailID,ItemType"
                                    CommandName="EditData" />
                                <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="showIdentityDetail" DataParamFields="IdentiyItemDetailID,ItemType"
                                    CommandName="ViewData" />
                                <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除">
                                </zhongsoft:LightButtonField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr class="trRiskControl">
        <td class="flexible" onclick="openDetail('trRiskControl')">风险和机遇识别及控制措施表&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr id="trRiskControl">
        <td>
            <table class="tz-table">
                <tr class="addOperate">
                    <td>
                        <span id="Span10" runat="server" style="float: right">
                            <asp:LinkButton runat="server" ID="lbtnAddRiskItem" CssClass="subtoolbarlink" EnableTheming="false"
                                OnClientClick="return addRiskItem()" OnClick="lbtnAddRiskItem_Click">
                                <span>
                                    <img runat="server" id="img9" src="~/Themes/Images/btn_add.gif" alt="新增风险点" width="16"
                                        height="16" />新增</span>
                            </asp:LinkButton>
                            <!--addEnvironmentalItem()  return loadRiskTmplt(); ----->
                            <asp:LinkButton runat="server" ID="lbtnLoadRiskTmplt" CssClass="subtoolbarlink" EnableTheming="false"
                                OnClientClick="return loadRiskTmplt();" OnClick="lbtnLoadRiskTmplt_Click">
                                <span>
                                    <img runat="server" id="img10" src="~/Themes/Images/btn_add.gif" alt="从模板中选择风险点" width="16"
                                        height="16" />从模板中选择</span>
                            </asp:LinkButton>
                            <!---->
                            <asp:LinkButton runat="server" ID="lbtnLoadHistoryRisk" CssClass="subtoolbarlink" Visible="False"
                                EnableTheming="false" OnClientClick="return loadHistoryRisk();" OnClick="lbtnLoadHistoryRisk_Click">
                                <span>
                                    <img runat="server" id="img11" src="~/Themes/Images/btn_add.gif" alt="新增里程碑节点" width="16"
                                        height="16" />套用历史工程风险点</span>
                            </asp:LinkButton>
                            <!------->
                            <asp:LinkButton runat="server" ID="lbtnLoadDeptRisks" CssClass="subtoolbarlink" EnableTheming="false"
                                OnClientClick="return loadDeptRisks();" OnClick="lbtnLoadDeptRisks_Click" Visible="False">
                                <span>
                                    <img runat="server" id="img12" src="~/Themes/Images/btn_add.gif" alt="新增里程碑节点" width="16"
                                        height="16" />导入部门风险点</span>
                            </asp:LinkButton>
                            <!------->
                            <!------->
                            <asp:LinkButton runat="server" ID="lbtnBatchDelRisks" OnClientClick="return confirm('确定要删除吗？');"
                                CssClass="subtoolbarlink" EnableTheming="false" OnClick="lbtnBatchDelRisks_OnClick">
                                <span>
                                    <img runat="server" id="img14" src="~/Themes/Images/btn_dg_delete.gif" alt="批量删除"
                                        width="16" height="16" />批量删除</span>
                            </asp:LinkButton>
                            <!------->
                        </span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvRiskControl" AllowPaging="true"
                            PageSize="10" AutoGenerateColumns="false" ShowExport="true" DataKeyNames="RiskControlItemID"
                            UseDefaultDataSource="true" AllowSorting="true" OnRowCommand="gvRiskControl_RowCommand"
                            BindGridViewMethod="UserControl.BindRiskControl" OnRowDataBound="gvRiskControl_OnRowDataBound">
                            <Columns>
                                <zhongsoft:LightCheckField HeaderText="" ItemStyle-Width="40px">
                                </zhongsoft:LightCheckField>
                                <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightBoundField DataField="RiskName" HeaderText="风险和机遇来源" Width="120" ShowToolTip="true"
                                    SortExpression="RiskName">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="RiskDescribe" HeaderText="风险和机遇描述" ShowToolTip="true"
                                    Width="150" SortExpression="RiskDescribe">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="RiskRank" HeaderText="风险等级" Width="50" SortExpression="RiskRank">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="Probability" HeaderText="发生概率" Width="70"
                                    SortExpression="RiskProcessMode">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="ExpectedResult" HeaderText="影响程度" Width="70"
                                    SortExpression="ExpectedResult">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="CounterMeasure" HeaderText="控制措施" Width="150"
                                    SortExpression="CounterMeasure" ShowToolTip="true">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightButtonField HeaderText="编辑" EditItemClick="editRiskItem" DataParamFields="RiskControlItemID"
                                    CommandName="EditData" />
                                <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="viewRiskItem" DataParamFields="RiskControlItemID"
                                    CommandName="ViewData" />
                                <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除">
                                </zhongsoft:LightButtonField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr style="display: none">
        <td class="flexible" onclick="openDetail('trEmergency')">应急预案清单&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr id="trEmergency" style="display: none">
        <td>
            <table class="tz-table">
                <tr class="addOperate">
                    <td>
                        <span id="Span6" runat="server" style="float: right">
                            <asp:LinkButton runat="server" ID="lbtnAddEmergency" CssClass="subtoolbarlink" EnableTheming="false"
                                OnClientClick="return addEmergencyItem()" OnClick="lbtnAddEmergency_Click">
                                <span>
                                    <img runat="server" id="img7" src="~/Themes/Images/btn_add.gif" alt="新增应急预案" width="16"
                                        height="16" />新增应急预案</span>
                            </asp:LinkButton>
                            <!------->
                            <asp:LinkButton runat="server" ID="lbtnBatchDelEmergency" OnClientClick="return confirm('确定要删除吗？');"
                                CssClass="subtoolbarlink" EnableTheming="false" OnClick="lbtnBatchDelEmergency_OnClick">
                                <span>
                                    <img runat="server" id="img20" src="~/Themes/Images/btn_dg_delete.gif" alt="批量删除"
                                        width="16" height="16" />批量删除</span>
                            </asp:LinkButton>
                            <!------->
                        </span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvEmergencyList" AllowPaging="true"
                            PageSize="10" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                            DataKeyNames="RegulationItemDetailID" UseDefaultDataSource="true" OnRowCommand="gvList_RowCommand"
                            BindGridViewMethod="UserControl.BindEmergencyList">
                            <Columns>
                                <zhongsoft:LightCheckField HeaderText="" ItemStyle-Width="40px">
                                </zhongsoft:LightCheckField>
                                <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightBoundField DataField="FillDeptName" HeaderText="填写部门">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="ItemCode" HeaderText="应急预案编号">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="ItemName" HeaderText="应急预案名称">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="FillUserName" HeaderText="填写人">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="FillDate" HeaderText="填写日期" DataFormatString="{0:yyyy-MM-dd}"
                                    ItemStyle-Width="70px">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="ItemLevel" HeaderText="级别">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="showRegulationDetail"
                                    DataParamFields="ParamRegulationItemID,ItemType" CommandName="ViewData" />
                                <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除">
                                </zhongsoft:LightButtonField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr style="display: none">
        <td class="flexible" onclick="openDetail('trGeneral')">通用图集列表&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr id="trGeneral" style="display: none">
        <td>
            <table class="tz-table">
                <tr class="addOperate">
                    <td>
                        <span id="Span3" runat="server" style="float: right">
                            <asp:LinkButton runat="server" ID="lbtnAddGeneralAtlas" CssClass="subtoolbarlink"
                                EnableTheming="false" OnClientClick="return addGeneralAtlasItem()" OnClick="lbtnAddGeneralAtlas_Click">
                                <span>
                                    <img runat="server" id="img4" src="~/Themes/Images/btn_add.gif" alt="新增通用图集" width="16"
                                        height="16" />新增通用图集</span>
                            </asp:LinkButton>
                            <!------->
                            <asp:LinkButton runat="server" ID="lbtnBatchDelGeneralAtlas" OnClientClick="return confirm('确定要删除吗？');"
                                CssClass="subtoolbarlink" EnableTheming="false" OnClick="lbtnBatchDelGeneralAtlas_OnClick">
                                <span>
                                    <img runat="server" id="img21" src="~/Themes/Images/btn_dg_delete.gif" alt="批量删除"
                                        width="16" height="16" />批量删除</span>
                            </asp:LinkButton>
                            <!------->
                        </span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvGeneralAtlas" AllowPaging="true"
                            PageSize="10" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                            DataKeyNames="RegulationItemDetailID" UseDefaultDataSource="true" OnRowCommand="gvList_RowCommand"
                            BindGridViewMethod="UserControl.BindGeneralAtlas">
                            <Columns>
                                <zhongsoft:LightCheckField HeaderText="" ItemStyle-Width="40px">
                                </zhongsoft:LightCheckField>
                                <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightBoundField DataField="SpecialtyName" HeaderText="专业">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="ItemName" HeaderText="通用图集名称" ShowToolTip="true"
                                    Width="150">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="VersionInfo" HeaderText="版本号">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="ImplementationDate" HeaderText="实施日期" DataFormatString="{0:yyyy-MM-dd}"
                                    ItemStyle-Width="70px">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="ReplaceFile" HeaderText="替代文件或版本" ShowToolTip="true"
                                    Width="150">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="ApprovalDepartment" HeaderText="发布或编制单位" ShowToolTip="true"
                                    Width="150">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="ItemLevel" HeaderText="级别">
                                </zhongsoft:LightBoundField>
                                <%--  <zhongsoft:LightBoundField DataField="FillUserName" HeaderText="填写人">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="FillDeptName" HeaderText="填写部门">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="FillDate" HeaderText="填写日期" DataFormatString="{0:yyyy-MM-dd}"
                        Width="70">
                    </zhongsoft:LightBoundField>--%>
                                <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="showRegulationDetail"
                                    DataParamFields="ParamRegulationItemID,ItemType" CommandName="ViewData" />
                                <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除">
                                </zhongsoft:LightButtonField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr style="display: none">
        <td class="flexible" onclick="openDetail('trGeneral')">强条列表&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr style="display: none">
        <td>
            <uc1:WBSMandatoryForPlan ID="ucWBSMandatoryForPlan" runat="server" />
        </td>
    </tr>
</table>
<!---存储选择后的法律法规、规程规范、通用图集、应急预案--->
<input type="hidden" runat="server" id="hiRegulationXml" />
<!---存储选择后的危险源辨识及环境因素识别--->
<input type="hidden" runat="server" id="hiIdentiyXml" />
<!---存储选择后的目标--->
<input type="hidden" runat="server" id="hiTargetXml" />
<!---存储选择后的风险辨识-模板--->
<input type="hidden" runat="server" id="hiTmpltRiskItemsXml" />
<!---存储选择后的风险辨识-历史--->
<input type="hidden" runat="server" id="hiOldRiskItemsXml" />
<!--里程碑-->
<input type="hidden" runat="server" id="hiMilestone" value="里程碑节点" />
<input type="hidden" runat="server" id="hiProjectLevel" />
<script>

    function integrateProjItem_Init() {
        if (!parseBool("<%=Enabled %>")) {
            $(".addOperate").hide();
        }

        $(".trMilestone").hide();
        $("#trMilestone").hide();
    }

    function addMilestoneNew() {
        handleMilestoneNew(2, '');
        return false;
    }

    function editMilestoneNew(bizId) {
        handleMilestoneNew(3, bizId);
        return false;
    }

    function viewMilestoneNew(bizId) {
        handleMilestoneNew(1, bizId);
        return false;
    }


    //添加新里程碑节点
    function handleMilestoneNew(actionType, bizId) {
        var orgId = "<%=OrganizationID %>";
        var sourcetype = "<%=SourceType %>";
        if (sourcetype !== null || sourcetype !== undefined || sourcetype !== '') {
            sourcetype = "综合项目计划书流程";
        }
        var projectplanbookid = "<%=ProjectPlanBookID %>";
        var json = { OrganizationID: orgId, SourceType: sourcetype, ProcessFormID: projectplanbookid };
        var url = buildBizUrl(actionType, bizId, '/EPMS/List/Plan/MilestoneEditor.aspx', json);
        var callBack = bindMilestoneNew;
        showDivDialog(encodeURI(url), "", 650, 600, callBack);
    }
    //刷新里程碑节点
    function bindMilestoneNew() {
         <%=Page.ClientScript.GetPostBackEventReference(this.lbtnAddMilestoneNew,"")%>;
    }


    function addProjectTarget() {
        handleProjectTarget(2, '');
        return false;
    }

    //刷新产品质量、环境和职业健康安全管理目标、措施及测评信息
    function bindTarget() {
        <%=Page.ClientScript.GetPostBackEventReference(this.lbtnAddTarget,"")%>;
    }

    //刷新产品质量、环境和职业健康安全管理目标、措施及测评信息
    function bindTargetMB() {
        <%=Page.ClientScript.GetPostBackEventReference(this.lbtnAddTargetMB,"")%>;
    }

    //添加目标
    function handleProjectTarget(actionType, bizId) {
        var orgId = "<%=OrganizationID %>";
        var sourcetype = "<%=SourceType %>";
        if (sourcetype !== null || sourcetype !== undefined || sourcetype !== '') {
            sourcetype = "综合项目计划书流程";
        }
        var projectplanbookid = "<%=ProjectPlanBookID %>";
        var json = { OrganizationID: orgId, ProcessFormID: projectplanbookid };
        var url = buildBizUrl(actionType, bizId, '/EPMS/List/Plan/ProjectPlanTargetEditor.aspx', json);
        var callBack = bindTarget;
        showDivDialog(encodeURI(url), "", 650, 600, callBack);
    }


    //编辑产品质量、环境和职业健康安全管理目标、措施及测评信息
    function editTargetDetail(bizId) {
        return showTargetDetail(bizId, 3);
    }


    function viewTargetDetail(bizId) {
        return showTargetDetail(bizId, 1);
    }


    function showTargetDetail(bizId, actionType) {
        var json = { actionType: actionType, bizId: bizId };
        var url = buildQueryUrl('/EPMS/List/Plan/ProjectPlanTargetEditor.aspx', json);
        var callBack = null;
        if (actionType == '3') {
            callBack = bindTarget;
        }
        showDivDialog(encodeURI(url), "", 650, 600, callBack);
        return false;
    }


    //刷新里程碑节点和评审计划信息
    function bindMilestoneNew() {
        <%=Page.ClientScript.GetPostBackEventReference(this.lbtnAddMilestoneNew,"")%>;
    }


    //添加法律法规
    function addLawItem() {
        selRegulation("<%=(int)RegulationItemType.法律法规 %>");
        return false;
    }
    //添加规程规范
    function addRegulationItem() {
        selRegulation("<%=(int)RegulationItemType.规程规范 %>");
        return false;
    }
    //添加通用图集
    function addGeneralAtlasItem() {
        selRegulation("<%=(int)RegulationItemType.通用图集 %>");
        return false;
    }
    //添加危险源辨识表
    function addDangerItem() {
        selIdentiyItem("<%=(int)IdentiyItemType.危险源辨识 %>");
        return false;
    }
    //添加环境因素标识
    function addEnvironmentalItem() {
        selIdentiyItem("<%=(int)IdentiyItemType.环境因素识别 %>");
        return false;
    }
    //添加重要环境因素
    function addImportantFactorsItem() {
        selIdentiyItem("<%=(int)IdentiyItemType.重要环境因素 %>");
        return false;
    }

    //添加应急预案
    function addEmergencyItem() {
        selRegulation("<%=(int)RegulationItemType.应急预案 %>");
        return false;
    }
    //添加法律法规、规程规范、通用图集、应急预案
    function selRegulation(itemType) {
        var param = new InputParamObject("m");
        var organizationID = "<%=OrganizationID %>";
        var projDeptId = "<%=ProjDeptId %>";
        var json = { ItemType: itemType, OrganizationID: organizationID };
        var callBack = null;
        if (itemType == "<%=(int)RegulationItemType.法律法规 %>") {
            callBack = refreshLawData;
        }
        else if (itemType == "<%=(int)RegulationItemType.规程规范 %>")
            callBack = refreshRegulationData;
        else if (itemType == "<%=(int)RegulationItemType.通用图集 %>")
            callBack = refreshGeneralAtlasData;
        else if (itemType == "<%=(int)RegulationItemType.应急预案 %>") {
            callBack = refreshEmergencyData;
            json = { ItemType: itemType, OrganizationID: organizationID };
        }
        getRegulationItem("<%=hiRegulationXml.ClientID %>", param, json, callBack);
    }
    //刷新法律法规、规程规范、通用图集、应急预案
    function refreshRegulationData() {
         <%=Page.ClientScript.GetPostBackEventReference(this.lbtnAddRegulation,"")%>;
    }
    //刷新法律法规、规程规范、通用图集、应急预案
    function refreshLawData() {
         <%=Page.ClientScript.GetPostBackEventReference(this.lbtnAddLaw,"")%>;
    }
    //刷新法律法规、规程规范、通用图集、应急预案
    function refreshGeneralAtlasData() {
         <%=Page.ClientScript.GetPostBackEventReference(this.lbtnAddGeneralAtlas,"")%>;
    }
    //刷新法律法规、规程规范、通用图集、应急预案
    function refreshEmergencyData() {
         <%=Page.ClientScript.GetPostBackEventReference(this.lbtnAddEmergency,"")%>;
    }

    //添加危险源辨识及环境因素识别
    function selIdentiyItem(itemType) {
        var param = new InputParamObject("m");
        var projDeptId = "<%=ProjDeptId %>";
        var json = { ItemType: itemType };
        var callBack = null;
        if (itemType == "<%=(int)IdentiyItemType.环境因素识别 %>")
            callBack = refreshEnvironmentalData;
        else if (itemType == "<%=(int)IdentiyItemType.危险源辨识 %>")
            callBack = refreshIdentiyData;
        else if (itemType == "<%=(int)IdentiyItemType.重要环境因素 %>")
            callBack = refreshImportant;
        getIdentiyItem("<%=hiIdentiyXml.ClientID %>", param, json, callBack);
        return false;
    }

    //添加目标
    function selProjectTargetMB() {
        var param = new InputParamObject("m");
        var callBack = bindTargetMB;
        buildDivSelector("<%=hiTargetXml.ClientID %>", param, null, buildQueryUrl("/EPMS/Obsolete/ProjectPlanTargetSelector.aspx", null), 950, 550, callBack);
        return false;
    }
    //刷新危险源辨识及环境因素识别 
    function refreshIdentiyData() {
        <%=Page.ClientScript.GetPostBackEventReference(this.lbtnAddDanger,"")%>;
    }
    //刷新危险源辨识及环境因素识别 
    function refreshIdentiyData() {
        <%=Page.ClientScript.GetPostBackEventReference(this.lbtnAddDanger,"")%>;
    }
    //刷新重要环境因素
    function refreshImportant() {
        <%=Page.ClientScript.GetPostBackEventReference(this.lbtnAddImportantFactors,"")%>;
    }

    //刷新危险源辨识及环境因素识别 
    function refreshEnvironmentalData() {
        <%=Page.ClientScript.GetPostBackEventReference(this.lbtnAddEnvironmental,"")%>;
    }
    //添加WBS任务信息
    function addWBSItem(type) {
        //传递已存在的WBS任务分解流程ID，从而可以进行编辑操作
        var bizId = '<%=WBSBizID %>';
        var json = { OrganizationID: '<%=OrganizationID %>' };
        var url = buildBizUrl(3, bizId, "/EPMS/List/WBS/WBSSplitEditor.aspx", json);
        showDivDialog(encodeURI(url), "", 1050, 600, bindMilestoneWbs);
        return false;
    }

    //新建评审计划
    function addReviewInfo() {
        addReviewItem(2, '');
        return false;
    }

    function editReviewDetail(wbsID) {
        addReviewItem(3, wbsID);
        return false;
    }

    function viewReviewDetail(wbsID) {
        addReviewItem(1, wbsID);
        return false;
    }

    function viewCalItem(wbsID) {
        addReviewItem(1, wbsID);
        return false;
    }

    function addReviewItem(actionType, bizId) {
        var orgId = "<%=OrganizationID %>";
        var json = { OrganizationID: orgId };
        if (actionType == 2 || actionType == 3) {
            json = { OrganizationID: orgId, ProjectPlanBookID:'<%=ProjectPlanBookID %>' };
            if ('<%=SourceType %>' == "<%=(int)PlanBookType.专业设计计划 %>") {
                json = { OrganizationID: orgId, ProjectPlanBookID:'<%=ProjectPlanBookID %>', ExecSpecialtyID:'<%=ExecSpecialtyID %>' };
            }
        }
        var url = buildBizUrl(actionType, bizId, '/EPMS/List/WBS/ReviewPlanEditor.aspx', json);
        var callBack = bindReview;
        showDivDialog(encodeURI(url), "", 650, 600, callBack);
    }

    //刷新评审计划信息
    function bindReview() {
         <%=Page.ClientScript.GetPostBackEventReference(this.lbtnAddNewReview,"")%>;
    }

    //刷新里程碑节点和评审计划信息
    function bindMilestoneWbs() {
         <%=Page.ClientScript.GetPostBackEventReference(this.lbtnAddMilestone,"")%>;
    }

    //编辑里程碑节点和评审计划信息
    function editDetail(bizId) {
        return showDetail(bizId, 3);
    }

    function showDetail(bizId, actionType) {
        var json = { actionType: actionType, bizId: bizId };
        var url = buildQueryUrl('/EPMS/List/WBS/WBSEditor.aspx', json);
        var callBack = null;
        if (actionType == '3') {
            callBack = bindMilestoneWbs;
        }
        showDivDialog(url, "", 1000, 600, callBack);
        return false;
    }
    //查看法律法规、规程规范、通用图集、应急预案详细页面
    function showRegulationDetail(bizId, itemType) {
        var json = { itemType: itemType };
        var url = buildBizUrl(1, bizId, "EPMS/List/Plan/RegulationItemEditor.aspx", json);
        return showDivDialog(url, null, 700, 450, null);
    }

    //查看法律法规、规程规范、通用图集、应急预案详细页面
    function showIdentityDetail(bizId, itemType) {
        var json = { itemType: itemType };
        var url = buildBizUrl(1, bizId, "EPMS/List/Plan/IdentiyItemEditor.aspx", json);
        return showDivDialog(url, null, 700, 450, null);
    }

    //编辑法律法规、规程规范、通用图集、应急预案详细页面
    function editIdentityDetail(bizId, itemType) {
        var json = { itemType: itemType };
        var url = buildBizUrl(3, bizId, "EPMS/List/Plan/IdentiyItemEditor.aspx", json);
        var callBack = null;
        if (itemType =='<%=(int)IdentiyItemType.环境因素识别%>') {
            callBack = EnvironmentalC;
        }
        else if (itemType =='<%=(int)IdentiyItemType.危险源辨识%>') {
            callBack = DangerC;
        }
        else if (itemType =='<%=(int)IdentiyItemType.重要环境因素%>') {
            callBack = ImportantFactorsC;
        }
        return showDivDialog(url, null, 700, 450, callBack);
    }

    //获取规程规范数量
    function getRegularCount() {
        return $('#<%=gvRegulationList.ClientID %>')[0].rows.length;
    }
    //法律法规数量
    function getLawRowCount() {
        return $('#<%=gvLawList.ClientID %>')[0].rows.length;
    }
    //获取环境因素识别表数量
    function getEnvironmentalCount() {
        return $('#<%=gvEnvironmentalList.ClientID %>')[0].rows.length;
    }
    //危险源辨识表数量
    function getDangerRowCount() {
        return $('#<%=gvDangerList.ClientID %>')[0].rows.length;
    }
    //应急预案数量
    function getEmergencyCount() {
        return $('#<%=gvEmergencyList.ClientID %>')[0].rows.length;
    }

</script>
<!----风险控制------>
<script>

    //批量导入项目所属部门的部门风险点
    function loadDeptRisks() {

        if (!confirm("根据项目组织部门的批量导入部门风险辨识，可能造成本流程大量不相关的风险点，是否继续？")) {
            return false;
        }
        var riskItemCount = getRiskItemCount();
        if (riskItemCount > 2) {
            if (!confirm("当前已经添加了风险辨识，批量导入项目组织部门的风险辨识可能导致重复项，是否继续？")) {
                return false;
            }
        }
        return true;
    }

    //套用模板风险点
    function loadRiskTmplt() {
        var riskItemCount = getRiskItemCount();
        //选择页面
        var param = new InputParamObject("m");
        var proecessType = "<%=ProecessType %>";
        var deptid = "<%=ProjDeptId %>";
        var json = { FormType: proecessType, ProjDeptId: deptid };

        var callBack = bindRiskTmplt;
        //getRiskTmpltItem("<%=hiTmpltRiskItemsXml.ClientID %>", param, json, callBack);
        buildDivSelector("<%=hiTmpltRiskItemsXml.ClientID %>", param, json, buildQueryUrl("/EPMS/Obsolete/RiskItemSelector.aspx", null), 1000, 600, callBack);
        return false;
    }

    //套用历史流程风险点
    function loadHistoryRisk() {
        if (!confirm("通过选择历史流程，将历史流程中的风险点批量导入，可能造成很多不相关的风险辨识，是否继续？")) {
            return false;
        }

        var riskItemCount = getRiskItemCount();
        if (riskItemCount > 2) {
            if (!confirm("当前已经添加了风险辨识，批量导入项目组织部门的风险辨识可能导致重复项，是否继续？")) {
                return false;
            }
        }

        //选择页面
        var param = new InputParamObject("s");
        var proecessType = "<%=ProecessType %>";
        var json = { FormType: proecessType };
        var callBack = bindHistoryRisk;
        //需要重新指定选择页面
        //getRiskHistoryItem("<%=hiOldRiskItemsXml.ClientID %>", param, json, callBack);
        buildDivSelector("<%=hiOldRiskItemsXml.ClientID %>", param, json, buildQueryUrl("/EPMS/Obsolete/RiskHistorySelector.aspx", null), 950, 600, callBack);
        return false;
    }


    //新增风险点
    function addRiskItem() {
        handleRiskItem(2, '');
        return false;
    }

    //编辑风险点
    function editRiskItem(bizId) {
        handleRiskItem(3, bizId);
        return false;
    }

    //查看风险点
    function viewRiskItem(bizId) {
        handleRiskItem(1, bizId);
        return false;
    }

    function handleRiskItem(actionType, bizId) {
        var orgId = "<%=OrganizationID %>";
        var sourceType = "<%=SourceType %>";
        var formType = "<%=FormType %>";
        var proecessType = "<%=ProecessType %>";
        var FormID = "<%=ProjectPlanBookID %>";
        var json = { actionType: actionType, bizId: bizId, FormPrstID: FormID, FormPrstType: proecessType, ProjectID: orgId };
        var url = buildQueryUrl('/EPMS/List/Plan/ProcessRiskIdentifyEditor.aspx', json);
        var callBack = bindRiskItem;
        showDivDialog(encodeURI(url), "", 800, 500, callBack);
    }



    //获取项目风险辨识数量
    function getRiskItemCount() {
        return $('#<%=gvRiskControl.ClientID %>')[0].rows.length;
    }
    function bindRiskTmplt() {
        <%=Page.ClientScript.GetPostBackEventReference(this.lbtnLoadRiskTmplt,"")%>;
    }
    function bindHistoryRisk() {
        <%=Page.ClientScript.GetPostBackEventReference(this.lbtnLoadHistoryRisk,"")%>;
    }

    function bindRiskItem() {
         <%=Page.ClientScript.GetPostBackEventReference(this.lbtnAddRiskItem,"")%>;
    }



    //新建
    function addDetailItemC(itemType) {
        var orgId = "<%=OrganizationID %>";
        var sourcetype = "<%=SourceType %>";
        var projectplanbookid = "<%=ProjectPlanBookID %>";
        var param = { actionType: 2, OrganizationID: orgId, ProcessFormID: projectplanbookid, itemType: itemType };
        var url = buildQueryUrl("/EPMS/List/Plan/IdentiyItemEditor.aspx", param);
        var callBack = null;
        if (itemType =='<%=(int)IdentiyItemType.环境因素识别%>') {
            callBack = EnvironmentalC;
        }
        else if (itemType =='<%=(int)IdentiyItemType.危险源辨识%>') {
            callBack = DangerC;
        }
        else if (itemType =='<%=(int)IdentiyItemType.重要环境因素%>') {
            callBack = ImportantFactorsC;
        }
        showDivDialog(url, "", 700, 450, callBack);
        return false;
    }

    //刷新环境识别因素
    function EnvironmentalC() {
        <%=Page.ClientScript.GetPostBackEventReference(this.lbtnAddEnvironmentalC,"")%>;
    }

    //刷新重要环境
    function ImportantFactorsC() {
        <%=Page.ClientScript.GetPostBackEventReference(this.lbtnAddImportantFactorsC,"")%>;
    }

    //刷新环境识别因素
    function DangerC() {
        <%=Page.ClientScript.GetPostBackEventReference(this.lbtnAddDangerC,"")%>;
    }

    function checkList() {
        var errorStr = "";
        //综合进度列表行数
        var gvList = $("#<%=gvMilestoneNew.ClientID %>")[0];
        //产品质量
        var gvListCPZL = $("#<%=gvListTarget.ClientID %>")[0];
        //环境因素识别评价表
        var gvEnvironmentalList = $("#<%=gvEnvironmentalList.ClientID %>")[0];
        //重要环境因素控制表
        var gvImportantFactorsList = $("#<%=gvImportantFactorsList.ClientID %>")[0];
        //隐患排查/危险源辨识、风险评价及控制措施表
        var gvDangerList = $("#<%=gvDangerList.ClientID %>")[0];
        //风险和机遇识别及控制措施表
        var gvRiskControl = $("#<%=gvRiskControl.ClientID %>")[0];

        if (gvList.rows[1].cells.length == 1) {
            errorStr = "综合进度计划表不可为空！";
            $("#ctl10_ucIntegrateProjPlan_txtWriteDeptName").focus();
            return errorStr;
        } else if (gvList.rows[1].cells.length > 1) {
            for (var i = 1; i < gvList.rows.length - 1; i++) {
                if (gvList.rows[i].cells[3].innerText == " ") {
                    errorStr = "综合进度计划表【" + gvList.rows[i].cells[2].innerText + "】-【日期】不可为空！";
                    <%--$("#<%=lbtnAddMilestoneNew.ClientID %>").focus();--%>
                    $("#ctl10_ucIntegrateProjPlan_txtWriteDeptName").focus();
                    return errorStr;
                }
            }
        }

        if (gvListCPZL.rows[1].cells.length == 1) {
            errorStr = "产品质量、环境和职业健康安全管理目标、措施及测评表不可为空！";
            <%--$("#<%=gvListTarget.ClientID %>").focus();--%>
            $("#<%=lbtnAddMilestoneNew.ClientID %>").focus();
            return errorStr;
        }
        //三类工程不验证环境因素识别评价表等
        var projectLevel = $("#<%=hiProjectLevel.ClientID %>").val();
        if (projectLevel != "Ⅲ类工程") {
            if (gvEnvironmentalList.rows[1].cells.length == 1) {
                errorStr = "环境因素识别评价表不可为空！";
            <%--$("#<%=gvEnvironmentalList.ClientID %>").focus();--%>
                $("#<%=gvListTarget.ClientID %>").focus();
            }
            else if (gvImportantFactorsList.rows[1].cells.length == 1) {
                errorStr = "重要环境因素控制表不可为空！";
            <%--$("#<%=gvImportantFactorsList.ClientID %>").focus();--%>
                $("#<%=gvEnvironmentalList.ClientID %>").focus();
            }
            else if (gvDangerList.rows[1].cells.length == 1) {
                errorStr = "隐患排查/危险源辨识、风险评价及控制措施表不可为空！";
            <%--$("#<%=gvDangerList.ClientID %>").focus();--%>
                $("#<%=gvImportantFactorsList.ClientID %>").focus();
            }
            else if (gvRiskControl.rows[1].cells.length == 1) {
                errorStr = "风险和机遇识别及控制措施表不可为空！";
            <%--$("#<%=gvRiskControl.ClientID %>").focus();--%>
                $("#<%=gvDangerList.ClientID %>").focus();
            }
        }
        return errorStr;
    }
</script>
