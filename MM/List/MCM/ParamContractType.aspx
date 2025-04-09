<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParamContractType.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MCM.ParamContractType" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                合同类型名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbContractTypeName" runat="server" req="1" activestatus="(23.*)"
                    MaxLength="32" field="TYPENAME" tablename="MCM_PARAMCONTRACTTYPE"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                合同基本类型<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlBaseType" field="BASETYPE" tablename="MCM_PARAMCONTRACTTYPE"
                    req="1" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                合同内容分类<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlContentType" field="CONTENTTYPE"
                    req="1" tablename="MCM_PARAMCONTRACTTYPE" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                责任部门
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtBelongDept" field="OrgUnitName"
                    tablename="MCM_PARAMCONTRACTTYPE" activestatus="(23.*)" SourceMode="SelectorPage"
                    ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" EnableTheming="false"
                    Writeable="false" ShowAttrs="name,UserCode" ResultForControls="{'hiBelongDeptID':'id','hiBelongCode':'OrgUnitCode'}"
                    PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx"></zhongsoft:LightObjectSelector>
                <input id="hiBelongDeptID" type="hidden" field="BELONGDEPTID" runat="server" tablename="MCM_PARAMCONTRACTTYPE" />
                <input id="hiBelongCode" type="hidden" field="BELONGDEPTCODE" runat="server" tablename="MCM_PARAMCONTRACTTYPE" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                编码<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbTypeCode" runat="server" activestatus="(23.*)" req="1"
                    MaxLength="16" field="TYPECODE" tablename="MCM_PARAMCONTRACTTYPE"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                描述
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbDescription" CssClass="kpms-textarea" runat="server"
                    TextMode="MultiLine" EnableTheming="false" maxtext="256" tablename="MCM_PARAMCONTRACTTYPE"
                    field="DESCRIPTION" ActiveStatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbMemo" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                    EnableTheming="false" maxtext="512" tablename="MCM_PARAMCONTRACTTYPE" field="MEMO"
                    ActiveStatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <!---合同类型ID-->
    <input type="hidden" runat="server" id="hiParamContractTypeID" field="PARAMCONTRACTTYPEID"
        tablename="MCM_PARAMCONTRACTTYPE" />
    <!---是否启用--->
    <input type="hidden" runat="server" id="hiFlag" field="FLAG" tablename="MCM_PARAMCONTRACTTYPE" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
    </script>
</asp:Content>
