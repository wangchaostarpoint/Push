<%@ Page Language="C#" AutoEventWireup="true" Title="选择任务模板" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="RelateWBSTemplate.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.RelateWBSTemplate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block" runat="server"><span class="filter-block-lb">编号/名称</span>
        <span>
            <zhongsoft:LightTextBox ID="tbName" runat="server" Width="120px"></zhongsoft:LightTextBox>
        </span></span><span id="Span1" class="filter-block" runat="server"><span class="filter-block-lb">
            专业</span> <span>
                <zhongsoft:LightDropDownList ID="ddlSpec" runat="server" class="kpms-ddlsearch" EnableTheming="false">
                </zhongsoft:LightDropDownList>
            </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <div style="display: none;">
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
    <%--AllowFrozing="true" FrozenColNum="3" FrozenHeight="300px"--%>
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="true"
        PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        DataKeyNames="WBSTemplateID" UseDefaultDataSource="true" BindGridViewMethod="BindGrid"
        OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand" ParentIdColumn="PARENTID"
        SelfIdColumn="WBSTemplateID">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                    <input type="hidden" runat="server" id="hiKeyId" value='<%#Eval("WBSTemplateID") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="WBSType" HeaderText="任务类别">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="任务编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSName" HeaderText="任务名称" Width="100px" MaxLength="20">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="SerialCode" HeaderText="成品号<br/>（校验号）" HtmlEncode="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSWay" HeaderText="任务作业<br/>（系统）方式" HtmlEncode="false"
                Width="60px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSFlag" HeaderText="任务标识" Width="60px" MaxLength="20">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="BelongModule" HeaderText="所属模块<br/>（系统、区域）"
                HtmlEncode="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ExecSpecialtyName" HeaderText="专业">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WorkDayOfTrade" HeaderText="行业定额" ItemStyle-HorizontalAlign="Right"
                ItemStyle-Width="40px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WorkDayOfEnterprise" HeaderText="标准定额" ItemStyle-HorizontalAlign="Right"
                ItemStyle-Width="40px">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <div style="width: 90%; text-align: center;">
        <asp:LinkButton runat="server" ID="ibtnOK" ToolTip="完成" OnClick="ibtnOK_Click">
            <span>
               完成</span>
        </asp:LinkButton>
        <asp:LinkButton runat="server" ID="lbtnCancel" ToolTip="取消" OnClientClick="return closeWindow();">
            <span>
               取消</span>
        </asp:LinkButton>
        &nbsp; <span class="req-star">标红任务为编号有重复的数据</span>
    </div>
    <script>
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";

        function initCustomerPlugin() {
            //隐藏查询工具条
            //$('#tbQuery').hide();
        }

        function closeExpWindow() {
            parent.returnValue = 'OK';
            closeWindow();
            return false;
        }

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
