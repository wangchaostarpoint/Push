<%@ Page Title="投运工程台账" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="RunningProjectsEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Project.RunningProjectsEditor" %>

<%@ Import Namespace="Zhongsoft.Portal.EPMS" %>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table width="100%" class="tz-table">
        <tr>
            <td class="td-l">
                工程名称<span class="req-star">*</span>
            </td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="tbTargetProjectName" SourceMode="SelectorPage"
                    IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                    PageWidth="850" EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                    ResultForControls="{'hiProjectID':'id'}" activestatus="(2.*)" req="1" OnClick="tbTargetProjectName_Click"
                    AfterSelect="checkGeneratorCode()" tablename="EPMS_RUNNINGPROJECTS" field="PROJECTNAME">
                </zhongsoft:LightObjectSelector>
            </td>
            <td class="td-l">
                工程编号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbProjectCode" runat="server" EnableTheming="false" ReadOnly="true"
                    req="1" MaxLength="128" tablename="EPMS_RUNNINGPROJECTS" field="PROJECTCODE">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                业务板块
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbBusinessPlate" runat="server" EnableTheming="false"
                    ReadOnly="true" tablename="EPMS_RUNNINGPROJECTS" field="BUSINESSPLATE">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                项目类型
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbProjectType" runat="server" EnableTheming="false" ReadOnly="true"
                    tablename="EPMS_RUNNINGPROJECTS" field="PROJECTTYPE">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                设计规模
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbDesignScale" runat="server" tablename="EPMS_RUNNINGPROJECTS"
                    EnableTheming="false" CssClass="kpms-textbox-short" field="PROJECTSCALE">
                </zhongsoft:LightTextBox>KV/MVA
                <!-- 对应设计规模-->
            </td>
        </tr>
        <tr>
            <td class="td-l">
                设计容量
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbDesignCapacity" runat="server" MaxLength="128" EnableTheming="false"
                    CssClass="kpms-textbox-short" Field="DesignCapacity" TableName="EPMS_RUNNINGPROJECTS">
                </zhongsoft:LightTextBox>&nbsp; MVA
            </td>
            <td class="td-l">
                容量等级
            </td>
            <td class="td-r">
                <%-- <zhongsoft:LightTextBox ID="tbCapacityLevel" runat="server" MaxLength="128" EnableTheming="false"
                    CssClass="kpms-textbox-short" Field="CapacityLevel" TableName="EPMS_RUNNINGPROJECTS">
                </zhongsoft:LightTextBox>--%>
                <zhongsoft:LightDropDownList ID="ddlCapacityLevel" runat="server" activestatus="(23.*)"
                    Field="CapacityLevel" TableName="EPMS_RUNNINGPROJECTS">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiCapacityLevel" field="CapacityLevel" tablename="EPMS_RUNNINGPROJECTS" />
            </td>
            <td class="td-l" flag="len">
                长度
            </td>
            <td class="td-r" flag="len">
                <zhongsoft:LightTextBox ID="tbLenght" runat="server" MaxLength="128" EnableTheming="false"
                    CssClass="kpms-textbox-short" activestatus="(23.*)" Field="Length" TableName="EPMS_RUNNINGPROJECTS">
                </zhongsoft:LightTextBox>&nbsp; km
            </td>
            <td class="td-m" id="hideTd" colspan="2" style="display: none;">
            </td>
        </tr>
        <tr style="display: none">
            <td class="td-l">
                规模等级
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbParamProjectGrade" runat="server" EnableTheming="false"
                    ReadOnly="true" tablename="EPMS_RUNNINGPROJECTS" field="PARAMPROJECTGRADE">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                规模容量（长度）
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbParamScaleCapacity" runat="server" EnableTheming="false"
                    ReadOnly="true" tablename="EPMS_RUNNINGPROJECTS" field="PARAMSCALECAPACITY">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                规模台数
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbParamNumber" runat="server" EnableTheming="false" ReadOnly="true"
                    tablename="EPMS_RUNNINGPROJECTS" field="PARAMNUMBER">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                业主单位
            </td>
            <td class="td-r" colspan="5">
                <zhongsoft:LightTextBox ID="tbCustomerName" runat="server" EnableTheming="false"
                    ReadOnly="true" tablename="EPMS_RUNNINGPROJECTS" field="CUSTOMERNAME">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                机组号<span class="req-star" id="reqGenerator">*</span>
            </td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox ID="tbGeneratorCode" runat="server" EnableTheming="false"
                    tablename="EPMS_RUNNINGPROJECTS" field="GENERATORCODE" activestatus="(23.*)"
                    req="1" maxtext="200" MaxLength="200">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                投运时间<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtStartDate" runat="server"
                    readonly="readonly" tablename="EPMS_RUNNINGPROJECTS" field="STARTDATE" activestatus="(23.*)"
                    req="1" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-r" colspan="5">
                <zhongsoft:LightTextBox ID="tbRemark" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                    TextMode="MultiLine" activestatus="(23.*)" field="REMARK" tablename="EPMS_RUNNINGPROJECTS"
                    maxtext="1000" MaxLength="1000">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiRunningProjectID" tablename="EPMS_RUNNINGPROJECTS"
        field="RUNNINGPROJECTID" />
    <input type="hidden" runat="server" id="hiProjectID" tablename="EPMS_RUNNINGPROJECTS"
        field="PROJECTID" />
    <input type="hidden" runat="server" id="hiBusinessPlateID" tablename="EPMS_RUNNINGPROJECTS"
        field="BUSINESSPLATEID" />
    <input type="hidden" runat="server" id="hiCustomerID" tablename="EPMS_RUNNINGPROJECTS"
        field="CUSTOMERID" />
    <input type="hidden" runat="server" id="hiParamProjectScaleID" tablename="EPMS_RUNNINGPROJECTS"
        field="PARAMPROJECTSCALEID" />
    <input type="hidden" runat="server" id="hiParamMeasureUnit" tablename="EPMS_RUNNINGPROJECTS"
        field="PARAMMEASUREUNIT" />
    <script type="text/javascript">

        function initCustomerPlugin() {
            checkGeneratorCode();

            var projType = $('#<%=tbProjectType.ClientID %>').val();
            //非输变电科研不显示长度信息
            if (projType != '输变电工程可研') {
                $('[flag="len"]').hide();
                $('#hideTd').show();
            }
        }

        //判断机组号是否必填
        function checkGeneratorCode() {
            var p = $("#<%=tbBusinessPlate.ClientID %>").val();
            if (p == "电网") {
                $("#reqGenerator").hide();
                $("#<%=tbGeneratorCode.ClientID %>").removeAttr("req");
            }
            else {
                $("#reqGenerator").show();
                $("#<%=tbGeneratorCode.ClientID %>").attr("req", "1");
            }
        }

    </script>
</asp:Content>
