<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllowGoFlowList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Quality.AllowGoFlowList" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">项目编号/名称</span> <span>
        <zhongsoft:LightTextBox ID="tbProjectInfo" search="1" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">卷册编号/名称</span>
        <span>
            <zhongsoft:LightTextBox ID="tbWBSInfo" search="1" runat="server" CssClass="kpms-textboxsearch"
                EnableTheming="false"></zhongsoft:LightTextBox>
        </span></span><span class="filter-block"><span class="filter-block-lb">卷册负责人</span>
            <span>
                <zhongsoft:LightTextBox ID="tbOwnerName" search="1" runat="server" CssClass="kpms-textboxsearch"
                    EnableTheming="false">
                </zhongsoft:LightTextBox>
            </span></span><span class="filter-block"><span class="filter-block-lb">工程类型</span><span>
                <zhongsoft:LightDropDownList ID="ddlProjectType" runat="server" class="kpms-ddlsearch"
                    EnableTheming="false">
                </zhongsoft:LightDropDownList>
            </span></span><span class="filter-block"><span class="filter-block-lb">所属部室</span> <span>
                <zhongsoft:LightDropDownList runat="server" ID="ddlDept">
                </zhongsoft:LightDropDownList>
            </span></span><span class="filter-block"><span class="filter-block-lb">专业</span><span>
                <zhongsoft:LightDropDownList runat="server" ID="ddlSpecialty">
                </zhongsoft:LightDropDownList>
            </span></span><span class="filter-block"><span class="filter-block-lb">放行审批人</span>
                <span>
                    <zhongsoft:LightTextBox ID="tbExamineUser" search="1" runat="server" CssClass="kpms-textboxsearch"
                        EnableTheming="false">
                    </zhongsoft:LightTextBox>
                </span></span>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
    <asp:Label runat="server" ID="lbTitle" Style="font-weight: bold"></asp:Label>&nbsp;
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvAllowFlow" AutoGenerateColumns="false"
        ShowExport="true" runat="server" BindGridViewMethod="BindAllowFlow" PageSize="10"
        UseDefaultDataSource="true" ShowPageSizeChange="true" OnBeforeExporting="gvAllowFlow_BeforeExporting">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName"  Width="150" ShowToolTip="true" >
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="卷册编号" DataField="WBSCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="卷册名称" DataField="WBSName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="主设人" ItemStyle-Width="100px">
                <ItemTemplate>
                    <asp:Label ID="lbZSR" runat="server">
                        <span orgid='<%#Eval("OrganizationId") %>' speid='<%#Eval("ExecSpecialtyID") %>'>
                        </span></asp:Label>
                    <input type="hidden" runat="server" id="hiOrganizationID" value='<%#Eval("OrganizationId") %>' />
                    <input type="hidden" runat="server" id="hiExecSpecialtyID" value='<%#Eval("ExecSpecialtyID") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="卷册负责人" DataField="WBSOwnerName" ItemStyle-Width="60px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="审批时间" DataField="AllowDate" ItemStyle-Width="70px"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="特殊放行理由" DataField="AllowReason" Width="150"
                ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="放行<br/>审批人" DataField="AllowUserName" ItemStyle-Width="50px"
                HtmlEncode="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="viewAllowFlow" DataParamFields="AllowGoFlowID"
                CommandName="ViewData" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        function initCustomerPlugin() {
            getWBSMainDesigner();
        }

        //异步加载主设人信息
        function getWBSMainDesigner() {
            var speIDArray = new Array();
            var $ids = "";
            var $speIDs = "";
            $("#<%=gvAllowFlow.ClientID %> span[orgid]").each(function () {
                var speID = $(this).attr("speid");
                if ($ids.indexOf($(this).attr("orgid")) < 0) {
                    $ids += $(this).attr("orgid") + "|";

                }
                if ($.inArray(speID, speIDArray) == -1) {
                    $speIDs += $(this).attr("speid") + "|";
                    speIDArray.push(speID);
                }
            });
            $.post("AllowGoFlowList.aspx",
                 { asyfunc: "GetMainDesigner", orgIdList: $ids, speIDList: $speIDs },
                 function (res) {
                     var $l = eval('(' + res + ')');
                     //主设人
                     $("#<%=gvAllowFlow.ClientID %> span[orgID]").each(function () {
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
        function viewAllowFlow(bizId) {
            var url = '/Custom/List/C_FormDetailLoading.aspx';
            var json = { bizId: bizId, IsOld: 2 };
            url = buildQueryUrl(url, json);
            window.open(url);
            return false;
        }

    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
