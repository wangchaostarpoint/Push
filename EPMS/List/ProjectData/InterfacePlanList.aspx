<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InterfacePlanList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.ProjectData.InterfacePlanList"
    MasterPageFile="~/UI/Master/ObjectList.Master" Title="接口计划" %>

<%@ Import Namespace="DAL.EPMS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block">
        <span class="filter-block-lb">编号/名称</span>
        <span>
            <asp:TextBox ID="tbKey" MaxLength="20" runat="server" CssClass="kpms-textboxsearch"
                EnableTheming="false"></asp:TextBox>
        </span>
    </span>
    <span class="filter-block">
        <span class="filter-block-lb">计划完成</span>
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
    <span class="filter-block" flag="fileEditShow">
        <span>
            <a style="color: blue" id="exportInterface" onclick="exportInterface()">
                <h4><span id="spExport">导出《专业提资计划》</span></h4>
            </a>
        </span>
    </span>
    <span class="filter-block" flag="fileEditShow">
        <span>
            <asp:LinkButton runat="server" ID="lbtnInport" EnableTheming="false"
                flag="import" OnClientClick="return inExport()" Style="color: blue"><h4><span id="spImport">导入《专业提资清单》</span></h4></asp:LinkButton>
        </span>
    </span>
    <span class="filter-block" flag="fileEditShow1" style="display: none;">
        <span>
            <a style="color: blue" onclick="return openDownLoad()" id="aDownLoad">
                <h4>下载模板</h4>
            </a>
        </span>
    </span>
    <span class="filter-block" flag="IsPlan1" style="display: none;">
        <span>
            <a style="color: blue" id="startPlanForm" runat="server">
                <h4>汇编进度计划</h4>
            </a>
        </span>
    </span>
    <span class="filter-block" flag="fileEditShow">
        <span>
            <asp:LinkButton ID="lbtnAllDelete" runat="server" OnClientClick="if(!confirm('您确定删除吗？')) return false;" EnableTheming="false"
                Style="color: blue" OnClick="btnAllDelete_Click"><span><h4>批量删除</h4></span></asp:LinkButton>
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" DataKeyNames="WBSID,WBSState,WBSFlag" OnExport="gvList_Export"
        AutoGenerateColumns="False" AllowPaging="True" AllowSorting="true" ShowExport="true" BindGridViewMethod="BindList"
        OnRowCommand="gvList_RowCommand" OnRowDataBound="gvList_RowDataBound" AllowFrozing="true" FrozenColNum="5"
        HideFieldOnExport="全部,编辑,序号,关联,实际交接日期,实际收到日期,资料状态,创建者,创建日期,最后修改者,最后修改日期,删除">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全部">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="编辑" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="40px">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnEdit" runat="server" EnableTheming="false" ForeColor="Blue" ToolTip="编辑" OnClientClick='<%# String.Format("return wbsItem(3,\"{0}\")",Eval("WBSID")) %>'>
                        编辑
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="资料编号" SortExpression="WBSCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSName" HeaderText="资料名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FileImportance" HeaderText="类别" SortExpression="FileImportance">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FileContent" HeaderText="主要内容" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="SpeInfo" HeaderText="提出专业">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="接收专业">
                <ItemTemplate>
                    <div runat="server" id="divRecSpe" tip="1" style="width: 100px" class="autoskip">
                    </div>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="PlanCompleteTime" HeaderText="计划提交日期" DataFormatString="{0:yyyy-MM-dd}" SortExpression="PlanStartTime">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="关联" Visible="false">
                <ItemTemplate>
                    <table style="width: 215px">
                        <tr>
                            <td style="width: 175px"><span wbsreleinfo='<%#Eval("WBSID") %>'></span>
                            </td>
                            <td>
                                <asp:LinkButton ID="lbtnRele" runat="server" EnableTheming="false" ForeColor="Blue" ToolTip="关联" OnClientClick='<%# String.Format("return releItem(1,\"{0}\")",Eval("WBSID")) %>'>
                                                        关联
                                </asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="FactCompleteTime" HeaderText="实际交接日期" DataFormatString="{0:yyyy-MM-dd}" SortExpression="FactCompleteTime">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FileNature" HeaderText="资料状态">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="Memo" HeaderText="备注">
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
    <input type="hidden" runat="server" id="hiPlanFormCode" value="EPMSPlan03" />
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
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";

        function initCustomerPlugin() {
            getWbsReleInfo();
            if ('<%=FilterWBSType%>' == '<%=WBSType.外部接口资料接收%>') {
                $('#spExport').html("导出《外部资料计划》");
                $('#spImport').html("导入《外部资料清单》");
            }
            $("[name*='gvList'][name*='BtnExcel']").hide();
            $("[name*='gvList'][name*='BtnWord']").hide();
            initDownLoad();
            initBtnStatus();
        }

        function wbsItem(actionType, bizId) {
            var json = { actionType: actionType, bizId: bizId };
            var url = buildQueryUrl('/EPMS/List/WBS/WBSEditor.aspx', json);
            showDivDialog(url, "", 1000, 600, rebindGridData);
            return false;
        }

        function releItem(actionType, bizId) {
            var isOnlyView = "0";
            if ("<%=FileAction%>" != "edit") {
                isOnlyView = "1";
            }
            var json = { actionType: actionType, bizId: bizId, WBSType:'<%=FilterWBSType%>', isOnlyView: isOnlyView, OrganizationID:'<%=OrganizationID %>' };
            var url = buildQueryUrl('/EPMS/List/WBS/InFileReleRoll.aspx', json);
            showDivDialog(url, "", 1000, 600, rebindGridData);
            return false;
        }

        function getWbsReleInfo() {
            var $ids = "";
            $("#<%=gvList.ClientID %> span[wbsreleinfo]").each(function () {
                $ids += $(this).attr("wbsreleinfo") + "|";
            });
            $.post("InterfacePlanList.aspx",
                { asyfunc: "GetWbsReleInfo", wbsIdList: $ids },
                function (res) {
                    var $l = eval('(' + res + ')');
                    //设计完成定额
                    $("#<%=gvList.ClientID %> span[wbsreleinfo]").each(function () {
                        var $wbsID = $(this).attr("wbsreleinfo");
                        for (var i = 0; i < $l.length; i++) {
                            var $id = $l[i][0];
                            var $rollInfo = $l[i][1];
                            if ($wbsID == $id) {
                                if ('<%=FilterWBSType%>' == '<%=WBSType.外部接口资料接收%>') {
                                    var $tzInfo = $l[i][2];
                                    var $jsgfsInfo = $l[i][3];
                                    $(this).html("卷册" + $rollInfo + "条;提资" + $tzInfo + "条;设备" + $jsgfsInfo + "条");
                                    $(this).attr("title", "关联的卷册" + $rollInfo + "条;关联的提资" + $tzInfo + "条;关联的设备" + $jsgfsInfo + "条");
                                }
                                else {
                                    $(this).html("卷册" + $rollInfo + "条");
                                    $(this).attr("title", "关联的卷册" + $rollInfo + "条");
                                }
                            }
                        }
                    });
                }
            );
        }

        function inExport() {
            var json = { OrganizationID: '<%=OrganizationID %>', WbsType: '<%=FilterWBSType%>' }
            var url = buildQueryUrl("EPMS/List/WBS/WBSSplitImport.aspx", json);
            showDivDialog(url, null, 600, 500, rebindGridData);
            return false;
        }

        //发起汇编进度计划
        function startWorkFlow(packageName, xpdlID, formId, orgID) {
            var url = buildQueryUrl("/Sys/Workflow/FormDetail.aspx", {
                actionType: 2, packageName: packageName, xpdlId: xpdlID, formId: formId, ver: '|', OrganizationId: orgID, WBSTypeName:  '<%=FilterWBSType%>',
            });
            window.open(url, "workspace");
            return false;
        }

        function exportInterface() {
            $("[name*='gvList'][name*='BtnExcel']").click();
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
                //alert("没有模板可以下载");
                //return false;

                var url = buildQueryUrl('/EPMS/Download/专业间提资清单（模板）.xlsx', null);
                if ('<%=FilterWBSType%>' == '外部接口资料接收') {
                    url = buildQueryUrl('/EPMS/Download/外部资料清单（模板）.xlsx', null);
                }
                window.open(url);
            }
            else {
                $("#divDownLoad").dialog('open');
                $("#divDownLoad").parent().appendTo("#<%=this.Page.Form.ClientID%>");
            }
            return false;
        }

        //设置按钮是否可见
        function initBtnStatus() {
            var action = "<%=FileAction %>";
            if (action == "edit") {
                $('[flag="fileEditShow"]').show();
                $('[flag="IsPlan"]').show();
            }
            else {
                $('[flag="fileEditShow"]').hide();
                $('[flag="IsPlan"]').hide();
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
