<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeptOptValueList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Plan.DeptOptValueList" Title="部门产值一览表" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false"
        ShowExport="true" AllowPaging="true" PageSize="15" UseDefaultDataSource="true" AllowFrozing="true" FrozenColNum="2"
        DataKeyNames="DeptID" BindGridViewMethod="BindGrid" OnRowCreated="gvList_RowCreated" OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <zhongsoft:LightBoundField HeaderText="部门" DataField="DeptName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="年度计划产值" DataField="DeptValue" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="1" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a id="aPlanMonth1" runat="server" class="aStyle"></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="2" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a id="aPlanMonth2" runat="server" class="aStyle"></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="3" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a id="aPlanMonth3" runat="server" class="aStyle"></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="4" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a id="aPlanMonth4" runat="server" class="aStyle"></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="5" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a id="aPlanMonth5" runat="server" class="aStyle"></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="6" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a id="aPlanMonth6" runat="server" class="aStyle"></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="7" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a id="aPlanMonth7" runat="server" class="aStyle"></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="8" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a id="aPlanMonth8" runat="server" class="aStyle"></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="9" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a id="aPlanMonth9" runat="server" class="aStyle"></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="10" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a id="aPlanMonth10" runat="server" class="aStyle"></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="11" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a id="aPlanMonth11" runat="server" class="aStyle"></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="12" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a id="aPlanMonth12" runat="server" class="aStyle"></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="1" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a id="aFactMonth1" runat="server" class="aStyle"></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="2" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a id="aFactMonth2" runat="server" class="aStyle"></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="3" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a id="aFactMonth3" runat="server" class="aStyle"></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="4" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a id="aFactMonth4" runat="server" class="aStyle"></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="5" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a id="aFactMonth5" runat="server" class="aStyle"></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="6" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a id="aFactMonth6" runat="server" class="aStyle"></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="7" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a id="aFactMonth7" runat="server" class="aStyle"></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="8" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a id="aFactMonth8" runat="server" class="aStyle"></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="9" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a id="aFactMonth9" runat="server" class="aStyle"></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="10" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a id="aFactMonth10" runat="server" class="aStyle"></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="11" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a id="aFactMonth11" runat="server" class="aStyle"></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="12" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <a id="aFactMonth12" runat="server" class="aStyle"></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="累计完成产值" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbTotalValue"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="完成年计划比例" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbCompleteRate"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        //查看产值信息
        function viewValueInfo(planYear, planMonth) {
            var json = { planYear: planYear, planMonth: planMonth };
            var url = buildQueryUrl('EPMS/List/Plan/MonthlyOptValueList.aspx', json);
            showDivDialog(encodeURI(url), "", 1000, 550, null);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
