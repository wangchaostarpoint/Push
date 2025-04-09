<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_TaskInfoManageForm.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.Form.MDM.WF_TaskInfoManageForm" %>
<%@ Import Namespace="Zhongsoft.Portal" %>
<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<table class="tz-table">
    <tr>
        <td class="td-l">
            工程名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="lboSelMarket" field="MARKETPROJECTNAME"
                tablename="MDM_TASKINFOFORM" activestatus="(23.填写任务单)(3.修改任务单)" SourceMode="SelectorPage"
                ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" EnableTheming="false"
                PageWidth="800px" SelectPageMode="Dialog" Writeable="false" ShowAttrs="name,UserCode"
                ResultForControls="{'hiMarketProjectID':'id'}" BeforeSelect="beforeSelMarket()"
                req="1" PageUrl="~/MM/Obsolete/MarketProjectSelector.aspx" AfterSelect="afterSelMarket()"
                OnClick="lbtnSelProject_Click"></zhongsoft:LightObjectSelector>
        </td>
        <td class="td-l">
            工程编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" field="MARKETPROJECTCODE"
                class="kpms-textbox" readonly="readonly" tablename="MDM_TASKINFOFORM" activestatus="(23.填写任务单)">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            任务名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText runat="server" ID="txtTaskName" field="TASKNAME" tablename="MDM_TASKINFOFORM"
                class="kpms-textbox" req="1" activestatus="(23.填写任务单)(3.修改任务单)" MaxLength="64">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            服务类型
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlService" runat="server" tablename="MDM_TASKINFOFORM"
                field="SERVICETYPE" req="1" activestatus="(23.填写任务单)(3.修改任务单)">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiServiceType" />
        </td>
    </tr>
    <tr style="display: none">
        <td class="td-l">
            任务编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtTaskCode" field="TASKCODE" class="kpms-textbox"
                readonly="readonly" tablename="MDM_TASKINFOFORM" activestatus="(23.填写任务单)">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            委托书编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProXYNumber" field="PROXYNUMBER"
                class="kpms-textbox" readonly="readonly" tablename="MDM_TASKINFOFORM" activestatus="(23.填写任务单)">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            委托书接收日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtReceiveProXYDate" field="RECEIVEPROXYDATE"
                class="kpms-textbox-date" readonly="readonly" tablename="MDM_TASKINFOFORM" activestatus="(23.填写任务单)">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l" nowrap>
            是否境内工程<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <asp:RadioButtonList runat="server" ID="rbIsChurchyard" field="ISCHURCHYARD" tablename="MDM_TASKINFOFORM"
                RepeatDirection="Horizontal" activestatus="(23.填写任务单)(3.修改任务单)" AutoPostBack="true"
                OnSelectedIndexChanged="rbIsChurchyard_SelectedIndexChanged">
            </asp:RadioButtonList>
        </td>
        <td class="td-l">
            省份(洲)<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlProvince" runat="server" tablename="MDM_TASKINFOFORM"
                field="PROVINCE" req="1" activestatus="(23.填写任务单)(3.修改任务单)" AutoPostBack="True"
                OnSelectedIndexChanged="ddlProvince_SelectedIndexChanged">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiProvince" field="PROVINCE" tablename="MDM_TASKINFOFORM" />
        </td>
        <td class="td-l">
            地区(国家)
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlArea" runat="server" tablename="MDM_TASKINFOFORM"
                field="AREA" activestatus="(23.填写任务单)(3.修改任务单)">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiArea" field="AREA" tablename="MDM_TASKINFOFORM" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            工程类别<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlProjectType" runat="server" tablename="MDM_TASKINFOFORM"
                field="PROJECTTYPEID" req="1" activestatus="(23.填写任务单)(3.修改任务单)" AutoPostBack="true"
                OnSelectedIndexChanged="ddlProjectType_SelectedIndexChanged">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiOldProjectType" />
        </td>
        <td class="td-l">
            任务来源<span class="req-star">*</span>
        </td>
        <td id="trResource" class="td-r">
            <zhongsoft:LightDropDownList ID="ddlTaskResource" runat="server" tablename="MDM_TASKINFOFORM"
                field="TASKRESOURCE" req="1" activestatus="(23.填写任务单)(3.修改任务单)">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">
            所属板块<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlBelongPlate" runat="server" field="BELONGPLATEID"
                req="1" tablename="MDM_TASKINFOFORM" activestatus="(23.填写任务单)(3.修改任务单)">
            </zhongsoft:LightDropDownList>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            分管院长<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lboChargePresidentName" field="ChargePresidentName"
                                           req="1" tablename="MDM_TASKINFOFORM" activestatus="(23.填写任务单)(3.修改任务单)" PageWidth="800px"
                                           SelectPageMode="Dialog" SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                                           ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode"
                                           FilterFunction="deptFilter('院领导')" ResultForControls="{'hiChargePresidentID':'id'}"
                                           PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiChargePresidentID" field="ChargePresidentID"
                   tablename="MDM_TASKINFOFORM" />
        </td>
        <td class="td-l">
            分管总工A<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lboChiefEngineerName" field="ChiefEngineerName"
                req="1" tablename="MDM_TASKINFOFORM" activestatus="(23.填写任务单)(3.修改任务单)" PageWidth="800px"
                SelectPageMode="Dialog" SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode"
                FilterFunction="deptFilter('技术质量部')" ResultForControls="{'hiChiefEngineerID':'id'}"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" AfterSelect="AfterSelectEngineer();">
            </zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiChiefEngineerID" field="ChiefEngineerID"
                tablename="MDM_TASKINFOFORM" />
        </td>
        <td class="td-l">
            分管总工B
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lbosChiefEngineerBName" field="ChiefEngineerBName"
                tablename="MDM_TASKINFOFORM" activestatus="(23.填写任务单)(3.修改任务单)" PageWidth="800px"
                SelectPageMode="Dialog" SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode"
                FilterFunction="deptFilter('技术质量部')" ResultForControls="{'hidChiefEngineerBID':'id'}"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" AfterSelect="AfterSelectEngineer();">
            </zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hidChiefEngineerBID" field="ChiefEngineerBID"
                tablename="MDM_TASKINFOFORM" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            牵头部门<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlBelongDept" Field="BELONGDEPTID" tableName="MDM_MARKETPROJECTENTITY"
                req="1" activestatus="(23.填写任务单)(3.修改任务单)" runat="server">
            </zhongsoft:LightDropDownList>
            <input id="hiBelongDeptName" type="hidden" field="BELONGDEPTNAME" runat="server"
                tablename="MDM_MARKETPROJECTENTITY" />
        </td>
        <td class="td-l">
            协作部门
        </td>
        <td colspan="3" class="td-m">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsCooperationDeptNames" IsMutiple="true"
                SelectPageMode="Dialog" ResultForControls="{'hiCooperationDeptIds':'id'}" EnableTheming="false"
                Text="选择协作部门" Filter="{OrganizationLevel:'2'}" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx"
                ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.填写任务单)(3.修改任务单)"
                TableName="MDM_TASKINFOFORM" field="CooperationDeptNames" />
            <input type="hidden" runat="server" id="hiCooperationDeptIds" tablename="MDM_TASKINFOFORM"
                field="CooperationDeptIds" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            工作阶段
        </td>
        <td class="td-m" colspan="5">
            <asp:DataList ID="dlPhases" runat="server" RepeatColumns="4" RepeatDirection="Horizontal"
                Style="width: 100%" EnableControl="(01.编制计划书（计划管理岗）)">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <input type="hidden" runat="server" id="hiPhaseID" value='<%#Eval("ParamPhaseID") %>' />
                                <input type="hidden" runat="server" id="hiPhaseCode" value='<%#Eval("PHASECODE") %>' />
                                <input type="hidden" runat="server" id="hiIsModifyEdition" value='<%#Eval("ISMODIFYEDITION") %>' />
                                <asp:CheckBox ID="cbSelect" runat="server" OnCheckedChanged="cbSelect_CheckedChanged"
                                    AutoPostBack="true"></asp:CheckBox>
                                <asp:Label runat="server" ID="lbName" Text='<%#Eval("PHASENAME") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label runat="server" ID="lbEdition" Text='修改版号' Visible="false"></asp:Label>
                                <zhongsoft:LightDropDownList ID="ddlNumber" runat="server" Visible="false" Width="50px">
                                    <asp:ListItem Value=""></asp:ListItem>
                                    <asp:ListItem Value="2">2</asp:ListItem>
                                    <asp:ListItem Value="3">3</asp:ListItem>
                                    <asp:ListItem Value="4">4</asp:ListItem>
                                    <asp:ListItem Value="5">5</asp:ListItem>
                                    <asp:ListItem Value="6">6</asp:ListItem>
                                    <asp:ListItem Value="7">7</asp:ListItem>
                                    <asp:ListItem Value="8">8</asp:ListItem>
                                    <asp:ListItem Value="9">9</asp:ListItem>
                                </zhongsoft:LightDropDownList>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
            <a style="float: right" id="aMorePhase" runat="server" onserverclick="aMorePhase_OnServerClick"
                visible="False">更多…</a>
            <zhongsoft:LightPowerGridView ID="gvPhaseProject" runat="server" AllowPaging="false"
                AutoGenerateColumns="false" UseDefaultDataSource="true" ShowHeaderWhenEmpty="true"
                ShowExport="true" OnRowDataBound="gvPhaseProject_RowDataBound" OnExport="gvPhaseProject_OnExport">
                <Columns>
                    <zhongsoft:LightBoundField DataField="PHASENAME" HeaderText="阶段名称" Width="10%" />
                    <zhongsoft:LightBoundField DataField="ProjectPhaseName" HeaderText="阶段项目名称" Width="20%" />
                    <zhongsoft:LightTemplateField HeaderText="立项状态">
                        <ItemStyle Width="10%"></ItemStyle>
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbProjectState" Text='<%#Eval("ISPROJECT") %>'></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="ProgressRequire" HeaderText="进度要求" />
                    <zhongsoft:LightBoundField DataField="QualityRequire" HeaderText="质量要求" />
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            建设单位
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText runat="server" ID="txtCustomerName" field="CUSTOMERNAME"
                class="kpms-textbox" activestatus="(23.填写任务单)(3.修改任务单)" readonly="readonly" tablename="MDM_TASKINFOFORM">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiCustomerID" field="CUSTOMERID" tablename="MDM_TASKINFOFORM" />
        </td>
        <td class="td-l">
            联系人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtContactName" field="CONTACTNAME"
                class="kpms-textbox" activestatus="(23.填写任务单)(3.修改任务单)" readonly="readonly" tablename="MDM_TASKINFOFORM">
            </zhongsoft:XHtmlInputText>
            <input id="hiContactID" type="hidden" field="CONTACTID" runat="server" tablename="MDM_TASKINFOFORM" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            联系电话
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtContactPhone" field="CONTACTTELEPHONE"
                readonly="readonly" class="kpms-textbox" tablename="MDM_TASKINFOFORM" activestatus="(23.填写任务单)(3.修改任务单)">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            任务下达日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtTaskIssuedDate" field="TASKISSUEDDATE"
                activestatus="(23.填写任务单)(3.修改任务单)" tablename="MDM_TASKINFOFORM" class="kpms-textbox-comparedate"
                compare="1" readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            任务接收日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtReceiveDate" field="RECEIVEDATE"
                activestatus="(3.签收生产任务)" tablename="MDM_TASKINFOFORM" class="kpms-textbox-comparedate"
                readonly="readonly" compare="1">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>

       <tr style="font-weight:bolder">
        <td class="td-l">
            任务情况描述
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbConditionDescription" CssClass="kpms-textarea" runat="server"
                TextMode="MultiLine" EnableTheming="false" maxtext="512" tablename="MDM_TASKINFOFORM"
                field="CONDITIONDESCRIPTION" activestatus="(23.填写任务单)(3.修改任务单)"></zhongsoft:LightTextBox>
        </td>
    </tr>
        <tr style="display: none">
        <td class="td-l">
            经营经理
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtManagerName" field="MANAGERNAME"
                class="kpms-textbox" activestatus="(23.填写任务单)(3.修改任务单)" readonly="readonly" tablename="MDM_TASKINFOFORM">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiManagerID" field="MANAGERID" tablename="MDM_TASKINFOFORM" />
        </td>
    </tr>
    <tr style="display: none">
        <td class="td-l" rowspan="3">
            业主要求
        </td>
        <td class="td-r" style="background-color: #f3f4f4">
            进度要求
        </td>
        <td class="td-m" colspan="4">
            <zhongsoft:LightTextBox ID="tbProgressRequire" CssClass="kpms-textarea" runat="server"
                TextMode="MultiLine" EnableTheming="false" maxtext="512" tablename="MDM_MIDMARKETPROJECT"
                activestatus="(23.填写任务单)(3.修改任务单)" field="PROGRESSREQUIRE" editFirst="true"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr style="display: none">
        <td class="td-r" style="background-color: #f3f4f4">
            质量要求
        </td>
        <td class="td-m" colspan="4">
            <zhongsoft:LightTextBox ID="tbQualityRequire" CssClass="kpms-textarea" runat="server"
                activestatus="(23.填写任务单)(3.修改任务单)" TextMode="MultiLine" EnableTheming="false"
                maxtext="512" tablename="MDM_MIDMARKETPROJECT" field="QUALITYREQUIRE" editFirst="true"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l" rowspan="1">
            业主其他要求
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbOtherRequire" CssClass="kpms-textarea" runat="server"
                activestatus="(23.填写任务单)(3.修改任务单)" TextMode="MultiLine" EnableTheming="false"
                maxtext="512" tablename="MDM_MIDMARKETPROJECT" field="OTHERREQUIRE"></zhongsoft:LightTextBox>
        </td>
    </tr>

 
    <tr>
        <td class="td-l">
            项目补充信息
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbAdditionInfo" CssClass="kpms-textarea" runat="server"
                TextMode="MultiLine" EnableTheming="false" maxtext="512" tablename="MDM_TASKINFOFORM"
                field="ADDITIONINFO" activestatus="(23.填写任务单)(3.修改任务单)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr style="display: none">
        <td class="td-l">
            合同签订状态
        </td>
        <td class="td-m" colspan="5">
            <asp:Label runat="server" ID="lbContractState"></asp:Label>
            <a runat="server" id="aViewContractDetail" title="点击查看合同信息" class="aStyle">点击查看合同信息</a>
        </td>
    </tr>
</table>
<!---流程主键ID--->
<input type="hidden" runat="server" id="hiTaskInfoFormID" field="TASKINFOFORMID"
    tablename="MDM_TASKINFOFORM" />
<!---工程ID-->
<input type="hidden" runat="server" id="hiMarketProjectID" field="MARKETPROJECTID"
    tablename="MDM_TASKINFOFORM" />
<!---工程中间表ID-->
<input type="hidden" runat="server" id="hiOldMarketProjectID" />
<!---下达任务类别 非调整，则为1-->
<input type="hidden" runat="server" id="hiIsNew" field="ISNEW" tablename="MDM_TASKINFOFORM"
    value="1" />
<!---任务单类型-->
<input type="hidden" runat="server" id="hiFormType" field="FormType" tablename="MDM_TASKINFOFORM" />
<!---下达的阶段数-->
<input type="hidden" runat="server" id="hiProjectNum" value="0" />
<script>
    function initCustomerPlugin() {
        checkMaxLength();
    }
    
    function checkForm() {     
        if ($formAction == 0) {
            var num=$("#<%=hiProjectNum.ClientID %>").val();
            if(num=="0"){
                alert("请添加下达的阶段！");
                return false;
            }
        }
        return true;
    }

    function beforeSelMarket(){
       var marketProjectID= $("#<%=hiMarketProjectID.ClientID %>").val();
       $("#<%=hiOldMarketProjectID.ClientID %>").val(marketProjectID);
       return true;
    }

    function afterSelMarket() { 
       <%=this.Page.ClientScript.GetPostBackEventReference(this.lboSelMarket, "")%>;
       return false;
    }

    function AfterSelectEngineer() {
        var chiefEngineerID = $("#<%=hiChiefEngineerID.ClientID %>").val();
        var chiefEngineerBID = $("#<%=hidChiefEngineerBID.ClientID %>").val();
        if (chiefEngineerID==chiefEngineerBID) {
            alert("分管总工A与分管总工B不能是同一个人，请重新选择分管总工B！");
            $("#<%=lbosChiefEngineerBName.ClientID %>").val("");
            $("#<%=lbosChiefEngineerBName.ClientID %>"+"_hivalue").val("");
            $("#<%=hidChiefEngineerBID.ClientID %>").val("");
        }
    }

    //查看签订的合同信息
    function viewContractDetail(contractID) {
        var url = buildBizUrl(1, contractID, "MM/List/MCM/ContractEditor.aspx", null);
        showDivDialog(url, null, 750, 1150, null);
        return false;
    }
   
    //部门
    function deptFilter(deptCode) {
        return {DeptName: deptCode };
    }
</script>
