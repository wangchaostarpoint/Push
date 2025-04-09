<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    Title="员工分组" CodeBehind="UserGroupEditor.aspx.cs" Inherits="Zhongsoft.Portal.EHR.List.UserGroupEditor" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="BusinessObjectHolder">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                管理人
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtOWNERNAME" runat="server" class="kpms-textbox" readonly="readonly"
                    tablename="EHR_USERGROUP" field="OWNERNAME" activestatus="(23.*)">
                </zhongsoft:XHtmlInputText>
                <input type="hidden" id="hiOWNERID" runat="server" tablename="EHR_USERGROUP" field="OWNERID" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                分组名
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbUSERGROUPNAME" runat="server" tablename="EHR_USERGROUP"
                    field="USERGROUPNAME" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                权限
            </td>
            <td class="td-r">
                <asp:RadioButtonList ID="radISPUBLIC" runat="server" RepeatDirection="Horizontal"
                    activestatus="(23.*)">
                    <asp:ListItem Value="0" Text="私有" Selected="True"></asp:ListItem>
                    <asp:ListItem Value="1" Text="公有"  ></asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                排序<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:TextBox runat="server" ID="tbSort" CssClass="kpms-textbox" Width="40px" MaxLength="3"
                    req="1" Style="text-align: right" field="Sort" regex="^\d*$" errmsg="排序只能填写非负整数"
                    tablename="EHR_USERGROUP" activestatus="(23.*)"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                是否启用
            </td>
            <td class="td-r">
                <asp:RadioButtonList ID="radFLAG" runat="server" RepeatDirection="Horizontal" tablename="EHR_USERGROUP"
                    field="FLAG" activestatus="(23.*)">
                    <asp:ListItem Value="1" Text="启用" Selected="True"></asp:ListItem>
                    <asp:ListItem Value="0" Text="不启用"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="flexible" colspan="2">
                对应角色管理
                <asp:Button runat="server" ID="btnAdd" Text="添加" OnClick="btnAdd_Click" displaystatus="(3.*)" style="float: right" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false" ShowExport="false" AllowPaging="true" PageSize="10" UseDefaultDataSource="true" ShowPageSizeChange="true" DataKeyNames="UserGroupRoleID,DeptTypeID" OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand" BindGridViewMethod="UseControls.BindDataGrid">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="对应角色">
                            <ItemTemplate>
                                <zhongsoft:LightObjectSelector runat="server" ID="selRoles" field="RoleName" activestatus="(23.*)" IsMutiple="false" SelectPageMode="Dialog" ResultAttr="name" EnableTheming="false" ShowJsonRowColName="true" ResultForControls="{'hiRoleIds':'id'}" PageUrl="~/Sys/RoleUser/RoleSelector.aspx"></zhongsoft:LightObjectSelector>
                                <zhongsoft:LightTextBox runat="server" ID="hiRoleIds" field="RoleID" MaxLength="36" Text='<%#Eval("RoleID") %>' ></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="对应部门">
                            <ItemTemplate>
                                <zhongsoft:LightObjectSelector ID="selDeptName" runat="server" field="DeptName" activestatus="(23.*)" SelectPageMode="Dialog" ShowJsonRowColName="true" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx" ResultAttr="name" ShowAttrs="name,UserCode" DoCancel="true" ResultForControls="{'hiDeptID':'id'}"/>
                                <zhongsoft:LightTextBox runat="server" ID="hiDeptID" field="DeptID" MaxLength="36" Text='<%#Eval("DeptID") %>' ></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="部门类型">
                            <ItemTemplate>
                                <zhongsoft:LightDropDownList ID="ddlType" runat="server" activestatus="(23.*)" field="DeptTypeID">
                                </zhongsoft:LightDropDownList>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightButtonField HeaderText="删除" CommandName="deleteData">
                        </zhongsoft:LightButtonField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input type="hidden" id="hiUSERGROUPID" runat="server" tablename="EHR_USERGROUP"
        field="USERGROUPID" />
    <input type="hidden" id="hiISPUBLIC" runat="server" tablename="EHR_USERGROUP"
        field="ISPUBLIC" />
</asp:Content>
