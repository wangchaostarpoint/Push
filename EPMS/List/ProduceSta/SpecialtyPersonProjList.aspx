<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SpecialtyPersonProjList.aspx.cs" Title="按项目工作量统计"
    Inherits="Zhongsoft.Portal.EPMS.List.ProduceSta.SpecialtyPersonProjList" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="toolBar" runat="server">
<span class="filter-block"><span class="filter-block-lb">日期范围</span> <span>
        <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtSProjectFormDate" runat="server"
            readonly="readonly" compare="1"/>
        <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtFProjectFormDate"
            runat="server" readonly="readonly" compare="1" />
    </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvProjStatistics" AutoGenerateColumns="false" 
        ShowExport="true" HideFieldOnExport="全部" runat="server" BindGridViewMethod="BindDataGrid"
        ShowPageSizeChange="true" OnRowDataBound="gvProjStatistics_RowDataBound" UseDefaultDataSource="true" 
        FooterStyle-ForeColor="Red" ShowFooter="true" PageSize="10" >
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="姓名" DataField="WorkerName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="定额工日" DataField="CompleteWorke" ItemStyle-HorizontalAlign="Right">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="查看" ItemStyle-HorizontalAlign="Center"
                ItemStyle-Width="35px">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="btnProductView" EnableTheming="false">
                                              <img alt="" style="cursor: pointer"  src="<%=WebAppPath%>/Themes/Images/btn_dg_view.gif" 
                                                onclick="return showDetail('<%#Eval("WorkerCode")%>','<%#Eval("ProjectCode")%>');" />                        
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>
        function showDetail(userCode, projectCode) {
            var json = { userCode: userCode, projectCode: projectCode };
            var url = buildQueryUrl('EPMS/List/ProduceSta/SpecialtyPersonRollList.aspx', json);
            showDivDialog(url, null, 1000, 600, null);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>