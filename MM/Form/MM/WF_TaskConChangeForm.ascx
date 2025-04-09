<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_TaskConChangeForm.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.Form.MM.WF_TaskConChangeForm" %>
<%@ Import Namespace="EDPortal.BLL.MM" %>
<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<table class="tz-table">
    <tr>
        <td class="td-l">
            申请人姓名
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyUserName" runat="server" type="text" class="kpms-textbox"
                tablename="MM_TASKCONCHANGEFORM" field="APPLYUSERNAME" readonly="readonly" activestatus="(23.发起信息变更)(3.修改变更信息)" />
            <input id="hiApplyUserID" runat="server" type="hidden" tablename="MM_TASKCONCHANGEFORM"
                field="APPLYUSERID" />
        </td>
        <td class="td-l">
            申请人部门
        </td>
        <td class="td-r">
            <input type="hidden" runat="server" id="hiApplyDeptID" tablename="MM_TASKCONCHANGEFORM"
                field="APPLYDEPTID" />
            <zhongsoft:XHtmlInputText ID="txtApplyDeptName" runat="server" type="text" class="kpms-textbox"
                style="width: 180px" tablename="MM_TASKCONCHANGEFORM" field="APPLYDEPTNAME" readonly="readonly"
                activestatus="(23.发起信息变更)(3.修改变更信息)" />
        </td>
        <td class="td-l">
            申请人电话
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtUserPhone" runat="server" type="text" class="kpms-textbox"
                style="width: 180px" tablename="MM_TASKCONCHANGEFORM" field="APPLYDEPTNAME" readonly="readonly"
                activestatus="(23.发起信息变更)(3.修改变更信息)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            变更类型<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <asp:RadioButtonList runat="server" ID="rbChangeType" activestatus="(23.发起信息变更)(3.修改变更信息)"
                OnSelectedIndexChanged="rbChangeType_SelectedIndexChanged" RepeatDirection="Horizontal"
                AutoPostBack="true" field="CHANGETYPE" tablename="MM_TASKCONCHANGEFORM" req="1">
            </asp:RadioButtonList>
        </td>
        <td class="td-l">
            日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtApplyDate" runat="server" type="text" req="1" class="kpms-textbox-date"
                tablename="MM_TASKCONCHANGEFORM" field="APPLYDATE" readonly="readonly" activestatus="(23.发起信息变更)" />
        </td>
    </tr>
    <tr id="trManagerType">
        <td class="td-l">
            经营经理变更<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <asp:RadioButtonList runat="server" ID="rbManagerChangeType" activestatus="(23.发起信息变更)(3.修改变更信息)"
                AutoPostBack="true" OnSelectedIndexChanged="rbChangeType_SelectedIndexChanged"
                RepeatDirection="Horizontal" field="MANAGERCHANGETYPE" tablename="MM_TASKCONCHANGEFORM">
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr id="trSelContractCustomer" displaystatus="(23.发起信息变更)(3.修改变更信息)" runat="server">
        <td class="td-m" colspan="6" align="right">
            <span id="Span1" class="req-star" runat="server" displaystatus="(2.发起信息变更)">请先保存，再添加合同信息</span>
            <asp:Button ID="btnContractCustomer" runat="server" OnClick="lobsContract_Click"
                displaystatus="(3.发起信息变更)(3.修改变更信息)" Text="选择合同" OnClientClick="return selContract()" />
        </td>
    </tr>
    <tr id="trSelTask" displaystatus="(23.发起信息变更)(3.修改变更信息)" runat="server">
        <td colspan="6" align="right" class="td-m">
            <span class="req-star" runat="server" displaystatus="(2.发起信息变更)">请先保存，再添加生产任务单</span>
            <asp:Button ID="btnSelTask" runat="server" OnClick="btnTask_Click" Text="选择生产任务单"
                displaystatus="(3.发起信息变更)(3.修改变更信息)" OnClientClick="return selTask()" />
        </td>
    </tr>
    <tr id="trSelContract" displaystatus="(23.发起信息变更)(3.修改变更信息)" runat="server">
        <td colspan="6" align="right" class="td-m">
            <span id="Span2" class="req-star" runat="server" displaystatus="(2.发起信息变更)">请先保存，再添加合同信息</span>
            <asp:Button ID="btnSelOtherContract" runat="server" OnClick="btnContract_Click" Text="选择合同"
                displaystatus="(3.发起信息变更)(3.修改变更信息)" OnClientClick="return selContract()" />
        </td>
    </tr>
    <tr id="trTaskInfo">
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvTaskInfo" runat="server" UseDefaultDataSource="true"
                DataKeyNames="TASKCONCHANGEDETAILID" OnRowCommand="gvChange_RowCommand" ShowExport="true"
                permissionstatus="true" AllowPaging="false" OnRowDataBound="gvChange_RowDataBound">
                <Columns>
                    <zhongsoft:LightBoundField DataField="TASKCODE" HeaderText="任务编号" ItemStyle-Wrap="false">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="TASKNAME" HeaderText="任务名称" ShowToolTip="true"
                        Width="150">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="MANAGERNAME" HeaderText="经营经理">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="ORGCUSTOMERNAME" HeaderText="变更前业主名称" ShowToolTip="true"
                        Width="150">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="拟定变更业主名称<span class='req-star'>*</span>">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText type="text" ID="txtCustomerName" runat="server" readonly="readonly"
                                activestatus="(23.发起信息变更)(3.修改变更信息)" req="1" checkNum="true" class="kpms-textbox"
                                value='<%#Eval("CHANGEDCUSTOMERNAME") %>' style="width: 85%" />
                            <input type="hidden" runat="server" id="hiCustomerID" value='<%#Eval("CHANGEDCUSTOMERID") %>' />
                            <asp:LinkButton runat="server" ID="lbtnSelCustomer" CssClass="btn-look-up" EnableTheming="false"
                                displaystatus="(23.发起信息变更)(3.修改变更信息)">
                                    <img title="选择业主信息" attr="select" src="../../Themes/Images/look-up.gif">
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除">
                    </zhongsoft:LightButtonField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr id="trTaskManager">
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvTaskManager" runat="server" UseDefaultDataSource="true"
                DataKeyNames="TASKCONCHANGEDETAILID" OnRowCommand="gvChange_RowCommand" ShowExport="true"
                permissionstatus="true" AllowPaging="false" OnRowDataBound="gvChange_RowDataBound">
                <Columns>
                    <zhongsoft:LightBoundField DataField="TASKCODE" HeaderText="任务编号" ItemStyle-Wrap="false">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="TASKNAME" HeaderText="任务名称" ShowToolTip="true"
                        Width="250">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="CUSTOMERNAME" HeaderText="业主名称" ShowToolTip="true"
                        Width="250">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="ORGMANAGERNAME" HeaderText="经营经理变更前">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="拟定经营经理变更<span class='req-star'>*</span>"
                        ItemStyle-Width="100px">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText type="text" ID="txtManagerName" runat="server" readonly="readonly"
                                style="width: 70px" activestatus="(23.发起信息变更)(3.修改变更信息)" req="1" checkNum="true"
                                class="kpms-textbox" value='<%#Eval("CHANGEDMANAGERNAME") %>' />
                            <input type="hidden" runat="server" id="hiManagerID" value='<%#Eval("CHANGEDMANAGERID") %>' />
                            <asp:LinkButton runat="server" ID="lbtnSelManager" CssClass="btn-look-up" EnableTheming="false"
                                displaystatus="(23.发起信息变更)(3.修改变更信息)">
                                    <img title="选择经营经理"  attr="select" src="../../Themes/Images/look-up.gif">
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除">
                    </zhongsoft:LightButtonField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr id="trContractCustomer">
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvContractCustomer" runat="server" UseDefaultDataSource="true"
                DataKeyNames="TASKCONCHANGEDETAILID" OnRowCommand="gvChange_RowCommand" ShowExport="true"
                permissionstatus="true" AllowPaging="false" BindGridViewMethod="UserControl.BindContractInfo"
                OnRowDataBound="gvChange_RowDataBound">
                <Columns>
                    <zhongsoft:LightBoundField DataField="CONTRACTCODE" HeaderText="合同编号" ItemStyle-Wrap="false">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="CONTRACTNAME" HeaderText="合同名称" ShowToolTip="true"
                        Width="250">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="ORGCUSTOMERNAME" HeaderText="变更前业主" ShowToolTip="true"
                        Width="150">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="拟定业主变更<span class='req-star'>*</span>">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText type="text" ID="txtCustomerName" runat="server" readonly="readonly"
                                activestatus="(23.发起信息变更)(3.修改变更信息)" req="1" checkNum="true" class="kpms-textbox"
                                value='<%#Eval("CHANGEDCUSTOMERNAME") %>' style="width: 85%" />
                            <input type="hidden" runat="server" id="hiCustomerID" value='<%#Eval("CHANGEDCUSTOMERID") %>' />
                            <asp:LinkButton runat="server" ID="lbtnSelCustomer" CssClass="btn-look-up" EnableTheming="false"
                                displaystatus="(23.发起信息变更)(3.修改变更信息)">
                                    <img title="选择业主"  attr="select" src="../../Themes/Images/look-up.gif">
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="拟定联系人" ItemStyle-Width="100px">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText type="text" ID="txtContactName" runat="server" readonly="readonly"
                                activestatus="(23.发起信息变更)(3.修改变更信息)" style="width: 70px" class="kpms-textbox"
                                value='<%#Eval("CHANGEDCONTACTNAME") %>' />
                            <input type="hidden" runat="server" id="hiContactID" value='<%#Eval("CHANGEDCONTACTID") %>' />
                            <asp:LinkButton runat="server" ID="lbtnSelContact" CssClass="btn-look-up" EnableTheming="false"
                                displaystatus="(23.发起信息变更)(3.修改变更信息)">
                                    <img title="选择联系人"  attr="select" src="../../Themes/Images/look-up.gif">
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除">
                    </zhongsoft:LightButtonField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr id="trContractManger">
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvContractManager" runat="server" UseDefaultDataSource="true"
                DataKeyNames="TASKCONCHANGEDETAILID" OnRowCommand="gvChange_RowCommand" ShowExport="true"
                permissionstatus="true" AllowPaging="false" BindGridViewMethod="UserControl.BindContractInfo"
                OnRowDataBound="gvChange_RowDataBound">
                <Columns>
                    <zhongsoft:LightBoundField DataField="CONTRACTCODE" HeaderText="合同编号" ItemStyle-Wrap="false">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="CONTRACTNAME" HeaderText="合同名称" ShowToolTip="true"
                        Width="350">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="ORGMANAGERNAME" HeaderText="变更前经营经理">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="拟定经营经理变更<span class='req-star'>*</span>"
                        ItemStyle-Width="120px">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText type="text" ID="txtManagerName" runat="server" readonly="readonly"
                                activestatus="(23.发起信息变更)(3.修改变更信息)" req="1" checkNum="true" class="kpms-textbox"
                                value='<%#Eval("CHANGEDMANAGERNAME") %>' style="width: 100px" />
                            <input type="hidden" runat="server" id="hiManagerID" value='<%#Eval("CHANGEDMANAGERID") %>' />
                            <asp:LinkButton runat="server" ID="lbtnSelManager" CssClass="btn-look-up" EnableTheming="false"
                                displaystatus="(23.发起信息变更)(3.修改变更信息)">
                                    <img title="选择经营经理"  attr="select" src="../../Themes/Images/look-up.gif">
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除">
                    </zhongsoft:LightButtonField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<!---流程主键--->
<input type="hidden" runat="server" id="hiTaskConChangeFormID" field="TASKCONCHANGEFORMID"
    tablename="MM_TASKCONCHANGEFORM" />
<input type="hidden" runat="server" id="hiSelXml" />
<script>
    function initCustomerPlugin() {
        displayOfCustomerInfo();
        displayOfManagerInfo();
        //变更类型不同，显示的内容不同
        $("#<%=rbChangeType.ClientID %>").live("change", function () { displayOfCustomerInfo(); });
        //项目经理变更类型不同，显示的内容不同
        $("#<%=rbManagerChangeType.ClientID %>").live("change", function () { displayOfManagerInfo(); });

    }
    //发送前验证
    function checkForm() {
        if ($formAction == 0) {
            if ($actName == "发起信息变更" || $actName == "修改变更信息") {
                //生产任务变更，提示 需要上传证明材料
                var changeType = getChangeType();
                if (changeType == "<%=(int)MMEnum.TaskConChangeType.生产任务业主变更 %>".toString()) {
                    //提示上传证明材料
                    alert("请将证明材作为附件上传");
                    //验证是否选择了变更的生产任务单
                    if (!getListNum("<%=gvTaskInfo.ClientID %>", "您还没有选择生产任务，请选择生产任务")) {
                        return false;
                    }
                }
                else if (changeType == "<%=(int)MMEnum.TaskConChangeType.合同相对方变更 %>".toString()) {
                    //提示上传证明材料
                    alert("请将证明材作为附件上传");
                    //验证是否选择了变更的合同信息
                    if (!getListNum("<%=gvContractCustomer.ClientID %>", "您还没有选择合同，请选择合同")) {
                        return false;
                    }
                }
                else if (changeType == "<%=(int)MMEnum.TaskConChangeType.经营经理变更 %>".toString()) {
                    var managerChangeType = getManagerChangeType();
                    //验证是否选择了经营经理信息
                    if (managerChangeType == "<%=(int)MMEnum.ManageChangeType.项目经营经理变更%>") {
                        if (!getListNum("<%=gvTaskManager.ClientID %>", "您还没有选择生产任务单，请选择生产任务单"))
                            return false;
                    }
                    else {
                        if (!getListNum("<%=gvContractManager.ClientID %>", "您还没有选择合同，请选择合同"))
                            return false;
                    }
                }
            }
        }
        return true;
    }

    //控制业主信息的显示
    function displayOfCustomerInfo() {
        //当生产任务单业主变更时，显示生产任务单信息
        var changeType = getChangeType();
        if (changeType == "<%=(int)MMEnum.TaskConChangeType.生产任务业主变更 %>".toString()) {
            $("#trTaskInfo").show();
            $("#trTaskManager").hide();
            $("#trContractCustomer").hide();
            $("#trContractManger").hide();
            $("#trManagerType").hide();
            $("#<%=trSelContractCustomer.ClientID %>").hide();
            $("#<%=trSelContract.ClientID %>").hide();
            if ($bizCtx.action == "<%=(int)AccessLevel.Update %>") {
                $("#<%=trSelTask.ClientID %>").show();
            }
            //控制经营经理变更类型必填
            $("#<%=rbManagerChangeType.ClientID %>").removeAttr("req");
        }
        //合同业主变更时，显示合同业主信息
        else if (changeType == "<%=(int)MMEnum.TaskConChangeType.合同相对方变更 %>".toString()) {
            $("#trTaskInfo").hide();
            $("#trTaskManager").hide();
            $("#trContractCustomer").show();
            $("#trContractManger").hide();
            $("#trManagerType").hide();
            $("#<%=trSelContractCustomer.ClientID %>").show();
            $("#<%=trSelTask.ClientID %>").hide();
            $("#<%=trSelContract.ClientID %>").hide();
            //经营经理变更类型非必填
            $("#<%=rbManagerChangeType.ClientID %>").removeAttr("req");
        }
        else {
            $("#trTaskInfo").hide();
            $("#trTaskManager").hide();
            $("#trContractCustomer").hide();
            $("#trContractManger").hide();
            $("#<%=trSelContractCustomer.ClientID %>").hide();
            $("#<%=trSelTask.ClientID %>").hide();
            $("#<%=trSelContract.ClientID %>").hide();
            if (changeType == "<%=(int)MMEnum.TaskConChangeType.经营经理变更 %>".toString()) {
                $("#trManagerType").show();
                //控制经营经理变更类型必填
                $("#<%=rbManagerChangeType.ClientID %>").attr("req", "1");
            }
            else {
                $("#trManagerType").hide();
                //经营经理变更类型非必填
                $("#<%=rbManagerChangeType.ClientID %>").removeAttr("req");
            }
        }
    }
    //控制项目经理新的显示
    function displayOfManagerInfo() {
        var managerChangeType = $("#<%=rbManagerChangeType.ClientID %> :checked").val();
        var changeType = getChangeType();
        if (changeType == "<%=(int)MMEnum.TaskConChangeType.经营经理变更 %>".toString()) {
            if (managerChangeType == "<%=(int)MMEnum.ManageChangeType.合同下项目经营经理变更 %>".toString()) {
                $("#trContractManger").show();
                $("#trTaskManager").hide();
                $("#<%=trSelTask.ClientID %>").hide();
                $("#<%=trSelContract.ClientID %>").show();
            }
            else if (managerChangeType == "<%=(int)MMEnum.ManageChangeType.项目经营经理变更 %>".toString()) {
                $("#trContractManger").hide();
                $("#trTaskManager").show();
                $("#<%=trSelTask.ClientID %>").show();
                $("#<%=trSelContract.ClientID %>").hide();
            }
            else {
                $("#trContractManger").hide();
                $("#trTaskManager").hide();
                $("#<%=trSelTask.ClientID %>").hide();
                $("#<%=trSelContract.ClientID %>").hide();
            }
        }
    }

    //#region 功能方法
    //获取变更类型信息
    function getChangeType() {
        var changeType = $("#<%=rbChangeType.ClientID %> :checked").val();
        return changeType;
    }
    //获取经营经理变更类型信息
    function getManagerChangeType() {
        var managerChangeType = $("#<%=rbManagerChangeType.ClientID %> :checked").val();
        return managerChangeType;
    }

    //验证列表数量，若没有添加相应的记录，则给出提示
    function getListNum(gvListID, alerMsg) {
        var listNum = $("#" + gvListID + " [checkNum]").length;
        if (listNum < 1) {
            alert(alerMsg);
            return false;
        }
        return true;
    }

    //清空经营经理变更类型
    function clearManagerType() {
        $("#<%=rbManagerChangeType.ClientID %> input:checked").removeAttr("checked");
    }

    //#endregion

    //#region  --------------------------------------------------选择方法
    //选择业主
    function selCustomer(customerID, customerName) {
        var param = new InputParamObject("s");
        var reObj = getCustomer('re', param, "");
        if (reObj != null) {
            $("#" + customerName).val(reObj.getName());
            $("#" + customerID).val(reObj.getId());
        }
        return false;
    }
    //选择业主联系人
    function selContact(contactID, contactName, customerID) {
        if ($('#' + customerID).val() == "") {
            alert("请先选择向对方信息");
            return false;
        }
        var param = new InputParamObject("s");
        var json = "{CUSTOMERID: '" + $("#" + customerID).val() + "' }";
        var reObj = getCustomerContact('re', param, json);
        if (reObj != null) {
            $("#" + contactName).val(reObj.getName());
            $("#" + contactID).val(reObj.getId());
        }
        return false;
    }
    //选择经营经理
    function selManger(managerID, managerName) {
        var param = new InputParamObject("s");
        var reObj = getUsers('re', param, "");
        if (reObj != null) {
            $("#" + managerName).val(reObj.getName());
            $("#" + managerID).val(reObj.getId());
        }
        return false;
    }

    //选择合同
    function selContract() {
        var param = new InputParamObject("m");
        var reObj = getContract('re', param, "");
        if (reObj != null) {
            $("#<%=hiSelXml.ClientID %>").val(reObj.xml());
            return true;
        }
        return false;
    }

    function selTask() {
        var param = new InputParamObject("m");
        var reObj = getProjectTaskIssued('re', param, "");
        if (reObj != null) {
            $("#<%=hiSelXml.ClientID %>").val(reObj.xml());
            return true;
        }
        return false;
    }
    //#endregion -----------------------------------------------选择方法
</script>
