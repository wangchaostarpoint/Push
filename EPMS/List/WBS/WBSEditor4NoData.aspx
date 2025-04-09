<%@ Page Language="C#" AutoEventWireup="true" Title="任务详细" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="WBSEditor4NoData.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.WBS.WBSEditor4NoData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">项目名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtProjectName" activestatus="(23.*)"
                    readonly="readonly" class="kpms-textbox" TableName="EPMS_WBSEntity" Field="ProjectName"
                    req="1">
                </zhongsoft:XHtmlInputText>
                <input type="hidden" runat="server" id="hiOrganizationID" tablename="EPMS_WBSEntity"
                    field="OrganizationID" />
            </td>
            <td class="td-l">项目编号<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(23.*)"
                    readonly="readonly" class="kpms-textbox" TableName="EPMS_WBSEntity" Field="ProjectCode"
                    req="1">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr flag="type">
            <td class="td-l">所属部门<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlDept" TableName="EPMS_WBSEntity" req="1"
                    Field="BelongDeptID" activestatus="(2.*)" AutoPostBack="true" OnSelectedIndexChanged="ddlDept_SelectedIndexChanged">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiBelongDeptName" tablename="EPMS_WBSEntity"
                    field="BelongDeptName" />
            </td>
            <td class="td-l"><span flag="wbsSpeName">专业</span><span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:LightDropDownList runat="server" ID="ddlExecSpecialtyId" TableName="EPMS_WBSEntity" req="1"
                    Field="ExecSpecialtyID" activestatus="(2.*)" AutoPostBack="true" OnSelectedIndexChanged="ddlExecSpecialtyId_SelectedIndexChanged">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiExecSpecialtyName" tablename="EPMS_WBSEntity"
                    field="ExecSpecialtyName" />
                <input type="hidden" runat="server" id="hiExecSpecialtyCode" tablename="EPMS_WBSEntity"
                    field="ExecSpecialtyCode" />
                <!-- 所属专业-->
                <input type="hidden" runat="server" id="hiBelongSpecialtyID" tablename="EPMS_WBSEntity"
                    field="BelongSpecialtyID" />
                <input type="hidden" runat="server" id="hiBelongSpecialtyCode" tablename="EPMS_WBSEntity"
                    field="BelongSpecialtyCode" />
                <input type="hidden" runat="server" id="hiBelongSpecialtyName" tablename="EPMS_WBSEntity"
                    field="BelongSpecialtyName" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                <span flag="name" id="spanName">任务名称</span><span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="tbWBSName" TableName="EPMS_WBSEntity"
                    Field="WBSName" activestatus="(23.*)" class="kpms-textbox" req="1" />
            </td>
            <td class="td-l">
                <span flag="name">任务编号</span><span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:XHtmlInputText runat="server" ID="tbWBSCode" TableName="EPMS_WBSEntity"
                    Field="WBSCode" activestatus="(23.*)" class="kpms-textbox" readonly="readonly" />
            </td>
        </tr>
        <tr style="display: none">
            <td class="td-l" flag="serial">成品号(校验号)<span class="req-star">*</span>
            </td>
            <td class="td-r" flag="serial">
                <zhongsoft:LightTextBox runat="server" ID="tbSerialCode" TableName="EPMS_WBSEntity"
                    Field="SerialCode" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l" flag="onlyCe" style="display: none"></td>
            <td class="td-r" flag="onlyCe" style="display: none"></td>
        </tr>
        <tr flag="roll">
            <td class="td-l">任务标识
            </td>
            <td class="td-m" colspan="3">
                <asp:CheckBoxList runat="server" ID="cblWBFFlag" RepeatDirection="Horizontal" activestatus="(23.*)">
                </asp:CheckBoxList>
                <input type="hidden" runat="server" id="hiWBSFlag" tablename="EPMS_WBSEntity" field="WBSFlag" />
            </td>
        </tr>
        <tr>
            <td class="td-l">计划开始日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtPlanStartTime"
                    runat="server" compare="1" readonly="readonly" activestatus="(23.*)" field="PlanStartTime"
                    tablename="EPMS_WBSEntity" />
            </td>
            <td class="td-l">计划完成日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtPlanCompleteTime"
                    runat="server" compare="1" readonly="readonly" activestatus="(23.*)" field="PlanCompleteTime"
                    tablename="EPMS_WBSEntity" Onchange="CompareDate(this);" />
            </td>
        </tr>
        <tr>
            <td class="td-l">负责人<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="tbWBSOwnerName" req="1" IsMutiple="false"
                    SelectPageMode="Dialog" ResultForControls="{'hiWBSOwnerID':'id','hiWBSOwnerCode':'LoginId'}" EnableTheming="false"
                    Text="选择负责人" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" PageWidth="850"
                    ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.*)" tablename="EPMS_WBSEntity"
                    field="WBSOwnerName" />
                <input type="hidden" runat="server" id="hiWBSOwnerID" tablename="EPMS_WBSEntity"
                    field="WBSOwnerID" />
                <input type="hidden" runat="server" id="hiWBSOwnerCode" tablename="EPMS_WBSEntity"
                    field="WBSOwnerCode" />
            </td>
             <td class="td-l">编制日期<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtPrepareDate"
                    runat="server"  req="1" readonly="readonly" activestatus="(23.*)" field="PrepareDate"
                    tablename="EPMS_WBSEntity" Onchange="CompareDate(this);" />
            </td>
        </tr>
    </table>
    <!-- 业务主键-->
    <input type="hidden" runat="server" id="hiWBSId" tablename="EPMS_WBSEntity" field="WBSID" />
    <!-- 任务状态-->
    <input type="hidden" runat="server" id="hiWBSState" tablename="EPMS_WBSEntity" field="WBSState"
        value="0" />
    <input type="hidden" runat="server" id="hiFlag" tablename="EPMS_WBSEntity" field="Flag"
        value="1" />
    <input type="hidden" runat="server" id="hiParamWBSTypeID" tablename="EPMS_WBSEntity"
        field="ParamWBSTypeID" />
    <input type="hidden" runat="server" id="hiWBSType" tablename="EPMS_WBSEntity" field="WBSType" />
    <input type="hidden" runat="server" id="hiArchiveCode" tablename="EPMS_WBSEntity" field="ArchiveCode" />

    <script type="text/javascript">
        function checkForm() {
            //保存再次验重
            return checkWBSCode();
        }

        function checkWBSCode() {
            var wbsCode = $('#<%=tbWBSCode.ClientID %>').val();
            var wbsType = $('#<%=hiWBSType.ClientID %>').val();

            var organizationId = '<%=OrganizationID %>';
            var bizId = '<%=BusinessObjectId %>';
            var isRepeat = false;
            $.ajax({
                type: 'POST',
                url: buildQueryUrl("/EPMS/Handler/CheckCodeHandler.ashx", null),
                data: { 'checkType': 'WBSCode', 'code': wbsCode, 'OrganizationID': organizationId, 'BizID': bizId, 'WBSWay': '' },
                async: false,
                //dataType: "json",
                cache: false,
                success: function (res) {
                    isRepeat = parseBool(res);
                },
                error: function (err) {
                    //alert(err);
                }
            });

            if (isRepeat) {
                //编号重复，给出提示、焦点定位
                alert('编号重复，请重新输入！');
                $('#<%=tbWBSCode.ClientID %>').focus();

                return false;
            }
            else {
                //验证通过，将任务编号默认为成品校验号
                if ($('#<%=tbSerialCode.ClientID %>').val() == '')
                    $('#<%=tbSerialCode.ClientID %>').val(wbsCode);
                return true;
            }
        }
    </script>
</asp:Content>