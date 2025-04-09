<%@ Page Title="投标项目台帐" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="TenderEntityList.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.MM.TenderEntityList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">业务版块</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlBusinessPlat" CssClass="kpms-ddlsearch" EnableTheming="False" />
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">投标状态</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlIsWinBid" CssClass="kpms-ddlsearch" EnableTheming="False" />
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">投标编号</span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbBidNumber" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">工程名称</span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbProjectName" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">招标单位</span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbBidUnitName" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">开标日期</span><span>
        <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtBidstartDate" runat="server" readonly="readonly" />
        -
        <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtBidEndDate" runat="server" readonly="readonly" />
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView runat="server" ID="gvList" AllowPaging="True" PageSize="15" UseDefaultDataSource="True" BindGridViewMethod="BindData" HideFieldOnExport="发起投标工作策划,发起投标文件评审"
        OnRowCommand="gvList_OnRowCommand" ShowExport="True" OnExport="gvList_OnExport" OnRowDataBound="gvList_OnRowDataBound" AllowFrozing="True" FrozenColNum="7">
        <Columns>
            <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px">
                <ItemTemplate>
                    <%#((GridViewRow)Container).DataItemIndex + 1 %>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="showTender" ToolTip="查看" DataParamFields="TenderEntityID"
                ImageUrl="../../../Themes/Images/btn_dg_view.gif">
            </zhongsoft:LightButtonField>
            <zhongsoft:LightButtonField HeaderText="编辑" ToolTip="编辑" EditItemClick="editTender" DataParamFields="TenderEntityID"
                ImageUrl="../../../Themes/Images/btn_dg_edit.gif">
            </zhongsoft:LightButtonField>
            <zhongsoft:LightButtonField HeaderText="添加开标记录" ToolTip="添加开标记录" EditItemClick="AddToTenderOpenRecord" DataParamFields="TenderEntityID"
                ImageUrl="../../../Themes/Images/btn_dg_add.gif">
            </zhongsoft:LightButtonField>
            <zhongsoft:LightTemplateField HeaderText="发起投标工作策划" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnStartWF" EnableTheming="False" OnClientClick="return false" ToolTip="发起投标工作策划">
                        <img alt="img" src="../../../Themes/Images/btn_submit.gif" onclick="return startBidPlanWF('<%# Eval("TenderEntityID") %>');"/>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="发起投标文件评审" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnStartWF" EnableTheming="False" OnClientClick="return false" ToolTip="发起投标文件评审">
                        <img alt="img" src="../../../Themes/Images/btn_submit.gif" onclick="return startBidProductWF('<%# Eval("TenderEntityID") %>');"/>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="投标编号" DataField="BidNumber" />
            <zhongsoft:LightBoundField HeaderText="负责部门" DataField="DutyDeptName" />
            <zhongsoft:LightBoundField HeaderText="所属工程包" DataField="ProjectPackage" />
            <zhongsoft:LightBoundField HeaderText="工程名称" DataField="ProjectName" />
            <zhongsoft:LightBoundField HeaderText="电压等级（kV）" DataField="VoltageGrade" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="工程情况说明" DataField="ProjectDescription" />
            <zhongsoft:LightBoundField HeaderText="工程规模" DataField="ProjectScale" />
            <zhongsoft:LightBoundField HeaderText="信息提供人" DataField="InfoProviderName" />
            <zhongsoft:LightBoundField HeaderText="预计开始日期" DataField="PlanStartTime" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField HeaderText="投标状态" DataField="TenderResult" />
            <zhongsoft:LightBoundField HeaderText="项目投资（万元）" ItemStyle-HorizontalAlign="Right" />
            <zhongsoft:LightBoundField HeaderText="预估合同额（万元）" ItemStyle-HorizontalAlign="Right" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <input type="hidden" runat="server" id="hiWFNames" value="投标工作策划,投标文件评审" />
    <asp:Button ID="btnTenderCallBack" runat="server" Visible="false" OnClick="btnTenderCallBack_OnClick" />
    <script type="text/javascript">
        //查看详细信息
        function showTender(id) {
            var url = buildBizUrl(1, id, "MM/List/MDM/TenderEditor.aspx", null);
            //return checkReturn(showModal(url, null, 1200, 1000));

            showDivDialog(url, null, 850, 550, null);
            return false;
        }

        function editTender(id) {
            var url = buildBizUrl(3, id, "MM/List/MDM/TenderEditor.aspx", null);
            //return checkReturn(showModal(url, null, 1200, 1000));

            showDivDialog(url, null, 850, 550, editTenderCallBack);
            return false;
        }

        //新建、编辑申请设备弹出层callback方法
        function editTenderCallBack() {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnTenderCallBack,"") %>
        }

        function AddToTenderOpenRecord(id) {
            var url = buildQueryUrl("MM/List/MDM/TenderOpenRecordEditor.aspx", { actionType: 2, TenderEntityID: id });
            //return checkReturn(showModal(url, null, 1200, 1000));

            showDivDialog(url, null, 850, 550, editTenderCallBack);
            return false;
        }

        //发起投标工作策划流程
        function startBidPlanWF(tenderEntityID) {
            var packageName ='<%=DtWorkflowFormDefinition.Select("FormName='投标工作策划'").Length>0?DtWorkflowFormDefinition.Select("FormName='投标工作策划'")[0]["PackageName"].ToString():""%>';
            var xpdlId ='<%=DtWorkflowFormDefinition.Select("FormName='投标工作策划'").Length>0?DtWorkflowFormDefinition.Select("FormName='投标工作策划'")[0]["XPDLID"].ToString():""%>';
            var formId ='<%=DtWorkflowFormDefinition.Select("FormName='投标工作策划'").Length>0?DtWorkflowFormDefinition.Select("FormName='投标工作策划'")[0]["FormID"].ToString():""%>';
            var url = '<%=WebAppPath %>/Sys/Workflow/FormDetail.aspx?actionType=2';
            var json = { tenderEntityID: tenderEntityID, packageName: packageName, xpdlId: xpdlId, formId: formId, ver: "|" };
            url = buildQueryUrl(url, json);
            window.open(url);
            return false;
        }

        //发起投标文件评审流程
        function startBidProductWF(tenderEntityID) {
            var packageName ='<%=DtWorkflowFormDefinition.Select("FormName='投标文件评审'").Length>0?DtWorkflowFormDefinition.Select("FormName='投标文件评审'")[0]["PackageName"].ToString():""%>';
            var xpdlId ='<%=DtWorkflowFormDefinition.Select("FormName='投标文件评审'").Length>0?DtWorkflowFormDefinition.Select("FormName='投标文件评审'")[0]["XPDLID"].ToString():""%>';
            var formId ='<%=DtWorkflowFormDefinition.Select("FormName='投标文件评审'").Length>0?DtWorkflowFormDefinition.Select("FormName='投标文件评审'")[0]["FormID"].ToString():""%>';
            var url = '<%=WebAppPath %>/Sys/Workflow/FormDetail.aspx?actionType=2';
            var json = { tenderEntityID: tenderEntityID, packageName: packageName, xpdlId: xpdlId, formId: formId, ver: "|" };
            url = buildQueryUrl(url, json);
            window.open(url);
            return false;
        }

    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
