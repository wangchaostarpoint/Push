<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ProjectNotSignForm.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.Form.MDM.WF_ProjectNotSignForm" %>
<table class="tz-table">
    <tr>
        <td class="td-l">
            任务名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtTaskName" field="TASKNAME" tablename="MDM_PROJNOTSIGNFORM"
                activestatus="(23.发起流程)" SourceMode="SelectorPage" ShowJsonRowColName="true"
                DoCancel="true" ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name"
                ResultForControls="{'hiTaskInfoFormID':'id','txtProXYNumber':'PROXYNUMBER','txtCustomerName':'CUSTOMERNAME','txtProjectTypeName':'PROJECTTYPENAME','txtManagerName':'MANAGERNAME','txtTaskState':'TASKSTATE'}"
                req="1" PageUrl="~/MM/Obsolete/ProjectIssuedTaskSelector.aspx" OnClick="btnTask_Click">
            </zhongsoft:LightObjectSelector>
            <input id="hiTaskInfoFormID" type="hidden" field="TASKINFOFORMID" runat="server"
                tablename="MDM_PROJNOTSIGNFORM" />
        </td>
        <td class="td-l">
            委托书编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProXYNumber" field="PROXYNUMBER"
                class="kpms-textbox" readonly="readonly" tablename="MDM_PROJNOTSIGNFORM" activestatus="(23.发起流程)">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            业主名称
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText runat="server" ID="txtCustomerName" field="CUSTOMERNAME"
                class="kpms-textbox" activestatus="(23.发起流程)" readonly="readonly" tablename="MDM_PROJNOTSIGNFORM">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            工程类型
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectTypeName" field="PROJECTTYPENAME"
                class="kpms-textbox" activestatus="(23.发起流程)" readonly="readonly" tablename="MDM_PROJNOTSIGNFORM">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            经营经理
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtManagerName" field="MANAGERNAME"
                class="kpms-textbox" activestatus="(23.发起流程)" readonly="readonly" tablename="MDM_PROJNOTSIGNFORM">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            任务状态
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText runat="server" ID="txtTaskState" field="TASKSTATE" class="kpms-textbox"
                activestatus="(23.发起流程)" readonly="readonly" tablename="MDM_PROJNOTSIGNFORM">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td colspan="6" height="25" style="font-weight: bold; text-align: center">
            不签委托书项目
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvNotSignProjList" runat="server" UseDefaultDataSource="true"
                DataKeyNames="PROJNOTSIGNDETAILID" OnRowCommand="gvNotSignProjList_RowCommand"
                ShowExport="true" BindGridViewMethod="BindNotSignProj" OnRowDataBound="gvProject_RowDataBound">
                <Columns>
                    <zhongsoft:LightBoundField DataField="PROJECTCODE" HeaderText="项目编号" ItemStyle-Wrap="false">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="PROJECTNAME" HeaderText="项目名称" MaxLength="20"
                        Width="200">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="PROJECTTYPENAME" HeaderText="工程类型">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="PhaseName" HeaderText="设计阶段">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="ManagerUserName" HeaderText="项目设总" Width="70">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="项目状态" ItemStyle-Width="70px">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbProjectState" Text='<%#Eval("PROJECTSTATE") %>'></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" DeleteText="您确认删除该项目{0}吗？"
                        DeleteTipField="PROJECTCODE">
                    </zhongsoft:LightButtonField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr>
        <tr class="trProject">
            <td colspan="6" height="25" style="font-weight: bold; text-align: center">
                任务关联项目
            </td>
        </tr>
        <td class="td-m" colspan="6" style="text-align: right">
            <asp:Button ID="btnAddToNotSign" displaystatus="(3.发起流程)(3.修改流程)" runat="server"
                Text="确定选中项目为不签项目" OnClientClick="return checkSelect();" OnClick="btnAddToNotSign_Click" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvAllProj" runat="server" UseDefaultDataSource="true"
                BindGridViewMethod="BindProjOfTask" DataKeyNames="ORGANIZATIONID" OnRowDataBound="gvProject_RowDataBound">
                <Columns>
                    <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="全选">
                        <HeaderTemplate>
                            <asp:CheckBox ID="cbIsAllSelect" runat="server" onclick="selectAll(this)" Text="全选">
                            </asp:CheckBox>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="cbIsSelect" runat="server"></asp:CheckBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="PROJECTCODE" HeaderText="项目编号" ItemStyle-Wrap="false">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="PROJECTNAME" HeaderText="项目名称" MaxLength="20"
                        Width="200">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="PROJECTTYPENAME" HeaderText="工程类型">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="PhaseName" HeaderText="设计阶段">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="ManagerUserName" HeaderText="项目设总" Width="70">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="项目状态" ItemStyle-Width="70px">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbProjectState" Text='<%#Eval("ProjectState") %>'></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<!---不签委托书主键ID--->
<input type="hidden" runat="server" id="hiProjNotSignFormID" field="PROJNOTSIGNFORMID"
    tablename="MDM_PROJNOTSIGNFORM" />
<script>
    //全选
    function selectAll(obj) {
        var $cbChecked = $("#<%=gvAllProj.ClientID %> [id$=cbIsSelect]");
        if ($(obj)[0].checked) {
            for (var i = 0; i < $cbChecked.length; i++) {
                $($cbChecked[i])[0].checked = true;
            }
        }
        else {
            for (var i = 0; i < $cbChecked.length; i++) {
                $($cbChecked[i])[0].checked = false;
            }
        }
    }

    //确定已选中项目信息
    function checkSelect() {
        var count = 0;
        $("input[id$=cbIsSelect]").each(function () {
            if ($(this)[0].checked == true) {
                count = count + 1;
            }
        });
        if (count == 0) {
            alert("请选择不签项目");
            return false;
        }
    }
</script>
