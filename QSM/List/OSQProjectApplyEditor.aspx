<%@ Page Title="优秀项目申报填写项目" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="OSQProjectApplyEditor.aspx.cs" Inherits="Zhongsoft.Portal.QSM.List.OSQProjectApplyEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                项目类别<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlProjType" req="1" activestatus="(23.*)"
                    field="ProjectType" tablename="QSM_OSQProjectApplyDetail">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                报送单位<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlAssessDept" req="1" activestatus="(23.*)"
                    field="AssessDeptName" tablename="QSM_OSQProjectApplyDetail">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                填报部门
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="tbApplyDeptName" field="ApplyDeptName"
                    tablename="QSM_OSQProjectApplyDetail" activestatus="(23.*)" class="kpms-textbox"
                    readonly="readonly">
                </zhongsoft:XHtmlInputText>
                <input type="hidden" runat="server" id="hiApplyDeptID" field="ApplyDeptID" tablename="QSM_OSQProjectApplyDetail" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                项目名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="tbProjName" SourceMode="SelectorPage"
                    Writeable="true" IsMutiple="false" ShowJsonRowColName="true" ResultAttr="name"
                    EnableTheming="false" SelectPageMode="Dialog" OnClientClick="return selProjectInfo();"
                    TableName="QSM_OSQProjectApplyDetail" Field="ProjectName" activestatus="(23.*)"
                    req="1"></zhongsoft:LightObjectSelector>
            </td>
            <td class="td-l">
                项目编号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <input type="hidden" runat="server" id="hiProjID" field="ProjectID" tablename="QSM_OSQProjectApplyDetail" />
                <zhongsoft:LightTextBox runat="server" ID="tbProjCode" req="1" field="ProjectCode"
                    tablename="QSM_OSQProjectApplyDetail" activestatus="(23.*)" class="kpms-textbox"
                    maxtext="32">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                项目负责人<span class="req-star">*</span>
            </td>
            <td class="td-r"> 
                <zhongsoft:LightObjectSelector runat="server" ID="txtProjOfficerName" field="ProjectManagerName"
                    tablename="QSM_OSQProjectApplyDetail" activestatus="(23.*)" SourceMode="SelectorPage"
                    ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" EnableTheming="false"
                    Writeable="false"  ShowAttrs="name" ResultForControls="{'hiProjOfficerID':'id','hiProjOfficerCODE':'UserCode'}"
                    PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiProjOfficerID" field="ProjectManagerID"
                    tablename="QSM_OSQProjectApplyDetail" />
                <input type="hidden" runat="server" id="hiProjOfficerCODE" field="ProjectManagerCode"
                    tablename="QSM_OSQProjectApplyDetail" />
            </td>
            <td class="td-m" colspan="4" />
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbMemo" runat="server" EnableTheming="false" TextMode="MultiLine"
                    maxtext="1024" field="Memo" tablename="QSM_OSQProjectApplyDetail" activestatus="(23.*)"
                    CssClass="kpms-textarea">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiApplyDetailID" field="OSQProjectApplyDetailID"
        tablename="QSM_OSQProjectApplyDetail" />
    <input type="hidden" runat="server" id="hiApplyFormID" field="OSQProjectApplyFormID"
        tablename="QSM_OSQProjectApplyDetail" />
    <input type="hidden" runat="server" id="hiInputUserID" field="InputUserID" tablename="QSM_OSQProjectApplyDetail" />
    <input type="hidden" runat="server" id="hiInputUserCode" field="InputUserCode" tablename="QSM_OSQProjectApplyDetail" />
    <input type="hidden" runat="server" id="hiInputUserName" field="InputUserName" tablename="QSM_OSQProjectApplyDetail" />
    <input type="hidden" runat="server" id="hiProjectXml" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();
        }

        function selProjectInfo() {
            var projectType = $("#<%=ddlProjType.ClientID %>").val();
            if (projectType == "优秀勘测项目" || projectType == "优秀设计项目" || projectType == "优秀工程咨询项目") {
                var param = new InputParamObject("s");
                var reObj = new KPMSXml();
                getDivProjectNew('<%=hiProjectXml.ClientID %>', param, "", afterProjectSel);               
            }
            else {
                alert("当前项目类型不支持勾选，请手工填入信息！");
            }
            return false;
        }

        function afterProjectSel() {
            var reObj = new KPMSXml();
            reObj.loadXML($("#<%=hiProjectXml.ClientID %>").val());
            if (reObj != null) {
                $('#<%=hiProjID.ClientID %>').val(reObj.getId());
                $('#<%=tbProjName.ClientID %>').next().val(reObj.getName());                
                $('#<%=tbProjName.ClientID %>').text(reObj.getName());
                $('#<%=tbProjCode.ClientID %>').val(reObj.buildAttrJson("o", "ProjectCode"));

                $('#<%=hiProjOfficerID.ClientID %>').val(reObj.buildAttrJson("o", "ManagerUserID"));
                $('#<%=txtProjOfficerName.ClientID %>').next().val(reObj.buildAttrJson("o", "ManagerUserName"));
                $('#<%=txtProjOfficerName.ClientID %>').text(reObj.buildAttrJson("o", "ManagerUserName"));
                $('#<%=hiProjOfficerCODE.ClientID %>').val(reObj.buildAttrJson("o", "ManagerUserCode"));
            }
        }
    </script>
</asp:Content>
