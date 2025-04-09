<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_SurveyRecordForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Survey.WF_SurveyRecordForm" %>
<table class="tz-table">
    <tr>
        <td class="td-l">
            编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="txtRecordCode" runat="server"
                readonly="readonly" TableName="EPMS_SurveyRecord" Field="RecordCode" ActiveStatus="(23.检验人填写过程检验记录单)(3.检验人修改过程填写记录单)(23.填写现场记录确认)" />
        </td>
        <td class="td-l">
            检验时间
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtCheckDate" runat="server"
                readonly="readonly" TableName="EPMS_SurveyRecord" Field="CheckDate" ActiveStatus="(23.检验人填写过程检验记录单)(3.检验人修改过程填写记录单)(23.填写现场记录确认)" />
        </td>
        <td id="trCheckType" class="td-l" runat="server" displaystatus="(123.检验人填写过程检验记录单)(13.检验人修改过程填写记录单)(13.审核)(1.*)">
            检验类型<span class="req-star">*</span>
        </td>
        <td id="trCheckType2" class="td-r" runat="server" displaystatus="(123.检验人填写过程检验记录单)(13.检验人修改过程填写记录单)(13.审核)(1.*)">
            <asp:RadioButtonList ID="rblCheckType" runat="server" TableName="EPMS_SurveyRecord"
                RepeatColumns="2" RepeatDirection="Horizontal" Field="CheckType" ActiveStatus="(23.检验人填写过程检验记录单)(3.检验人修改过程填写记录单)" />
        </td>
        <td id="trCheckType3" class="td-m" colspan="2" runat="server" displaystatus="(123.填写现场记录确认)(13.归档)(1.*)">
        </td>
    </tr>
    <tr>
        <td class="td-l">
            项目名称<span class="req-star">*</span>
        </td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
                IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                PageWidth="850" EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                ResultForControls="{'hiProjectID':'id','txtProjectCode':'ProjectCode'}" TableName="EPMS_SurveyRecord"
                Field="ProjectName" activestatus="(23.检验人填写过程检验记录单)(3.检验人修改过程填写记录单)(23.填写现场记录确认)"
                req="1" OnClick="txtProjectName_Click"></zhongsoft:LightObjectSelector>
            <input type="hidden" id="hiProjectID" runat="server" field="OrganizationID" tablename="EPMS_SurveyRecord" />
        </td>
        <td class="td-l">
            项目编号
        </td>
        <td>
            <zhongsoft:XHtmlInputText ID="txtProjectCode" runat="server" field="ProjectCode"
                readonly="readonly" tablename="EPMS_SurveyRecord" activestatus="(23.检验人填写过程检验记录单)(3.检验人修改过程填写记录单)(23.填写现场记录确认)"
                class="kpms-textbox" />
        </td>
    </tr>
    <tr>
        <td id="trCheckUser" class="td-l" runat="server" displaystatus="(123.检验人填写过程检验记录单)(13.检验人修改过程填写记录单)(13.审核)(1.*)">
            校验人<span class="req-star">*</span>
        </td>
        <td id="trCheckUser2" class="td-m" colspan="3" runat="server" displaystatus="(123.检验人填写过程检验记录单)(13.检验人修改过程填写记录单)(13.审核)(1.*)">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsPerson" SourceMode="SelectorPage"
                IsMutiple="true" ResultAttr="name" EnableTheming="false" SelectPageMode="Dialog"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" Enabled="false" OnClick="lbsPerson_Click"
                activestatus="(23.检验人填写过程检验记录单)(3.检验人修改过程填写记录单)" req="1" />
        </td>
        <td class="td-l">
            专业<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlSpecialtyID" tablename="EPMS_SurveyRecord"
                req="1" field="SpecialtyId" ActiveStatus="(23.检验人填写过程检验记录单)(3.检验人修改过程填写记录单)(23.填写现场记录确认)">
            </zhongsoft:LightDropDownList>
            <input type="hidden" id="hiSpecialtyName" name="hiSpecialtyName" runat="server" tablename="EPMS_SurveyRecord"
                field="SpecialtyName" />
            <input type="hidden" id="hiSpecialtyCode" name="hiSpecialtyCode" runat="server" tablename="EPMS_SurveyRecord"
                field="SpecialtyCode" />
        </td>
        <td id="trCheckUser3" class="td-m" colspan="4" runat="server" displaystatus="(123.填写现场记录确认)(13.归档)(1.*)">
        </td>
    </tr>
    <tr id="trRoll">
        <td class="td-l">
            卷册名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtRollName" SourceMode="SelectorPage"
                IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/WBSSelector.aspx"
                ResultForControls="{'hiRollID':'id','txtRollCode':'WBSCode'}" activestatus="(23.检验人填写过程检验记录单)(3.检验人修改过程填写记录单)(23.填写现场记录确认)"
                BeforeSelect="beforeSelectWbs()" FilterFunction="wbsFilter()" tablename="EPMS_SurveyRecord"
                field="RollName"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiRollID" tablename="EPMS_SurveyRecord" field="RollID" />
        </td>
        <td class="td-l">
            卷册编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtRollCode" activestatus="(23.检验人填写过程检验记录单)(3.检验人修改过程填写记录单)(23.填写现场记录确认)"
                readonly="readonly" class="kpms-textbox" TableName="EPMS_SurveyRecord" Field="RollCode" />
        </td>
    </tr>
    <tr id="trCE">
        <td class="td-l">
            现场环境和职业健康<br />
            安全控制评价 <span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <asp:RadioButtonList runat="server" ID="rblControlEvaluation" activestatus="(23.填写现场记录确认)"
                req="1" RepeatDirection="Horizontal" TableName="EPMS_SurveyRecord" Field="ControlEvaluation">
                <asp:ListItem Value="作业过程符合质量、环境和职业健康安全管理体系的规定">作业过程符合质量、环境和职业健康安全管理体系的规定</asp:ListItem>
                <asp:ListItem Value="个别作业项不符合质量、环境和职业健康安全管理体系的规定">个别作业项不符合质量、环境和职业健康安全管理体系的规定</asp:ListItem>
            </asp:RadioButtonList>
            <span class="req-star">对不符合的作业项，必须整改后重新验证</span>
        </td>
    </tr>
    <tr runat="server" displaystatus="(13.*)">
        <td colspan="6" style="text-align: center; font-weight: bold">
            详细记录列表<span style="float: right">
                <asp:LinkButton runat="server" ID="btnSelRecord" OnClientClick="return addRecord()"
                    displaystatus="(3.检验人填写过程检验记录单)(3.检验人修改过程填写记录单)(3.填写现场记录确认)"><span>选择详细记录</span></asp:LinkButton>
            </span>
        </td>
    </tr>
    <tr runat="server" displaystatus="(13.*)">
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvList" runat="server" AllowPaging="true" PageSize="10"
                AutoGenerateColumns="false" UseDefaultDataSource="true" DataKeyNames="DetailId"
                OnRowCommand="gvList_RowCommand" OnRowDataBound="gvList_RowDataBound" ShowExport="true"
                OnExport="gvList_Export">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField HeaderText="检验情况" DataField="InspectiCondition" Width="40%" />
                    <zhongsoft:LightTemplateField HeaderText="完成情况">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbExecuteCondition" runat="server" maxtext="1024" TextMode="MultiLine"
                                EnableTheming="false" CssClass="kpms-textarea" Text='<%#Eval("ExecuteCondition")%>'
                                Enabled="false" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" CausesValidation="false"
                        DeleteText="删除后将无法恢复，确认删除该记录吗？" Visible="false" />
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            备注
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbMemo" runat="server" maxtext="1024" TableName="EPMS_SurveyRecord"
                TextMode="MultiLine" EnableTheming="false" CssClass="kpms-textarea" Field="Memo"
                ActiveStatus="(23.检验人填写过程检验记录单)(3.检验人修改过程填写记录单)(23.填写现场记录确认)" />
        </td>
    </tr>
</table>
<asp:Button runat="server" ID="btnBindRecord" OnClick="btnBindRecord_Click" Style="display: none" />
<input type="hidden" id="hiSurveyRecordId" name="hiSurveyRecordId" runat="server"
    tablename="EPMS_SurveyRecord" field="SurveyRecordId" />
<input type="hidden" id="hiFormType" name="hiFormType" runat="server" tablename="EPMS_SurveyRecord"
    field="FormType" />
<!--负责人-->
<input type="hidden" id="hiDirectorId" name="hiDirectorId" runat="server" tablename="EPMS_SurveyRecord"
    field="DirectorId" />
<input type="hidden" id="hiDirectorCode" name="hiDirectorCode" runat="server" tablename="EPMS_SurveyRecord"
    field="DirectorCode" />
<input type="hidden" id="hiDirectorName" name="hiDirectorName" runat="server" tablename="EPMS_SurveyRecord"
    field="DirectorName" />
<!--检验人-->
<input type="hidden" id="hiInspectPersonId" name="hiInspectPersonId" runat="server"
    tablename="EPMS_SurveyRecord" field="InspectPersonId" />
<input type="hidden" id="hiInspectPersonCode" name="hiInspectPersonCode" runat="server"
    tablename="EPMS_SurveyRecord" field="InspectPersonCode" />
<input type="hidden" id="hiInspectPersonName" name="hiInspectPersonName" runat="server"
    tablename="EPMS_SurveyRecord" field="InspectPersonName" />
<!--结束日期-->
<input type="hidden" id="hiFinishDate" name="hiFinishDate" runat="server" tablename="EPMS_SurveyRecord"
    field="FinishDate" />
<input type="hidden" id="hiRecordXML" runat="server" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
        initCheckType();
        //勘测外业结束流程不显示“校验人”
        if("<%=Wf.FormCode %>" == "EPMS82"){
             $("#<%=trCheckUser.ClientID %>").hide();
             $("#<%=trCheckUser2.ClientID %>").hide();
             $("#<%=trCheckUser3.ClientID %>").show();
             //外业结束显示现场环境和职业健康安全控制评价
             $('#trCE').show();
        }
        else  {
            $('#trCE').hide();
        }
    }

    function getRadlValue(radl) {
        var selectVal = "";
        $("#" + radl + " input").each(function () {
            if ($(this)[0].checked) {
                selectVal = $(this).val();
                return false;
            }
        });
        return selectVal;
    }

    $("#<%=rblCheckType.ClientID%>").live("change", function() {
      initCheckType();
    })

    function initCheckType(){
        var checkType = getRadlValue("<%=rblCheckType.ClientID %>");
        if(checkType=="<%=CheckType.综合检验.GetHashCode() %>"){
            $("#trRoll").hide();     
            $('#<%=trCheckType3.ClientID %>').hide();  
            $('#<%=trCheckUser3.ClientID %>').hide();             
            $('#<%=txtRollName.ClientID %>').removeAttr("req");  
            $('#<%=txtRollName.ClientID %>').val("");
            $('#<%=txtRollCode.ClientID %>').val("");
            $('#<%=hiRollID.ClientID %>').val("");
        }
        else if(checkType=="<%=CheckType.专业检验.GetHashCode() %>"){
            $("#trRoll").show();            
            $('#<%=trCheckType3.ClientID %>').hide(); 
            $('#<%=trCheckUser3.ClientID %>').hide();     
            $('#<%=txtRollName.ClientID %>').attr('req', '1');
        }
        else{
            $("#trRoll").show();  
            $('#<%=trCheckType.ClientID %>').hide();     
            $('#<%=trCheckType2.ClientID %>').hide();  
            $('#<%=trCheckUser.ClientID %>').hide();     
            $('#<%=trCheckUser2.ClientID %>').hide();            
            $('#<%=txtRollName.ClientID %>').attr('req', '1');
        }
    }

    //选择任务之前的逻辑判断
    function beforeSelectWbs() {
        var orgId = $('#<%=hiProjectID.ClientID %>').val();
        var specialtyId=$("#<%=ddlSpecialtyID.ClientID %>").val();
        if (orgId == '' || orgId == undefined) {
            alert('请先选择项目，再选择卷册！');
            return false;
        }        
        if (specialtyId == '' || specialtyId == undefined) {
            alert('请先选择专业，再选择卷册！');
            return false;
        }
        return true;
    }

    //选择任务的筛选条件
    function wbsFilter() {
        var orgId = $('#<%=hiProjectID.ClientID %>').val();
        var specialtyId=$("#<%=ddlSpecialtyID.ClientID %>").val();
        return { OrganizationID: orgId, WBSType: '<%= DAL.EPMS.WBSMode.任务管理.GetHashCode() %>', ExeSpecialtyID: specialtyId, IsShowMore: 1 };
    }
     
    //批量添加记录
    function addRecord() {
        var param = new InputParamObject("m"); 
        var filter = { SpecialtyID:$("#<%=ddlSpecialtyID.ClientID %>").val(),FormID:"<%=FormId %>"};
        getSurveyRecord('<%=hiRecordXML.ClientID %>', param, filter, bindRecord);
        return false;
    }

    //执行后台添加专业数据
    function bindRecord(){
        <%=Page.ClientScript.GetPostBackEventReference(this.btnBindRecord,"")%>;
    }
</script>
