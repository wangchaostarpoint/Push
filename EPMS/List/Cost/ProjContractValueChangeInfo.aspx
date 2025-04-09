<%@ Page Title="合同额变更记录" Language="C#" AutoEventWireup="true" CodeBehind="ProjContractValueChangeInfo.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Cost.ProjContractValueChangeInfo" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="10" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        UseDefaultDataSource="true" BindGridViewMethod="BindGrid" OnRowDataBound="gvList_RowDataBound"
        OnRowCommand="gvList_RowCommand">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="项目编号">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbProjectCode" Text='<%# Eval("ProjectCode")%>'></asp:Label>
                    <input type="hidden" id="hiFormID" runat="server" value='<%#Eval("FORMID") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="项目名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="LASTMODIFYDATE" HeaderText="变更日期" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="BELONGTYPE" HeaderText="类型">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PARAMSPLITITEMNAME" HeaderText="分项名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ITEMVALUE" HeaderText="合同额(万元)" ItemStyle-HorizontalAlign="right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="查看" HeaderStyle-Width="40px">
                <ItemTemplate>
                    <asp:LinkButton ID="lbView" runat="server" EnableTheming="false" CommandName="FormInfo"
                        CommandArgument='<%# DataBinder.Eval(Container.DataItem, "FORMID") %>'>
                    <img alt="查看流程信息" src="../../../Themes/Images/btn_dg_detail.gif" style="cursor: hand" title="查看流程信息" border="0"/>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">

        //查看流程信息
        function viewInfo(bizId, isOld) {
            var url = '/Custom/List/C_FormDetailLoading.aspx';
            var json = { bizId: bizId, isOld: isOld };
            url = buildQueryUrl(url, json);
            try {
                window.open(url);
            }
            catch (ex) {
            }
            return false;
        }
    </script>
</asp:Content>
