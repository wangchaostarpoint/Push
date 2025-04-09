<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="WBSTemplateList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.WBSTemplateList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
    <zhongsoft:LightDropDownList runat="server" ID="ddlProjTemp" AutoPostBack="true"
        OnSelectedIndexChanged="ddlProjTemp_SelectedIndexChanged" Width="200px">
    </zhongsoft:LightDropDownList>
    <asp:TreeView ID="tvWBSTree" runat="server" ShowLines="True" Height="100%" OnSelectedNodeChanged="tvWBSTree_SelectedNodeChanged"
        OnTreeNodeExpanded="tvWBSTree_TreeNodeExpanded">
        <SelectedNodeStyle BackColor="#F7F7F7" />
    </asp:TreeView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block" runat="server" id="spanWBSType" visible="false"><span
        class="filter-block-lb">任务类型</span> <span>
            <zhongsoft:LightDropDownList ID="ddlWBSType" runat="server" class="kpms-ddlsearch"
                EnableTheming="false">
            </zhongsoft:LightDropDownList>
        </span></span><span class="filter-block"><span class="filter-block-lb">
            <asp:Label runat="server" ID="lbWBSName" Text="编号/名称"></asp:Label>
        </span><span>
            <zhongsoft:LightTextBox runat="server" ID="tbName" EnableTheming="false" CssClass="kpms-textboxsearch"></zhongsoft:LightTextBox>
        </span></span><span class="filter-block" id="spFlag" runat="server"><span class="filter-block-lb">任务标识</span> <span>
            <zhongsoft:LightDropDownList ID="ddlWBSFlag" runat="server" class="kpms-ddlsearch"
                EnableTheming="false">
            </zhongsoft:LightDropDownList>
        </span></span><span class="filter-block" runat="server" id="spanParentName" visible="false">
            <span class="filter-block-lb">卷册编号/名称</span> <span>
                <zhongsoft:LightTextBox runat="server" ID="tbParentName" EnableTheming="false" CssClass="kpms-textboxsearch"></zhongsoft:LightTextBox>
            </span></span><span class="filter-block" runat="server" id="spanRSpec" visible="false">
                <span class="filter-block-lb">收资专业</span> <span>
                    <zhongsoft:LightDropDownList ID="ddlRSpec" runat="server" class="kpms-ddlsearch"
                        EnableTheming="false">
                    </zhongsoft:LightDropDownList>
                </span></span><span class="filter-block" runat="server" id="spanLevel" visible="false">
                    <span class="filter-block-lb">类别</span> <span>
                        <zhongsoft:LightDropDownList ID="ddlLevel" runat="server" class="kpms-ddlsearch"
                            EnableTheming="false">
                        </zhongsoft:LightDropDownList>
                    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <!-- 将TreeGridView改为LightPowerGridView，树形列表在数据很多情况下递归会很慢 tianhl 20150707-->
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="true"
        PageSize="50" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        DataKeyNames="WBSTemplateID,Flag,ExecSpecialtyID,WBSLevel" UseDefaultDataSource="true"
        BindGridViewMethod="BindGrid" OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand"
        OnExport="gvList_Export">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="ProjectTempName" HeaderText="项目模板名称" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ExecSpecialtyCode" HeaderText="专业编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ExecSpecialtyName" HeaderText="专业名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="卷册编号">
                <ItemTemplate>
                    <%#Eval("ParentWBSCode") %>
                    <asp:Label runat="server" ID="lbParentWBSCode"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <%-- <zhongsoft:LightBoundField HeaderText="卷册模板名称" ShowToolTip="true" Width="50" ItemStyle-Width="50px">
            </zhongsoft:LightBoundField>--%>
            <zhongsoft:LightTemplateField HeaderText="卷册模板名称" ItemStyle-Width="250px">
                <ItemTemplate>
                    <div style="word-break: break-all !important; white-space: normal !important; width: 100%">
                        <%#Eval("ParentWBSName") %>
                        <asp:Label runat="server" ID="lbParentWBSName"></asp:Label>
                    </div>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="WBSType" HeaderText="任务类型" Visible="false">
            </zhongsoft:LightBoundField>

            <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSName" HeaderText="名称" DataParamFields="WBSTemplateID"
                DialogMode="Dialog" EditItemClick="viewDetail" HeaderStyle-Width="150px" ShowToolTip="true">
            </zhongsoft:LightBoundField>

            <%--  <zhongsoft:LightBoundField DataField="SerialCode" HeaderText="成品号（校验号）">
            </zhongsoft:LightBoundField>--%>
            <zhongsoft:LightBoundField DataField="WBSWay" HeaderText="任务作业<br/>（系统）方式" HtmlEncode="false" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSFlag" HeaderText="任务标识">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="接收专业" Visible="false" HeaderStyle-Width="150px">
                <ItemTemplate>
                    <div class="autoskip" style="width: 150px">
                        <asp:Label runat="server" ID="lbRSpec"></asp:Label>
                    </div>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="接收卷册" Visible="false" HeaderStyle-Width="150px">
                <ItemTemplate>
                    <div class="autoskip" style="width: 150px">
                        <asp:Label runat="server" ID="lbRWBS"></asp:Label>
                    </div>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>

            <zhongsoft:LightBoundField DataField="WBSLevel" HeaderText="类别" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSContent" HeaderText="内容" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSContent" HeaderText="程序" HeaderStyle-Width="100px"
                ShowToolTip="true" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PlanTerm" HeaderText="预计工期" ItemStyle-HorizontalAlign="Right"
                ItemStyle-Width="50px">
            </zhongsoft:LightBoundField>
            <%--<zhongsoft:LightBoundField DataField="BelongModule" HeaderText="所属模块（系统、区域）">
            </zhongsoft:LightBoundField>--%>
            <%--<zhongsoft:LightBoundField DataField="BelongSpecialtyName" HeaderText="所属专业">
            </zhongsoft:LightBoundField>--%>
            <zhongsoft:LightBoundField DataField="WorkDayOfTrade" HeaderText="行业定额" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WorkDayOfEnterprise" HeaderText="企业定额" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="使用情况" ItemStyle-HorizontalAlign="Center" Visible="false">
                <ItemTemplate>
                    <a onclick="viewUseNum('<%#Eval("WBSTemplateID") %>')">使用（<asp:Label runat="server"
                        ID="lbUseNum" Text="0"></asp:Label>）次</a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="是否启用" Visible="false">
                <ItemTemplate>
                    <asp:RadioButtonList runat="server" ID="rbl" RepeatDirection="Horizontal" key='<%#Eval("WBSTemplateID") %>'
                        OnSelectedIndexChanged="rbl_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Value="1">启用</asp:ListItem>
                        <asp:ListItem Value="0">不启用</asp:ListItem>
                    </asp:RadioButtonList>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="外部资料说明" Visible="false">
                <ItemTemplate>
                    <div style="word-break: break-all !important; white-space: normal !important;">
                        <%#Eval("DESCRIPTION")%>
                    </div>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <input type="hidden" runat="server" id="hiIsCalcute" value="0" />
    <input type="hidden" id="hiSpecID" runat="server" value="" />
    <%--1有权限新建0无权限新建--%>
    <input type="hidden" id="hiCanAdd" runat="server" value="0" />
    <%--ProjTempID--%>
    <input type="hidden" id="hiProjTempID" runat="server" value="" />
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";

        function initCustomerPlugin() {
            //为列表中a标签添加统一样式
            $('#<%=gvList.ClientID %> a').addClass('aStyle');
        }

        function viewDetail(bizId) {
            var json = { actionType: 1, bizId: bizId, ProjTempID: $("#<%=hiProjTempID.ClientID %>").val() };
            var url = buildQueryUrl('/EPMS/List/Sys/WBSTemplateEditor.aspx', json);
            showDivDialog(url, null, 1050, 550, rebindGridData);
        }

        //查看模板适用次数
        function viewUseNum(wbsTempId) {

        }

        function beforeDialog(actionType, bizId) {

            if (actionType == 2) {
                //判断是否选择了专业
                if ($("#<%=hiSpecID.ClientID %>").val() == "") {
                    alert("请先选择专业，然后再新建模板！");
                    return false;
                }
                if ($("#<%=hiCanAdd.ClientID %>").val() != "1") {
                    //新建时判断是否有该专业的新增权限
                    alert("您没有所选专业的权限，不能新建模板。请选择其他专业或是联系管理员");
                    return false;
                }

            }
            var json = { actionType: actionType, bizId: bizId, WBSModeID: "<%=WBSModeID %>", SpecialtyID: $("#<%=hiSpecID.ClientID %>").val(), ProjTempID: $("#<%=hiProjTempID.ClientID %>").val() };
            var url = buildQueryUrl('/EPMS/List/Sys/WBSTemplateEditor.aspx', json);
            showDivDialog(url, null, 1050, 550, rebindGridData);
            return false;
        }

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
