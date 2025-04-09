<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_DesignSpeReViewForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Quality.WF_DesignSpeReViewForm" %>
<%@ Register Assembly="Zhongsoft.Web.UI.PowerDataGrid" Namespace="Zhongsoft.Web.UI"
    TagPrefix="zhongsoft" %>
<script type="text/javascript">
    var actionType = "<%=ActionType %>";
    var currAct = "<%=CurrentActivityName %>";

    function InitCustomerPlugin() {
        checkMaxLength();

        var completes = $("[apptype=Complete]");
        var dengs = $("[apptype=deng]");
        for (var i = 0; i < completes.length; i++) {
            var count = parseInt(completes.eq(i).val());
            if (count == 0) {
                dengs.eq(i).show();
            }
        }

    }

    function KPMSCheckSubmit() {
        if ($readyFormSend) {
            if (currAct == "主设人编写专业评审文件" || currAct == "主设人重新编写专业评审文件") {
                if ($("[appType=JudgeContent]").length <= 0) {
                    alert("请添加评审内容！");
                    return false;
                }
                var xmlHttp;
                try {
                    xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
                }
                catch (e) {
                    try {
                        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    catch (e2) {
                        xmlHttp = false;
                    }
                }
                if (!xmlHttp && typeof XMLHttpRequest != 'undefined') {
                    xmlHttp = new XMLHttpRequest();
                }
                var url = "/Portal/Sys/Workflow/FormDetail.aspx?actionType=<%=IntActionType %>&formId=<%=FormId %>&actInstId=<%=ActInstId %>&wfInstId=<%=WfInstId %>&next=" + encodeURI("相关专业主任工审核");
                xmlHttp.open("GET", url, false);
                xmlHttp.send("");
                if (xmlHttp.responsetext != "") {
                    alert(xmlHttp.responsetext);
                    return false;
                }
            }
            if (currAct == "填写执行情况") {
                var xmlHttp;
                try {
                    xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
                }
                catch (e) {
                    try {
                        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    catch (e2) {
                        xmlHttp = false;
                    }
                }
                if (!xmlHttp && typeof XMLHttpRequest != 'undefined') {
                    xmlHttp = new XMLHttpRequest();
                }
                var url = "/Portal/Sys/Workflow/FormDetail.aspx?actionType=<%=IntActionType %>&formId=<%=FormId %>&actInstId=<%=ActInstId %>&wfInstId=<%=WfInstId %>&next=" + encodeURI("审核执行情况");
                xmlHttp.open("GET", url, false);
                xmlHttp.send("");
                if (xmlHttp.responsetext != "") {
                    alert(xmlHttp.responsetext);
                    return false;
                }
            }
        }
        return true;
    }

    // 折叠表头
    function OnShow(divid, imgid) {
        imgid.src = document.getElementById(divid).style.display == "none" ? "/Portal/Themes/Images/btn_title.gif" : "/Portal/Themes/Images/btn_folder.gif";
        OpenDetail(divid);
    }

    //选择项目
    function SelectProject() {
        var param = new InputParamObject("s");
        var reObj = null;
        reObj = getProjects("<%=hiProjectXML.ClientID %>", param, "||||||||||||||1");
        if (reObj != null) {
            var id = reObj.getAttrVal(0, "o", "id");
            var name = reObj.getAttrVal(0, "o", "name");
            var code = reObj.getAttrVal(0, "o", "att3");
            if (id != null) {
                $("#<%=hiProjectPhaseID.ClientID %>").val(id);
                $("#<%=tbProjectPhaseName.ClientID %>").val(name);
                $("#<%=tbProjectPhaseCode.ClientID %>").val(code);
                document.getElementById("<%=tbSpecialtyCode.ClientID %>").value = "";
                document.getElementById("<%=ddlSpecialtyID.ClientID %>").selectedIndex = -1;
                return true;
            }
        } else {
            return false;
        }
    }

    //选择组织人
    function SelectOrganigerName() {
        var param = new InputParamObject("s");
        var reObj = null;
        reObj = getUsers("<%=hiXmlSelectOrganigerName.ClientID %>", param, "|" + $("#<%=hiDeptId.ClientID %>").val() + "|");
        if (reObj != null) {
            var id = reObj.getAttrVal(0, "o", "id");
            var name = reObj.getAttrVal(0, "o", "name");
            if (id != null) {
                $("#<%=tbOrganigerName.ClientID %>").val(name);
                $("#<%=hiOrganigerID.ClientID %>").val(id);
            }
            return true;
        } else {
            return false;
        }
    }

    //选择参加人员
    function SelectParticipanterName() {
        var param = new InputParamObject("m");
        var reObj = null;
        reObj = getUsers("<%=hiXmlParticipanters.ClientID %>", param, "|<%=KPMSUser.OrganizationId %>");
        if (reObj != null) {
            return true;
        } else {
            return false;
        }
    }

    //选择卷册
    function SelectRoll() {
        if (document.getElementById("<%=hiProjectPhaseID.ClientID %>").value == "") {
            alert("-请先选择项目。");
            return false;
        }
        if (document.getElementById("<%=ddlSpecialtyID.ClientID %>").value == "") {
            alert("-请选择专业。");
            return false;
        }
        var param = new InputParamObject("m");
        var reObj = null;
        var condition = $("#<%=hiProjectPhaseID.ClientID %>").val() + "|" + $("#<%=ddlSpecialtyID.ClientID %>").val() + "|"
        reObj = getRoll("<%=hiXmlRoll.ClientID %>", param, condition);

        if (reObj != null) {
            return true;

        } else {
            return false;
        }
    }
    //新增评审内容
    function NewJudgeContent() {
        if (actionType == "Create") {
            alert("请先保存主业务数据。");
            return false;
        }
        else {
            var formID = document.getElementById("<%=hiBusinessObjectId.ClientID %>").value;
            var urlStr = "/Portal/EPMS/List/ProjectQuality/SpecialtyDesignJudgeContentEditor.aspx?actionType=2&formid=" + formID;
            var stringFeatures = "dialogHeight: 450px; dialogWidth: 700px; dialogTop: px; dialogLeft: px; center: Yes; status: no;unadorned:yes;";
            ret = showModalDialog(urlStr, "", stringFeatures);

            if (undefined == ret) {
                return false;
            }
            else {
                return true;
            }
        }
    }

    //编辑评审内容
    function EidtJudgeContentPage(judgeContentID) {
        var urlStr = "/Portal/EPMS/List/ProjectQuality/SpecialtyDesignJudgeContentEditor.aspx?actionType=3&formid=<%=BusinessObjectId %>&bizId=" + judgeContentID;
        var stringFeatures = "dialogHeight: 450px; dialogWidth: 700px; dialogTop: px; dialogLeft: px; center: Yes; status: no;unadorned:yes;";
        ret = showModalDialog(urlStr, "", stringFeatures);

        if (undefined == ret) {
            return false;
        }
        else {
            return true;
        }
    }

    //查看评审内容
    function ViewJudgeContent(judgeContentID) {
        var urlStr = "/Portal/EPMS/List/ProjectQuality/SpecialtyDesignJudgeContentEditor.aspx?actionType=1&bizId=" + judgeContentID;
        var stringFeatures = "dialogHeight: 450px; dialogWidth: 700px; dialogTop: px; dialogLeft: px; center: Yes; status: no;unadorned:yes;";
        ret = showModalDialog(urlStr, "", stringFeatures);
        return false;
    }

    //添加评审意见
    function NewJudgeOption(judgeContentID) {
        var urlStr = "/Portal/EPMS/List/ProjectQuality/SpecialtyDesignJudgeOptionEditor.aspx?actionType=2&contentid=" + judgeContentID + "&specialtyid=" + document.getElementById("<%=hiSpecialtyID.ClientID %>").value + "&projectphaseid=" + document.getElementById("<%=hiProjectPhaseID.ClientID %>").value;
        var stringFeatures = "dialogHeight: 600px; dialogWidth: 800px; dialogTop: px; dialogLeft: px; center: Yes; status: no;unadorned:yes;";
        ret = showModalDialog(urlStr, "", stringFeatures);

        if (undefined == ret) {
            return false;
        }
        else {
            return true;
        }
    }

    //编辑评审意见
    function EditJudgeOption(judgeOptionID) {
        var urlStr = "/Portal/EPMS/List/ProjectQuality/SpecialtyDesignJudgeOptionEditor.aspx?actionType=3&bizId=" + judgeOptionID + "&specialtyid=" + document.getElementById("<%=hiSpecialtyID.ClientID %>").value + "&projectphaseid=" + document.getElementById("<%=hiProjectPhaseID.ClientID %>").value;
        if (currAct == "填写执行情况" || currAct == "审核执行情况") {
            urlStr += "&opentype=1";
        }
        var stringFeatures = "dialogHeight: 600px; dialogWidth: 800px; dialogTop: px; dialogLeft: px; center: Yes; status: no;unadorned:yes;";
        ret = showModalDialog(urlStr, "", stringFeatures);

        if (undefined == ret) {
            return false;
        }
        else {
            return true;
        }
    }

    //查看评审意见
    function ViewJudgeOption(judgeOptionID) {
        var urlStr = "/Portal/EPMS/List/ProjectQuality/SpecialtyDesignJudgeOptionEditor.aspx?actionType=1&bizId=" + judgeOptionID + "&specialtyid=" + document.getElementById("<%=hiSpecialtyID.ClientID %>").value + "&projectphaseid=" + document.getElementById("<%=hiProjectPhaseID.ClientID %>").value;
        if (currAct == "填写执行情况" || currAct == "审核执行情况" || currAct == "") {
            urlStr += "&opentype=1";
        }
        var stringFeatures = "dialogHeight: 600px; dialogWidth: 800px; dialogTop: px; dialogLeft: px; center: Yes; status: no;unadorned:yes;";
        ret = showModalDialog(urlStr, "", stringFeatures);
        return false;
    }

    /*隐藏嵌套的Gridview*/
    function ShowHidden(sid, ev) {
        ev = ev || window.event;
        var target = ev.target || ev.srcElement;
        var oDiv = document.getElementById("tr" + sid);
        oDiv.style.display = oDiv.style.display == "none" ? "block" : "none";
        target.src = oDiv.style.display == "none" ? "<%=WebAppPath%>/themes/Images/TreeImages/plus.gif " : "<%=WebAppPath%>/themes/Images/TreeImages/minus.gif";
    }

    function BeforeDelete(type) {
        var opions = $("[appType=" + type + "]");
        if (opions.length > 0) {
            return confirm("该评审内容已经添加评审意见，确定要一起删除吗？");
        }
        else {
            return confirm("您确定删除吗？");
        }
    }
</script>
<table id="Table1" class="kpms-table">
    <tr>
        <td class="td-l">
            项目名称<span class="kpms-star">*</span>
        </td>
        <td colspan="3" class="td-m">
            <zhongsoft:XHtmlInputText ID="tbProjectPhaseName" runat="server" readonly="readonly"
                class="kpms-textbox" field="ProjectPhaseName" tablename="EPMS_FormulateDesignPrincipleForm"
                req="1" activestatus="(23.主设人编写专业评审文件)(3.主设人重新编写专业评审文件)" />
            <asp:ImageButton ID="ibtnChooseProjectPhaseName" runat="server" CausesValidation="False"
                DisplayStatus="(23.主设人编写专业评审文件)(3.主设人重新编写专业评审文件)" ImageUrl="<%=WebAppPath%>/Themes/Images/btn_select.gif"
                OnClientClick="return SelectProject();" ToolTip="选择" OnClick="ibtnChooseProjectPhaseName_Click" />
        </td>
        <td class="td-l">
            项目编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="tbProjectPhaseCode" runat="server" readonly="readonly"
                class="kpms-textbox" field="ProjectPhaseCode" tablename="EPMS_FormulateDesignPrincipleForm"
                style="width: 75%" activestatus="(23.主设人编写专业评审文件)(3.主设人重新编写专业评审文件)" />
            <input id="hiProjectPhaseID" runat="server" type="hidden" field="OrganizationID"
                tablename="EPMS_FormulateDesignPrincipleForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            设计阶段
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="tbPhaseName" runat="server" readonly="readonly" maxlength="32"
                class="kpms-textbox" field="PhaseName" tablename="ProjectPhaseEntity" activestatus="(23.主设人编写专业评审文件)(3.主设人重新编写专业评审文件)" />
            <input type="hidden" runat="server" id="hiPhaseID" field="PhaseID" tablename="" />
            <input type="hidden" runat="server" id="hiPhaseCode" field="PhaseCode" tablename="" />
        </td>
        <td class="td-l">
            专业名称<span class="kpms-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlSpecialtyID" runat="server" AutoPostBack="True"
                ActiveStatus="(23.主设人编写专业评审文件)(3.主设人重新编写专业评审文件)" OnSelectedIndexChanged="ddlSpecialtyID_SelectedIndexChanged"
                req="1">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiSpecialtyID" field="SpecialtyID" tablename="EPMS_FormulateDesignPrincipleForm" />
            <input type="hidden" runat="server" id="hiSpecialtyName" field="SpecialtyName" tablename="EPMS_FormulateDesignPrincipleForm" />
        </td>
        <td class="td-l">
            专业代字
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="tbSpecialtyCode" runat="server" readonly="readonly"
                maxlength="32" style="width: 50%;" class="kpms-textbox" activestatus="(23.主设人编写专业评审文件)(3.主设人重新编写专业评审文件)"
                field="SpecialtyCode" tablename="EPMS_FormulateDesignPrincipleForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            组织人员<span class="kpms-star">*</span>
        </td>
        <td class="td-m">
            <zhongsoft:XHtmlInputText ID="tbOrganigerName" runat="server" readonly="readonly"
                class="kpms-textbox-short" field="InstituteOrganizerName" tablename="EPMS_FormulateDesignPrincipleForm"
                req="1" activestatus="(23.主设人编写专业评审文件)(3.主设人重新编写专业评审文件)" />
            <input type="hidden" id="hiOrganigerID" runat="server" field="InstituteOrganizerID"
                tablename="EPMS_FormulateDesignPrincipleForm" />
            <asp:ImageButton ID="ibtnChooseOrganigerName" runat="server" CausesValidation="False"
                DisplayStatus="(23.主设人编写专业评审文件)(3.主设人重新编写专业评审文件)" OnClientClick="return SelectOrganigerName();"
                ImageUrl="<%=WebAppPath%>/Themes/Images/btn_select.gif" ToolTip="选择" />
        </td>
        <td class="td-l">
            评审日期<span class="kpms-star">*</span>
        </td>
        <td class="td-r" colspan="3">
            <zhongsoft:XHtmlInputText ID="tbJudgeDate" runat="server" readonly="readonly" maxlength="16"
                class="kpms-textbox-date" field="InstituteCheckDate" tablename="EPMS_FormulateDesignPrincipleForm"
                activestatus="(23.主设人编写专业评审文件)(3.主设人重新编写专业评审文件)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            参加人员<span class="kpms-star">*</span>
        </td>
        <td colspan="5" class="td-m">
            <zhongsoft:XHtmlInputText ID="tbParticipanterNames" runat="server" readonly="readonly"
                class="kpms-textbox" activestatus="(23.主设人编写专业评审文件)(3.主设人重新编写专业评审文件)" req="1" />
            <asp:ImageButton ID="ibtnParticipanterName" runat="server" CausesValidation="False"
                DisplayStatus="(23.主设人编写专业评审文件)(3.主设人重新编写专业评审文件)" OnClientClick="return SelectParticipanterName();"
                ImageUrl="<%=WebAppPath%>/Themes/Images/btn_select.gif" ToolTip="选择" OnClick="ibtnParticipanterName_Click" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            外单位参会人
        </td>
        <td colspan="5" class="td-m">
            <zhongsoft:LightTextBox ID="tbExteriorUsers" CssClass="com_textbox" ActiveStatus="(23.主设人编写专业评审文件)(3.主设人重新编写专业评审文件)"
                MaxLength="128" Field="InstituteCustomers" TableName="EPMS_FormulateDesignPrincipleForm"
                runat="server"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            相关卷册<span class="kpms-star">*</span>
        </td>
        <td colspan="5" class="td-m">
            <input type="hidden" id="hiRollIDs" runat="server" field="RollIDs" tablename="EPMS_FormulateDesignPrincipleForm" />
            <zhongsoft:XHtmlInputText ID="tbRollNames" runat="server" readonly="readonly" maxlength="128"
                class="kpms-textbox" field="RollNames" tablename="EPMS_FormulateDesignPrincipleForm"
                req="1" activestatus="(23.主设人编写专业评审文件)(3.主设人重新编写专业评审文件)" />
            <asp:ImageButton ID="ibtnRollName" runat="server" CausesValidation="False" DisplayStatus="(23.主设人编写专业评审文件)(3.主设人重新编写专业评审文件)"
                OnClientClick="return SelectRoll();" ImageUrl="<%=WebAppPath%>/Themes/Images/btn_select.gif"
                ToolTip="选择" OnClick="ibtnRollName_Click" />
        </td>
    </tr>
    <tr>
        <td colspan="6" align="center">
            <strong>评审内容 </strong>
        </td>
    </tr>
    <tr runat="server" id="trAddJudgeContent" displaystatus="(3.主设人编写专业评审文件)(3.主设人重新编写专业评审文件)">
        <td colspan="6" align="right">
            <asp:Button ID="btnAddJudgeContent" runat="server" Text="新增评审内容" CssClass="kpms-buttonfree"
                OnClientClick="return NewJudgeContent()" OnClick="btnAddJudgeContent_Click" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="pdgJudgeContentList" runat="server" AutoGenerateColumns="False"
                DataKeyField="DesignSpecialtyID" OnItemDataBound="pdgJudgeContentList_ItemDataBound"
                ItemShowLength="20">
                <Columns>
                    <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%"
                        ItemStyle-Wrap="false">
                        <ItemTemplate>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="评审主题" ItemStyle-Width="40%">
                        <ItemTemplate>
                            <a onclick="return ViewJudgeContent('<%#Eval("DesignSpecialtyID") %>')" title='<%# Eval("DesignPrincipleContent")%>'
                                style="color: #0000FF;">
                                <%#Eval("DesignPrincipleTitle").ToString().Length > 20 ? Eval("DesignPrincipleTitle").ToString().Substring(0, 20) + "..." : Eval("DesignPrincipleTitle")%>
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="评审内容" ItemStyle-Width="40%">
                        <ItemTemplate>
                            <%#Eval("DesignPrincipleContent").ToString().Length > 20 ? Eval("DesignPrincipleContent").ToString().Substring(0, 20) + "..." : Eval("DesignPrincipleContent")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="评审结论<span class='kpms-star'>*</span>" ItemStyle-Width="14%"
                        HeaderStyle-Wrap="false">
                        <ItemTemplate>
                            <asp:Label ID="lbResult" runat="server" Text='<%#Eval("Result") %>'></asp:Label>
                            <zhongsoft:LightDropDownList ID="ddlResult" runat="server">
                            </zhongsoft:LightDropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="添加<br>评审意见" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="12%"
                        HeaderStyle-Wrap="false">
                        <ItemTemplate>
                            <asp:ImageButton ID="ibtnEditComment" ImageUrl="<%=WebAppPath%>/Themes/Images/btn/add-row.gif"
                                runat="server" OnClick="ibtnEditComment_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="编辑" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%"
                        HeaderStyle-Wrap="false">
                        <ItemTemplate>
                            <asp:ImageButton ID="ibtnEditReview" ImageUrl="<%=WebAppPath%>/Themes/Images/btn_dg_edit.gif"
                                runat="server" OnClick="ibtnEditReview_Click" Style="height: 16px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%"
                        HeaderStyle-Wrap="false">
                        <ItemTemplate>
                            <asp:LinkButton ID="ibtnDelReview" runat="server" OnCommand="ibtnDelReview_Click"
                                CommandArgument='<%#Eval("DesignSpecialtyID") %>'>
                                <img alt="删除" src="<%=WebAppPath%>/Themes/Images/btn_dg_delete.gif" onclick='return BeforeDelete("<%#Eval("DesignSpecialtyID") %>");' />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="0px">
                        <ItemTemplate>
                            <tr id="tr<%#Eval("DesignSpecialtyID") %>">
                                <td>
                                </td>
                                <td colspan="7">
                                    <zhongsoft:LightPowerGridView ID="pdgOptionList" runat="server" AutoGenerateColumns="False"
                                        DataKeyField="DesignSpecialtyOpinionID" OnItemDataBound="pdgOptionList_ItemDataBound"
                                        ItemShowLength="40" EnableTheming="false" HeaderStyle-BorderColor="#d5d4d9" HeaderStyle-BorderWidth="1"
                                        HeaderStyle-HorizontalAlign="Center">
                                        <Columns>
                                            <asp:TemplateField HeaderText="评审意见" ItemStyle-Width="850px">
                                                <ItemTemplate>
                                                    <img id="imgComplete" apptype="deng" src="<%=WebAppPath%>/Themes/Images/btn/warnpic_green.gif" style="display: none" />
                                                    <a onclick="return ViewJudgeOption('<%#Eval("DesignSpecialtyOpinionID") %>')" title='<%# Eval("JudgeOpinion")%>'
                                                        style="color: #0000FF;">
                                                        <%#Eval("JudgeOpinion").ToString().Length > 40 ? Eval("JudgeOpinion").ToString().Substring(0, 40) + "..." : Eval("JudgeOpinion")%>
                                                    </a>
                                                    <input type="hidden" id="hiDesignSpecialtyID" runat="server" value='<%#Eval("DesignSpecialtyID") %>'
                                                        apptype='<%#Eval("DesignSpecialtyID") %>' />
                                                    <input type="hidden" id="hiComplete" apptype="Complete" runat="server" value='<%#Eval("Complete") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="编辑" ItemStyle-Width="35px">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ibtnEdit" ImageUrl="<%=WebAppPath%>/Themes/Images/btn_dg_edit.gif" runat="server"
                                                        OnClick="ibtnEdit_Click" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="删除" ItemStyle-Width="35px">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ibtnDelete" OnClientClick="return confirm('确认删除？')" ImageUrl="/Portal/Themes/Images/btn_dg_delete.gif"
                                                        runat="server" OnCommand="ibtnDelete_Click" CommandArgument='<%#Eval("DesignSpecialtyOpinionID") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </zhongsoft:LightPowerGridView>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<%--综合评审记录单ID--%>
<input type="hidden" id="hiBusinessObjectId" runat="server" field="FormulateDesignPrincipleFormID"
    tablename="EPMS_FormulateDesignPrincipleForm" />
<%--综合评审记录单ID--%>
<input type="hidden" id="HiCreateMan" runat="server" field="CreateUserName" tablename="EPMS_FormulateDesignPrincipleForm" />
<input type="hidden" id="hiFormType" runat="server" field="FormType" value="专业设计评审"
    tablename="EPMS_FormulateDesignPrincipleForm" />
<%-- 选择专业的XML--%>
<input id="hiPorjectXml" type="hidden" value="<root></root>" runat="server" />
<%--记录组织人的XML--%>
<input id="hiXmlSelectOrganigerName" runat="server" type="hidden" value="<root></root>" />
<%--记录选择参与人员的XML--%>
<input id="hiXmlParticipanters" runat="server" type="hidden" value="<root></root>" />
<%--记录选择卷册的XML--%>
<input type="hidden" id="hiXmlRoll" runat="server" value="<root></root>" />
<%--记录当前用户的部室ID--%>
<input type="hidden" id="hiDeptId" runat="server" value="" />
<input type="hidden" id="hiProjectXML" runat="server" />
