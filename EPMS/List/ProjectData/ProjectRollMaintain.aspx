<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectRollMaintain.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.ProjectData.ProjectRollMaintain"
    MasterPageFile="~/UI/Master/ObjectList.Master" Title="进度变更与维护" %>

<%@ Import Namespace="DAL.EPMS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block">
        <span class="filter-block-lb">卷册编号/名称</span>
        <span>
            <asp:TextBox ID="tbKey" MaxLength="20" runat="server" CssClass="kpms-textboxsearch"
                EnableTheming="false"></asp:TextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">卷册负责人</span>
        <span>
            <asp:TextBox ID="tbWbsOwner" MaxLength="20" runat="server" CssClass="kpms-textboxsearch"
                EnableTheming="false"></asp:TextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">任务类型</span>
        <span>
            <zhongsoft:LightDropDownList ID="ddlWBSType" runat="server" class="kpms-ddlsearch" EnableTheming="false">
            </zhongsoft:LightDropDownList>
        </span>
    </span>
    <br />
    <span class="filter-block">
        <span class="filter-block-lb">计划完成</span>
        <span>
            <asp:RadioButtonList ID="rblPlanRadio" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Value="0">仅1周</asp:ListItem>
                <asp:ListItem Value="1">本月</asp:ListItem>
                <asp:ListItem Value="2">仅三个月</asp:ListItem>
                <asp:ListItem Value="3">起始时间</asp:ListItem>
            </asp:RadioButtonList>
        </span>
    </span>
    <span class="filter-block" flag="TimeRange" style="display: none">
        <span>
            <zhongsoft:XHtmlInputText ID="txtPlanStartTimeS" runat="server"
                class="kpms-textbox-comparedate" compare="1" readonly="readonly">
            </zhongsoft:XHtmlInputText>
            至
                    <zhongsoft:XHtmlInputText ID="txtPlanStartTimeE" runat="server"
                        class="kpms-textbox-comparedate" compare="1" readonly="readonly">
                    </zhongsoft:XHtmlInputText>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">实际完成</span>
        <span>
            <zhongsoft:XHtmlInputText ID="txtFactCompleteTimeS" runat="server"
                class="kpms-textbox-comparedate" compare="2" readonly="readonly">
            </zhongsoft:XHtmlInputText>
            至
                    <zhongsoft:XHtmlInputText ID="txtFactCompleteTimeE" runat="server"
                        class="kpms-textbox-comparedate" compare="2" readonly="readonly">
                    </zhongsoft:XHtmlInputText>
        </span>
    </span>
    <br />
    <span class="filter-block" flag="IsAdd" runat="server" id="spNewWBS">
        <span>
            <a style="color: blue" flag="addWbs" id="addWbs">
                <h4>新建卷册</h4>
            </a>
        </span>
    </span>
    <span class="filter-block" flag="IsModify" id="spSpecMemo" runat="server">
        <span>
            <asp:LinkButton runat="server" ID="lbtnEditSpeMemo" ToolTip="专业在这里勾选卷册提出修改计划时间及原因" EnableTheming="false" OnClick="lbtnEditSpeMemo_Click"
                flag="import" OnClientClick="return showMemoInfo('speInfo')" Style="color: blue"><span><h4>进度变更申请</h4></span></asp:LinkButton>
        </span>
    </span>
    <span class="filter-block" flag="IsOnlyView" id="spAllDelete" runat="server">
        <span>
            <asp:LinkButton ID="lbtnAllDelete" runat="server" OnClientClick="if(!confirm('您确定删除吗？')) return false;" EnableTheming="false"
                Style="color: blue" OnClick="btnAllDelete_Click"><span><h4>批量删除</h4></span></asp:LinkButton>
        </span>
    </span>
    <span class="filter-block" flag="IsModifyForm" runat="server" id="spPlanChange">
        <span>
            <asp:LinkButton ID="lbtnStartPlanChangeForm" runat="server" OnClientClick="return startPlanChangeForm();" EnableTheming="false"
                Style="color: blue">
                <span><h4>进度变更</h4></span>
            </asp:LinkButton>
        </span>
    </span>
    <span class="filter-block" flag="IsPlan" style="display: none">
        <span>
            <a style="color: blue" id="startPlanForm" runat="server">
                <h4>汇编进度计划</h4>
            </a>
        </span>
    </span>
    <span class="filter-block" flag="fileEditShow" runat="server" id="spExport">
        <span>
            <a style="color: blue" id="exportRollPlan" onclick="exportRoll()">
                <h4>导出《卷册计划》</h4>
            </a>
        </span>
    </span>
    <span class="filter-block" flag="fileEditShow">
        <span>
            <a style="color: blue" onclick="return openDownLoad()" id="aDownLoad">
                <h4>下载模板</h4>
            </a>
        </span>
    </span>
    <span class="filter-block" flag="fileEditShow" runat="server" id="spSelTemplate">
        <span>
            <asp:LinkButton ID="btnAddWbs" runat="server" EnableTheming="false"
                Style="color: blue">
                <span><h4>选择卷册模板</h4></span>
            </asp:LinkButton>
        </span>
    </span>

    <span class="filter-block" flag="IsOnlyView" runat="server" id="spInport">
        <span>
            <asp:LinkButton runat="server" ID="lbtnInport" EnableTheming="false"
                flag="import" OnClientClick="return inExport()" Style="color: blue"><span><h4>导入《卷册目录及计划》</h4></span></asp:LinkButton>
        </span>
    </span>

    <span class="filter-block" flag="IsModify" runat="server" id="spProjectMemo">
        <span>
            <asp:LinkButton runat="server" ID="lbtnEditProjMemo" ToolTip="计划经理在这里勾选卷册说明计划进度要求和进度反馈" EnableTheming="false" OnClick="lbtnEditProjMemo_Click"
                flag="import" OnClientClick="return showMemoInfo('projInfo')" Style="color: blue"><span><h4>添加项目备注</h4></span></asp:LinkButton>
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" DataKeyNames="WBSID,WBSState,WBSFlag"
        AutoGenerateColumns="False" AllowPaging="True" AllowSorting="true" ShowExport="false" BindGridViewMethod="BindList"
        OnRowCommand="gvList_RowCommand" OnRowDataBound="gvList_RowDataBound" AllowFrozing="true" FrozenColNum="6" PageSize="10">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全部">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="编辑" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="40px">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnUp" runat="server" EnableTheming="false"
                        ToolTip="升版" OnClientClick="return false" Visible="false">
                                    <img alt="升版" src="<%=this.WebAppPath %>/Themes/Images/btn_shengban.png" 
                                    onclick="upgradeWbs('<%#Eval("WBSID") %>','0')"/>
                    </asp:LinkButton>
                    <asp:LinkButton ID="lbtnEdit" runat="server" EnableTheming="false" ForeColor="Blue" ToolTip="编辑" OnClientClick='<%# String.Format("return wbsItem(3,\"{0}\")",Eval("WBSID")) %>'>
                        编辑
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="项目名称" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ExecSpecialtyName" HeaderText="专业名称"
                ItemStyle-HorizontalAlign="Center">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="卷册编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="卷册名称" ItemStyle-Width="50px">
                <ItemTemplate>
                    <a class="aStyle"
                        onclick="wbsItem(1,'<%#Eval("WBSID") %>')"><%#Eval("WBSName") %></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="提交流程" ItemStyle-Width="80px">
                <ItemTemplate>
                    <input type="hidden" runat="server" id="hiFileID" flag="fileID" value='<%#Eval("WBSID") %>' />
                    <a id="clickmenu" runat="server" flag="clickmenu" onclick="showMenu()" fileid='<%#Eval("WBSID") %>' style="color: blue">提交流程<img src="<%=WebAppPath %>/Themes/Images/ddl.gif" /></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>

            <zhongsoft:LightBoundField DataField="ProductCode" HeaderText="图纸编号" Visible="false" SortExpression="ProductCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProductName" HeaderText="图纸名称" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="BelongModule" HeaderText="系统、厂房" Visible="false" SortExpression="BelongModule">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProductLevel" HeaderText="图纸级别" SortExpression="ProductLevel">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PlanTerm" HeaderText="计划工时" SortExpression="PlanTerm" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:F0}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="IsYlgd" HeaderText="是否压力管道" SortExpression="IsYlgd">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PlanStartTime" HeaderText="计划开始" DataFormatString="{0:yyyy-MM-dd}" SortExpression="PlanStartTime">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PlanCompleteTime" HeaderText="计划完成" DataFormatString="{0:yyyy-MM-dd}" SortExpression="PlanCompleteTime">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="IsLcb" HeaderText="是否里程碑节点" SortExpression="IsLcb">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="关联">
                <ItemTemplate>
                    <table width="100px">
                        <tr>
                            <td width="65px"><span wbsreleinfo='<%#Eval("WBSID") %>' style="float: left"></span>
                            </td>
                            <td>
                                <asp:LinkButton ID="lbtnRele" runat="server" EnableTheming="false" ForeColor="Blue" ToolTip="关联" OnClientClick='<%# String.Format("return releItem(1,\"{0}\")",Eval("WBSID")) %>'>
                        关联
                                </asp:LinkButton></td>
                        </tr>
                    </table>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="WBSOwnerName" HeaderText="卷册负责人">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="卷册状态">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FactStartTime" HeaderText="实际开始" ItemStyle-Width="40px" DataFormatString="{0:yyyy-MM-dd}" ItemStyle-HorizontalAlign="Center">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FactCompleteTime" HeaderText="实际完成" ItemStyle-Width="40px" DataFormatString="{0:yyyy-MM-dd}" ItemStyle-HorizontalAlign="Center">
            </zhongsoft:LightBoundField>

            <zhongsoft:LightBoundField DataField="ApplyChangeTime" HeaderText="申请计划调整时间" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ApplyChangeReason" HeaderText="调整原因">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ImpactOnSite" HeaderText="对现场是否有影响">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="SpecialityMemo" HeaderText="专业备注">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectMemo" HeaderText="项目备注">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="CreateUserName" HeaderText="创建者" SortExpression="CreateUserName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="CreateDate" HeaderText="创建日期" DataFormatString="{0:yyyy-MM-dd}" SortExpression="CreateDate">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="LastModifyUserName" HeaderText="最后修改者" SortExpression="LastModifyUserName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="LastModifyDate" HeaderText="最后修改日期" DataFormatString="{0:yyyy-MM-dd}" SortExpression="LastModifyDate">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="40px">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del"
                        CommandArgument='<%# Eval("WBSID") %>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="<%=this.WebAppPath %>/Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <div id="divWorkflow" style="display: none">
        <asp:RadioButtonList ID="rblWorkFlow" runat="server"></asp:RadioButtonList>
    </div>
    <zhongsoft:LightPowerGridView ID="gvExport" runat="server" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="true" ShowExport="true" OnExport="gvExport_Export" Style="display: none">
        <Columns>
            <zhongsoft:LightBoundField DataField="ExecSpecialtyName" HeaderText="专业"
                ItemStyle-HorizontalAlign="Center">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="项目名称" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="卷册编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSName" HeaderText="卷册名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProductCode" HeaderText="图纸编码">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProductName" HeaderText="图纸名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProductLevel" HeaderText="图纸级别">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="BelongModule" HeaderText="系统、厂房">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="IsYlgd" HeaderText="是否压力管道">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="JKWBSCode" HeaderText="关联接口">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PlanTerm" HeaderText="计划工时" DataFormatString="{0:F0}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="SpecialityMemo" HeaderText="专业备注" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="IsLcb" HeaderText="是否里程碑节点" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSFlag" HeaderText="标识">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PlanStartTime" HeaderText="计划开始" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PlanCompleteTime" HeaderText="计划完成时间[相对第一方砼（FCD），单位：月]" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ApplyChangeTime" HeaderText="申请计划调整时间" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ApplyChangeReason" HeaderText="调整原因">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ImpactOnSite" HeaderText="对现场是否有影响">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="SpecialityMemo" HeaderText="备注（选填）">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>

    <table id="divWBSType" style="display: none;">
        <tr>
            <td>
                <a class="subtoolbarlink" id="newWbs" style="display: none;"><span>
                    <img runat="server" src="~/Themes/Images/btn_add.gif" alt="新建卷册" width="16" height="16" />新建卷册</span></a>
                <zhongsoft:LightPowerGridView runat="server" ID="gvWBSMode" AutoGenerateColumns="false"
                    UseDefaultDataSource="true" OnRowDataBound="gvWBSMode_RowDataBound" AllowPaging="false" ShowPager="false">
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
    <input type="hidden" runat="server" id="hiTemplateCount" />
    <div id="divDownLoad" style="display: none;">
        <asp:DataList runat="server" ID="dlTemplateFile" CssClass="kpms-tablebordernone"
            DataKeyField="TemplateFileURL" Width="100%">
            <ItemTemplate>
                <table style="border: #cbccce 1px solid !important; background: #f3f4f4; width: 100%">
                    <tr>
                        <td>
                            <%# Container.ItemIndex+1 %> 、
                            <a href="<%=this.WebAppPath %>/Sys/Handler/FileDownloadHandler.ashx?fileId=<%#Eval("TemplateFileURL") %>"
                                target="_blank" title="<%# Eval("TemplateFileName") %>" style="color: Blue; text-decoration: underline">
                                <%# Eval("TemplateFileName").ToString()%>
                            </a>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </div>
    <input type="hidden" runat="server" id="hiFormCode" value="EPMS73" />
    <input type="hidden" runat="server" id="hiFormID" />
    <input type="hidden" runat="server" id="hiPackageName" />
    <input type="hidden" runat="server" id="hiXpdlId" />
    <input type="hidden" runat="server" id="hiCurFileID" />
    <input type="hidden" runat="server" id="hiPlanFormName" value="汇编进度计划" />
    <input type="hidden" runat="server" id="hiIsExport" />
    <input type="hidden" runat="server" id="hiWbsXML" />
    <input type="hidden" runat="server" id="hiProjectTemplateID" />
    <input type="hidden" runat="server" id="hiUpdateTimeXml" />
    <input type="hidden" runat="server" id="hiEquipFormCode" value="ProductVerifyEquip" />

    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";

        function initCustomerPlugin() {

            initOperate();
            document.onmousedown = function () { if (!over) hideMenu(); };

            var width = 500;
            var height = 170;

            //弹出查询框定位到查询按钮下方
            try {

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
                    position: [pX, pY],
                    buttons: {
                        "关闭": function () {
                            $(this).dialog("close");
                            rebindGridData();
                        }
                    }
                });
            } catch (ex) {

            }
            $('[flag="addWbs"]').each(function () {

                $(this).bind('click', function () {

                    openWBSType("");
                });
            });

            $('#<%=gvWBSMode.ClientID %> input:radio').each(function () {
                $(this).bind('click', function () {
                    radioClick(this);
                });
            });
            <%--var action = "<%=FileAction%>";--%>
            var speId = '<%=ParamSpecialityID%>';
           <%-- if (!parseBool('<%=IsModify%>')) {
                $('[flag="IsModify"]').hide();
                $('[flag="IsModifyForm"]').hide();
                if (action == "edit") {
                    $('[flag="fileEditShow"]').show();
                    $('[flag="IsOnlyView"]').show();
                    $('[flag="IsPlan"]').show();
                }
                else {
                    $('[flag="fileEditShow"]').hide();
                    $('[flag="IsOnlyView"]').hide();
                    $('[flag="IsAdd"]').hide();
                }
            }--%>
            //if (speId == '') {
            //    $('[flag="IsAdd"]').hide();
            //}
            if (parseBool('<%=IsOnlyView%>')) {
                $('[flag="IsModify"]').hide();
                $('[flag="IsModifyForm"]').hide();
                $('[flag="IsPlan"]').hide();
                $('[flag="IsAdd"]').hide();
                $('[flag="IsOnlyView"]').hide();
                $('[flag="fileEditShow"]').hide();
            }
            getWbsReleInfo();
            initDownLoad();

            $('#<%=btnAddWbs.ClientID %>').live('click', function () {
                addWbs();
            });

            $("#<%=rblPlanRadio.ClientID%> input[type=radio]:checked").each(function () {
                if ($(this).val() == "3") {
                    $('[flag="TimeRange"]').show();
                }
                else { $('[flag="TimeRange"]').hide(); }
            })

            $("#<%=this.tbWbsOwner.ClientID %>").autocomplete({
                source: function (request, response) {
                    $.getJSON("<%=WebAppPath %>/JsonSelectorHandler.ashx", {
                        term: request.term + ',user'
                    }, response);
                },
                minLength: 1,
                select: function (event, ui) {
                    if (ui.item) {
                        $tempLoginId = ui.item.value;
                        window.setTimeout(setLoginId, 200);
                    }
                }
            }).focus();
        }

        function initOperate() {
            $('[flag="clickmenu"]').each(function () {
                $(this).bind('click', function (ev) {
                    showMenu(ev);
                });
            })
        }

        //弹出菜单具体方法
        //用于指定是否禁止原有菜单，主要是为了当右击表头以及翻页行是禁止右键自定义菜单，展示原有右键菜单
        var showInit = null;
        var over = false;
        var menu = null;
        function showMenu(ev) {
            ev = ev || window.event;
            hideMenu();
            var e = ev.srcElement || ev.target;
            if (e.tagName == "TH") {
                showInit = true;
                return;
            }

            var parent = e.parentNode;
            //名称列由于showtooltip的原因多了一层div，导致当前父级为td
            if (e.parentNode.tagName == "TD") {
                parent = e.parentNode.parentNode;
            }
            var id = $(parent).find("[flag='fileID']").val();
            if (id == "" || id == undefined) {
                showInit = true;
                return;
            }
            $("#<%=hiCurFileID.ClientID%>").val(id);
            var x = ev.pageX || ev.clientX + document.documentElement.scrollLeft;
            var y = ev.pageY || ev.clientY + document.documentElement.scrollTop;
            menu = document.createElement("DIV");
            menu.className = "menu";
            menu.style.left = x + 10 + "px";
            menu.style.top = y - ($("#<%=rblWorkFlow.ClientID %>").find("input[type='radio']").length) * 20 + "px";
            document.body.appendChild(menu);
            showInit = false;
            $(menu).append($("#<%=rblWorkFlow.ClientID%>").html());
            //menu.innerHTML = $("#<%=rblWorkFlow.ClientID%>").html();
            menu.onmouseover = function () { over = true; };
            menu.onmouseout = function () { over = false; };
        }

        //隐藏菜单
        function hideMenu() {
            if (menu) {
                document.body.removeChild(menu);
                menu = null;
            }
        }

        function startWorkFlowRoll(packageName, xpdlID, formId, orgID) {
            var url = buildQueryUrl("/Sys/Workflow/FormDetail.aspx", {
                actionType: 2, packageName: packageName, xpdlId: xpdlID, formId: formId, ver: '|', OrganizationId: orgID, WBSID: $("#<%=hiCurFileID.ClientID%>").val()
            });
            window.open(url, "workspace");
            return false;
        }

        function setLoginId() {
            $("#<%=this.tbWbsOwner.ClientID %>").val($tempLoginId);
        }

        $("#<%=rblPlanRadio.ClientID%> input[type=radio]").live("change", function () {
            if ($(this).val() == "3") {
                $('[flag="TimeRange"]').show();
            }
            else { $('[flag="TimeRange"]').hide(); }
        })

        function openWBSType() {

            $("#divWBSType").dialog('open');
            $("#divWBSType").parent().appendTo("#<%=this.Page.Form.ClientID%>");

            return false;
        }

        //单选按钮实现
        function radioClick(obj) {
            $('#<%=gvWBSMode.ClientID %> input:radio:checked').attr('checked', false);
            $(obj).attr('checked', true);
            return newWbs();
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
            var speId = '<%=ParamSpecialityID%>';
            var deptId = "";
            var speCode = "";
            var rollId = "";
            if (wbsMode == '综合管理' && speCode.toLowerCase() != 'a') {
                alert('只有选择综合专业，才可以选择综合管理下任务类别！');
                return false;
            }
            var json = { actionType: 2, OrganizationID: '<%=OrganizationID %>', ExecSpecialtyID: speId, DeptID: deptId };
            json = $.extend(json, { ParamWBSTypeID: paramWbsTypeId, RollID: rollId });
            var url = buildQueryUrl('/EPMS/List/WBS/WBSEditor.aspx', json);
            showDivDialog(encodeURI(url), "", 800, 600, null);
            //清空之前选项
            $('#<%=gvWBSMode.ClientID %> input:radio:checked').attr('checked', false);
            return false;
        }

        function wbsItem(actionType, bizId) {
            var json = { actionType: actionType, bizId: bizId };
            var url = buildQueryUrl('/EPMS/List/WBS/WBSEditor.aspx', json);
            showDivDialog(url, "", 1000, 600, rebindGridData);
            return false;
        }

        function releItem(actionType, bizId, isOnlyView) {
            var json = { actionType: actionType, bizId: bizId, isOnlyView: isOnlyView };
            if (parseBool('<%= IsOnlyView%>')) {
                json = { actionType: actionType, bizId: bizId, isOnlyView: 1 };
            }
            var url = buildQueryUrl('/EPMS/List/WBS/RollReleEditor.aspx', json);
            showDivDialog(url, "", 1000, 600, rebindGridData);
            return false;
        }

        function getWbsReleInfo() {
            var $ids = "";
            $("#<%=gvList.ClientID %> span[wbsreleinfo]").each(function () {
                $ids += $(this).attr("wbsreleinfo") + "|";
            });
            $.post("ProjectRollMaintain.aspx",
                { asyfunc: "GetWbsReleInfo", wbsIdList: $ids, organizationID:'<%=OrganizationID%>' },
                function (res) {
                    var $l = eval('(' + res + ')');
                    //设计完成定额
                    $("#<%=gvList.ClientID %> span[wbsreleinfo]").each(function () {
                        var $wbsID = $(this).attr("wbsreleinfo");
                        for (var i = 0; i < $l.length; i++) {
                            var $id = $l[i][0];
                            var $tzInfo = $l[i][1];
                            var $wzInfo = $l[i][2];
                            if ($wbsID == $id) {
                                $(this).html("内" + $tzInfo + "条;" + "外" + $wzInfo + "条");
                                $(this).attr("title", "关联的内部接口" + $tzInfo + "条;" + "关联的外部接口" + $wzInfo + "条");
                            }
                        }
                    });
                }
            );
        }

        function inExport() {
            var json = { OrganizationID: '<%=OrganizationID %>', WbsType: '<%=WBSType.册.ToString()%>' }
            var url = buildQueryUrl("EPMS/List/WBS/WBSSplitImport.aspx", json);
            showDivDialog(url, null, 600, 500, rebindGridData);
            return false;
        }

        function startPlanChangeForm() {
            var ids = $("#" + $gridCheckedClientID).val();
            var WBSIDs = "";
            if (ids.length > 36) {
                ids = ids.replace("[", "").replace("]", "").replace(/\"/g, "");
                WBSIDs = ids;
            } else {
                alert("请勾选发起进度调整申请的卷册。");
                return false;
            }

            var startRes = "";
            $.ajaxSettings.async = false;
            $.post("ProjectRollMaintain.aspx",
                { asyfunc: "StartPlanChangeForm", wbsIds: WBSIDs, organizationID:"<%=OrganizationID %>" },
                function (res) {

                    startRes = res;
                }
            );
            $.ajaxSettings.async = true;
            try {
                var formInfo = eval('(' + startRes + ')');

                var pid = formInfo.Pid;
                var aid = formInfo.Aid;

                var url = encodeURI("<%=WebAppPath%>/Sys/Workflow/FormDetail.aspx?actionType=3&prcinstid=" + pid + "&actinstid=" + aid + "&formId=" + $("#<%=hiFormID.ClientID %>").val() + "&forwardid=&isread=0");

                window.location.href = url;

            } catch (e) {
                alert(startRes);
                return false;
            }


            return false;
        }

        //发起汇编进度计划
        function startWorkFlow(packageName, xpdlID, formId, orgID) {
            var url = buildQueryUrl("/Sys/Workflow/FormDetail.aspx", {
                actionType: 2, packageName: packageName, xpdlId: xpdlID, formId: formId, ver: '|', OrganizationId: orgID, WBSTypeName: '<%=WBSType.册.ToString()%>',
            });
            window.open(url, "workspace");
            return false;
        }

        function exportRoll() {
            $("#<%=hiIsExport.ClientID %>").val(1);
            $("[name*='gvExport'][name*='BtnExcel']").click();
        }

        //升版任务
        function upgradeWbs(originalId, versionType) {
            var json = { actionType: 2, OriginalID: originalId, VerType: versionType };
            var url = buildQueryUrl('/EPMS/List/WBS/WBSEditor.aspx', json);
            showDivDialog(url, "", 1000, 600, rebindGridData);
            return false;
        }

        function initDownLoad() {
            var width = 500;
            var height = 300;

            //弹出查询框定位到查询按钮下方
            var pX; var pY;
            pX = $('#aDownLoad').offset().left - 200;
            pY = $('#aDownLoad').offset().top + $('#aDownLoad').outerHeight() + 1;
            $("#divDownLoad :ui-dialog").dialog("destroy");
            $("#divDownLoad").dialog({
                title: "下载模板",
                resizable: true,
                autoOpen: false,
                minHeight: height,
                minWidth: width,
                modal: true,
                position: [pX, pY],
                buttons: {
                    "关闭": function () {
                        $(this).dialog("close");
                    }
                }
            });
        }

        //下载
        function openDownLoad() {
            var temCount = $("#<%=hiTemplateCount.ClientID%>").val();
            if (temCount == "0" || temCount == "") {
                alert("没有模板可以下载");
                return false;
            }
            else {
                $("#divDownLoad").dialog('open');
                $("#divDownLoad").parent().appendTo("#<%=this.Page.Form.ClientID%>");
            }
            return false;
        }

        //批量添加任务
        function addWbs() {
            var json = { OrganizationID: '<%=OrganizationID %>', ProjectTemplateID: $("#<%=hiProjectTemplateID.ClientID%>").val(), WbsType: encodeURI('册'), WBSModeID: 3 };
            var url = buildQueryUrl('/EPMS/List/Sys/RelateWBSTemplate.aspx', json);
            showDivDialog(url, "", 1000, 600, rebindGridData);
            return false;
        }

        //打开卷册档案袋
        function showWBSDetail(wbsID) {
            var url ="<%=WebAppPath %>/Custom/List/Dashboard.aspx?ListId=720B45D0-71D9-4D1D-8D5B-38C647CD3868&secid=3B413684-1588-4B7D-A3F7-D9307C23CE7B&IsDashboard=1&ShowToolbar=0&IsShowHeader=2&ActionType=1";
            var json = { WBSID: wbsID };
            url = buildQueryUrl(url, json);
            window.open(url);
        }

        $gridCheckedClientIDRoll = "<%=this.gvList.CheckedClientID %>";

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

        function showMemoInfo(speOrProj) {
            var updateNum = getCheckNum();
            if (updateNum < 1) {
                alert("请勾选任务信息");
                return false;
            }
            var xml = $("#<%=hiUpdateTimeXml.ClientID %>").val();
            var json = { showInfo: speOrProj };
            var url = buildQueryUrl("EPMS/List/WBS/WBSMemoEditor.aspx", json);
            if (speOrProj == "speInfo") {
                showDivDialog(encodeURI(url), xml, 600, 400, batchRefreshSpeInfo);
            }
            else {
                showDivDialog(encodeURI(url), xml, 600, 400, batchRefreshProjInfo);
            }
            return false;
        }

        function batchRefreshSpeInfo(re) {
            $("#<%=hiUpdateTimeXml.ClientID %>").val(re);
          <%=this.Page.ClientScript.GetPostBackEventReference(this.lbtnEditSpeMemo, "")%>;
        }

        function batchRefreshProjInfo(re) {
            $("#<%=hiUpdateTimeXml.ClientID %>").val(re);
          <%=this.Page.ClientScript.GetPostBackEventReference(this.lbtnEditProjMemo, "")%>;
        }
    </script>

    <style type="text/css">
        /*下拉弹出层样式开始*/
        a {
            text-decoration: none;
            color: #000;
            background: transparent;
            outline: none;
        }

            a:visited {
            }

            a:focus {
                outline: none;
            }

        #toolbarlay {
            /*width: 140px;
            height: 35px;
            line-height: 35px;*/ /*去掉注释后，legend的标题与按钮同行*/
            z-index: 3;
            /*position: fixed;
            left: 0;
            top: 0;
            right: 0;*/
        }

        #clickmenu {
            cursor: pointer;
            display: block;
            text-align: center;
            margin: 0 auto;
            /*line-height: 35px;*/ /*去掉注释后，legend的标题与按钮同行*/
            color: #000;
        }

            #clickmenu img {
                margin-bottom: 3px;
            }

        #overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: #fff;
            opacity: 0;
            filter: alpha(opacity=0);
            display: none;
            z-index: 4;
        }

        #poplayer {
            position: fixed;
            /*top: 25px;
            left: 20px;*/
            width: auto;
            margin: 0;
            display: none;
            z-index: 555;
        }

        table {
            border-collapse: collapse;
            border-spacing: 0;
        }

        th {
            text-align: inherit;
        }

        .sl-shadow {
            -moz-box-shadow: 0 0 4px #999;
            -o-box-shadow: 0 0 4px #999;
            -webkit-box-shadow: 0 0 4px #999;
            box-shadow: 0 0 4px #999;
            -ms-filter: "progid:DXImageTransform.Microsoft.Glow(color=#a0a0a0,strength=0) progid:DXImageTransform.Microsoft.Shadow(color=#a0a0a0,direction=0,strength=2) progid:DXImageTransform.Microsoft.Shadow(color=#a0a0a0,direction=90,strength=2) progid:DXImageTransform.Microsoft.Shadow(color=#a0a0a0,direction=180,strength=2) progid:DXImageTransform.Microsoft.Shadow(color=#a0a0a0,direction=270,strength=2)";
            *filter: progid:DXImageTransform.Microsoft.Shadow(color=#a0a0a0,direction=0,strength=2) progid:DXImageTransform.Microsoft.Shadow(color=#a0a0a0,direction=90,strength=2) progid:DXImageTransform.Microsoft.Shadow(color=#a0a0a0,direction=180,strength=2) progid:DXImageTransform.Microsoft.Shadow(color=#a0a0a0,direction=270,strength=2)
        }

        .item-sub {
            /*position: absolute;*/
            padding: 12px 3px;
            background: #fff;
            top: 0px;
        }

        .item-table {
            background: none repeat scroll 0 0 #fff;
            white-space: nowrap;
        }

            .item-table td, .item-table th {
                border-right: 1px solid #e7e7e7;
                padding: 3px 16px;
                white-space: nowrap
            }

            .item-table th {
                font-weight: 700;
                padding: 0 14px 3px 17px;
                border-collapse: separate;
                white-space: nowrap
            }

                .item-table th.last, .item-table td.last {
                    border-right: 0
                }

            .item-table a {
                color: #555;
                display: block;
                padding-left: 6px;
                position: relative;
                vertical-align: middle
            }

                .item-table a:hover {
                    background-color: #aaa;
                    border-radius: 2px 2px 2px 2px;
                    color: #fff;
                    text-decoration: none;
                    vertical-align: middle
                }
        /*下拉弹出层样式结束*/

        .menu {
            position: absolute;
            z-index: 101;
            width: 300px;
            border: solid 1px #999;
            padding: 2px;
            background-color: #ffffff;
        }

            .menu label {
                /*display: block;*/
                padding: 3px 6px;
                font-size: 14px;
                color: #000000;
                cursor: default;
                text-decoration: none;
            }

                .menu label:hover {
                    background-color: #507cd1;
                    color: #ffffff;
                    cursor: pointer;
                }
    </style>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>

