<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegulationItemEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Plan.RegulationItemEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<%@ Import Namespace="Zhongsoft.Portal.EPMS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                级别
            </td>
            <td class="td-r" id="tdLevel">
                <zhongsoft:LightDropDownList runat="server" ID="ddlItemLevel" TableName="EPMS_ParamRegulationItem"
                    Field="ItemLevel" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l" itemtype="lawInfo" style="display: none">
                法律法规分类
            </td>
            <td class="td-r" itemtype="lawInfo" style="display: none">
                <zhongsoft:LightDropDownList runat="server" ID="ddlClassification" TableName="EPMS_ParamRegulationItem"
                    Field="Classification" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l" itemtype="notlawInfo" notshow="emergency">
                专业
            </td>
            <td class="td-r" itemtype="notlawInfo" notshow="emergency">
                <zhongsoft:LightDropDownList runat="server" ID="ddlSpecialty" TableName="EPMS_ParamRegulationItem"
                    Field="ParamSpecialtyID" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l" notshow="emergency">
                <span id="spanDate">实施日期</span>
            </td>
            <td class="td-r" notshow="emergency">
                <zhongsoft:XHtmlInputText runat="server" ID="txtImplementationDate" activestatus="(23.*)"
                    readonly="readonly" class="kpms-textbox-date" tablename="EPMS_ParamRegulationItem"
                    style="width: 70px" field="ImplementationDate" />
            </td>
        </tr>
        <tr itemtype="emergencyCode">
            <td class="td-l">
                应急预案编号
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbItemCode" TableName="EPMS_ParamRegulationItem"
                    Field="ItemCode" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                <span id="spanName">名称</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbItemName" TableName="EPMS_ParamRegulationItem"
                    TextMode="MultiLine" EnableTheming="false" CssClass="kpms-textarea" Field="ItemName"
                    activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr itemtype="graphicAndRegular">
            <td class="td-l">
                版本号
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbVersionInfo" TableName="EPMS_ParamRegulationItem"
                    Field="VersionInfo" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr itemtype="graphicAndRegular">
            <td class="td-l">
                替代文件或版本
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbReplaceFile" TableName="EPMS_ParamRegulationItem"
                    Field="ReplaceFile" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr id="trApprovalDepartment" style="display: none">
            <td class="td-l">
                <span id="spanDeptName">发布/批准部门</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbApprovalDepartment" TableName="EPMS_ParamRegulationItem"
                    Field="ApprovalDepartment" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr itemtype="emgercyAndGraphic" style="display: none">
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbMemo" TextMode="MultiLine" CssClass="kpms-textarea"
                    EnableTheming="false" MaxLength="512" tablename="EPMS_ParamRegulationItem" field="Memo"
                    activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                填写人
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtFillUserName" activestatus="(23.*)"
                    readonly="readonly" class="kpms-textbox" tablename="EPMS_ParamRegulationItem"
                    field="FillUserName" />
            </td>
            <td class="td-l">
                填写部门
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtFillDeptName" activestatus="(23.*)"
                    readonly="readonly" class="kpms-textbox" tablename="EPMS_ParamRegulationItem"
                    field="FillDeptName" />
            </td>
            <td class="td-l">
                填写日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtFillDate" activestatus="(23.*)" readonly="readonly"
                    class="kpms-textbox-date" tablename="EPMS_ParamRegulationItem" field="FillDate"
                    style="width: 70px" />
            </td>
        </tr>
    </table>
    <!--填写人-->
    <input type="hidden" runat="server" id="hiFillUserId" field="FillUserId" tablename="EPMS_ParamRegulationItem" />
    <!--填写部门-->
    <input type="hidden" runat="server" id="hiFillDeptID" field="FillDeptID" tablename="EPMS_ParamRegulationItem" />
    <!--主键ID-->
    <input type="hidden" runat="server" id="hiParamRegulationItemID" field="ParamRegulationItemID"
        tablename="EPMS_ParamRegulationItem" />
    <!---类型-->
    <input type="hidden" runat="server" id="hiItemType" field="ItemType" tablename="EPMS_ParamRegulationItem" />
    <script>
        function initCustomerPlugin() {
            var itemType = "<%=ItemType %>";
            //法律法规显示法律法规分类信息
            if (itemType == "<%=RegulationItemType.法律法规.GetHashCode()%>") {
                $("[itemtype=lawInfo]").show();
                $("[itemtype=notlawInfo]").hide();
                $("#spanDate").text("发布日期");
                $("#spanName").text("法律法规名称");
                $("[itemtype=graphicAndRegular]").hide();
                $("[itemtype=emergencyCode]").hide();
                $("#trApprovalDepartment").show();
            }
            else if (itemType == "<%=RegulationItemType.规程规范.GetHashCode()%>") {
                $("#spanName").text("规程规范名称");
                $("[itemtype=graphicAndRegular]").show();
                $("[itemtype=emergencyCode]").hide();
            }
            else if (itemType == "<%=RegulationItemType.应急预案.GetHashCode()%>") {
                $("[itemtype=emergencyCode]").show();
                $("[itemtype=graphicAndRegular]").hide();
                $("[itemtype=lawInfo]").hide();
                $("[itemtype=emgercyAndGraphic]").show();
                $("#spanName").text("应急预案名称");
                $("[notshow=emergency]").hide();
                $("#tdLevel").attr("colspan", "5");
            }
            //通用图集
            else {
                $("[itemtype=emergencyCode]").hide();
                $("[itemtype=emgercyAndGraphic]").show();
                $("#spanName").text("通用图集名称");
                $("#trApprovalDepartment").show();
                $("#spanDeptName").text("发布或编制单位");
            }
        }
    </script>
</asp:Content>
