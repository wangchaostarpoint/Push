<%@ Page Title="工代服务记录" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="GDServiceRecordList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.GDManage.GDServiceRecordList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton ID="lbtnNew" runat="server" EnableTheming="false" CssClass="subtoolbarlink" OnClientClick="return viewItem(2, '');">
            <span>
                <img runat="server" id="img1" src="~/Themes/Images/btn_new.gif" alt="新建" height="16" />新建</span>
        </asp:LinkButton>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">工程名称</span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbProjectName" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <%--<span class="filter-block"><span class="filter-block-lb">服务日期</span><span>
        <zhongsoft:XHtmlInputText runat="server" ID="txtStartDate" class="kpms-textbox-comparedate" readonly="readonly" compare="1"
                                EnableTheming="false"/>- 
        <zhongsoft:XHtmlInputText runat="server" ID="txtEndDate" class="kpms-textbox-comparedate" readonly="readonly" compare="1"
                                EnableTheming="false"/>
    </span></span>--%>
    <span class="filter-block"><span class="filter-block-lb">工代</span><span>
        <zhongsoft:LightTextBox runat="server" ID="txtGDName" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false"
        ShowExport="true" AllowPaging="true" PageSize="15" UseDefaultDataSource="true"
        AllowSorting="true" BindGridViewMethod="BindData"
        DataKeyNames="GDServiceRecordID" OnRowCommand="gvList_OnRowCommand">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                <ItemTemplate>
                    <%#Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="查看" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnViewForm" runat="server" EnableTheming="false" OnClientClick="return false">
                        <img alt="img" src="../../../Themes/Images/btn_dg_view.gif"  title="查看合同信息"
                             onclick="viewItem('1','<%# Eval("GDServiceRecordID") %>');"/>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="编辑" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnEdit" runat="server" EnableTheming="false" OnClientClick="return false">
                        <img alt="img" src="../../../Themes/Images/btn_dg_edit.gif"  title="编辑"
                             onclick="viewItem('3','<%# Eval("GDServiceRecordID") %>');"/>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del"
                        CommandArgument='<%# Eval("GDServiceRecordID") %>' OnClientClick="return confirm('您确定删除吗？');">
                        <span><img src="../../../Themes/Images/btn_dg_delete.gif" alt="删除"  title="删除"/></span>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="工程名称" DataField="ProjectName" SortExpression="ProjectName" />
            <zhongsoft:LightBoundField HeaderText="工程所在地" DataField="ProjectPlace" />
            <zhongsoft:LightBoundField HeaderText="服务开始日期" DataField="ServiceStartDate" SortExpression="ServiceStartDate" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField HeaderText="服务结束日期" DataField="ServiceEndDate" SortExpression="ServiceEndDate" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField HeaderText="专业" DataField="SpecialtyName" />
            <zhongsoft:LightBoundField HeaderText="工代" DataField="GDUserName" />
            <zhongsoft:LightBoundField HeaderText="服务内容" DataField="Content" Width="300px" ShowToolTip="True" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:Button runat="server" ID="btnBindData" OnClick="btnBindData_OnClick" Style="display: none" />

    <script type="text/javascript">
        function viewItem(actionType, bizId) {
            var json = { actionType: actionType, bizId: bizId };
            var organizationId = '<%=OrganizationID%>';
            var projectSpecialtyID = '<%=ProjectSpecialtyID%>';
            if (organizationId != "") {
                json = { actionType: actionType, bizId: bizId, organizationID: organizationId };
            }
            if (projectSpecialtyID != "") {
                json = { actionType: actionType, bizId: bizId, projectSpecialtyID: projectSpecialtyID };
            }
            var url = buildQueryUrl('/EPMS/List/GDManage/GDServiceRecordEditor.aspx', json);
            var callBack = null;
            if (actionType == '2' || actionType == '3') {
                callBack = bindData;
            }
            showDivDialog(url, "", 800, 500, callBack);
            return false;
        }
        //执行后台绑定列表
        function bindData() {
            $('#<%=btnBindData.ClientID %>').click();
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
