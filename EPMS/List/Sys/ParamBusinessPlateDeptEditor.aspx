<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParamBusinessPlateDeptEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Sys.ParamBusinessPlateDeptEditor" Title="与部门的对应关系"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                业务板块<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlBusinessPlate" runat="server" activestatus="(23.*)"
                    tablename="EPMS_ValueDefaultOfDept" field="ParamBusinessPlateID" AutoPostBack="true"
                    OnSelectedIndexChanged="ddlBusinessPlate_SelectedIndexChanged">
                </zhongsoft:LightDropDownList>
                <input type="hidden" id="hiBusinessPlate" runat="server" tablename="EPMS_ValueDefaultOfDept"
                    field="BusinessPlate" />
            </td>
            <td class="td-l">
                业务类型
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlBizType" runat="server" activestatus="(23.*)"
                    tablename="EPMS_ValueDefaultOfDept" field="ParamBusinessTypeID">
                </zhongsoft:LightDropDownList>
                <input type="hidden" id="hiBusinessType" runat="server" tablename="EPMS_ValueDefaultOfDept"
                    field="BusinessType" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                部门<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsDept" req="1" IsMutiple="false"
                    SelectPageMode="Dialog" ResultForControls="{'hiDeptID':'id'}" EnableTheming="false"
                    Text="选择部门" PageUrl="/Sys/OrgUsers/OrgSelectorJson.aspx" ShowJsonRowColName="true"
                    ResultAttr="name" FilterFunction="getFilter()" activestatus="(23.*)" tablename="EPMS_ValueDefaultOfDept"
                    field="DeptName" />
                <input type="hidden" runat="server" id="hiDeptID" tablename="EPMS_ValueDefaultOfDept"
                    field="DeptID" />
            </td>
            <td class="td-l">
                单项<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsSingle" req="1" IsMutiple="false"
                    SelectPageMode="Dialog" ResultForControls="{'hiParamSingleID':'id'}" EnableTheming="false"
                    Text="选择单项" PageUrl="/EPMS/Obsolete/ParamSingleSelector.aspx" ShowJsonRowColName="true"
                    ResultAttr="name" activestatus="(23.*)" FilterFunction="getSingleFilter()" tablename="EPMS_ValueDefaultOfDept"
                    field="SingleName" />
                <input type="hidden" id="hiParamSingleID" runat="server" tablename="EPMS_ValueDefaultOfDept"
                    field="ParamSingleID" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                参与类型<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:RadioButtonList ID="rdblPartakeType" RepeatColumns="2" runat="server" activestatus="(23.*)"
                    tablename="EPMS_ValueDefaultOfDept" field="PartakeType">
                </asp:RadioButtonList>
            </td>
            <td class="td-l">
                默认分配比例<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbAllotRatio" TableName="EPMS_ValueDefaultOfDept"
                    Field="AllotRatio" activestatus="(23.*)" req="1" EnableTheming="false" CssClass="kpms-textbox-money"
                    Regex="^([1-9][0-9]?(\.[0-9]{1,2})?)$|^(0\.[1-9][0-9]?)$|^(0\.[0-9][1-9])$|^100(\.00)?$" errmsg="请输入0.01-100.00的百分数"></zhongsoft:LightTextBox>%
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbMemo" CssClass="kpms-textarea" EnableTheming="false"
                    activestatus="(23.*)" TextMode="MultiLine" maxtext="512" Rows="4" tablename="EPMS_ValueDefaultOfDept"
                    field="Memo">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input id="hiValueDefaultOfDeptID" type="hidden" tablename="EPMS_ValueDefaultOfDept"
        field="ValueDefaultOfDeptID" runat="server" />
    <script type="text/javascript">
        function getFilter() {
            return { OrganizationLevel: '2,3' };
        }
        function getSingleFilter() {
            return { ParamBusinessTypeID: $("#<%=ddlBizType.ClientID %>").val() };
        }
    </script>
</asp:Content>
