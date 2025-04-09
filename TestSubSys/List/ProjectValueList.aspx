<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectList.Master" Title="列表合并行列"
    CodeBehind="ProjectValueList.aspx.cs" Inherits="Zhongsoft.Portal.BMIS.List.ValueManage.ProjectValueList" %>

<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table class="tz-table" width="100%">
        <tr>
            <td>
                <asp:DropDownList runat="server" ID="ddlYear" Visible="false">
                </asp:DropDownList>
                <zhongsoft:LightDropDownList runat="server" ID="ddlProjectType" OnSelectedIndexChanged="ddlProjectType_SelectedIndexChanged"
                    AutoPostBack="true" Visible="false">
                </zhongsoft:LightDropDownList>
                设计阶段
                <zhongsoft:LightDropDownList runat="server" ID="ddlPhase" Width="150">
                </zhongsoft:LightDropDownList>
            </td>
            <td>
                <asp:Label runat="server" ID="lbMsg" Text="单位：万元" Font-Bold="true" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true"
        AutoGenerateColumns="false" AllowPaging="true" PageSize="10" ShowExport="true"
        OnExport="gvList_Export" OnRowCommand="gvList_RowCommand" Width="100%" OnRowDataBound="gvList_RowDataBound"
        ShowFooter="true" OnBeforeExporting="gvList_BeforeExporting">
        <Columns>
            <asp:BoundField DataField="ProjectPhaseCode" HeaderText="项目编号" HeaderStyle-Width="10%" />
            <asp:BoundField DataField="ProjectPhaseName" HeaderText="项目名称" HeaderStyle-Width="30%" />
            <asp:BoundField DataField="BelongType" HeaderText="模块" ItemStyle-Wrap="false" />
            <asp:BoundField DataField="ContractValue" HeaderText="合同额" ItemStyle-HorizontalAlign="Right"
                DataFormatString="{0:F4}" />
            <asp:BoundField DataField="MValue1" HeaderText="1月产值" ItemStyle-HorizontalAlign="Right"
                DataFormatString="{0:F4}" />
            <asp:BoundField DataField="MValue2" HeaderText="2月产值" ItemStyle-HorizontalAlign="Right"
                DataFormatString="{0:F4}" />
            <asp:BoundField DataField="MValue3" HeaderText="3月产值" ItemStyle-HorizontalAlign="Right"
                DataFormatString="{0:F4}" />
            <asp:BoundField DataField="MValue4" HeaderText="4月产值" ItemStyle-HorizontalAlign="Right"
                DataFormatString="{0:F4}" />
            <asp:BoundField DataField="MValue5" HeaderText="5月产值" ItemStyle-HorizontalAlign="Right"
                DataFormatString="{0:F4}" />
            <asp:BoundField DataField="MValue6" HeaderText="6月产值" ItemStyle-HorizontalAlign="Right"
                DataFormatString="{0:F4}" />
            <asp:BoundField DataField="MValue7" HeaderText="7月产值" ItemStyle-HorizontalAlign="Right"
                DataFormatString="{0:F4}" />
            <asp:BoundField DataField="MValue8" HeaderText="8月产值" ItemStyle-HorizontalAlign="Right"
                DataFormatString="{0:F4}" />
            <asp:BoundField DataField="MValue9" HeaderText="9月产值" ItemStyle-HorizontalAlign="Right"
                DataFormatString="{0:F4}" />
            <asp:BoundField DataField="MValue10" HeaderText="10月产值" ItemStyle-HorizontalAlign="Right"
                DataFormatString="{0:F4}" />
            <asp:BoundField DataField="MValue11" HeaderText="11月产值" ItemStyle-HorizontalAlign="Right"
                DataFormatString="{0:F4}" />
            <asp:BoundField DataField="MValue12" HeaderText="12月产值" ItemStyle-HorizontalAlign="Right"
                DataFormatString="{0:F4}" />
            <asp:TemplateField HeaderText="查看" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnView" runat="server" CommandName="view" EnableTheming="false"> 
                        <img alt="" src="/Portal/Themes/Images/btn_chakan.gif" border='0'
                          onclick='return ViewProject("<%#Eval("ProjectPhaseID") %>");' />
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle Font-Bold="true" />
    </zhongsoft:LightPowerGridView>

    <script type="text/javascript">
        //回车键默认单击查看
        function search() {
            if (event.keyCode == 13) {
                event.returnValue = false;
                event.cancel = true;
                $("[cont='searchResult']").click();
            }
        }

        //点击查看对应项目的产值信息
        function ViewProject(projectPhaseId) {
            var url = "/Portal/BMIS/List/ValueManage/ProjectValueView.aspx?projectPhaseId=" + projectPhaseId;
            //bizId不一定非是guid
            var bizid = projectPhaseId;
            var bizName = "项目产值查看";
            window.parent.parent.$("#tab-container").opentabitem({ id: bizid, text: bizName, url: url, isactive: true, closeable: true }, true);
            return false;
        }
    </script>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
