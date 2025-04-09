<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectFlowDetail.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Project.ProjectFlowDetail" MasterPageFile="~/UI/Master/ObjectList.Master"
    Title="项目流程信息台账（二级目录）" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
            
            <span class="filter-block"><span class="filter-block-lb">流程名称</span> <span>
        <asp:TextBox ID="txtProcessInstanceName" runat="server"
                    class="kpms-textboxsearch"  MaxLength="64" search="1" EnableTheming="false" />
                    
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">流程开始时间</span> <span>
        <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtSSProjectFormDate"
            runat="server" readonly="readonly" compare="1" />
        <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtFSProjectFormDate"
            runat="server" readonly="readonly" compare="1" />
    </span></span><span class="filter-block"><span class="filter-block-lb">流程结束时间</span>
        <span>
            <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtSFProjectFormDate"
                runat="server" readonly="readonly" compare="2" />
            <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtFFProjectFormDate"
                runat="server" readonly="readonly" compare="2" />
        </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
    <asp:Label runat="server" ID="lbTitle" Style="font-weight: bold"></asp:Label>&nbsp;
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvProjectFlow" AutoGenerateColumns="false"
        DataKeyNames="KeyId" ShowExport="true" HideFieldOnExport="全部" runat="server"
        BindGridViewMethod="BindFlowDetail" PageSize="10" UseDefaultDataSource="true"
        ShowPageSizeChange="true" Width="100%" OnRowDataBound="gvProjectFlow_RowDataBound">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="流程名称" DataField="ProcessInstanceName" Width="450">
            </zhongsoft:LightBoundField>
            <%--  <zhongsoft:LightBoundField HeaderText="流程状态" DataField="STATE">
            </zhongsoft:LightBoundField>--%>
            <zhongsoft:LightTemplateField HeaderText="流程状态">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbSTATE" Text='<%#Eval("STATE") %>'></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="创建时间" DataField="StartDateTime" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="结束时间" DataField="FinishDateTime" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="查看流程" ItemStyle-HorizontalAlign="Center"
                ItemStyle-Width="50px">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false" ToolTip="查看" CommandName="FlowInfo">
                                    <img alt="查看" src="<%=this.WebAppPath %>/Themes/Images/btn_dg_detail.gif" />
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <input type="hidden" runat="server" id="hiFormIDs" />
    <script type="text/javascript">
        function viewFormDetail(formId, processId) {
            var url = '<%=this.WebAppPath %>/Sys/Workflow/FormDetail.aspx?actionType=1&FormID=' + formId + '&prcinstid=' + processId;
            window.open(encodeURI(url), "", "");
            return false;
        }

        function viewForm(formId,bizId, extendedAttribute) {
            var url = '/Custom/List/C_FormDetailLoading.aspx';
            var json = { formID: formId, bizId: bizId, IsOld: 2, ExtendedAttribute: extendedAttribute };
            url = buildQueryUrl(url, json);
            window.open(url);
            return false;
        }

    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
