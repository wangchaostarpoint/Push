<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="C_DesignChangeList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Product.C_DesignChangeList" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master"
    Title="设计变更台账" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <%--<fieldset class="rtm_fds_bd" id="Fieldset1" style="display: block">
        <legend class="rtm_fds_tle" onclick="return showSearch();" style="cursor: pointer">一般查询条件</legend>
        <div style="background-color: #EFF2F7;" id="divQuery">--%>
    <span class="filter-block"><span class="filter-block-lb">项目名称/编号</span> <span>
        <asp:TextBox ID="tbProjectInfo" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">任务类型</span> <span>
        <zhongsoft:LightDropDownList ID="ddlWBSType" runat="server" Style="width: 155px;
            margin: 3px 0px;">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">名称/编号</span>
        <span>
            <asp:TextBox ID="tbWBSInfo" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
                EnableTheming="false"></asp:TextBox>
        </span></span><span class="filter-block"><span class="filter-block-lb">专业</span><span>
            <zhongsoft:LightDropDownList ID="ddlSpecialty" runat="server" Style="width: 155px;
                margin: 3px 0px;">
            </zhongsoft:LightDropDownList>
        </span></span>
    <%--</div>
    </fieldset>--%>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvDesignChange" AutoGenerateColumns="false"
        DataKeyNames="DESIGNCHANGEID" ShowExport="true" HideFieldOnExport="全部" runat="server"
        BindGridViewMethod="BindDataGrid" OnSorting="gvDesignChange_Sorting" ShowPageSizeChange="true"
        AllowSorting="true">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全部" PostBackClick="checkGridPostBack">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode" SortExpression="ProjectCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" SortExpression="ProjectName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="任务类型" DataField="WBSType" SortExpression="WBSType">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="编号" DataField="WBSCode" SortExpression="WBSCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="名称" DataField="WBSName" SortExpression="WBSName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="专业" DataField="WBSBookCode" SortExpression="WBSBookCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="更改原因" DataField="PutUserName" SortExpression="PutUserName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="创建人" DataField="PutSpecialtyName" SortExpression="PutSpecialtyName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="修改状态" DataField="PutDeptName" SortExpression="WBSOwnerName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField HeaderText="查看" CommandName="ViewData" DataParamFields="DESIGNCHANGEID,ISOLD"
                EditItemClick="viewFormDetail">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=this.gvDesignChange.CheckedClientID %>";
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
