<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WBSTreeAndList.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.WBS.WBSTreeAndList" %>
<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<%@ Import Namespace="DAL.EPMS" %>
<tr style="height: auto" id="trWBS">
    <td class="td-m" style="width: 20%; vertical-align: top;">
        <asp:Button ID="btnAddSpecialty" Text="添加专业" runat="server" OnClientClick="return addSpecialty4WBS();"
            DisplayStatus="(3.?)" class="kpms-buttonfree" Style="margin-left: 15px;" OnClick="btnAddSpecialty_Click" />
        <asp:TreeView ID="tvWBSTree" runat="server" ShowLines="True" Height="100%" OnSelectedNodeChanged="tvWBSTree_SelectedNodeChanged">
            <SelectedNodeStyle BackColor="#F7F7F7" />
        </asp:TreeView>
    </td>
    <td colspan="3" style="width: 80%; vertical-align: top;" class="td-m">
        <span id="divOperate">
            <!-- 相关操作-->
            <span id="spTemplate" runat="server"></span>
            <!-- 不可以添加服务器控件，否则翻页后无法显示-->
            <%--|</span>【<a class="aStyle" id="aViewProjPlan">查看项目计划</a>】--%>
            <table class="table-xmjh">
                <colgroup>
                    <col class="table-title">
                    <col style="width: 50.0%;">
                    <col class="table-title">
                    <col style="width: 50.0%;">
                </colgroup>
                <tbody>
                    <tr>
                        <td class="table-title">从模板导入：</td>
                        <td class="table-content" colspan="3"><a class="aStyle" flag="wbsTemp" speid='<%=SpecialtyID %>'
                            deptid='<%=DeptID%>'>任务（<asp:Label runat="server" ID="lbTempWbs" Text="0"></asp:Label>）供选择</a>，<a
                                class="aStyle" flag="outFileTemp" speid='<%=SpecialtyID%>' deptid='<%=DeptID%>'>互提资料（<asp:Label
                                    runat="server" ID="lbTempOutFile" Text="0"></asp:Label>）供选择</a><a class="aStyle"
                                        style="display: none;" flag="inFileTemp" speid='<%=SpecialtyID%>' deptid='<%=DeptID%>'>接受资料（
                            <asp:Label runat="server" ID="lbTempInFile" Text="0"></asp:Label>）供选择</a>，<a class="aStyle"
                                flag="externalTemp" speid='<%=SpecialtyID%>' deptid='<%=DeptID%>'>外部资料（<asp:Label
                                    runat="server" ID="lbTempExteral" Text="0"></asp:Label>）供选择</a><a class="aStyle"
                                        style="display: none;" flag="equipTemp" speid='<%=SpecialtyID%>'>设备（
                                        <asp:Label runat="server" ID="lbTempEquip" Text="0"></asp:Label>）供选择</a></td>
                    </tr>
                    <tr>
                        <td class="table-title">从历史项目导入：</td>
                        <td class="table-content"><a class="subtoolbarlink" flag="selectWbs" speid='<%=SpecialtyID%>' deptid='<%=DeptID%>'>
                            <span>
                                <img runat="server" id="imgSelect" src="~/Themes/Images/workflow/dr-rw.png" alt="选择历史项目任务"
                                    width="16" height="16" />任务</span></a>
                            <a class="subtoolbarlink" flag="selectOutFile" speid='<%=SpecialtyID%>' deptid='<%=DeptID%>'>
                                <span>
                                    <img runat="server" id="img1" src="~/Themes/Images/workflow/dr-tz.png" alt="选择历史项目专业间提资"
                                        width="16" height="16" />互提资料</span></a>
                            <a class="subtoolbarlink" flag="selectExternal" speid='<%=SpecialtyID%>' deptid='<%=DeptID%>'>
                                <span>
                                    <img runat="server" id="img3" src="~/Themes/Images/workflow/dr-zl.png" alt="选择历史项目外部资料"
                                        width="16" height="16" />外部资料</span></a></td>
                        <td class="table-title">新建：</td>
                        <td class="table-content"><a class="subtoolbarlink" flag="addWbs"
                            id="addWbs" speid='<%=SpecialtyID%>' specode='<%=SpecialtyCode %>' deptid='<%=DeptID%>'
                            rollid='<%=RollID %>' style="display: none"><span>
                                <img runat="server" id="imgAdd" src="~/Themes/Images/btn_add.gif" alt="新建任务" width="16"
                                    height="16" />任务</span></a>
                            <a class="subtoolbarlink" flag="addRoll" speid='<%=SpecialtyID%>' deptid='<%=DeptID%>'><span>
                                <img runat="server" id="img10" src="~/Themes/Images/workflow/xj-rw.png" alt="新建任务" width="16"
                                    height="16" />任务</span></a>
                            <a class="subtoolbarlink" flag="addOutFile" speid='<%=SpecialtyID%>' deptid='<%=DeptID%>'><span>
                                <img runat="server" id="img2" src="~/Themes/Images/workflow/xj-tz.png" alt="新建互提资料" width="16"
                                    height="16" />互提资料</span></a>
                            <a class="subtoolbarlink" flag="addExternal" speid='<%=SpecialtyID%>' deptid='<%=DeptID%>'><span>
                                <img runat="server" id="img4" src="~/Themes/Images/workflow/xj-zl.png" alt="新建外部资料" width="16"
                                    height="16" />外部资料</span></a></td>
                    </tr>
                    <tr>
                        <td class="table-title">从Excel导入：</td>
                        <td class="table-content" colspan="3">
                            <asp:LinkButton runat="server" ID="lbtnInport" CssClass="subtoolbarlink" EnableTheming="false"
                                flag="import" OnClientClick="return inExport('任务')">
                            <span>
                                <img runat="server" src="~/Themes/Images/workflow/excel-rw.png" alt="从Excel导入" width="16" height="16" />任务</span>
                            </asp:LinkButton>
                            <asp:LinkButton runat="server" ID="lbtnInportHT" CssClass="subtoolbarlink" EnableTheming="false"
                                flag="import" OnClientClick="return inExport('内部专业间提资')">
                        <span>
                            <img runat="server" src="~/Themes/Images/workflow/excel-tz.png" alt="从Excel导入" width="16" height="16" />互提资料</span>
                            </asp:LinkButton>
                            <asp:LinkButton runat="server" ID="lbtnInportWB" CssClass="subtoolbarlink" EnableTheming="false"
                                flag="import" OnClientClick="return inExport('外部接口资料接收')">
                        <span>
                            <img runat="server" src="~/Themes/Images/workflow/excel-zl.png" alt="从Excel导入" width="16" height="16" />外部资料</span>
                            </asp:LinkButton>
                            <asp:LinkButton runat="server" ID="lbtnDownLoad" CssClass="subtoolbarlink" EnableTheming="false"
                                flag="import" OnClientClick="return openDownLoad()">
                                <span>
                                    <img id="Img9" runat="server" src="~/Themes/Images/workflow/xzmb.png" alt="下载模板" width="16"
                                        height="16" />下载模板</span>
                            </asp:LinkButton></td>
                    </tr>
                </tbody>
            </table>
            <span>
                <%--</a>--%></span>
            <span>
                <asp:LinkButton runat="server" ID="lbtnAllDelete" CssClass="subtoolbarlink" OnClientClick="if(!confirm('您确定删除吗？')) return false;"
                    OnClick="btnAllDelete_Click" EnableTheming="false" ToolTip="批量删除" flag="delete">
                    <span>
                        <img runat="server" id="img5" src="~/Themes/custom/images/btn_delete.gif" alt="批量删除"
                            width="16" height="16" />批量删除</span>
                </asp:LinkButton>
            </span>
            <asp:LinkButton runat="server" ID="lbtnRoll" CssClass="subtoolbarlink" OnClientClick="return RollAlert()"
                OnClick="btnRoll_Click" EnableTheming="false" ToolTip="自动为该工程专业下的卷册" flag="roll"
                Visible="false">
                <span>
                    <img runat="server" id="img6" src="~/Themes/Images/btn-cfg1.png" alt="合卷" width="16"
                        height="16" />合卷</span>
            </asp:LinkButton>
            <asp:LinkButton runat="server" ID="lbtnBatch" CssClass="subtoolbarlink" OnClientClick="return OpenWBSinfo()"
                EnableTheming="false" ToolTip="分批次" flag="batch">
                <span>
                    <img runat="server" id="img7" src="~/Themes/Images/process.GIF" alt="分批次" width="16"
                        height="16" />分批次</span>
            </asp:LinkButton>
            <asp:LinkButton ID="lbtnDeptPlan" runat="server" EnableTheming="false" CssClass="btn-query"
                OnClientClick="return viewDeptProjPlan()" flag="Arrange">
                <span>
                    <img runat="server" id="img8" src="~/Themes/Images/process.GIF" alt="安排计划" width="16"
                        height="16" />安排计划</span>
            </asp:LinkButton>
            <span style="margin-bottom: 10px; display: block">编号/名称
                    <zhongsoft:LightTextBox ID="tbRollCode" runat="server" Width="70px"></zhongsoft:LightTextBox>
                类别<zhongsoft:LightDropDownList runat="server" ID="ddlType" Width="100px">
                    <asp:ListItem Value="">全部</asp:ListItem>
                    <asp:ListItem Value="任务" Selected="True">任务</asp:ListItem>
                    <asp:ListItem Value="内部专业间提资">互提资料</asp:ListItem>
                    <asp:ListItem Value="外部接口资料接收">外部资料</asp:ListItem>
                </zhongsoft:LightDropDownList>
                <asp:LinkButton runat="server" ID="lbtnSearch" OnClick="lbtnSearch_Click" EnableTheming="false"
                    ToolTip="查询">查询
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="lbtnReset" OnClick="lbtnReset_Click" EnableTheming="false"
                    ToolTip="重置">重置
                </asp:LinkButton>
                <asp:LinkButton ID="lbtnViewRecord" runat="server" EnableTheming="false" OnClientClick="return false">
                    <span onclick="viewWBSRecord();">
                        <img alt="img" src="<%=WebAppPath %>/Themes/Images/btn_dg_view.gif"  title="查看任务修改记录" />
                        查看任务修改记录
                    </span>
                </asp:LinkButton>
            </span>
            <%--</div>--%>
        </span>
        <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="true"
            PageSize="500" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
            DataKeyNames="WBSID" UseDefaultDataSource="true" OnRowDataBound="gvList_RowDataBound"
            OnRowCommand="gvList_RowCommand" BindGridViewMethod="UserControl.BindWBSList"
            OnExport="gvList_Export" AllowFrozing="false" ShowPageSizeChange="true" HideFieldOnExport="操作">
            <Columns>
                <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px">
                </zhongsoft:LightCheckField>
                <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <%# Container.DataItemIndex+1 %>
                    </ItemTemplate>
                </zhongsoft:LightTemplateField>
                <asp:TemplateField HeaderText="操作" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbtnFileBag" runat="server" EnableTheming="false" Visible="false"
                            ToolTip="档案袋" OnClientClick="return false">
                                    <img alt="档案袋" src="<%=this.WebAppPath %>/Themes/Images/btn_dg_detail.gif" onclick="fileBagItem('<%# Eval("WBSID") %>','<%# Eval("WBSState") %>');" />
                        </asp:LinkButton>
                        <asp:LinkButton ID="lbtnEdit" runat="server" EnableTheming="false" Visible="false"
                            ToolTip="编辑" OnClientClick="return false">
                                    <img alt="编辑" src="<%=this.WebAppPath %>/Themes/Images/btn_dg_edit.gif" ,
                                    onclick="wbsItem('3','<%# Eval("WBSID") %>','<%# Eval("ExecSpecialtyID") %>','<%# Eval("BelongDeptID") %>','<%# Eval("ParamWBSTypeID") %>');" />
                        </asp:LinkButton>
                        <asp:LinkButton ID="lbtnUp" runat="server" EnableTheming="false" Visible="false" CommandArgument='<%#Eval("WBSID") %>'
                            ToolTip="升版" OnClientClick='return confirm("是否确认升版?");' OnClick="lbtnUp_OnClick">
                                    <img alt="升版" src="<%=this.WebAppPath %>/Themes/Images/btn_shengban.png" />
                        </asp:LinkButton>
                        <asp:LinkButton ID="lbtnInter" runat="server" EnableTheming="false" Visible="false"
                            ToolTip="内审版" OnClientClick="return false">
                                    <img alt="内审版" src="<%=this.WebAppPath %>/Themes/Images/btn_neishen.png"
                                    onclick="upgradeWbs('<%#Eval("WBSID") %>','1','<%# Eval("ExecSpecialtyID") %>','<%# Eval("BelongDeptID") %>')" />
                        </asp:LinkButton>
                        <asp:LinkButton ID="lbtnApprove" runat="server" EnableTheming="false" Visible="false"
                            ToolTip="报批版" OnClientClick="return false">
                                    <img alt="报批版" src="<%=this.WebAppPath %>/Themes/Images/btn_baopi.png"
                                    onclick="upgradeWbs('<%#Eval("WBSID") %>','2','<%# Eval("ExecSpecialtyID") %>','<%# Eval("BelongDeptID") %>')" />
                        </asp:LinkButton>
                        <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" Visible="false"
                            ToolTip="删除" CommandName="del" CommandArgument='<%# Eval("WBSID") %>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="<%=this.WebAppPath %>/Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="项目名称（必填）" Visible="false">
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号（必填）" Visible="false">
                </zhongsoft:LightBoundField>
                <zhongsoft:LightTemplateField HeaderText="父级编号" Visible="false">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbParentCode"></asp:Label>
                    </ItemTemplate>
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightBoundField DataField="WBSType" HeaderText="类别" Visible="false">
                </zhongsoft:LightBoundField>
                <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="模板号" Visible="false">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbTempCode"></asp:Label>
                    </ItemTemplate>
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightBoundField DataField="ExecSpecialtyCode" HeaderText="专业代码（必填）" Visible="false">
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField DataField="ExecSpecialtyName" HeaderText="专业名称">
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField DataField="BelongDeptName" HeaderText="所属分院">
                </zhongsoft:LightBoundField>
                <zhongsoft:LightTemplateField HeaderText="编号">
                    <ItemTemplate>
                        <zhongsoft:LightTextBox runat="server" ID="tbWBSCode" Text='<%#Eval("WBSCode") %>'
                            Width="60px" Visible="false"></zhongsoft:LightTextBox>
                        <asp:Label runat="server" ID="lbWBSCode" Text='<%#Eval("WBSCode") %>'></asp:Label>
                        <input type="hidden" runat="server" id="hiWBSID" value='<%#Eval("WBSID") %>' />
                        <input type="hidden" runat="server" id="hiWBSType" value='<%#Eval("WBSType") %>' />
                    </ItemTemplate>
                </zhongsoft:LightTemplateField>
                <%--<zhongsoft:LightBoundField DataField="WBSCode" HeaderText="任务编号">
                </zhongsoft:LightBoundField>--%>
                <%--  <zhongsoft:LightBoundField DataField="WBSName" HeaderText="名称" DataParamFields="WBSID,ExecSpecialtyID,BelongDeptID"
                    DialogMode="Dialog" EditItemClick="viewItem">
                </zhongsoft:LightBoundField>--%>
                <zhongsoft:LightTemplateField HeaderText="名称">
                    <ItemTemplate>
                        <div style="word-break: break-all !important; white-space: normal !important; width: 150px">
                            <asp:LinkButton runat="server" ID="lbViewChild" EnableTheming="false" Style="text-decoration: underline; color: Blue !important"
                                OnClientClick='<%# String.Format("return viewItem(\"{0}\",\"{1}\",\"{2}\",\"{3}\")", Eval("WBSID"), Eval("ExecSpecialtyID"),Eval("BelongDeptID"),Eval("ParamWBSTypeID")) %>'>
                                 <span><%#Eval("WBSName")%></span></asp:LinkButton>
                        </div>
                    </ItemTemplate>
                </zhongsoft:LightTemplateField>
                <%--<zhongsoft:LightBoundField DataField="WBSWay" HeaderText="任务作业<br />（系统）方式" HtmlEncode="false">
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField DataField="BelongModule" HeaderText="所属模块<br />（系统、区域）"
                    HtmlEncode="false">
                </zhongsoft:LightBoundField>--%>
                <%--<zhongsoft:LightBoundField DataField="WBSState" HeaderText="任务状态">
                </zhongsoft:LightBoundField>--%>
                <%--<zhongsoft:LightBoundField DataField="Memo" HeaderText="来源">
                </zhongsoft:LightBoundField>--%>
                <zhongsoft:LightBoundField DataField="PlanTerm" HeaderText="预计工天" Visible="false">
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField DataField="MasterDemandSchedule" HeaderText="业主要求时间" Visible="false"
                    DataFormatString="{0:yyyy-MM-dd}">
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField DataField="DelayDays" HeaderText="FCD+T" Visible="false">
                </zhongsoft:LightBoundField>
                <zhongsoft:LightTemplateField HeaderText="接收专业" Visible="True">
                    <ItemTemplate>
                        <div runat="server" id="divRecSpe" tip="1" style="width: 100px" class="autoskip">
                        </div>
                    </ItemTemplate>
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightBoundField DataField="PlanStartTime" HeaderText="计划开始" ItemStyle-Width="40px"
                    DataFormatString="{0:yyyy-MM-dd}">
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField DataField="PlanCompleteTime" HeaderText="计划完成" ItemStyle-Width="40px"
                    DataFormatString="{0:yyyy-MM-dd}">
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField DataField="FactCompleteTimeOfAdjusted" HeaderText="调整后计划完成时间"
                    ItemStyle-Width="40px" DataFormatString="{0:yyyy-MM-dd}" Visible="false">
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField DataField="Memo" HeaderText="备注（计划调整原因）" Visible="false">
                </zhongsoft:LightBoundField>
                <%--<zhongsoft:LightBoundField DataField="WorkDayOfTrade" HeaderText="行业定额" ItemStyle-HorizontalAlign="Right">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="WorkDayOfEnterprise" HeaderText="企业定额" ItemStyle-HorizontalAlign="Right">
                        </zhongsoft:LightBoundField>--%>
                <zhongsoft:LightTemplateField HeaderText="状态" ItemStyle-Width="40px">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbState"></asp:Label>
                    </ItemTemplate>
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightBoundField DataField="WBSOwnerName" HeaderText="负责人">
                </zhongsoft:LightBoundField>
                <asp:TemplateField HeaderText="查看" Visible="false" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false" ToolTip="查看" OnClientClick="return false">
                                    <img alt="查看" src="<%=this.WebAppPath %>/Themes/Images/btn_dg_view.gif"
                                    onclick="wbsItem('1','<%# Eval("WBSID") %>');" />
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </zhongsoft:LightPowerGridView>
    </td>
</tr>
<!-- 任务管理方式-->
<table id="divWBSType" style="display: none; width: 100%">
    <tr>
        <td>
            <a class="subtoolbarlink" id="newWbs" speid='<%=SpecialtyID%>' deptid='<%=DeptID%>'
                style="display: none;"><span>
                    <img runat="server" src="~/Themes/Images/btn_add.gif" alt="新建任务" width="16" height="16" />新建任务</span></a>
            <zhongsoft:LightPowerGridView runat="server" ID="gvWBSMode" AutoGenerateColumns="false"
                Width="100%" UseDefaultDataSource="true" OnRowDataBound="gvWBSMode_RowDataBound">
                <Columns>
                    <zhongsoft:LightBoundField DataField="ParamName">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="类别">
                        <ItemTemplate>
                            <asp:RadioButtonList runat="server" ID="rblWBStype" RepeatDirection="Horizontal">
                            </asp:RadioButtonList>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<div id="divDownLoad" style="display: none; text-align: center">
    <p>
        <a class="aStyle" href="<%=WebAppPath %>/EPMS/DownLoad/项目计划导入模板V1.0.xlsx" target="_blank"
            style="display: none">下载项目计划导入模板</a>
    </p>
    <p>
        <a class="aStyle" href="<%=WebAppPath %>/EPMS/DownLoad/设备导入模板V1.0.xlsx" target="_blank"
            style="display: none">下载设备模板</a>
    </p>
    <p>
        <a class="aStyle" href="<%=WebAppPath %>/EPMS/DownLoad/任务导入模板.xlsx" target="_blank">下载任务模板</a>
    </p>
    <p>
        <a class="aStyle" href="<%=WebAppPath %>/EPMS/DownLoad/互提资料导入模板.xlsx" target="_blank">下载互提资料模板</a>
    </p>
    <p>
        <a class="aStyle" href="<%=WebAppPath %>/EPMS/DownLoad/外部资料导入模板.xlsx" target="_blank">下载外部资料模板</a>
    </p>
</div>
<asp:Button runat="server" ID="btnBindWbs" OnClick="btnBindWbs_Click" Style="display: none" />
<input type="hidden" runat="server" id="hiSpeId" />
<input type="hidden" runat="server" id="hiDeptId" />
<input type="hidden" runat="server" id="hiSpeCode" />
<input type="hidden" runat="server" id="hiRollID" />
<input type="hidden" runat="server" id="hiWbsType" />
<input type="hidden" runat="server" id="hiParamWBSTypeID" />
<input runat="server" id="hiZHSpeCode" type="hidden" value="A" />
<input runat="server" id="hiZHSpeName" type="hidden" value="综合" />
<input type="hidden" runat="server" id="hiOrganizationID" />
<input type="hidden" runat="server" id="hiProjectTempID" />
<input type="hidden" runat="server" id="hiEnable" />
<input runat="server" id="hiSpeXml" type="hidden" />

<script type="text/javascript">
    $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
    function initWBSList() {
        //动态确定树所在行的高度
        $("#trWBS").height($('[id$=tvWBSTreen0Nodes]').height() + 30);
        //可用状态下，才进行事件赋值
        if (parseBool($("#<%=hiEnable.ClientID %>").val())) {
            $("#divOperate").show();
            //选择任务模板
            $('[flag="wbsTemp"]').each(function () {
                var speId = $(this).attr('speId');
                var deptId = $(this).attr('deptId');
                $(this).bind('click', function () {
                    wbsTemp(speId, deptId);
                });
            });

            //选择提出资料模板
            $('[flag="outFileTemp"]').each(function () {
                var speId = $(this).attr('speId');
                var deptId = $(this).attr('deptId');
                $(this).bind('click', function () {
                    outFileTemp(speId, deptId);
                });
            });

            //选择外部资料模板
            $('[flag="externalTemp"]').each(function () {
                var speId = $(this).attr('speId');
                var deptId = $(this).attr('deptId');
                $(this).bind('click', function () {
                    externalTemp(speId, deptId);
                });
            });

            //选择设备模板
            $('[flag="equipTemp"]').each(function () {
                var speId = $(this).attr('speId');
                $(this).bind('click', function () {
                    //                addWbs(speId);
                });
            });

            //新建WBS任务
            $('[flag="addWbs"]').each(function () {
                var speId = $(this).attr('speId');
                var deptId = $(this).attr('deptId');
                var speCode = $(this).attr('speCode');
                var rollId = $(this).attr('rollId');
                $(this).bind('click', function () {
                    //addWbs(speId, deptId);
                    $('#<%=hiSpeId.ClientID %>').val(speId);
                    $('#<%=hiDeptId.ClientID %>').val(deptId);
                    $('#<%=hiSpeCode.ClientID %>').val(speCode);
                    $('#<%=hiRollID.ClientID %>').val(rollId);
                    openWBSType(speId);
                });
            });

            //选择历史工程WBS任务
            $('[flag="selectWbs"]').each(function () {
                var speId = $(this).attr('speId');
                var deptId = $(this).attr('deptId');
                $(this).bind('click', function () {
                    selectWbs(speId, deptId);
                });
            });

            //新建册
            $('[flag="addRoll"]').each(function () {
                var speId = $(this).attr('speId');
                var deptId = $(this).attr('deptId');
                $(this).bind('click', function () {
                    addRoll(speId, deptId);
                });
            });

            //新建提出资料
            $('[flag="addOutFile"]').each(function () {
                var speId = $(this).attr('speId');
                var deptId = $(this).attr('deptId');
                $(this).bind('click', function () {
                    addOutFile(speId, deptId);
                });
            });

            //新建外部资料
            $('[flag="addExternal"]').each(function () {
                var speId = $(this).attr('speId');
                var deptId = $(this).attr('deptId');
                $(this).bind('click', function () {
                    addExternal(speId, deptId);
                });
            });

            //选择历史项目提出资料
            $('[flag="selectOutFile"]').each(function () {
                var speId = $(this).attr('speId');
                var deptId = $(this).attr('deptId');
                $(this).bind('click', function () {
                    selectOutFile(speId, deptId);
                });
            });

            //选择历史项目外部资料
            $('[flag="selectExternal"]').each(function () {
                var speId = $(this).attr('speId');
                var deptId = $(this).attr('deptId');
                $(this).bind('click', function () {
                    selectExternal(speId, deptId);
                });
            });
        }
        else {
            $("#divOperate").hide();
        }

        $('#aViewProjPlan').bind('click', function () {

            var json = { OrganizationID: '<%=OrganizationID %>', IsShowInExportWBS: false };
            var url = buildBizUrl('<%=(int)AccessLevel.Read %>', '<%=OrganizationID %>', "EPMS/List/Plan/ProjOverallPlan.aspx", json);

            showDivDialog(url, null, 900, 750, null);
            return false;
        });

        initWBSType();

        initDownLoad();

        //将之前的live的事件清掉，否则回发后会执行多次事件
        //直接选择任务类别单选按钮，弹出新建任务页面，减少操作次数 tianhl 20150826
        //$('#newWbs').die('click',newWbs).live('click',newWbs);
        $('[flag = "batch"]').hide();
        $('[flag = "roll"]').hide();
        if ($('#<%=hiWbsType.ClientID %>').val() == '<%=WBSType.册 %>') {
            //去掉合卷功能 modified by likun on 20160601
            //$('[flag = "roll"]').show();
        }
        else if ($('#<%=hiWbsType.ClientID %>').val() == '<%=WBSType.设备技术规范书 %>' || $('#<%=hiWbsType.ClientID %>').val() == '<%=WBSType.设备技术协议书 %>') {
            $('[flag = "batch"]').show();
        }
        // $('[flag = "import"]').hide();
        $('[flag="delete"]').hide();
        //设总或计划工程师可以下载、导入任务数据
        if (parseBool("<%=IsPlanEngineer %>") || parseBool("<%=IsProDirector %>")) {
            //$('[flag = "import"]').show();
            if ("<%=(int)ActionType %>" != "<%=(int)Zhongsoft.Portal.ACL.AccessLevel.Read %>") {
                $('[flag="delete"]').show();
            }
        }
        //小型项目策划、wbs任务分解流程中，主设人可以批量删除
        if (parseBool("<%=IsMainSet %>") && ('<%=CurrentActivityName %>' == '初始化WBS任务' ||'<%=CurrentActivityName %>' == '主设人WBS任务分解' ||'<%=CurrentActivityName %>' == '主任工审核WBS任务分解')) {
            $('[flag="delete"]').show();
        }

        //初始化卷册目录主任工审核WBS任务分解步骤主任工可以删除
        if (parseBool("<%=IsDirector %>") && ('<%=CurrentActivityName %>' == '主任工审核WBS任务分解' ||'<%=CurrentActivityName %>' == '专工审核WBS任务分解')) {
            $('[flag="delete"]').show();
        }

        //安排计划功能只有设总可以看到
        $('[flag="Arrange"]').hide();
        if ((parseBool("<%=IsDirector %>") || parseBool("<%=IsMainSet %>") || parseBool('<%=IsProDirector %>')) && parseBool('<%=Enable %>')) {
            $('[flag="Arrange"]').show();
        }
    }

    function newWbs() {
        if ($('#<%=gvWBSMode.ClientID %> input:radio:checked').length == 0) {
            alert('请先选择任务类别！');
            return false;
        }
        var rblVal = $('#<%=gvWBSMode.ClientID %> input:radio:checked').val();
        var vals = rblVal.split(',');

        var paramWbsTypeId = vals[0];
        var wbsMode = vals[1];
        var speId = $('#<%=hiSpeId.ClientID %>').val();
        var deptId = $('#<%=hiDeptId.ClientID %>').val();
        var speCode = $('#<%=hiSpeCode.ClientID %>').val();
        var rollId = $('#<%=hiRollID.ClientID %>').val();
        if (wbsMode == '综合管理' && speCode.toLowerCase() != 'a') {
            alert('只有选择综合专业，才可以选择综合管理下任务类别！');
            return false;
        }
        var json = { actionType: 2, OrganizationID: '<%=OrganizationID %>', ExecSpecialtyID: speId, DeptID: deptId, WBSSplitFormID: '<%=WBSSplitFormID %>' };
        json = $.extend(json, { ParamWBSTypeID: paramWbsTypeId, RollID: rollId });
        var url = buildQueryUrl('/EPMS/List/WBS/WBSEditor.aspx', json);
        showDivDialog(encodeURI(url), "", 650, 600, null);
        //清空之前选项
        $('#<%=gvWBSMode.ClientID %> input:radio:checked').attr('checked', false);
        return false;
    }

    function initWBSType() {
        var width = 350;
        var height = 170;

        //弹出查询框定位到查询按钮下方
        var pX; var pY;
        pX = $('#addWbs').offset().left - 200;
        pY = $('#addWbs').offset().top + $('#addWbs').outerHeight() + 1;

        $("#divWBSType :ui-dialog").dialog("destroy");
        $("#divWBSType").dialog({
            title: "选择任务类别",
            resizable: true,
            autoOpen: false,
            minHeight: height,
            minWidth: width,
            modal: true,
            //改变位置todo控件值改变，重新绑定
            position: [pX, pY],
            buttons: {
                //"新建任务": function () {
                //    newWbs();
                //},
                "关闭": function () {
                    $(this).dialog("close");
                    bindWbs();
                }
            }
        });

        //实现所有任务类别单选
        $('#<%=gvWBSMode.ClientID %> input:radio').each(function () {
            $(this).unbind();
        });
        $('#<%=gvWBSMode.ClientID %> input:radio').each(function () {
            //$(this).die('click',radioClick(this)).bind('click',radioClick(this));
            $(this).bind('click', function () {
                radioClick(this);
            });
        });
    }

    function initDownLoad() {
        var width = 150;
        var height = 200;
        $("#divDownLoad :ui-dialog").dialog("destroy");
        $("#divDownLoad").dialog({
            title: "下载模板",
            resizable: true,
            autoOpen: false,
            minHeight: height,
            minWidth: width,
            modal: true,
            buttons: {
                "关闭": function () {
                    $(this).dialog("close");
                }
            }
        });
    }

    function openWBSType(speId) {
        if (!checkSpe(speId)) {
            return false;
        }
        $("#divWBSType").dialog('open');
        $("#divWBSType").parent().appendTo("#<%=this.Page.Form.ClientID%>");

        return false;
    }
    //下载
    function openDownLoad() {
        if (parseBool('<%=Enable %>')) {
            $("#divDownLoad").dialog('open');
            $("#divDownLoad").parent().appendTo("#<%=this.Page.Form.ClientID%>");
            return false;
        }
    }

    //单选按钮实现
    function radioClick(obj) {
        $('#<%=gvWBSMode.ClientID %> input:radio:checked').attr('checked', false);
        $(obj).attr('checked', true);
        return newWbs();
    }

    //新建wbs任务
    function addWbs(speId, deptId) {
        if (!checkSpe(speId)) {
            return false;
        }
        var json = { actionType: 2, OrganizationID: '<%=OrganizationID %>', ExecSpecialtyID: speId, DeptID: deptId, WBSSplitFormID: '<%=WBSSplitFormID %>' };
        var url = buildQueryUrl('/EPMS/List/WBS/WBSEditor.aspx', json);
        showDivDialog(encodeURI(url), "", 1000, 600, bindWbs);
        return false;
    }

    //卷册档案袋
    function fileBagItem(wbsid, wbsState) {
        var actionType = 1;
        //卷册档案袋中卷册状态为“尚未确定”“尚未开展”“正在进行”，对应的值应该为0,1,2，卷册相关信息可以修改，如果不是这三个状态，卷册的信息不可修改
        if (wbsState == 0 || wbsState == 1 || wbsState == 2) {
            actionType = 3;
        }
        var url = buildQueryUrl("/Custom/List/Dashboard.aspx", {
            ListId: '494CE4A3-A401-4B85-A97D-3247C6D2F439',
            ViewId: '3B413684-1588-4B7D-A3F7-D9307C23CE7B', secid: "3B413684-1588-4B7D-A3F7-D9307C23CE7B", WBSID: wbsid, IsDashboard: 1, ShowToolbar: 0, IsShowHeader: 2, ActionType: actionType
        });
        window.open(url);
        return false;
    }

    //wbs任务详细
    function wbsItem(actionType, bizId, speId, deptId, paramWBSTypeID) {
        var json = { actionType: actionType, OrganizationID: '<%=OrganizationID %>', ExecSpecialtyID: speId, DeptID: deptId, bizId: bizId, WBSSplitFormID: '<%=WBSSplitFormID %>', ParamWBSTypeID: paramWBSTypeID };
        var url = buildQueryUrl('/EPMS/List/WBS/WBSEditor.aspx', json);
        var callBack = null;
        if (actionType == '3') {
            callBack = bindWbs;
        }
        showDivDialog(url, "", 1000, 600, callBack);
        return false;
    }

    //查看任务
    function viewItem(bizId, speId, deptId, paramWBSTypeID) {
        return wbsItem('1', bizId, speId, deptId, paramWBSTypeID);
    }

    //选择wbs任务模板
    function wbsTemp(speId, deptId) {
        if (!checkSpe(speId)) {
            return false;
        }
        var json = { OrganizationID: $('#<%=hiOrganizationID.ClientID %>').val(), ExecSpecialtyID: speId, DeptID: deptId, ProjectTemplateID: $('#<%=hiProjectTempID.ClientID %>').val(), WBSSplitFormID: '<%=WBSSplitFormID %>', WBSModeID: '<% =DAL.EPMS.WBSMode.任务管理.GetHashCode()%>', WbsType:'<%=WBSType.任务 %>', IsDelFileRele: 'true' };
        var url = buildQueryUrl('/EPMS/List/Sys/RelateWBSTemplate.aspx', json);
        showDivDialog(url, "", 1020, 600, bindWbs);
        return false;
    }

    //选择历史项目WBS任务
    function selectWbs(speId, deptId) {
        if (!checkSpe(speId)) {
            return false;
        }
        var json = { OrganizationID: $('#<%=hiOrganizationID.ClientID %>').val(), ExecSpecialtyID: speId, DeptID: deptId, WBSSplitFormID: '<%=WBSSplitFormID %>' };
        var url = buildQueryUrl('/EPMS/Obsolete/OldProjectWBSSelector.aspx', json);
        showDivDialog(url, "", 1000, 600, bindWbs);
        return false;
    }

    //新建资料
    function addFile(speId, deptId, paramWbsTypeId) {
        if (!checkSpe(speId)) {
            return false;
        }
        var rollId = $('#<%=hiRollID.ClientID %>').val();
        var json = { actionType: 2, OrganizationID: $('#<%=hiOrganizationID.ClientID %>').val(), ExecSpecialtyID: speId, DeptID: deptId, WBSSplitFormID: '<%=WBSSplitFormID %>' };
        json = $.extend(json, { ParamWBSTypeID: paramWbsTypeId, RollID: rollId });
        var url = buildQueryUrl('/EPMS/List/WBS/WBSEditor.aspx', json);
        showDivDialog(encodeURI(url), "", 650, 600, bindWbs);
        return false;
    }

    //新建任务
    function addRoll(speId, deptId) {
        //modified by biye 20210226 新建任务时，任务类型为任务（paramWbsTypeId=23）
        addFile(speId, deptId, 23)
    }

    //新建提出资料
    function addOutFile(speId, deptId) {
        addFile(speId, deptId, 14)
    }

    //新建外部资料
    function addExternal(speId, deptId) {
        addFile(speId, deptId, 18)
    }

    //选择资料模板
    function fileTemp(speId, deptId, fileType) {
        if (!checkSpe(speId)) {
            return false;
        }
        var json = { OrganizationID: $('#<%=hiOrganizationID.ClientID %>').val(), ExecSpecialtyID: speId, DeptID: deptId, ProjectTemplateID: $('#<%=hiProjectTempID.ClientID %>').val(), WbsType: encodeURI(fileType) };
        var url = buildQueryUrl('/EPMS/List/Sys/RelateWBSTemplate.aspx', json);
        showDivDialog(url, "", 1000, 600, bindWbs);
        return false;
    }

    //选择提出资料模板
    function outFileTemp(speId, deptId) {
        fileTemp(speId, deptId, '<%=WBSType.内部专业间提资 %>')
    }

    //选择外部资料模板
    function externalTemp(speId, deptId) {
        fileTemp(speId, deptId, '<%=WBSType.外部接口资料接收 %>')
    }

    //选择历史项目资料
    function selectFile(speId, deptId, fileType) {
        if (!checkSpe(speId)) {
            return false;
        }
        var json = { OrganizationID: $('#<%=hiOrganizationID.ClientID %>').val(), ExecSpecialtyID: speId, DeptID: deptId, FileType: fileType };
        var url = buildQueryUrl('/EPMS/Obsolete/OldProjectFileSelector.aspx', json);
        showDivDialog(url, "", 1000, 600, bindWbs);
        return false;
    }

    //选择历史项目提出资料
    function selectOutFile(speId, deptId) {
        selectFile(speId, deptId, 0)
    }

    //选择历史项目外部资料
    function selectExternal(speId, deptId) {
        selectFile(speId, deptId, 1)
    }

    //绑定WBS列表
    function bindWbs() {
        <%=Page.ClientScript.GetPostBackEventReference(this.btnBindWbs,"")%>;
    }

    //统一提示信息
    function checkSpe(speId) {
        if (speId == '' || speId == undefined) {
            alert('请先从左侧树形结构选择专业！');
            return false;
        }
        return checkLimit(speId);
        return true;
    }

    //操作权限控制，设总、专业主设人主任工才可以进行操作
    function checkLimit(speId) {
        if (parseBool("<%=IsProDirector %>") || parseBool("<%=IsPlanEngineer %>")) {
            return true;
        }
        else {
            var curStep = '<%=CurrentActivityName %>';
            if (parseBool("<%=IsMainSet %>") || parseBool("<%=IsDirector %>") || curStep == '专业WBS任务分解') {
                var curSpeId = '<%=CurSpeID %>';
                if (curSpeId.indexOf(speId) < 0) {
                    if (curStep == '专业WBS任务分解') {
                        alert('您不是该专业的主设人，请选择其他专业操作！');
                        return false;
                    }
                    else {
                        alert('您不是该专业的主设人或者专工，请选择其他专业操作！');
                        return false;
                    }
                }
                return true;
            }
            else {
                alert('您没有权限！');
                return false;
            }
        }
    }

    //升版任务
    function upgradeWbs(originalId, versionType, speId, deptId) {
        var json = { actionType: 2, OriginalID: originalId, WBSSplitFormID: '<%=WBSSplitFormID %>', VerType: versionType, OrganizationID: '<%=OrganizationID %>', ExecSpecialtyID: speId, DeptID: deptId };
        var url = buildQueryUrl('/EPMS/List/WBS/WBSEditor.aspx', json);
        var callBack = null;
        //        if (actionType == '3') {
        callBack = bindWbs;
        //        }
        showDivDialog(url, "", 1000, 600, callBack);
        return false;
    }

    function OpenWBSinfo() {
        var rollDs = $("#" + $gridCheckedClientID).val();
        if (rollDs.length < 3) {
            alert("请勾选任务信息");
            return false;
        }
        var wbsType = $('#<%=hiWbsType.ClientID %>').val();
        var hiSpeId = $('#<%=hiSpeId.ClientID %>').val();
        var hiParamWBSTypeID = $('#<%=hiParamWBSTypeID.ClientID %>').val();
        var json = { actionType: 2, OrganizationID: '<%=OrganizationID %>', ExecSpecialtyID: hiSpeId, DeptID: '<%=DeptID %>', WBSSplitFormID: '<%=WBSSplitFormID %>', WbsType: wbsType, Action: 'batch', ChildID: rollDs, ParamWBSTypeID: '24' };
        var url = buildQueryUrl('/EPMS/List/WBS/WBSEditor.aspx', json);
        showDivDialog(encodeURI(url), "", 1000, 600, bindWbs);
        return false;
    }

    function RollAlert() {
        var rollDs = $("#" + $gridCheckedClientID).val();
        if (rollDs.length < 3) {
            alert("请勾选任务信息");
            return false;
        }
        return true;
    }

    function inExport(wbsType) {
        if (parseBool('<%=Enable %>')) {
            var canImport = false;
            if (parseBool("<%=IsPlanEngineer %>") || parseBool("<%=IsProDirector %>")) {
                canImport = true;
            }
            var json = { OrganizationID: $('#<%=hiOrganizationID.ClientID %>').val(), CanImport: canImport, wbsType: wbsType }
            var url = buildQueryUrl("EPMS/List/WBS/WBSSplitImport.aspx", json);
            var url = buildQueryUrl(url);
            showDivDialog(url, null, 500, 300, bindWbs);
            return false;
        }
    }

    //安排计划
    function viewDeptProjPlan() {
        var state = "false";
        var speId = $('#<%=hiSpeId.ClientID %>').val();
        //当前人员为设总时,不进行专业判断
        //去掉设总必须选专业才能安排计划的验证
        //if (parseBool("<%=IsProDirector %>") && !checkSpe(speId)) {
        //return false;
        //}
        //默认使用IsUserInRoles方法,如果在第一步骤 判断是否项目设总
        var method = "IsUserInRolesSZ";
        var curStep = '<%=CurrentActivityName %>';
        $.ajax({
            type: 'POST',
            url: buildQueryUrl("<%=WebAppPath %>/EPMS/List/WBS/WBSSplitEditor.aspx", null),
            data: { asyfunc: method, orgId: '<%=OrganizationID %>', speId: speId, userId:'<%=KPMSUser.UserId %>' },
            async: false,
            dataType: "json",
            success: function (res) {
                state = res;
            },
            error: function (err) {
            }
        });
        if (state == "false" || state == false) {
            alert("您不是设总，请选择其他专业操作！");
            return false;
        }
        else {
            var json = { actionType: 3, OrganizationID: $('#<%=hiOrganizationID.ClientID %>').val(), speId: speId };
            var url = buildQueryUrl("EPMS/List/Plan/ProjectMonthPlanWBSEditor.aspx", json);
            showDivDialog(url, null, 1000, 600, bindWbs);
            return false;
        }
    }

    function viewWBSRecord() {
        var json = { OrganizationID: $('#<%=hiOrganizationID.ClientID %>').val() };
        var url = buildQueryUrl("EPMS/List/WBS/WBSEmergeRecordList.aspx", json);
        showDivDialog(url, null, 900, 550, null);
        return false;
    }

    //添加专业
    function addSpecialty4WBS() {
        <%--var projectTypeId = $('#<%=hiParamProjectTypeID.ClientID %>').val();--%>
        var param = new InputParamObject("m");
        var josn = { SelectForOrg: '1', ParentSpeID: '<%=CurSpeID%>' };
        getDivSpecialty("<%=hiSpeXml.ClientID %>", param, josn, afterAddSpecialty4WBS);
        return false;
    }

    function afterAddSpecialty4WBS(re) {
        <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.btnAddSpecialty, "")%>;
        return false;
    }
</script>
