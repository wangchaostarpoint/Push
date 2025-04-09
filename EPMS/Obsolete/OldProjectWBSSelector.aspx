<%@ Page Language="C#" AutoEventWireup="true" Title="选择历史项目任务" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="OldProjectWBSSelector.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.Obsolete.OldProjectWBSSelector" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <table width="100%" style="text-align: left;">
        <!--可根据情况控制显隐-->
        <tr>
            <td>
                项目名称
            </td>
            <td>
                <!--todo 项目类型筛选-->
                <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
                    IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                    PageWidth="850" EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                    ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode','txtPhase':'PhaseName','txtScale':'ProjectScale'}"
                    FilterFunction="projFilter()" OnClick="txtProjectName_Click"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiOrganizationID" />
            </td>
            <td>
                项目编号
            </td>
            <td>
                <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" readonly="readonly"
                    class="kpms-textbox" />
            </td>
        </tr>
        <tr>
            <td>
                设计阶段
            </td>
            <td>
                <zhongsoft:XHtmlInputText runat="server" ID="txtPhase" readonly="readonly" class="kpms-textbox" />
            </td>
            <td>
                项目规模
            </td>
            <td>
                <zhongsoft:XHtmlInputText runat="server" ID="txtScale" readonly="readonly" class="kpms-textbox" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <div id="queryDiv" style="display: none;">
        <asp:LinkButton runat="server" ID="ibtnSelected" CssClass="subtoolbarlink" EnableTheming="false"
            OnClick="ibtnSelected_Click">
        <span>已选择</span>
        </asp:LinkButton>
        <asp:LinkButton runat="server" ID="ibtnSelectTo" CssClass="subtoolbarlink" EnableTheming="false"
            OnClick="ibtnSelectTo_Click">
        <span>待选择</span>
        </asp:LinkButton>
        <asp:LinkButton runat="server" ID="ibtnAll" CssClass="subtoolbarlink" EnableTheming="false"
            OnClick="ibtnAll_Click">
        <span>全部</span>
        </asp:LinkButton>
    </div>
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="true"
        PageSize="100" AutoGenerateColumns="false" AllowSorting="true" DataKeyNames="WBSID"
        UseDefaultDataSource="true" BindGridViewMethod="BindGrid" OnRowDataBound="gvList_RowDataBound"
        OnRowCommand="gvList_RowCommand" ParentIdColumn="PARENTID" SelfIdColumn="WBSID">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1%>
                    <input type="hidden" runat="server" id="hiKeyId" value='<%#Eval("WBSID") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="任务编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSName" HeaderText="任务名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="SerialCode" HeaderText="成品号（校验号）">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSType" HeaderText="任务类别">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSWay" HeaderText="任务作业（系统）方式">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSFlag" HeaderText="任务标识">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="BelongModule" HeaderText="所属模块（系统、区域）">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ExecSpecialtyName" HeaderText="执行专业">
            </zhongsoft:LightBoundField>
            <%--<zhongsoft:LightBoundField DataField="WorkDayOfTrade" HeaderText="行业定额" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WorkDayOfEnterprise" HeaderText="企业定额" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>--%>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <div style="text-align: center;">
        <asp:LinkButton runat="server" ID="ibtnOK" ToolTip="完成" OnClick="ibtnOK_Click">
            <span>
               完成</span>
        </asp:LinkButton>
        <asp:LinkButton runat="server" ID="lbtnCancel" ToolTip="取消" OnClientClick="return closeWindow();">
            <span>
                取消</span>
        </asp:LinkButton>
        &nbsp; <span class="req-star" flag="select">请先选择历史项目，再选择任务</span> <span class="req-star"
            flag="repeat">标红任务为编号有重复的数据</span>
    </div>
    <!-- 项目类型ID-->
    <input type="hidden" runat="server" id="hiProjectTypeID" />
    <input type="hidden" runat="server" id="hiProjectPhaseID" />
    <script>
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";

        function initCustomerPlugin() {
            //选择项目后才显示已选、待选、全部查询，防止读取全部数据
            if ($('#<%=hiOrganizationID.ClientID %>').val() != '') {
                //$('#queryDiv').show();
                //选择提示、标红提示
                $('[flag="select"]').hide();
                $('[flag="repeat"]').show();
            }
            else {
                $('#queryDiv').hide();
                //选择提示、标红提示
                $('[flag="select"]').show();
                $('[flag="repeat"]').hide();
            }
        }

        function closeExpWindow() {
            parent.returnValue = 'OK';
            closeWindow();
            return false;
        }

        //选择历史项目筛选（同工程类型，但是不包括当前项目）
        function projFilter() {
            return { 'ProjectTypeID': $('#<%=hiProjectTypeID.ClientID %>').val(), 'ParamPhaseID': $('#<%=hiProjectPhaseID.ClientID %>').val(), 'NotSelfID': '<%=OrganizationID %>' };
        }

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
