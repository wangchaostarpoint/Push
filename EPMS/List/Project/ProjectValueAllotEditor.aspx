<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectValueAllotEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Project.ProjectValueAllotEditor" Title="项产值分配"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                业务板块
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtBusinessPlate" runat="server" readonly="readonly"
                    activestatus="(23.*)" maxlength="16" class="kpms-textbox" />
            </td>
            <td colspan="5" class="td-m">
            </td>
        </tr>
        <tr content='project'>
            <td class="td-l">
                项目名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3" style="white-space: nowrap">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectProject" IsMutiple="false"
                    PageWidth="850" SelectPageMode="Dialog" ResultForControls="{'hiOrganizationID':'id','tbProjectCode':'ProjectCode','txtManagerUserName':'ManagerUserName','txtProjectScale':'ProjectScale','txtPhaseName':'PhaseName'}"
                    EnableTheming="false" Text="选择项目" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                    ShowJsonRowColName="true" ResultAttr="name" FilterFunction="getFilter()" activestatus="(23.*)" />
            </td>
            <td class="td-l">
                项目编号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="tbProjectCode" runat="server" readonly="readonly" activestatus="(23.*)"
                    maxlength="16" class="kpms-textbox" />
                <input type="hidden" id="hiOrganizationId" runat="server" />
            </td>
        </tr>
        <tr content='project'>
            <td class="td-l">
                项目规模
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtProjectScale" runat="server" readonly="readonly"
                    activestatus="(23.*)" maxlength="16" class="kpms-textbox" />
            </td>
            <td class="td-l">
                项目阶段
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtPhaseName" runat="server" readonly="readonly" activestatus="(23.*)"
                    maxlength="16" class="kpms-textbox" />
            </td>
            <td class="td-l">
                设总
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtManagerUserName" runat="server" activestatus="(23.*)"
                    class="kpms-textbox" readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td colspan="6" class="td-m">
                <div class="aStyle-red" style="float: left; margin-top:5px;">
                    计算默认值说明：<asp:Label ID="lbMassage" runat="server"></asp:Label>通过“计算默认值”之后可以再调整
                </div>
                <div style=" float:right;">  <asp:Button ID="btnSetDefaultValue" runat="server" Text="计算默认值" activestatus="(3.*)"
                        OnClick="btnSetDefaultValue_Clict" OnClientClick ="setDefaultValue()" />
                </div> 
            </td>
        </tr>
        <tr>
            <td colspan="6" class="td-m">
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
                    PageSize="15" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                    DataKeyNames="ProjectDeptValueID" UseDefaultDataSource="true" OnRowDataBound="gvList_RowDataBound"
                    EmptyDataText="没有要查找的数据" OnRowCommand="gvList_RowCommand">
                    <PagerStyle HorizontalAlign="Right"></PagerStyle>
                    <Columns>
                        <zhongsoft:LightBoundField DataField="SingleName" HeaderText="单项" HtmlEncode="false">
                            <ItemStyle Width="60px" />
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="DeptName" HeaderText="部门" HtmlEncode="false">
                            <ItemStyle Width="60px" />
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="分配产值">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox ID="tbAllotValue" runat="server" CssClass="kpms-textbox-money"
                                    EnableTheming="false" Text='<%#Eval("AllotValue") %>' Regex="^([1-9]\d{0,11}|[0])(\.\d{1,2})?$" errmsg="请输入正数，最多12位整数，2位小数"> 
                                </zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="备注">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox ID="tbMemo" runat="server" CssClass="kpms-textbox" EnableTheming="false"
                                    Text='<%#Eval("Memo") %>' MaxLength="20"> 
                                </zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input type="hidden" id="hiBusinessCommonID" runat="server" tablename="BusinessCommon"
        field="BusinessCommonID" />
    <input type="hidden" id="hiOtherColumnsXml" runat="server" tablename="BusinessCommon"
        field="OtherColumnsXml" />
    <script type="text/javascript">
        function getFilter() {
            return { BusinessPlateID: "<%=BusinessPlateID %>" };
        }
        function initCustomerPlugin() {
            var xml = $("#<%=hiOtherColumnsXml.ClientID %>").val();
            if (xml == "" && "<%=ActionType %>" == "Update") {
                $("[content='project']").hide();
            }
        }
        function setDefaultValue() {
            parent.returnValue = "Saved";
            return true;
        }
    </script>
</asp:Content>
