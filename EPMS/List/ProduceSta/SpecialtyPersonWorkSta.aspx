<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SpecialtyPersonWorkSta.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.ProduceSta.SpecialtyPersonWorkSta" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">分院</span><span>
        <zhongsoft:LightDropDownList id="ddlDept" runat="server" class="kpms-ddlsearch" enabletheming="false"
        AutoPostBack="true" OnSelectedIndexChanged="ddlDept_SelectedIndexChanged">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">专业室</span><span>
        <zhongsoft:LightDropDownList id="ddlRoom" runat="server" class="kpms-ddlsearch" enabletheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">专业</span><span>
        <zhongsoft:LightDropDownList id="ddlSpecial" runat="server" class="kpms-ddlsearch"
            enabletheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
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
        ShowPageSizeChange="true" OnRowDataBound="gvProjStatistics_RowDataBound" UseDefaultDataSource="false"
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
            <zhongsoft:LightBoundField HeaderText="完成工日" DataField="CompleteWorke" ItemStyle-HorizontalAlign="Right">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="其中：前期项目工日" DataField="PreProWorkload" ItemStyle-HorizontalAlign="Right">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="其中：施工图工日" DataField="ConstructWorkload" ItemStyle-HorizontalAlign="Right">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="项目明细" ItemStyle-HorizontalAlign="Center"
                ItemStyle-Width="35px">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="btnProductView" EnableTheming="false">
                                              <img alt="" style="cursor: pointer"  src="<%=WebAppPath%>/Themes/Images/btn_dg_view.gif" 
                                                onclick="return showDetail('<%#Eval("WorkerCode")%>');" />                        
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>
        function showDetail(userCode, bizId) {
            var json = { userCode: userCode };
            var url = buildQueryUrl('EPMS/List/ProduceSta/SpecialtyPersonProjList.aspx', json);
            showDivDialog(url, null, 1000, 600, null);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>