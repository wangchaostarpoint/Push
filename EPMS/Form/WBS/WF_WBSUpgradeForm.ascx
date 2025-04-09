<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_WBSUpgradeForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.WBS.WF_WBSUpgradeForm" %>
<%@ Register Src="../../UI/WBS/FileUpgradeList.ascx" TagName="FileUpgradeList" TagPrefix="uc1" %>
<%@ Import Namespace="DAL.EPMS" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            项目名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <!--不同升版流程，选择项目不一样-->
            <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
                IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                PageWidth="850" EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode','txtPhase':'PhaseName','hiProManagerId':'ManagerUserID','txtProManager':'ManagerUserName'}"
                TableName="EPMS_WBSUpgradeForm" Field="ProjectName" activestatus="(23.确定变更专业)"
                req="1" OnClick="txtProjectName_Click"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiOrganizationID" tablename="EPMS_WBSUpgradeForm"
                field="OrganizationID" />
        </td>
        <td class="td-l">
            项目编号<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" activestatus="(23.确定变更专业)"
                readonly="readonly" class="kpms-textbox" TableName="EPMS_WBSUpgradeForm" Field="ProjectCode"
                req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            项目阶段
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtPhase" activestatus="(23.确定变更专业)"
                readonly="readonly" class="kpms-textbox" />
        </td>
        <td class="td-l">
            项目设总
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProManager" activestatus="(23.确定变更专业)"
                TableName="EPMS_WBSUpgradeForm" Field="ManagerUserName" readonly="readonly" class="kpms-textbox" />
            <input type="hidden" runat="server" id="hiProManagerId" tablename="EPMS_WBSUpgradeForm"
                field="ManagerUserID" />
            <!-- 发起人-->
            <input type="hidden" runat="server" id="hiStartUserID" tablename="EPMS_WBSUpgradeForm"
                field="StartUserID" />
            <input type="hidden" runat="server" id="hiStartUserName" tablename="EPMS_WBSUpgradeForm"
                field="StartUserName" />
        </td>
        <td class="td-l">
            升版类型<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <asp:RadioButtonList runat="server" ID="rblUpType" activestatus="(2.?)" RepeatDirection="Horizontal">
            </asp:RadioButtonList>
            <input type="hidden" runat="server" id="hiUpType" tablename="EPMS_WBSUpgradeForm"
                field="VersionType" />
        </td>
    </tr>
    <%--<tr>
        <td class="td-l">
            版次
        </td>
        <td class="td-r">
            <!--版次信息，根据升版方式不同而不同，编码规则也不一样，去掉该字段-->
            <zhongsoft:LightDropDownList runat="server" ID="ddlVersion">
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>6</asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>8</asp:ListItem>
                <asp:ListItem>9</asp:ListItem>
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-m" colspan="2">
        </td>
    </tr>--%>
    <tr>
        <td class="td-l">
            开始时间
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtStartTime" activestatus="(23.确定变更专业)"
                readonly="readonly" class="kpms-textbox-date" TableName="EPMS_WBSUpgradeForm"
                Field="StartTime">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            执行时间<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtExecDate" activestatus="(23.确定变更专业)"
                readonly="readonly" class="kpms-textbox-date" TableName="EPMS_WBSUpgradeForm"
                Field="ExecDate" req="1">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            完成时间<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtFinishTime" activestatus="(23.确定变更专业)"
                readonly="readonly" class="kpms-textbox-date" TableName="EPMS_WBSUpgradeForm"
                Field="FinishTime" req="1">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            变更要求
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbChangeRequire" TableName="EPMS_FileItemEntity"
                Field="ChangeRequire" activestatus="(23.确定变更专业)" TextMode="MultiLine" EnableTheming="false"
                CssClass="kpms-textarea" maxtext="1024"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            变更专业
        </td>
        <td class="td-m" colspan="5">
            <!-- 全选-->
            <!-- 专业权限控制-->
            <asp:CheckBoxList runat="server" ID="cblSpecialty" RepeatDirection="Horizontal" RepeatColumns="10"
                OnSelectedIndexChanged="cblSpecialty_SelectedIndexChanged" AutoPostBack="true"
                activestatus="(23.确定变更专业)">
            </asp:CheckBoxList>
        </td>
    </tr>
    <tr>
        <td class="td-m flexible" colspan="6" onclick="openDetail('trRoll')">
            卷册信息&nbsp;<img src="../../themes/images/lright.png" />
        </td>
    </tr>
    <tr id="Tr1" runat="server" nodisplaystatus="(2.*)">
        <td colspan="5" class="td-m">
            <span class="filter-block"><span class="filter-block-lb">专业</span><span>
                <zhongsoft:LightDropDownList ID="ddlSpecial" runat="server" class="kpms-ddlsearch"
                    EnableTheming="false">
                </zhongsoft:LightDropDownList>
            </span></span><span class="filter-block"><span class="filter-block-lb">卷册名称/编号</span>
                <span>
                    <zhongsoft:LightTextBox ID="tbWBSInfo" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
                        EnableTheming="false">
                    </zhongsoft:LightTextBox>
                </span></span>
        </td>
        <td align="right" class="td-l">
            <asp:LinkButton runat="server" ID="lbtnQuery" OnClick="btnQuery_Click">
                      <span content='searchResult'>查询</span>
            </asp:LinkButton>
            <asp:LinkButton runat="server" ID="lbtnReset" OnClick="lbtnReset_Click">
                      <span content='searchResult'>重置</span>
            </asp:LinkButton>
        </td>
    </tr>
    <tr id="trRoll">
        <td class="td-m" colspan="6">
            <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="true"
                PageSize="50" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                DataKeyNames="WBSID" UseDefaultDataSource="true" OnRowDataBound="gvList_RowDataBound"
                BindGridViewMethod="UserControl.BindRollList">
                <Columns>
                    <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="ExecSpecialtyName" HeaderText="专业">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="原卷册编号" ItemStyle-Width="150px">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="升版后编号" ItemStyle-Width="150px">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbNowCode"></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="WBSName" HeaderText="卷册名称" ItemStyle-Width="300px">
                    </zhongsoft:LightBoundField>
                    <asp:TemplateField HeaderText="操作" ItemStyle-Width="60px" ItemStyle-HorizontalAlign="Center"
                        Visible="false">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnUp" runat="server" EnableTheming="false" Visible="false"
                                ToolTip="升版" OnClientClick="return false">
                                    <img alt="升版" src="../../Themes/Images/btn_shengban.png" 
                                    onclick="upgrade('<%#Eval("OrganizationID") %>','<%#Eval("WBSID") %>','0','<%#Eval("ExecSpecialtyID") %>')"/>
                            </asp:LinkButton>
                            <asp:LinkButton ID="lbtnInter" runat="server" EnableTheming="false" Visible="false"
                                ToolTip="内审版" OnClientClick="return false">
                                    <img alt="内审版" src="../../Themes/Images/btn_neishen.png" 
                                    onclick="upgrade('<%#Eval("OrganizationID") %>','<%#Eval("WBSID") %>','1','<%#Eval("ExecSpecialtyID") %>')"/>
                            </asp:LinkButton>
                            <asp:LinkButton ID="lbtnApprove" runat="server" EnableTheming="false" Visible="false"
                                ToolTip="报批版" OnClientClick="return false">
                                    <img alt="报批版" src="../../Themes/Images/btn_baopi.png" 
                                    onclick="upgrade('<%#Eval("OrganizationID") %>','<%#Eval("WBSID") %>','2','<%#Eval("ExecSpecialtyID") %>')"/>
                            </asp:LinkButton>
                            <input type="hidden" runat="server" id="hiWBSId" value='<%#Eval("WBSID") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr>
        <td class="td-m flexible" colspan="6" onclick="openDetail('trMutual')">
            互提资料&nbsp;<img src="../../themes/images/lright.png" />
        </td>
    </tr>
    <tr id="trMutual">
        <td class="td-m" colspan="6">
            <uc1:FileUpgradeList ID="mutualFile" runat="server" WBSType="内部专业间提资" WBSTypeID="1" />
        </td>
    </tr>
    <tr>
        <td class="td-m flexible" colspan="6" onclick="openDetail('trExternal')">
            外部资料&nbsp;<img src="../../themes/images/lright.png" />
        </td>
    </tr>
    <tr id="trExternal">
        <td class="td-m" colspan="6">
            <uc1:FileUpgradeList ID="externalFile" runat="server" WBSType="外部接口资料接收" WBSTypeID="2" />
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiFormID" tablename="EPMS_WBSUpgradeForm"
    field="WBSUpgradeFormID" />
<asp:Button runat="server" ID="btnLoad" OnClick="btnLoad_Click" Visible="false" />
<script type="text/javascript">

    function initCustomerPlugin() {
        //隐藏删除
        //$('[key="Delete"]').hide();
    }

    //升版任务（卷册、资料）
    function upgrade(orgId,originalId, versionType, execSpecialtyID) {
        var json = { actionType: 2,OrganizationID:orgId, OriginalID: originalId, WBSSplitFormID: '<%=BusinessObjectId %>', VerType: versionType, WBSType: '<%=(int)WBSMode.任务管理 %>',ExecSpecialtyID:execSpecialtyID};
        if (versionType == '2') {
           json = { actionType: 2,OrganizationID:orgId, OriginalID: originalId, WBSSplitFormID: '<%=BusinessObjectId %>', VerType: versionType, WBSType: '<%=(int)WBSMode.任务管理 %>',DefaultInhreitType:'<%=(int)InheritType.不继承 %>',ExecSpecialtyID:execSpecialtyID };
        }
        var url = buildQueryUrl('/EPMS/List/WBS/WBSEditor.aspx', json);
        var callBack = null;
        callBack = bindWbs;
        showDivDialog(url, "", 1050, 600, callBack);
        return false;
    }

    //绑定WBS列表
    function bindWbs() {
        <%=Page.ClientScript.GetPostBackEventReference(this.btnLoad,"")%>;
    }
</script>
