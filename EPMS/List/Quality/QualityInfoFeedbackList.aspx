<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QualityInfoFeedbackList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Quality.QualityInfoFeedbackList" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>

<%@ Register Src="~/EPMS/UI/Quality/QualityDeptInfo.ascx" TagName="QualityDeptInfo"
    TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">项目名称/编号</span> <span>
        <asp:TextBox ID="tbProjectInfo" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
    </span></span><span class="filter-block" style="display: none"><span class="filter-block-lb">
        任务类型</span> <span>
            <zhongsoft:LightDropDownList ID="ddlWBSType" runat="server" class="kpms-ddlsearch"
                EnableTheming="false">
            </zhongsoft:LightDropDownList>
        </span></span><span class="filter-block"><span class="filter-block-lb">专业</span> <span>
            <zhongsoft:LightDropDownList ID="ddlSpe" runat="server" class="kpms-ddlsearch" EnableTheming="false">
            </zhongsoft:LightDropDownList>
        </span></span><span class="filter-block"><span class="filter-block-lb">名称/编号</span>
            <span>
                <asp:TextBox ID="tbWBSInfo" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
                    EnableTheming="false"></asp:TextBox>
            </span></span><span class="filter-block"><span class="filter-block-lb">信息状态</span> <span>
                <zhongsoft:LightDropDownList ID="ddlState" runat="server" class="kpms-ddlsearch"
                    EnableTheming="false">
                </zhongsoft:LightDropDownList>
            </span></span>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="advSearch" runat="server">
    <span class="filter-block"><span class="filter-block-lb">主题词</span> <span>
        <asp:TextBox ID="tbQualityTheme" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">审批意见</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlApproveOpinion" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <asp:LinkButton ID="btnDel" runat="server" EnableTheming="false" CssClass="btn-query"
        OnClick="btnDel_Click" Visible="false"><span>删除</span></asp:LinkButton>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="15" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        AllowFrozing="true" FrozenColNum="3" DataKeyNames="QualityID,QualityFeedBackID"
        UseDefaultDataSource="false" BindGridViewMethod="BindDataGrid" OnRowDataBound="gvList_RowDataBound"
        EmptyDataText="没有要查找的数据">
        <PagerStyle HorizontalAlign="Right"></PagerStyle>
        <Columns>
            <%--<zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridView">
            </zhongsoft:LightCheckField>--%>
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="项目名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSType" HeaderText="任务类型" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSName" HeaderText="名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="QualityTheme" HeaderText="主题词" ShowToolTip="true"
                HeaderStyle-Width="150px" MaxLength="13">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectNature" HeaderText="项目性质">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="SpecialtyName" HeaderText="专业">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="QualityStateToList" HeaderText="信息状态">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ApproveOpinion" HeaderText="审批意见" ShowToolTip="true"
                Width="150px" MaxLength="13">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WriteUserName" HeaderText="填写人">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField HeaderText="查看流程" CommandName="viewData" CausesValidation="false"
                DataParamFields="QualityFeedBackID,IsOld" EditItemClick="viewFormDetail">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <input type="hidden" runat="server" id="hiKey" />
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
        $("#<%=btnDel.ClientID %>").hide();

        function checkGridView(array) {
            $("#<%=hiKey.ClientID %>").val(array);
            transParamToToolBar(array, null);
            if (array != "") {
                $("#<%=btnDel.ClientID %>").show();
            }
            else {
                $("#<%=btnDel.ClientID %>").hide();
            }
        }
        function controlBtn() {
            $("#<%=btnDel.ClientID %>").hide();
        }  
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
    <uc1:QualityDeptInfo ID="ucQualityDeptInfo" runat="server" />
</asp:Content>
