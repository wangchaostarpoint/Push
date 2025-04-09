<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OldWBSBookSelector.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Obsolete.OldWBSBookSelector" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    Title="历史工程任务书" %>

<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <!--项目、卷册、工程类型、专业-->
    <table width="100%" style="text-align: left;">
        <tr>
            <td>
                项目名称/编号
                <zhongsoft:LightTextBox ID="tbProjectInfo" runat="server" EnableTheming="false" CssClass="kpms-textboxsearch">
                </zhongsoft:LightTextBox>
                卷册名称/编号
                <zhongsoft:LightTextBox ID="tbWBSInfo" runat="server" EnableTheming="false" CssClass="kpms-textboxsearch">
                </zhongsoft:LightTextBox>
                <br />
                工程类型
                <zhongsoft:LightDropDownList ID="ddlProjectType" runat="server" EnableTheming="false"
                    CssClass="kpms-ddlsearch">
                </zhongsoft:LightDropDownList>
                设计阶段
                <zhongsoft:LightDropDownList ID="ddlPhase" runat="server" EnableTheming="false" CssClass="kpms-ddlsearch">
                </zhongsoft:LightDropDownList>
                专业
                <zhongsoft:LightDropDownList ID="ddlSpecialty" runat="server" EnableTheming="false"
                    CssClass="kpms-ddlsearch">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true" BindGridViewMethod="DoSelectByFilter"
        OnJsonClick="addObject" JsonClickMode="onclick" DataKeyNames="" ShowJsonRowColName="true"
        OnRowDataBound="gvList_RowDataBound">
        <Columns>
            
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="项目名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="卷册编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSName" HeaderText="卷册名称">
            </zhongsoft:LightBoundField>
            <%--<zhongsoft:LightBoundField DataField="BasisOrConditions" HeaderText="设计依据及主要原则">
            </zhongsoft:LightBoundField>--%>
            <zhongsoft:LightButtonField HeaderText="详细" CommandName="viewData" EditItemClick="viewDetail"
                DataParamFields="WBSBookID">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";

        function viewDetail(bizid) {
            viewFormDetail(bizid, 0);
            return false;
        }
    </script>
</asp:Content>
