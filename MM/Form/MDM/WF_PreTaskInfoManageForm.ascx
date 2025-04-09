<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_PreTaskInfoManageForm.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.Form.MDM.WF_PreTaskInfoManageForm" %>
<%@ Import Namespace="Zhongsoft.Portal" %>
<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<%@ Import Namespace="Zhongsoft.Portal" %>
<%@ Import Namespace="EDPortal.BLL.MM" %>
<table class="tz-table">
    <tr>
        <td class="td-l">
            下达部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtBelongDept" field="BELONGDEPTNAME"
                activestatus="(23.编写任务提供单)(3.修改任务提供单)" tablename="MDM_TASKINFOFORM" class="kpms-textbox"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
            <input id="hiBelongDeptID" type="hidden" field="BELONGDEPTID" runat="server" tablename="MDM_TASKINFOFORM" />
        </td>
        <td class="td-l">
            下达人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtIssueUserName" field="TaskIssueUserName"
                style="width: 70px" activestatus="(23.编写任务提供单)(3.修改任务提供单)" tablename="MDM_TASKINFOFORM"
                class="kpms-textbox" readonly="readonly">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiTaskIssueUserID" field="TaskIssueUserID"
                tablename="MDM_TASKINFOFORM" />
        </td>
        <td class="td-l">
            任务下达日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtTaskIssuedDate" field="TASKISSUEDDATE"
                activestatus="(23.编写任务提供单)(3.修改任务提供单)" tablename="MDM_TASKINFOFORM" class="kpms-textbox-date"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            计划类别<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <asp:RadioButtonList runat="server" ID="rbPlanType" activestatus="(23.编写任务提供单)(3.修改任务提供单)"
                RepeatDirection="Horizontal" req="1" field="PlanType" tablename="MDM_TASKINFOFORM"
                AutoPostBack="true" OnSelectedIndexChanged="rbPlanType_SelectedIndexChanged">
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            任务接收部门<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlTaskReceiveDept" tableName="MDM_TASKINFOFORM"
                req="1" activestatus="(23.编写任务提供单)(3.修改任务提供单)" runat="server">
            </zhongsoft:LightDropDownList>
            <input id="hiTaskReceiveDeptID" type="hidden" field="RECEIVEDEPTID" runat="server"
                tablename="MDM_TASKINFOFORM" />
            <input id="hiTaskReceiveDeptName" type="hidden" field="RECEIVEDEPRNAME" runat="server"
                tablename="MDM_TASKINFOFORM" />
        </td>
        <td class="td-l">
            任务接收人
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lboTaskReceiveUserName" activestatus="(3.?)" PageWidth="800px" SelectPageMode="Dialog"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" FilterFunction="userFilter()"
                BeforeSelect="beforeSelectUser()" ResultAttr="name" EnableTheming="false" Writeable="false"
                ShowAttrs="name,UserCode" ResultForControls="{'hiTaskIssueUserID':'id'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx">
            </zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hidTaskReceiveUserName" tablename="MDM_TASKINFOFORM"
                field="RECEIVEUSERNAME" />
            <input type="hidden" runat="server" id="hiTaskReceiveUserID" field="RECEIVEUSERID"
                tablename="MDM_TASKINFOFORM" />
        </td>
        <td class="td-l">
            任务接收日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtReceiveDate" field="RECEIVEDATE"
                activestatus="(3.签收生产任务)" tablename="MDM_TASKINFOFORM" class="kpms-textbox-date"
                readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            任务名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:XHtmlInputText runat="server" ID="txtTaskName" field="TASKNAME" tablename="MDM_TASKINFOFORM"
                class="kpms-textbox" req="1" activestatus="(23.编写任务提供单)(3.修改任务提供单)" MaxLength="64">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            任务内容
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbConditionDescription" CssClass="kpms-textarea" runat="server"
                TextMode="MultiLine" EnableTheming="false" maxtext="512" tablename="MDM_TASKINFOFORM"
                field="CONDITIONDESCRIPTION" activestatus="(23.编写任务提供单)(3.修改任务提供单)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr style="display: none" showtype="haveContract">
        <td colspan="6" class="flexible" onclick="openDetail('trContract')">
            下达合同列表&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr id="trContract" showtype="haveContract" style="display: none">
        <td colspan="6">
            <table class="tz-table">
                <tr runat="server" displaystatus="(23.编写任务提供单)(3.修改任务提供单)">
                    <td colspan="6" align="right">
                        <span style="float: right;" id="spAdd" runat="server">
                            <asp:LinkButton runat="server" ID="lbtnAddContract" CssClass="subtoolbarlink" EnableTheming="false"
                                OnClientClick="return selContract()" OnClick="btnAddContract_Click">
                                <span>
                                    <img id="Img1" runat="server" src="~/Themes/Images/btn_add.gif" alt="添加关联合同" width="16"
                                        height="16" />添加关联合同</span>
                            </asp:LinkButton>
                        </span>
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <zhongsoft:LightPowerGridView ID="gvContract" runat="server" AutoGenerateColumns="False"
                            UseDefaultDataSource="true" AllowPaging="false" PageSize="25" ShowExport="true"
                            DataKeyNames="TaskRelContractID" BindGridViewMethod="UserControl.BindRelContract"
                            OnRowCommand="gvContract_RowCommand">
                            <Columns>
                                <zhongsoft:LightBoundField HeaderText="合同名称" DataField="CONTRACTNAME" Width="250"
                                    ShowToolTip="true">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField HeaderText="合同编号" DataField="CONTRACTCODE">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField HeaderText="合同相对方" DataField="CUSTOMERNAME" ShowToolTip="true">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField HeaderText="承办人" DataField="UNDERTAKEUSERNAME">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField HeaderText="承办部门" DataField="UNDERTAKEDEPTNAME">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightButtonField CommandName="ViewData" HeaderText="查看" CausesValidation="false"
                                    DataParamFields="ContractID" EditItemClick="viewContract">
                                    <HeaderStyle HorizontalAlign="Center" Width="35px"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </zhongsoft:LightButtonField>
                                <zhongsoft:LightButtonField HeaderText="删除" CommandName="DeleteData">
                                    <HeaderStyle HorizontalAlign="Center" Width="35px"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </zhongsoft:LightButtonField>
                            </Columns>
                            <PagerStyle HorizontalAlign="Right"></PagerStyle>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="6" class="flexible" onclick="openDetail('trRelProject')">
            相关工程列表&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr id="trRelProject">
        <td colspan="6">
            <table class="tz-table">
                <tr runat="server" displaystatus="(23.编写任务提供单)(3.修改任务提供单)">
                    <td colspan="6" align="right">
                        <span style="float: right;" id="spanAddProject" runat="server">
                            <asp:LinkButton runat="server" ID="lbtnAddProject" CssClass="subtoolbarlink" EnableTheming="false"
                                OnClientClick="return selMarketProject()" OnClick="lbtnSelProject_Click">
                                <span>
                                    <img id="Img2" runat="server" src="~/Themes/Images/btn_add.gif" alt="添加关联工程" width="16"
                                        height="16" />添加关联工程</span>
                            </asp:LinkButton>
                        </span>
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <zhongsoft:LightPowerGridView ID="gvRelateProject" runat="server" AllowPaging="false"
                            AutoGenerateColumns="false" UseDefaultDataSource="true" DataKeyNames="MARKETPROJECTID"
                            ShowHeaderWhenEmpty="true" OnRowCommand="gvRelateProject_RowCommand" ShowExport="true"
                            OnRowDataBound="gvRelateProject_RowDataBound" OnExport="gvRelateProject_OnExport"
                            PermissionStatus="true">
                            <Columns>
                                <zhongsoft:LightBoundField DataField="MARKETPROJECTNAME" HeaderText="工程名称" Width="100px"
                                    ItemStyle-HorizontalAlign="Left" ShowToolTip="true" />
                                <zhongsoft:LightBoundField DataField="MARKETPROJECTCODE" HeaderText="工程编号" Width="30px" />
                                <zhongsoft:LightTemplateField HeaderText="阶段项目名称">
                                    <ItemTemplate>
                                        <zhongsoft:LightTextBox runat="server" ID="txtProjectPhaseName" Text='<%#Eval("ProjectPhaseName") %>'
                                            activestatus="(23.编写任务提供单)(3.修改任务提供单)(23.审批)" CssClass="kpms-textarea" TextMode="MultiLine"
                                            EnableTheming="false" />
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightBoundField DataField="PhaseNameNew" HeaderText="阶段" Width="30px" />
                                <zhongsoft:LightTemplateField HeaderText="进度要求<span class='req-star'>*</span>">
                                    <ItemTemplate>
                                        <zhongsoft:LightTextBox runat="server" ID="txtProgressRequire" Text='<%#Eval("ProgressRequire") %>'
                                            activestatus="(23.编写任务提供单)(3.修改任务提供单)(23.审批)" CssClass="kpms-textarea" TextMode="MultiLine"
                                            EnableTheming="false" req="1" />
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="质量要求<span class='req-star'>*</span>">
                                    <ItemTemplate>
                                        <zhongsoft:LightTextBox runat="server" ID="txtQualityRequire" Text='<%#Eval("QualityRequire") %>'
                                            activestatus="(23.编写任务提供单)(3.修改任务提供单)(23.审批)" CssClass="kpms-textarea" TextMode="MultiLine"
                                            EnableTheming="false" req="1" />
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="选择阶段">
                                    <ItemStyle Width="150px"></ItemStyle>
                                    <ItemTemplate>
                                        <span style="display: none"><a href='javascript:showPhase("div<%#Eval("ProCode") %>");'
                                            id='a<%#Eval("ProCode") %>'>
                                            <img id="Img2" runat="server" src="~/Themes/Images/btn_add.gif" alt="选择阶段" width="16"
                                                height="16" />选择阶段</a></span>
                                        <div id='div<%#Eval("ProCode") %>' align="center">
                                            <asp:CheckBoxList runat="server" ID="cbIssuePhases" RepeatDirection="Horizontal"
                                                RepeatColumns="3" AutoPostBack="True" OnSelectedIndexChanged="cbIssuePhases_OnSelectedIndexChanged">
                                            </asp:CheckBoxList>
                                            <a style="float: right" id="aMorePhase" runat="server" onserverclick="aMorePhase_OnServerClick">
                                                更多专题…</a> <a style="float: right" id="aMorePhaseEnvsisible" runat="server" visible="False"
                                                    onserverclick="aMorePhase_OnServerClick">收起</a>
                                            <input type="hidden" runat="server" id="hiMarketProjectID" value='<%#Eval("MarketProjectID") %>' />
                                            <input type="hidden" runat="server" id="hiIsAMoreClick" value="" />
                                        </div>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="viewMarketProject" DataParamFields="MARKETPROJECTID"
                                    CommandName="ViewData" />
                                <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" DeleteText="您确认删除该项目吗？">
                                </zhongsoft:LightButtonField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="6" class="flexible" onclick="openDetail('trContractFile')">
            <span id="fileTitle">合同附件</span>&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr id="trContractFile">
        <td colspan="6">
            <table class="tz-table">
                <tr id="Tr1" runat="server" displaystatus="(23.编写任务提供单)(3.修改任务提供单)">
                    <td colspan="6" align="right">
                        <zhongsoft:LightFileUploader runat="server" ID="btnUpLoad" CssClass="subtoolbarlink"
                            EnableTheming="false" OnClick="btnBindFile_Click"> <span>
                            <img id="imgFile" src="../../Themes/Images/ico_fujian.gif" alt="上传文件" width="16"
                                height="16" />上传文件</span></zhongsoft:LightFileUploader>
                        <asp:LinkButton runat="server" ID="lbtnGetContractFile" CssClass="subtoolbarlink"
                            Style="display: none" showtype="haveContract" EnableTheming="false" OnClick="btnGetContractFile_Click">
                            <span>
                                <img id="Img3" runat="server" src="~/Themes/Images/btn_add.gif" alt="获取合同附件信息" width="16"
                                    height="16" />获取合同附件信息</span>
                        </asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <zhongsoft:LightPowerGridView ID="gvFileList" runat="server" AllowPaging="false"
                            UseDefaultDataSource="true" AutoGenerateColumns="false" DataKeyNames="FileID"
                            OnRowCommand="gvFileList_RowCommand" ShowExport="false" ShowFooter="false">
                            <Columns>
                                <zhongsoft:LightTemplateField HeaderText="文件名称">
                                    <ItemTemplate>
                                        <a href="<%=this.WebAppPath %>/Sys/Handler/FileDownloadHandler.ashx?fileId=<%#Eval("fileId") %>"
                                            class="aStyle" target="_blank" title="<%# Eval("FileName") %>">
                                            <%# Eval("FileName") %>
                                        </a>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="删除">
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <input type="hidden" runat="server" id="hiFilePath" value='<%#Eval("FILEPATH") %>' />
                                        <asp:LinkButton ID="lbDelete" runat="server" alt="" CommandName="DeleteData" OnClientClick="return confirm('确认要删除吗？');"
                                            EnableTheming="false" CommandArgument='<%#Eval("FileID") %>'><img id="btDelete" title="删除" style="CURSOR: hand" src="../../Themes/Images/btn_dg_delete.gif" border="0"></asp:LinkButton>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<!---流程主键ID--->
<input type="hidden" runat="server" id="hiTaskInfoFormID" field="TASKINFOFORMID"
    tablename="MDM_TASKINFOFORM" />
<!--流程类型-->
<input type="hidden" runat="server" id="hiFormType" field="FormType" tablename="MDM_TASKINFOFORM" />
<input type="hidden" runat="server" id="hiSelContractXml" />
<input type="hidden" runat="server" id="hiSelMarketXml" />
<input type="hidden" runat="server" id="hiProjectNum" value="0" />
<input type="hidden" runat="server" id="hidCheck" />
<%--//存放点击更多专题的行id gyp--%>
<input type="hidden" runat="server" id="hiAMoreClick" value="," />
<%--存放阶段信息 gyp--%>
<input type="hidden" runat="server" id="hiPhaseNameNew" />
<asp:LinkButton runat="server" ID="lbtnEditProject" OnClick="lbtnEditProject_Click"
    Style="display: none"></asp:LinkButton>
<script type="text/javascript">
    function showPhase(divName) {
        $("#" + divName).dialog({
            title: "选择项目阶段",
            closed: true,
            cache: true,
            modal: true
//            buttons: {
//                "确定": function () {
//                    $(this).dialog("close");
//                    return true;
//                },
//                "取消": function () {
//                    $(this).dialog("close");
//                    return false;
//                }
//            }
        });
    }

    function CloseDialog(divName) {
        alert(1);
        $("#" + divName).dialog('close');
    }

    function SavePhase(aName, divName) {
        $("#" + aName).next().click();
        $("#" + divName).dialog('close');
    }

    function initCustomerPlugin() {
        checkMaxLength();
        dislpayOfContractInfo();    
    }
    //添加修改gyp
    function checkForm() {
        if ($formAction == 0) {
            var num = $("#<%=hiProjectNum.ClientID %>").val();
            if (num == "0") {
                alert("请添加下达的工程！");
                return false;
            }
            <%CheckCKB(); %>
            var check = $("#<%=hidCheck.ClientID %>").val();
            if (check == "0") {
                alert("请完善工程信息的设计阶段！");
                return false;
            }
            //必须选择项目阶段才可下一步gyp
            var hiPhaseNameNew =  $("#<%=hiPhaseNameNew.ClientID %>").val();
            if (hiPhaseNameNew == "" || hiPhaseNameNew==null) {
                alert("请选择工程阶段！");
                return false;
            }
        }
        return true;
    }


    //是否显示合同信息
    function dislpayOfContractInfo() {
        var formType = $("#<%=hiFormType.ClientID %>").val();
        if (formType == "<%=(int)MMEnum.TaskFormType.已签合同生产任务单 %>") {
            $('[showtype=haveContract]').show();
        }
        else {
            $('#fileTitle').html("相关附件");
        }
    }

    //选择市场项目
    function selContract() {
        var param = new InputParamObject("m");
        getDivContract('<%=hiSelContractXml.ClientID %>', param, null, afterSelContract);
        return false;
    }

    function afterSelContract() {
        <%=this.Page.ClientScript.GetPostBackEventReference(this.lbtnAddContract, "")%>;
        return false;
    }

    //选择市场项目
    function selMarketProject() {
        var param = new InputParamObject("m");
        var json = null;
        getMarketDivProjects('<%=hiSelMarketXml.ClientID %>', param, json, afterSelMarketProject);
        return false;
    }

    function afterSelMarketProject() {
        <%=this.Page.ClientScript.GetPostBackEventReference(this.lbtnAddProject, "")%>;
    }

    //查看合同信息
    function viewContract(contractID) {
        var url = buildBizUrl(1, contractID, "MM/List/MCM/ContractEditor.aspx", null);
        showDivDialog(url, null, 900, 650, null);
        return false;
    }

    //查看合同信息
    function showMarketProject(actType, marketProjectID) {
        var callBack = null;
        var taskInfoFormID = $bizCtx.bizId;
        var json = { taskInfoFormID: taskInfoFormID };
        var url = buildBizUrl(actType, marketProjectID, "MM/List/MDM/MarketProjectEditor.aspx", json);
        if (actType == 3)
            callBack = afterEditProject;
        showDivDialog(url, json, 850, 650, callBack);
        return false;
    }

    function viewMarketProject(marketProjectID) {
        showMarketProject(1, marketProjectID);
    }

    function editMarketProject(marketProjectID) {
        showMarketProject(3, marketProjectID);
    }

    function afterEditProject() {
        <%=this.Page.ClientScript.GetPostBackEventReference(this.lbtnEditProject, "")%>;
    }


    //选择任务之前的逻辑判断
    function beforeSelectUser() {
        var receiveDeptID = $('#<%=ddlTaskReceiveDept.ClientID %>').val();
        if (receiveDeptID == '' || receiveDeptID == null) {
            alert('请先选择任务接收部门！');
            return false;
        }
        return true;
    }

    //任务接收人
    function userFilter() {
        var receiveDeptID = $('#<%=ddlTaskReceiveDept.ClientID %>').val();
        return { OrganizationId: receiveDeptID };
    }
</script>
