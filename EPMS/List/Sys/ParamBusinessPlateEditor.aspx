<%@ Page Language="C#" AutoEventWireup="true" Title="业务板块参数编辑" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="ParamBusinessPlateEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.ParamBusinessPlateEditor" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <script src="../../UI/Script/EPMSGeneralScript.js" type="text/javascript"></script>
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">业务板块<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbType" TableName="EPMS_PARAMBUSINESSPLATE"
                    Field="BUSINESSPLATE" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">描述
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbDescription" TableName="EPMS_PARAMBUSINESSPLATE"
                    Field="DESCRIPTION" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr style="display: none">
            <td class="td-l">项目扩展数据表
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbExtend" TableName="EPMS_PARAMBUSINESSPLATE"
                    Field="ProjectExtendDataTable" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">排序号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSort" TableName="EPMS_PARAMBUSINESSPLATE" Field="SORT"
                    Style="text-align: right; width: 70px;" activestatus="(23.*)" regex="^([1-9]\d{0,1}|0)$"
                    errmsg="请输入最多2位整数" runat="server"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">是否启用
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblFlag" RepeatDirection="Horizontal" TableName="EPMS_PARAMBUSINESSPLATE"
                    Field="FLAG" activestatus="(23.*)">
                    <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                    <asp:ListItem Value="0">不启用</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr style="display: none">
            <td class="td-l">归属的业务类型
            </td>
            <td class="td-m" colspan="3">
                <asp:CheckBox runat="server" ID="cbAllBizType" Text="选择全部业务类型" activestatus="(23.*)" />
                <asp:CheckBoxList runat="server" ID="cblBizType" RepeatDirection="Horizontal" RepeatColumns="5"
                    activestatus="(23.*)">
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr style="display: none">
            <td class="td-l">包括的项目类型
            </td>
            <td class="td-m" colspan="3">
                <asp:CheckBox runat="server" ID="cbAllProjType" Text="选择全部项目类型" activestatus="(23.*)" />
                <asp:CheckBoxList runat="server" ID="cblProjType" RepeatDirection="Horizontal" RepeatColumns="5"
                    activestatus="(23.*)">
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td colspan="4" class="flexible">对应部门<span style="float: right"><asp:Button runat="server" ID="addValueDefaultOfDept"
                OnClientClick="return addDefaultOfDept()" displaystatus="(3.*)" CssClass="btn"
                Text="添加对应部门" /></span>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
                    PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                    DataKeyNames="ValueDefaultOfDeptID" UseDefaultDataSource="true" BindGridViewMethod="BindGrid"
                    OnRowCommand="gvList_RowCommand" OnRowDataBound="gvList_RowDataBound">
                    <Columns>
                        <zhongsoft:LightBoundField DataField="BusinessPlate" HeaderText="业务板块">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="SingleName" HeaderText="单项" Visible="false">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="DeptName" HeaderText="对应部门">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="PartakeType" HeaderText="参与类型" Visible="false">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="AllotRatio" HeaderText="默认分配比例" ItemStyle-HorizontalAlign="Right" Visible="false">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="Memo" HeaderText="备注" MaxLength="10" Visible="false">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightButtonField HeaderText="编辑" CommandName="editData" EditItemClick="editDefaultOfDept" Visible="false"
                            DataParamFields="ValueDefaultOfDeptID">
                        </zhongsoft:LightButtonField>
                        <zhongsoft:LightButtonField HeaderText="删除" CommandName="deleteData" Visible="false">
                        </zhongsoft:LightButtonField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input id="hikeyID" type="hidden" tablename="EPMS_PARAMBUSINESSPLATE" field="PARAMBUSINESSPLATEID"
        runat="server" />
    <asp:Button ID="btnBindData" runat="server" Visible="false" OnClick="btnBindData_Click" />
    <input type="hidden" runat="server" id="hiDeptXml" />

    <script type="text/javascript">
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();

            //归属的业务类型
            initCBoxAll('<%=cblBizType.ClientID %>', '<%=cbAllBizType.ClientID %>');
            $('#<%=cblBizType.ClientID %> input:checkbox').live('click', function () {
                initCBoxAll('<%=cblBizType.ClientID %>', '<%=cbAllBizType.ClientID %>');
            });

            $('#<%=cbAllBizType.ClientID %>').live('change', function () {
                initCBoxList('<%=cblBizType.ClientID %>', '<%=cbAllBizType.ClientID %>');
            });

            //包括的项目类型
            initCBoxAll('<%=cblProjType.ClientID %>', '<%=cbAllProjType.ClientID %>');
            $('#<%=cblProjType.ClientID %> input:checkbox').live('click', function () {
                initCBoxAll('<%=cblProjType.ClientID %>', '<%=cbAllProjType.ClientID %>');
            });

            $('#<%=cbAllProjType.ClientID %>').live('change', function () {
                initCBoxList('<%=cblProjType.ClientID %>', '<%=cbAllProjType.ClientID %>');
            });
        }

        function addDefaultOfDept() {
            <%--var url = buildQueryUrl("/EPMS/List/Sys/ParamBusinessPlateDeptEditor.aspx", { actionType: 2, ParamBusinessPlateID:"<%=BusinessObjectId %>" });
            showDivDialog(url, null, 800, 500, editCallBack);
            return false;--%>
            var param = new InputParamObject("m");
            getTreeOrgs('<%=hiDeptXml.ClientID %>', param, null, editCallBack);
            return false;
        }

        function editDefaultOfDept(valueDefaultOfDeptID) {
            var url = buildQueryUrl("/EPMS/List/Sys/ParamBusinessPlateDeptEditor.aspx", { actionType: 3, bizid: valueDefaultOfDeptID });
            showDivDialog(url, null, 800, 500, editCallBack);
            return false;
        }

        function editCallBack(re) {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnBindData,"") %>
            return true;
        }
    </script>
</asp:Content>
