<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PlanWBSOfRoll.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Plan.PlanWBSOfRoll" %>
<table class="tz-table" style="width: 100%">
    <tr>
        <td align="center" style="font-weight: bold">
            <asp:Label runat="server" ID="lbProjectInfo"></asp:Label>
        </td>
    </tr>
    <tr runat="server" id="trToolBar">
        <td>
            <div id="divCustomBar" style="float: left;" class="subtoolbarbg">
                <asp:LinkButton runat="server" ID="lbtnSelWBS" CssClass="subtoolbarlink" EnableTheming="false"
                    OnClientClick="return selWBS();" ToolTip="选择卷册成品">
                    <span>
                        <img runat="server" id="img5" src="~/Themes/Images/look-up.gif" alt="选择计划任务" width="16"
                            height="16" />选择卷册成品</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="lbtnSelFile" CssClass="subtoolbarlink" EnableTheming="false"
                    OnClientClick="return selFile();" ToolTip="选择设计接口资料">
                    <span>
                        <img runat="server" id="img4" src="~/Themes/Images/look-up.gif" alt="选择设计接口资料" width="16"
                            height="16" />选择设计接口资料</span>
                </asp:LinkButton>
            </div>
            <div id="div1" style="float: left;" class="subtoolbarbg">
                <asp:LinkButton runat="server" ID="lbtnBatchDel" CssClass="subtoolbarlink" EnableTheming="false"
                    OnClientClick="return checkBatchDel();" ToolTip="批量取消" OnClick="lbtnBatchDel_Click">
                    <span>
                        <img runat="server" id="img2" src="~/Themes/Images/btn_delete.gif" alt="选择计划任务" width="16"
                            height="16" />批量取消</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="lbtnBatchUpdate" CssClass="subtoolbarlink" OnClick="btnBatchUpdate_Click"
                    EnableTheming="false" ToolTip="批量更新时间" OnClientClick="return showUpdateInfo()">
                    <span>
                        <img runat="server" id="img1" src="~/Themes/Images/btn_editor.gif" alt="批量更新时间" width="16"
                            height="16" />批量更新时间</span>
                </asp:LinkButton>
                <%--<asp:LinkButton runat="server" ID="lbtnComputeComDate" CssClass="subtoolbarlink"
                    OnClick="btnUpdateCom_Click" EnableTheming="false" ToolTip="计算完成时间" OnClientClick="return updateDate('PlanCompleteTime')">
                    <span>
                        <img runat="server" id="imgStart" src="~/Themes/Images/btn_editor.gif" alt="计算完成时间"
                            width="16" height="16" />计算完成时间</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="lbtnComputeStartDate" CssClass="subtoolbarlink"
                    EnableTheming="false" ToolTip="倒推开始时间" OnClientClick="return updateDate('PlanStartTime')">
                    <span>
                        <img runat="server" id="img6" src="~/Themes/Images/btn_editor.gif" alt="倒推开始时间" width="16"
                            height="16" />倒推开始时间</span>
                </asp:LinkButton>--%>
                <asp:LinkButton runat="server" ID="lbtnRoomDirectorIdea" CssClass="subtoolbarlink"
                    OnClick="btnBatchUpdateIdea_Click" EnableTheming="false" ToolTip="主任工意见" OnClientClick="return showSetInfo('divBatchUpdate')">
                    <span runat="server" id="spanRoomDirectorIdea">
                        <img runat="server" id="imgRoomDirectorIdea" src="~/Themes/Images/btn_editor.gif"
                            alt="主任工意见" width="16" height="16" />批量添加主任工意见</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="lbtnOK" CssClass="subtoolbarlink" EnableTheming="false"
                    flag="lbtnOK" ToolTip="保存" OnClick="lbtnOK_Click" Style="display: none">
                    <span>
                        <img runat="server" id="imgOk" src="~/Themes/Images/btn_finish.gif" alt="保存" width="16"
                            height="16" />保存</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="lbtnArrangeUsers" CssClass="subtoolbarlink" EnableTheming="false"
                    ToolTip="安排人员" OnClientClick="return arrangeUsers()" OnClick="lbtnArrangeUsers_Click">
                    <span runat="server" id="spanArrange">
                        <img runat="server" id="imgArrange" src="~/Themes/Images/btn_editor.gif" alt="安排人员"
                            width="16" height="16" />批量安排人员</span>
                </asp:LinkButton>
            </div>
            <div id="div2" style="float: left;" class="subtoolbarbg">
                <asp:LinkButton runat="server" ID="lkbShowAllRoll" CssClass="subtoolbarlink" EnableTheming="false"
                    OnClick="lkbShowAllRoll_Click">
                    <span>显示所有计划卷册</span>
                </asp:LinkButton>
            </div>
            <div id="div3" style="float: left;" class="subtoolbarbg">
                <asp:LinkButton runat="server" ID="lbtnInport" CssClass="subtoolbarlink" EnableTheming="false"
                    flag="inExport" OnClick="lbtnRefreshRoll_Click">
                    <span>
                        <img runat="server" id="img3" src="~/Themes/Images/ico_excel.gif" alt="导入" width="16"
                            height="16" />从Excel导入</span>
                </asp:LinkButton>
                <a class="subtoolbarlink" href="<%=this.WebAppPath %>/Sys/Download/EPMS/WBS导出模板.xlsx"
                    style="display: none"><span>
                        <img runat="server" id="imgSelect" src="~/Themes/Images/ico_excel.gif" alt="导出模板"
                            width="16" height="16" />导出Excel模板</span></a>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvRollList" AllowPaging="true"
                PageSize="10" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                OnExport="gvRollList_Export" UseDefaultDataSource="true" OnRowCommand="gvRollList_RowCommand"
                OnBeforeExporting="gvRollList_BeforeExporting" OnRowDataBound="gvRollList_RowDataBound"
                AllowFrozing="true" BindGridViewMethod="UserControl.BindInfo">
                <Columns>
                    <zhongsoft:LightCheckField HeaderText="全选" ItemStyle-Width="40px">
                    </zhongsoft:LightCheckField>
                    <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="项目编号">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbProjectCode" Text='<%#Eval("ProjectCode")%>' ToolTip='<%#Eval("ProjectName")%>'></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="WBSType" HeaderText="任务类型" Visible="false">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="编号">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="名称">
                        <ItemTemplate>
                            <a class="aStyle" onclick="viewWBSDetail(this)" wbsid='<%# IsEntityData?Eval("WBSID"):Eval("WBSInfoID") %>'>
                                <span>
                                    <%#Eval("WBSName") %></span> </a>
                            <input type="hidden" runat="server" id="hiParamWBSTypeID" value='<%#Eval("ParamWBSTypeID") %>' />
                            <input type="hidden" runat="server" id="hiWBSState" value='<%#Eval("WBSState") %>' />
                            <%--                            <input type="hidden" runat="server" id="hiPlanWBSID" value='<%#Eval("PlanWBSID") %>' />--%>
                            <input type="hidden" runat="server" id="hiWBSID" value='<%#IsEntityData?Eval("WBSID"):Eval("WBSINFOID") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="ParentName" HeaderText="卷/批" Visible="false">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="专业">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbSpecialtyName" Text='<%#!IsEntityData ?  Eval("BelongSpecialtyName") : Eval("ExecSpecialtyName") %>'></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="计划设计<br/>开始时间">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtPlanStartTime" runat="server"
                                wbsID='<%# IsEntityData?Eval("WBSID"):Eval("PlanWBSID") %>' content="PlanStartTime"
                                style="width: 70px" colIndex="0" checkDate="true" flag="copyValue" readonly="readonly"
                                Value='<%# (Eval("PlanStartTime")==null||string.IsNullOrEmpty(Eval("PlanStartTime").ToString())) ? Eval("PlanStartTime") : Convert.ToDateTime(Eval("PlanStartTime")).ToString("yyyy-MM-dd") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <%-- <zhongsoft:LightBoundField DataField="DelayDays" HeaderText="FCD+T" ItemStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="PlanTerm" HeaderText="预计工期" ItemStyle-HorizontalAlign="Right">
                    </zhongsoft:LightBoundField>--%>
                    <%-- <zhongsoft:LightBoundField DataField="FactCompleteTimeOfAdjusted" HeaderText="调整后<br/>完成时间"
                        HtmlEncode="false" DataFormatString="{0:yyyy-MM-dd}">
                    </zhongsoft:LightBoundField>--%>
                    <zhongsoft:LightTemplateField HeaderText="计划个人<br/>出手时间" ItemStyle-Width="70px">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtPlanHandTime" runat="server"
                                wbsID='<%# IsEntityData?Eval("WBSID"):Eval("PlanWBSID") %>' content="PlanHandTime"
                                colIndex="1" Value='<%#(Eval("PlanHandTime")==null||string.IsNullOrEmpty(Eval("PlanHandTime").ToString())) ? Eval("PlanHandTime") : Convert.ToDateTime(Eval("PlanHandTime")).ToString("yyyy-MM-dd")  %>'
                                style="width: 70px" checkDate="true" flag="copyValue" readonly="readonly" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="计划校核<br/>完成时间" ItemStyle-Width="70px" Visible="false">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtPlanCheckTime" runat="server"
                                wbsID='<%# IsEntityData?Eval("WBSID"):Eval("PlanWBSID") %>' content="PlanCheckTime"
                                Value='<%#(Eval("PlanCheckTime")==null||string.IsNullOrEmpty(Eval("PlanCheckTime").ToString())) ? Eval("PlanCheckTime") : Convert.ToDateTime(Eval("PlanCheckTime")).ToString("yyyy-MM-dd")  %>'
                                style="width: 70px" flag="copyValue" readonly="readonly" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="计划室<br/>交出时间" ItemStyle-Width="70px">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtPlanRecheckTime1" content="PlanRecheckTime1"
                                runat="server" wbsID='<%# IsEntityData?Eval("WBSID"):Eval("PlanWBSID") %>' flag="copyValue"
                                checkDate="true" isoutRoom="true" Value='<%#(Eval("PlanRecheckTime1")==null||string.IsNullOrEmpty(Eval("PlanRecheckTime1").ToString())) ? Eval("PlanRecheckTime1") : Convert.ToDateTime(Eval("PlanRecheckTime1")).ToString("yyyy-MM-dd") %>'
                                style="width: 70px" colIndex="2" readonly="readonly" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="计划院<br/>交出时间" ItemStyle-Width="70px">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtPlanCompleteTime" runat="server"
                                wbsID='<%# IsEntityData?Eval("WBSID"):Eval("PlanWBSID") %>' content="PlanCompleteTime"
                                colIndex="3" style="width: 70px" checkDate="true" flag="copyValue" readonly="readonly"
                                Value='<%# (Eval("PlanCompleteTime")==null||string.IsNullOrEmpty(Eval("PlanCompleteTime").ToString())) ? Eval("PlanCompleteTime") : Convert.ToDateTime(Eval("PlanCompleteTime")).ToString("yyyy-MM-dd") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="业主要求进度" ItemStyle-Width="70px">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtMasterDemandSchedule"
                                runat="server" wbsID='<%# IsEntityData?Eval("WBSID"):Eval("PlanWBSID") %>' content="MasterDemandSchedule"
                                Value='<%#(Eval("MasterDemandSchedule")==null||string.IsNullOrEmpty(Eval("MasterDemandSchedule").ToString())) ? Eval("MasterDemandSchedule") : Convert.ToDateTime(Eval("MasterDemandSchedule")).ToString("yyyy-MM-dd") %>'
                                colIndex="4" style="width: 70px" checkDate="true" flag="copyValue" readonly="readonly" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <%-- <zhongsoft:LightBoundField DataField="MasterDemandSchedule" HeaderText="业主要求进度" DataFormatString="{0:yyyy-MM-dd}">
                    </zhongsoft:LightBoundField>--%>
                    <zhongsoft:LightBoundField DataField="WBSOwnerName" HeaderText="负责人">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="安排人员" ItemStyle-Width="70px" ItemStyle-HorizontalAlign="Center"
                        Visible="false">
                        <ItemTemplate>
                            <asp:LinkButton ID="lkArrangeUser" runat="server" OnClientClick='<%# String.Format("return arrangeSingleUser(\"{0}\")", IsEntityData?Eval("WBSID"):Eval("PlanWBSID")) %>'
                                EnableTheming="false">
                                <img runat="server" id="imgArrange" src="~/Themes/Images/btn_editor.gif" alt="安排人员"
                                    width="16" height="16" />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="负责人" ItemStyle-Width="70px" Visible="false">
                        <ItemTemplate>
                            <zhongsoft:LightObjectSelector runat="server" ID="txtWBSOwnerName" SourceMode="SelectorPage"
                                IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                                EnableTheming="false" ShowAttrs="name,UserCode" SelectPageMode="Dialog" Value='<%#Eval("WBSOwnerName") %>'
                                Style="width: 100px !important" FilterFunction="filterFuc();" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
                                ResultForControls="{'hiWBSOwnerID':'id'}" OnClick="txtWBSOwnerName_Click"></zhongsoft:LightObjectSelector>
                            <input type="hidden" runat="server" id="hiWBSOwnerID" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <%--  <zhongsoft:LightTemplateField HeaderText="校核人" HeaderStyle-Width="140px">
                        <ItemTemplate>
                            <asp:Label ID="lbChecker" runat="server">
                            <span wbsid='<%# IsEntityData?Eval("WBSID"):Eval("WBSINFOID") %>' >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>--%>
                    <zhongsoft:LightTemplateField HeaderText="主任工意见">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbRoomDirectorIdea"></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="FactStartTime" HeaderText="实际<br/>开始时间" DataFormatString="{0:yyyy-MM-dd}"
                        HtmlEncode="false">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="FactCompleteTime" HeaderText="实际<br/>完成时间"
                        HtmlEncode="false" DataFormatString="{0:yyyy-MM-dd}">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="FactHandTime" HeaderText="实际个人<br/>出手时间" DataFormatString="{0:yyyy-MM-dd}"
                        HtmlEncode="false">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="FactRecheckTime1" HeaderText="实际室<br/>交出时间"
                        HtmlEncode="false" DataFormatString="{0:yyyy-MM-dd}">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="卷册状态">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbWBSState"></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="是否出版">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbIsPublish" content="isPublish"></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="项目名称" Visible="false">
                        <ItemTemplate>
                            <%#Eval("ProjectName")%>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="定额工天" Visible="false">
                        <ItemTemplate>
                            <%#Eval("WorkDayOfDesign")%>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="Memo" HeaderText="备注" ItemStyle-Width="120px"
                        ShowToolTip="true">
                    </zhongsoft:LightBoundField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<div id="divBatchUpdate" style="display: none" title="主任工意见">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">主任工意见
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbRoomDirectorIdea" TextMode="MultiLine"
                    CssClass="kpms-textarea" EnableTheming="false" MaxLength="512"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
</div>
<input type="hidden" runat="server" id="hiWBSXml" />
<!---计划年--->
<input type="hidden" runat="server" id="hiPlanYear" />
<input type="hidden" runat="server" id="hiPlanPeriod" />
<!----当计划时间改变时，构建xml，只保存改变的计划时间信息---->
<input type="hidden" runat="server" id="hiPlanWBSXml" />
<!-----任务类型---->
<input type="hidden" runat="server" id="hiWBSTypeShowInfo" />
<asp:LinkButton runat="server" ID="lbtnRefreshRoll" OnClick="lbtnRefreshRoll_Click"
    Style="display: none"></asp:LinkButton>
<!---任务列表中，“名称”列的索引--->
<input type="hidden" runat="server" id="hiEnabledCodeIndex" value="4" />
<!---用于向批量更新时间页面传递，时间页面根据项目ID，显示项目计划开始时间---->
<input type="hidden" runat="server" id="hiOrganizationID" />
<!----批量更新时间或安排人员页面返回的信息----->
<input type="hidden" runat="server" id="hiUpdateTimeXml" />
<!---更新类型   计算计划完成时间时为"PlanCompleteTime"，倒推计划开始时间时为"PlanStartTime"--->
<input type="hidden" runat="server" id="hiUpdateType" />
<asp:LinkButton runat="server" ID="lbtnArrangeSingle" OnClick="lbtnArrangeSingleUser_Click"
    Style="display: none"></asp:LinkButton>
<input type="hidden" runat="server" id="hiPlanWBSId" />
<script type="text/javascript">
    $gridCheckedClientIDRoll = "<%=this.gvRollList.CheckedClientID %>";
    //导入WBS任务计划信息， 在调用此用户控件的控件中需要调用此方法
    function inExportEvent() {
        $('[flag="inExport"]').each(function () {
            $(this).bind('click', function () {
                return inExport();
            });
        });
        //批量更新执行保存事件
        $('[flag="lbtnOK"]').each(function () {
            $(this).bind('click', function () {
                return savePlanWBS();
            });
        });
    }

    //更新
    function batchRefreshInfo(re) {
        $("#<%=hiUpdateTimeXml.ClientID %>").val(re);
        <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.lbtnBatchUpdate, "")%>;
    }

    //更新
    function refreshRollInfo() {
         <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.lbtnRefreshRoll, "")%>;
    }

    function selWBS() {
        selWBSInfo();
        return false;
    }

    function selFile() {
        selFileInfo();
        return false;
    }
    //批量删除
    function checkBatchDel() {
        var updateNum = getCheckNum();
        if (updateNum < 1) {
            alert("请勾选任务信息");
            return false;
        }
        else {
            if (confirm("您确认要取消吗？")) {
                 <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.lbtnBatchDel, "")%>;
            }
        }
        return false;
    }

    //导入计划WBS事件
    function inExport() {
        var planYear = $("#<%=hiPlanYear.ClientID %>").val();
        var planPeriod = $("#<%=hiPlanPeriod.ClientID %>").val();
        var planCycle = escape("<%=PlanCycle %>");
        var json = { PlanYear: planYear, PlanCycle: planCycle, PlanPeriod: planPeriod };
        var url = buildQueryUrl(encodeURI("EPMS/List/Plan/PlanWBSImport.aspx"), json);
        showDivDialog(url, null, 300, 300, refreshRollInfo);
        return false;
    }

    function savePlanWBS() {
        if (typeof (saveChildData) == "function") {
            saveChildData();
        }
        <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.lbtnOK, "")%>;
        return false;
    }

    //保存更改的计划时间Xml,后台保存时只保存有更改的计划时间
    function saveChangeWBSInfo(obj) {
        var wbsID = $(obj).attr("wbsID");
        var attrName = $(obj).attr("content");
        if (!rollXmlDoc.isExistById(wbsID, "planWBS")) {
            var root = rollXmlDoc.selectSingleNode("root");
            var planWBS = rollXmlDoc.createElement("planWBS");
            var att = rollXmlDoc.createAttribute("id");
            att.value = wbsID;
            planWBS.setAttributeNode(att);
            var att = rollXmlDoc.createAttribute(attrName);
            att.value = $(obj).val();
            planWBS.setAttributeNode(att);
            root.appendChild(planWBS);
        } else {
            var changePlanWBS = rollXmlDoc.getElementById(wbsID, "planWBS");
            var item = changePlanWBS.attributes.getNamedItem(attrName);
            if (item == null) {
                var att = rollXmlDoc.createAttribute(attrName);
                att.value = $(obj).val();
                changePlanWBS.setAttributeNode(att);
            }
            else {
                item.value = $(obj).val();
            }
        }
        $("#<%=this.hiPlanWBSXml.ClientID %>").val(rollXmlDoc.xml());
    }

    //验证所输入的时间是否合法 
    var errcount = 0;
    var wincount = 0;

    //日期控件改变后的控制
    function dateChangeControl(obj, isControl) {
        isControl = parseBool(isControl);
        errcount = 0;
        wincount = 0;
        var wbsID = $(obj).attr("wbsID");
        var attrName = $(obj).attr("content");
        var rowIndex = $(obj).attr("index");
        var dateValue = $(obj).val();
        if (isControl) {
            if (!checkDateIsRight(obj, false)) {
                saveChangeWBSInfo(obj);
                return;
            }
        }
        saveChangeWBSInfo(obj);
    }

    var $dateFieldName = new Array(5);
    $dateFieldName[0] = "计划设计开始时间";
    $dateFieldName[1] = "计划个人出手时间";
    $dateFieldName[2] = "计划室交出时间";
    $dateFieldName[3] = "计划院交出时间";
    $dateFieldName[4] = "业主要求进度";
    //判断修改的计划时间是否正确
    function checkDateIsRight(obj, isAll) {
        var begin = "<%=CycleStartTime %>";
        var dateValue = $(obj).val();
        var re = /-/g;
        if (begin != "") {
            if (new Date(dateValue.replace(re, '/')) < new Date(begin.replace(re, '/'))) {
                $(obj).val("");
                return false;
            }
        }

        //控制时间必须大于左侧时间，小于右侧时间
        var colIndex = $(obj).attr("colIndex");
        var minIndex = 0;
        var maxIndex = 4;
        var $dateArray = $(obj).parent("td").parent("tr").find("[checkDate]");
        var rightDate = "";
        var rightIndex = -1;
        var leftIndex = -1;
        var leftDate = "";
        //是否是计划室交出时间与计划院交出时间的比较
        var isSpecial = false;
        //业主要求进度不用和右侧的时间比较
        if (colIndex < 4) {
            //查找右侧的时间信息
            for (m = parseInt(colIndex) + 1; m <= 4; m++) {
                if ($($dateArray[m]).val() != "") {
                    rightDate = $($dateArray[m]).val();
                    rightIndex = m;
                    break;
                }
            }
        }
        //计划开始时间不用和左侧的时间比较
        if (colIndex > 0) {
            //查找左侧的时间信息
            for (i = parseInt(colIndex) - 1; i >= 0; i--) {
                if ($($dateArray[i]).val() != "") {
                    leftDate = $($dateArray[i]).val();
                    leftIndex = i;
                    break;
                }
            }
        }

        if ((parseInt(colIndex) == 3 && parseInt(leftIndex) == 2) || parseInt(colIndex) == 2 && parseInt(rightIndex) == 3) {
            isSpecial = true;
        }
        //室交出时间与院交出时间的特殊需求
        if (isSpecial) {
            if (parseInt(colIndex) == 3 && parseInt(leftIndex) == 2) {
                if (!compareRommAndCompleteDate(leftDate, dateValue, isAll)) {
                    $(obj).val("");
                    $(obj).parent('td').css("background-color", "#FFCF63");
                    return false;
                }
            }
            else {
                if (!compareRommAndCompleteDate(dateValue, rightDate, isAll)) {
                    $(obj).val("");
                    $(obj).parent('td').css("background-color", "#FFCF63");
                    return false;
                }
                //判断是否小于左侧的时间
                if (!compareDate(leftDate, dateValue)) {
                    if (isAll) {
                        errcount++;
                    }
                    else {
                        var message = "(" + $dateFieldName[colIndex] + ")不能<(" + $dateFieldName[leftIndex] + ")";
                        alert(message);
                    }
                    $(obj).val("");
                    $(obj).parent('td').css("background-color", "#FFCF63");
                    return false;
                }
            }
        }
        else {
            //小于左侧的时间或大于右侧的时间
            if (!compareDate(leftDate, dateValue) || !compareDate(dateValue, rightDate)) {
                if (isAll) {
                    errcount++;
                }
                else {
                    if (rightIndex != -1 && leftIndex != -1) {
                        var message = "(" + $dateFieldName[colIndex] + ")不能>(" + $dateFieldName[rightIndex] + ")且不能<(" + $dateFieldName[leftIndex] + ")";
                        alert(message);
                    }
                    else if (rightIndex != -1 && leftIndex == -1) {
                        var message = "(" + $dateFieldName[colIndex] + ")不能>(" + $dateFieldName[rightIndex] + ")";
                        alert(message);
                    }
                    else if (rightIndex == -1 && leftIndex != -1) {
                        var message = "(" + $dateFieldName[colIndex] + ")不能<(" + $dateFieldName[leftIndex] + ")";
                        alert(message);
                    }
                }
                $(obj).val("");
                $(obj).parent('td').css("background-color", "#FFCF63");
                return false;
            }
        }
        $(obj).parent('td').removeAttr("style");
        return true;
    }

    //获取时间差（返回相差的天数信息）
    function getChaDays(outRoom, complete) {
        var outRoomDate = new Date(outRoom.replace(/-/g, "/"));
        var completeDate = new Date(complete.replace(/-/g, "/"));
        //室交出时间最好早于院交出时间至少三天
        var date3 = completeDate.getTime() - outRoomDate.getTime();  //时间差的毫秒数
        //计算出相差天数
        var days = Math.floor(date3 / (24 * 3600 * 1000));
        return days;
    }

    //比较室交出时间和院交出时间
    function compareRommAndCompleteDate(outRoom, complete, isAll) {
        //室交出时间最好早于院交出时间至少三天

        var days = getChaDays(outRoom, complete);
        if (days < 3) {
            if (isAll) {
                wincount++;
            }
            else {
                var message = "(" + $dateFieldName[2] + ")最好<(" + $dateFieldName[3] + ")3天";
                alert(message);
            }
            //判断室交出时间是否>=院交出时间
            if (!compareDate(outRoom, complete)) {
                if (isAll) {
                    errcount++;
                }
                else {
                    var message = "(" + $dateFieldName[3] + ")必须大于(" + $dateFieldName[2] + ")";
                    alert(message);
                }
                return false;
            }
        }
        return true;
    }

    //查看WBS任务详细信息
    function viewWBSDetail(obj) {
        var bizId = $(obj).attr("wbsid");
        var json = { actionType: 1, bizId: bizId };
        var url = buildQueryUrl('/EPMS/List/WBS/WBSEditor.aspx', json);
        showDivDialog(url, "", 1050, 600, null);
        return false;
    }

    function showUpdateInfo() {
        var updateNum = getCheckNum();
        if (updateNum < 1) {
            alert("请勾选任务信息");
            return false;
        }
        var xml = $("#<%=hiUpdateTimeXml.ClientID %>").val();
        var organizationID = $("#<%=hiOrganizationID.ClientID %>").val();
        var wbsTypeShowInfo = $("#<%=hiWBSTypeShowInfo.ClientID %>").val();
        var json = { OrganizationID: organizationID, WBSTypeShowInfo: wbsTypeShowInfo, UpdateWBSNum: updateNum };
        if (typeof (getUpdateTimeJson) == "function") {
            json = getUpdateTimeJson(json);
        }
        var url = buildQueryUrl("EPMS/List/Plan/BatchUpdatePlanTime.aspx", json);
        if (wbsTypeShowInfo == "file")
            showDivDialog(encodeURI(url), xml, 350, 300, batchRefreshInfo);
        else
            showDivDialog(encodeURI(url), xml, 550, 500, batchRefreshInfo);
        return false;
    }
    //获取选中的任务数量
    function getCheckNum() {
        var checkedValue = $("#" + $gridCheckedClientIDRoll).val().length;
        var updateNum = 0;
        if (checkedValue > 1) {
            checkedValue = $("#" + $gridCheckedClientIDRoll).val().substring(1, checkedValue - 1);
            if (checkedValue != "")
                updateNum = checkedValue.split(",").length;
        }
        return updateNum;
    }

    //安排人员
    function arrangeUsers() {
        var updateNum = getCheckNum();
        if (updateNum < 1) {
            alert("请勾选任务信息");
            return false;
        }
        var xml = $("#<%=hiUpdateTimeXml.ClientID %>").val();
        var url = buildQueryUrl("EPMS/List/WBS/RollPartakerEditor.aspx", null);
        showDivDialog(encodeURI(url), xml, 350, 250, batchArrangeInfo);
        return false;
    }

    //单个安排人员
    function arrangeSingleUser(planWBSId) {
        $("#<%=hiPlanWBSId.ClientID %>").val(planWBSId);
        var xml = $("#<%=hiUpdateTimeXml.ClientID %>").val();
        var url = buildQueryUrl("EPMS/List/WBS/RollPartakerEditor.aspx", null);
        showDivDialog(encodeURI(url), xml, 350, 250, batchArrangeSingleInfo);
        return false;
    }

    //更新
    function batchArrangeInfo(re) {
        $("#<%=hiUpdateTimeXml.ClientID %>").val(re);
        <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.lbtnArrangeUsers, "")%>;
        return false;
    }

    //单个更新
    function batchArrangeSingleInfo(re) {
        $("#<%=hiUpdateTimeXml.ClientID %>").val(re);
        <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.lbtnArrangeSingle, "")%>;
        return false;
    }

    function getWBSChecker() {
        var $ids = "";
        $("#<%=gvRollList.ClientID %> span[wbsid]").each(function () {
            $ids += $(this).attr("wbsid") + "|";
        });
        $.post("<%=WebAppPath %>" + "/EPMS/List/WBS/C_RollList.aspx",
            { asyfunc: "GetWBSChecker", wbsIdList: $ids },
            function (res) {
                var $l;
                if (res == "") {

                } else {
                    $l = eval('(' + res + ')');
                }
                $("#<%=gvRollList.ClientID %> span[wbsid]").each(function () {
                    var $wbsid = $(this).attr("wbsid");
                    for (var i = 0; i < $l.length; i++) {
                        var $id = $l[i][0];
                        var $name = $l[i][1];
                        if ($wbsid == $id) {
                            if ($name == "")
                                $(this).html("");
                            else {
                                $(this).html($name);
                            }
                        }
                    }
                });
            }
        );
    }

    //部门id传参
    function filterFuc() {
        var orgId = '<%=KPMSUser.OrganizationId %>';

        return "{DeptID:'" + orgId + "'}";
    }

    //region 主任工意见

    //弹出对应层
    function showSetInfo(div) {
        if (getCheckNum() < 1) {
            alert("请勾选任务信息");
            return false;
        }
        $("#" + div).dialog('open');
        $("#" + div).parent().appendTo("#<%=this.Page.Form.ClientID%>");
        return false;
    }

    //加载div默认事件
    function initDetailEvent() {
        $("#divBatchUpdate :ui-dialog").dialog("destroy");
        $("#divBatchUpdate").dialog({
            title: "批量更新主任工意见",
            resizable: false,
            autoOpen: false,
            minHeight: 250,
            minWidth: 200,
            modal: true,
            buttons: {
                "确定": function () {
                    refreshRoomInfo();
                    $(this).dialog("close");
                },
                "取消": function () {
                    $(this).dialog("close");
                }
            }
        });
    }

    //更新
    function refreshRoomInfo() {
         <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.lbtnRoomDirectorIdea, "")%>;
        return false;
    }

 //#endregion


 //#region 河北院不使用功能

//    //更新计划完成时间
//    function updateDate(updateType) {
//        if (getCheckNum() < 1) {
//            alert("请勾选任务信息");
//            return false;
//        }
//        $("#<%=hiUpdateType.ClientID %>").val(updateType);
//        computeTimeInfo();
//        return false;
//    }

//    //计算完成时间，计算开始时间
//    function computeTimeInfo() {
//        return false;
//    }
 //#endregion

</script>
