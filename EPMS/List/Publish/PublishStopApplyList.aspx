<%@ Page Language="C#" AutoEventWireup="true" Title="出版终止申请台帐" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="PublishStopApplyList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Publish.PublishStopApplyList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span>项目编号/名称 </span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbProject" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span><span class="filter-block"><span>申请部门 </span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlDept" class="kpms-ddlsearch" EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span>专业 </span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlSpe" class="kpms-ddlsearch" EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span>卷册编号/名称 </span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbRoll" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span><span class="filter-block"><span>申请人 </span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbApplyUser" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span><span class="filter-block"><span>申请日期 </span><span>
        <zhongsoft:XHtmlInputText ID="txtApplyStart" runat="server" class="kpms-textbox-date"
            readonly="readonly" />
        -
        <zhongsoft:XHtmlInputText ID="txtApplyEnd" runat="server" class="kpms-textbox-date"
            readonly="readonly" />
    </span></span><span class="filter-block"><span>批准日期 </span><span>
        <zhongsoft:XHtmlInputText ID="txtApproveStart" runat="server" class="kpms-textbox-date"
            readonly="readonly" />
        -
        <zhongsoft:XHtmlInputText ID="txtApproveEnd" runat="server" class="kpms-textbox-date"
            readonly="readonly" />
    </span></span><span class="filter-block"><span>出版接受日期 </span><span>
        <zhongsoft:XHtmlInputText ID="txtReceiveStart" runat="server" class="kpms-textbox-date"
            readonly="readonly" />
        -
        <zhongsoft:XHtmlInputText ID="txtReceiveEnd" runat="server" class="kpms-textbox-date"
            readonly="readonly" />
    </span></span><span class="filter-block"><span>状态 </span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlState" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="true"
        PageSize="10" AutoGenerateColumns="false" ShowExport="true" DataKeyNames="PublishStopApplyFormID"
        UseDefaultDataSource="false" BindGridViewMethod="BindGrid" OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="项目名称" ShowToolTip="true"
                HeaderStyle-Width="150px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="卷册编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSName" HeaderText="卷册名称" ShowToolTip="true"
                HeaderStyle-Width="150px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ApplySpecialtyName" HeaderText="专业">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ApplyUserName" HeaderText="卷册负责人">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ApplyDeptName" HeaderText="申请部门">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ApplyDate" HeaderText="申请时间" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="State" HeaderText="处理状态">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="查看" ItemStyle-HorizontalAlign="Center"
                ItemStyle-Width="40px">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnViewForm" EnableTheming="false">
                        <img runat="server" src="~/Themes/Images/btn_dg_detail.gif" />
                    </asp:LinkButton>
                    <input type="hidden" runat="server" id="hiExtendedAttribute" value='<%#Eval("ExtendedAttribute") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightButtonField HeaderText="查看" CommandName="viewForm" DataParamFields="PublishStopApplyFormID,ExtendedAttribute"
                EditItemClick="viewForm" Visible="false">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">

        //打开流程页面
        function viewForm(bizId, extendAttr) {
            var json = { bizid: bizId, ExtendedAttribute: extendAttr, IsOld: 2 };
            var url = buildQueryUrl('Custom/List/C_FormDetailLoading.aspx', json);
            window.open(url);
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
