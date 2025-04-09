<%@ Page Language="C#" AutoEventWireup="true" Title="项目模板" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="ProjectTemplateList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.ProjectTemplateList" %>

<%@ Import Namespace="DAL.EPMS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">模板名称</span> <span>
        <zhongsoft:LightTextBox ID="tbName" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">项目类型</span> <span>
        <zhongsoft:LightDropDownList ID="ddlProjectType" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">项目阶段</span> <span>
        <zhongsoft:LightDropDownList ID="ddlProjectPhase" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="50" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        DataKeyNames="ProjectTemplateID" UseDefaultDataSource="true" BindGridViewMethod="BindGrid"
        OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" HeaderStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="详细">
                <ItemTemplate>
                    模板名称：<%#Eval("ProjectTemplateName")%>； 项目类型：<asp:Label runat="server" ID="lbProjType"></asp:Label>；
                    设计阶段：<asp:Label runat="server" ID="lbPhase"></asp:Label>； 规模等级：<asp:Label runat="server"
                        ID="lbScale"></asp:Label>
                    <br />
                    <a onclick="viewWBS('<%#Eval("ProjectTemplateID")%>')">卷册<%--（<asp:Label runat="server"
                        ID="lbWBSNum" Text="0"></asp:Label>）个--%></a> ； <a onclick="viewTask('<%#Eval("ProjectTemplateID")%>')">设计任务书<%--（<asp:Label runat="server" ID="lbTaskBookNum" Text="0"></asp:Label>）个--%></a>；
                    <a style="display: none" onclick="viewEquip('<%#Eval("ProjectTemplateID")%>')">设备<%--（<asp:Label runat="server"
                        ID="lbEquipNum" Text="0"></asp:Label>）个--%></a><span style="display: none">；</span> <a onclick="viewMutual('<%#Eval("ProjectTemplateID")%>')">互提资料<%--（<asp:Label runat="server" ID="lbMutualNum" Text="0"></asp:Label>）项--%></a>；
                    <a onclick="viewExternal('<%#Eval("ProjectTemplateID")%>')">外部资料<%--（<asp:Label runat="server"
                        ID="lbExternalNum" Text="0"></asp:Label>）项--%></a>； <a onclick="viewVerifyPoint('<%#Eval("ProjectTemplateID")%>')">校审要点<%--（<asp:Label runat="server" ID="lbVerifyPointNum" Text="0"></asp:Label>）条--%></a>；
                    <a style="display: none" onclick="viewMandatory('<%#Eval("ProjectTemplateID")%>')">强条<%--（<asp:Label runat="server"
                        ID="lbMandatoryNum" Text="0"></asp:Label>）条--%></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="模板文件">
                <ItemTemplate>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="是否启用">
                <ItemTemplate>
                    <asp:RadioButtonList runat="server" ID="rbl" RepeatDirection="Horizontal" key='<%#Eval("ProjectTemplateID") %>'
                        OnSelectedIndexChanged="rbl_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Value="1">启用</asp:ListItem>
                        <asp:ListItem Value="0">不启用</asp:ListItem>
                    </asp:RadioButtonList>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";

        function initCustomerPlugin() {
            //为列表中a标签添加统一样式
            $('#<%=gvList.ClientID %> a').addClass('aStyle');
        }

        //查看WBS任务项
        function viewWBS(projTempId) {
            var json = { ProjectTemplateID: projTempId, WBSModeID: 3 };
            var url = buildQueryUrl('/EPMS/List/Sys/WBSTemplateList.aspx', json);
            showDivDialog(url, null, 1050, 550, null);
        }

        //查看任务书
        function viewTask(projTempId) {
            var json = { ProjectTemplateID: projTempId };
            var url = buildQueryUrl('/EPMS/List/Sys/TaskBookTemplateList.aspx', json);
            showDivDialog(url, null, 1050, 550, null);
        }

        //查看设备
        function viewEquip(projTempId) {
            var json = { ProjectTemplateID: projTempId };
            var url = buildQueryUrl('/EPMS/List/Sys/EquipmentTemplateList.aspx', json);
            showDivDialog(url, null, 1050, 550, null);
        }

        //查看互提资料
        function viewMutual(projTempId) {
            var json = { ProjectTemplateID: projTempId, WBSModeID: '<%=WBSMode.设计接口资料.GetHashCode()%>', WBSTypeID: '<%=WBSType.内部专业间提资.GetHashCode() %>' };
            var url = buildQueryUrl('/EPMS/List/Sys/WBSTemplateList.aspx', json);
            showDivDialog(url, null, 1050, 550, null);
        }

        //查看外部资料
        function viewExternal(projTempId) {
            var json = { ProjectTemplateID: projTempId, WBSModeID: '<%=WBSMode.设计接口资料.GetHashCode()%>', WBSTypeID: '<%=WBSType.外部接口资料接收.GetHashCode() %>' };
            var url = buildQueryUrl('/EPMS/List/Sys/WBSTemplateList.aspx', json);
            showDivDialog(url, null, 1050, 550, null);
        }

        //查看校审要点
        function viewVerifyPoint(projTempId) {
            var json = { ProjectTemplateID: projTempId };
            var url = buildQueryUrl('/EPMS/List/Sys/VerifyPointTemplateList.aspx', json);
            showDivDialog(url, null, 1050, 550, null);
        }

        //查看强条
        function viewMandatory(projTempId) {
            var json = { ProjectTemplateID: projTempId };
            var url = buildQueryUrl('/EPMS/List/Sys/MandatoryTemplateList.aspx', json);
            showDivDialog(url, null, 1050, 550, null);
        }

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
