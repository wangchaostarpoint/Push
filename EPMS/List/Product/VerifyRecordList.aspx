<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerifyRecordList.aspx.cs" Title="成品校审单"
    Inherits="Zhongsoft.Portal.EPMS.List.Product.VerifyRecordList" MasterPageFile="~/UI/Master/ObjectList.Master" %>
<%@ Import Namespace="Zhongsoft.Portal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">项目编号/名称</span> <span>
        <zhongsoft:LightTextBox ID="tbProjectInfo" search="1" runat="server" MaxLength="64"
            CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        <asp:LinkButton runat="server" ID="lbtnSelProject" CssClass="btn-look-up" EnableTheming="false"
            OnClientClick="return selProject();" Style="margin-top: 2px !important;">
                    <img title="选择项目" src="../../../Themes/Images/look-up.gif">
        </asp:LinkButton>
    </span></span><span class="filter-block"><span class="filter-block-lb">任务编号/名称</span>
        <span>
            <zhongsoft:LightTextBox ID="tbWBSInfo" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
                EnableTheming="false"></zhongsoft:LightTextBox>
            <asp:LinkButton runat="server" ID="lbtnSelWBS" CssClass="btn-look-up" EnableTheming="false"
                OnClientClick="return selWBS();" Style="margin-top: 2px !important;">
                    <img title="选择任务" src="../../../Themes/Images/look-up.gif">
            </asp:LinkButton>
        </span></span><span class="filter-block"><span class="filter-block-lb">专业</span> <span>
            <zhongsoft:LightDropDownList runat="server" ID="ddlSpecialty">
            </zhongsoft:LightDropDownList>
        </span></span><span class="filter-block"><span class="filter-block-lb">主设人</span> <span>
            <zhongsoft:LightTextBox ID="tbMainDesigner" search="1" runat="server" MaxLength="64"
                CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span></span>
    <span class="filter-block">
        <span>
            <a style="color: blue" onclick="startStateWF()">
                <h4>发起《产品校审流程》</h4>
            </a></span>
    </span>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="advSearch" runat="server">
    <span class="filter-block"><span class="filter-block-lb">部门</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlDept">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">工程类型</span><span>
        <zhongsoft:LightDropDownList ID="ddlProjectType" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">设计阶段</span><span>
        <zhongsoft:LightDropDownList ID="ddlPhase" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
    <asp:LinkButton runat="server" ID="lbtnReBindPhase" OnClick="lbtnReBindPhase_Click"
        Style="display: none"></asp:LinkButton>
    <asp:LinkButton runat="server" ID="lbtnReBindSpe" OnClick="ddlDept_SelectedIndexChanged" Style="display: none"></asp:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
    <asp:Label runat="server" ID="lbTitle" Style="font-weight: bold"></asp:Label>&nbsp;
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvVerifyRoll" AutoGenerateColumns="false"
        ShowExport="true" runat="server" BindGridViewMethod="BindVerifyRoll" PageSize="10"
        UseDefaultDataSource="false" ShowPageSizeChange="true" OnBeforeExporting="gvVerifyRoll_BeforeExporting">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="任务编号" DataField="WBSCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="任务名称" DataField="WBSName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="所属专业" DataField="ExecSpecialtyName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="主设人" ItemStyle-Width="120px">
                <ItemTemplate>
                    <asp:Label ID="lbZSR" runat="server">
                        <span orgid='<%#Eval("OrganizationId") %>' speid='<%#Eval("ExecSpecialtyID") %>'>
                        </span></asp:Label>
                    <input type="hidden" runat="server" id="hiOrganizationID" value='<%#Eval("OrganizationId") %>' />
                    <input type="hidden" runat="server" id="hiExecSpecialtyID" value='<%#Eval("ExecSpecialtyID") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightButtonField HeaderText="查看详细" EditItemClick="viewRollInfo" DataParamFields="WBSID"
                CommandName="ViewData" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">

        function initCustomerPlugin() {
            getWBSMainDesigner();
            $("#<%=ddlProjectType.ClientID %>").live("change", function () { afterProjectTypeChange(); });
            $("#<%=ddlDept.ClientID %>").live("change", function () { afterDeptChange(); });
        }
        function afterProjectTypeChange() {
            <%=this.Page.ClientScript.GetPostBackEventReference(this.lbtnReBindPhase, "")%>;
        }
        function afterDeptChange() {
            <%=this.Page.ClientScript.GetPostBackEventReference(this.lbtnReBindSpe, "")%>;
        }

        function viewRollInfo(wbsid) {
            var url = buildQueryUrl("/EPMS/List/Product/VerifyRecordEditor.aspx", { actionType: 1, bizId: wbsid });
            showDivDialog(url, null, 900, 600, null);
            return false;
        }

        //异步加载主设人信息
        function getWBSMainDesigner() {
            var speIDArray = new Array();
            var $ids = "";
            var $speIDs = "";
            $("#<%=gvVerifyRoll.ClientID %> span[orgid]").each(function () {
                var speID = $(this).attr("speid");
                if ($ids.indexOf($(this).attr("orgid")) < 0) {
                    $ids += $(this).attr("orgid") + "|";

                }
                if ($.inArray(speID, speIDArray) == -1) {
                    $speIDs += $(this).attr("speid") + "|";
                    speIDArray.push(speID);
                }
            });
            $.post("VerifyRecordList.aspx",
                 { asyfunc: "GetMainDesigner", orgIdList: $ids, speIDList: $speIDs },
                 function (res) {
                     var $l = eval('(' + res + ')');
                     //主设人
                     $("#<%=gvVerifyRoll.ClientID %> span[orgID]").each(function () {
                         var $orgID = $(this).attr("orgID");
                         var $paramSpeID = $(this).attr("speID");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $speID = $l[i][1];
                             var $zsr = $l[i][2];
                             if ($orgID == $id && $speID == $paramSpeID) {
                                 if ($zsr == "")
                                     $(this).html("");
                                 else {
                                     $(this).html($zsr);
                                 }
                             }
                         }
                     });
                 }
             );
        }

        //选择项目信息
        function selProject() {
            var param = new InputParamObject("s");
            getDivProject(null, param, null, setProjInfo);
            return false;
        }

        function setProjInfo(reObj) {
            if (reObj != null) {
                $('#<%=tbProjectInfo.ClientID %>').val(reObj.buildAttrJson("o", "ProjectCode"));
            }
        }

        function selWBS() {
            var param = new InputParamObject("s");
            var json = { ProjectCode: $('#<%=tbProjectInfo.ClientID %>').val() };
            getWBS(null, param, json, setWBSInfo);
            return false;
        }

        function setWBSInfo(reObj) {
            if (reObj != null) {
                $('#<%=tbWBSInfo.ClientID %>').val(reObj.buildAttrJson("o", "WBSCode"));
            }
        }
        //发起《产品校审流程》  
        function startStateWF() {
            var url = buildQueryUrl("/Sys/Workflow/FormDetail.aspx", {
                actionType: 2, packageName: 'EPMSProductVerify.xpdl', xpdlId: 'EPMSProductVerify_wp1', formId: '<%=FormHelper.GetFormIdByPackage("EPMSProductVerify.xpdl")%>', ver: '|', OrganizationID: '<%=OrganizationID%>'
            });
            window.open(url);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
