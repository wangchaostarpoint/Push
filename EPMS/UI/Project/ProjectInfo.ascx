<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjectInfo.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Project.ProjectInfo" %>
<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.EPMS" TagPrefix="zhongsoft" %>
<%@ Register Src="../../../Sys/FileDocument/AttachmentView.ascx" TagName="UpLoadFile"
    TagPrefix="uc3" %>
<tr runat="server" id="trTask" visible="false">
    <td class="td-l">任务单名称<span class="req-star">*</span>
    </td>
    <td class="td-m" colspan="3">
        <zhongsoft:LightObjectSelector runat="server" ID="lbsSelTask" IsMutiple="false" SelectPageMode="Dialog"
            ResultForControls="{'hiParentId':'id'}" Text="选择任务单" PageUrl="~/MM/Obsolete/ProjectPhaseTaskSelector.aspx"
            ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.*)(23.启动项目)(3.修改项目启动)"
            AfterSelect="afterSelect()" />
        <input type="hidden" id="hiProductionTaskID" runat="server" field="ProductionTaskID"
            tablename="EPMS_ProjectEntity" />
    </td>
    <td class="td-l">任务单编号
    </td>
    <td class="td-m">
        <zhongsoft:LightTextBox ID="tbTaskCode" runat="server" MaxLength="128" activestatus="(23.*)"
            ReadOnly="true" />
    </td>
</tr>
<tr runat="server" id="trSub" visible="false">
    <td class="td-l">父级项目名称
    </td>
    <td class="td-m" colspan="3">
        <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectProject" IsMutiple="false"
            SelectPageMode="Dialog" ResultForControls="{'hiParentId':'id','tbParentProjectCode':'ProjectCode'}"
            PageWidth="850" Text="选择项目" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
            ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.*)(23.启动项目)(3.修改项目启动)"
            AfterSelect="afterSelect()" />
        <input type="hidden" id="hiParentId" name="hiParentId" runat="server" field="ParentId"
            tablename="EPMS_ProjectEntity" />
    </td>
    <td class="td-l">父级项目编号
    </td>
    <td class="td-r">
        <zhongsoft:LightTextBox ID="tbParentProjectCode" runat="server" MaxLength="128" activestatus="(23.*)" />
    </td>
</tr>
<table class="tz-table">
    <%--  <div style="height: 5px">
    </div>--%>
    <tr style="display: none">
        <td colspan="6" class="flexible" onclick="openDetail('projectInfo')">项目基本信息&nbsp;<img src="<%=WebAppPath%>/Themes/Images/lright.png" />
        </td>
    </tr>
    <%--    <tr id="trleader">
        <td colspan="6">
            <table width="100%" id="projectInfo">--%>
    <tr>
        <td class="td-l">项目名称(中文)<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox ID="tbProjectName" runat="server" MaxLength="128" Field="ProjectName"
                req="1" TableName="EPMS_ProjectEntity" activestatus="(23.*)(23.启动项目)" />
            <input type="hidden" runat="server" id="hiTaskXml" />
            <input type="hidden" runat="server" id="hiName" />
        </td>
        <td class="td-l">项目编号<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <table cellpadding='0' cellspacing='0' width="100%">
                <tr>
                    <td>
                        <zhongsoft:LightTextBox ID="tbProjectCode" runat="server" MaxLength="32" Field="ProjectCode"
                            req="1" TableName="EPMS_ProjectEntity" activestatus="(23.*)" />
                    </td>
                    <td runan="server">
                        <asp:LinkButton runat="server" ID="lbtnCheckCode" CssClass="btn-look-up" EnableTheming="false"
                            OnClientClick="return selPhaseCode();" activestatus="(23.*)(23.启动项目)" displaystatus="(23.*)"
                            Visible="false">
                        <img src="<%=WebAppPath%>/Themes/Images/look-up.gif"/>
                        </asp:LinkButton>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="td-l">项目名称(英文)
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox ID="tbProjectNameForEnglish" runat="server" MaxLength="128"
                Field="ProjectNameForEnglish" TableName="EPMS_ProjectEntity" activestatus="(23.*)(23.启动项目)(3.修改项目启动)" />
        </td>
        <td class="td-l">项目简称
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbProjectNameForShort" runat="server" MaxLength="30"
                Field="ProjectNameForShort" TableName="EPMS_ProjectEntity" activestatus="(23.*)(23.启动项目)(3.修改项目启动)" />
        </td>
    </tr>
    <tr>
        <td class="td-l" style="display: none">服务类型
        </td>
        <td class="td-r" style="display: none">
            <zhongsoft:LightDropDownList ID="ddlBusinessType" runat="server" activestatus="(23.*)(23.启动项目)(3.修改项目启动)"
                Field="ParamBusinessTypeID" TableName="EPMS_ProjectEntity" OnSelectedIndexChanged="ddlBusinessType_SelectedIndexChanged"
                AutoPostBack="true">
            </zhongsoft:LightDropDownList>
            <input type="hidden" id="hiBusinessType" name="hiBusinessType" runat="server" field="BusinessType"
                tablename="EPMS_ProjectEntity" />
        </td>
        <td class="td-l">业务板块<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlBusinessPlate" runat="server" activestatus="(23.*)(23.启动项目)(3.修改项目启动)"
                req="1" Field="ParamBusinessPlateID" TableName="EPMS_ProjectEntity" OnSelectedIndexChanged="ddlBusinessPlate_SelectedIndexChanged"
                AutoPostBack="true">
            </zhongsoft:LightDropDownList>
            <input type="hidden" id="hiBusinessPlate" name="hiBusinessPlate" runat="server" field="BusinessPlate"
                tablename="EPMS_ProjectEntity" />
        </td>
        <td class="td-l">工程类别<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlProjectType" runat="server" activestatus="(23.*)(23.启动项目)(3.修改项目启动)"
                req="1" Field="ParamProjectTypeID" TableName="EPMS_ProjectEntity" OnSelectedIndexChanged="ddlProjectType_SelectedIndexChanged"
                AutoPostBack="true">
            </zhongsoft:LightDropDownList>
            <input type="hidden" id="hiProjectType" name="hiProjectType" runat="server" field="ProjectType"
                tablename="EPMS_ProjectEntity" />
            <input type="hidden" id="hiProjectTypeCode" name="hiProjectTypeCode" runat="server"
                field="ProjectTypeCode" tablename="EPMS_ProjectEntity" />
        </td>
        <td class="td-l">设计阶段<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlPhase" runat="server" activestatus="(23.*)(23.启动项目)(3.修改项目启动)" Field="ParamPhaseID"
                                         req="1" TableName="EPMS_ProjectEntity" OnSelectedIndexChanged="ddlPhase_SelectedIndexChanged"
                                         AutoPostBack="true">
            </zhongsoft:LightDropDownList>
            <input type="hidden" id="hiPhaseCode" name="hiPhaseCode" runat="server" field="PhaseCode"
                   tablename="EPMS_ProjectEntity" />
            <input type="hidden" id="hiPhaseName" name="hiPhaseName" runat="server" field="PhaseName"
                   tablename="EPMS_ProjectEntity" />
        </td>
    </tr>
    <tr>
        <td class="td-l">设计规模
        </td>
        <td class="td-m">
            <%--<zhongsoft:LightDropDownList ID="ddlProjectScale" runat="server" activestatus="(23.*)(23.启动项目)(3.修改项目启动)"
                Field="ParamProjectScaleID" TableName="EPMS_ProjectEntity">
            </zhongsoft:LightDropDownList>
            <input type="hidden" id="hiProjectScale" name="hiProjectScale" runat="server" field="ProjectScale"
                tablename="EPMS_ProjectEntity" />--%>
            <%--项目规模改为设计规模用文本框填写--%>
            <zhongsoft:LightTextBox ID="tbProjectScale" runat="server" MaxLength="128" Field="ProjectScale"
                TableName="EPMS_ProjectEntity" EnableTheming="false" CssClass="kpms-textbox-short"
                activestatus="(23.*)(23.启动项目)(3.修改项目启动)">
            </zhongsoft:LightTextBox>&nbsp;KV/MVA
            <%--<asp:LinkButton class="subtoolbarlink" flag="addScale" ID="addScale" runat="server"
                EnableTheming="false" CssClass="subtoolbarlink" displaystatus="(23.*)(23.启动项目)(3.修改项目启动)">
                <span>
                    <img runat="server" id="imgAdd" src="~/Themes/Images/btn_add.gif" alt="新建项目规模" width="16"
                        height="16" /></span>
            </asp:LinkButton>--%>
        </td>
        <%--去掉项目级别--%>
        <%--<td class="td-l">
            项目级别
        </td>
        <td class="td-m">
            <zhongsoft:LightDropDownList ID="ddlProjectLevel" runat="server" activestatus="(23.*)(23.启动项目)(3.修改项目启动)"
                Field="ProjectLevel" TableName="EPMS_ProjectEntity">
            </zhongsoft:LightDropDownList>
        </td>--%>
        <td class="td-l">设计容量
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbDesignCapacity" runat="server" MaxLength="128" EnableTheming="false"
                CssClass="kpms-textbox-short" activestatus="(23.*)(23.启动项目)(3.修改项目启动)" Field="DesignCapacity"
                TableName="EPMS_ProjectEntity">
            </zhongsoft:LightTextBox>&nbsp; MVA
        </td>
        <td class="td-l">容量等级
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlCapacityLevel" runat="server" activestatus="(23.*)(23.启动项目)(3.修改项目启动)"
                                         Field="CapacityLevel" TableName="EPMS_ProjectEntity">
            </zhongsoft:LightDropDownList>
        </td>
    </tr>
    <tr style="display: none">
        <td class="td-l" flag="len">长度
        </td>
        <td class="td-r" flag="len">
            <zhongsoft:LightTextBox ID="tbLenght" runat="server" MaxLength="128" EnableTheming="false"
                CssClass="kpms-textbox-short" activestatus="(23.*)(23.启动项目)(3.修改项目启动)" Field="Length"
                TableName="EPMS_ProjectEntity">
            </zhongsoft:LightTextBox>&nbsp; km
        </td>
        <td class="td-m" colspan="4" id="hideTd"></td>
    </tr>
    <tr>
        <td class="td-l">是否境外<span class="req-star">*</span>
        </td>
        <td class="td-m">
            <asp:RadioButtonList runat="server" ID="rblIsAbroad" RepeatDirection="Horizontal"
                TableName="EPMS_ProjectEntity" Field="IsAbroad" activestatus="(23.*)(23.启动项目)(3.修改项目启动)">
                <asp:ListItem Value="1">是</asp:ListItem>
                <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td class="td-l">项目性质
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlProjectNature" runat="server" activestatus="(23.*)(23.启动项目)(3.修改项目启动)"
                Field="ProjectNature" TableName="EPMS_ProjectEntity">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l" style="display: none">项目标识
        </td>
        <td class="td-r" style="display: none">
            <!--创优、打捆-->
            <asp:CheckBoxList ID="cblProjectFlag" runat="server" RepeatDirection="Horizontal"
                activestatus="(23.*)(23.启动项目)(3.修改项目启动)">
            </asp:CheckBoxList>
            <input type="hidden" runat="server" id="hiProjectFlag" field="ProjectFlag" tablename="EPMS_ProjectEntity" />
        </td>
        <td class="td-r" colspan="2"></td>
    </tr>
    <tr>
        <td class="td-l">项目地点<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbProjectPlace" runat="server" MaxLength="32" activestatus="(23.*)(23.启动项目)(3.修改项目启动)"
                Field="ProjectPlace" TableName="EPMS_ProjectEntity" req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">项目简介
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbProjectContent" runat="server" MaxLength="128" activestatus="(23.*)(23.启动项目)(3.修改项目启动)"
                Field="ProjectContent" TableName="EPMS_ProjectEntity" />
        </td>
    </tr>
    <tr>
        <td class="td-l">任务来源<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlTaskSource" runat="server" activestatus="(23.*)(23.启动项目)(3.修改项目启动)"
                Field="TaskSource" req="1" TableName="EPMS_ProjectEntity">
            </zhongsoft:LightDropDownList>
            <input type="hidden" id="hiTaskSource" runat="server" field="TaskSource" tablename="EPMS_ProjectEntity" />
        </td>
        <td class="td-l" style="display: none">任务（委托）形式
        </td>
        <td class="td-r" style="display: none">
            <zhongsoft:LightDropDownList ID="ddlTaskType" runat="server" activestatus="(23.*)(23.启动项目)(3.修改项目启动)"
                Field="TaskType" TableName="EPMS_ProjectEntity">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">组织部门<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightDropDownList ID="ddlDept" runat="server" activestatus="(23.*)(23.启动项目)(3.修改项目启动)" req="1"
                Field="HostDeptID" TableName="EPMS_ProjectEntity" Width="220px">
            </zhongsoft:LightDropDownList>
            <input type="hidden" id="hiHostDeptName" name="hiHostDeptName" runat="server" field="HostDeptName"
                tablename="EPMS_ProjectEntity" />
        </td>
    </tr>
    <tr>
        <td class="td-l">任务设计依据
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbTaskAccording" runat="server" MaxLength="128" activestatus="(23.*)(23.启动项目)(3.修改项目启动)"
                Field="TaskAccording" TableName="EPMS_ProjectEntity" />
        </td>
    </tr>
    <tr style="display: none">
        <td class="td-l">跟踪项目附件信息</td>
        <td class="td-m" colspan="5">
            <uc3:UpLoadFile ID="marketInfoFile" runat="server" />
        </td>
    </tr>
    <%--            </table>
        </td>
    </tr>--%>
</table>
<!--业主Begin-->
<div style="height: 5px">
</div>
<table class="tz-table">
    <tr>
        <td colspan="6" class="flexible" onclick="openDetail('customerInfo')">业主信息&nbsp;<img src="<%=WebAppPath%>/Themes/Images/lright.png" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <table width="100%" id="customerInfo">
                <tr>
                    <td class="td-l">业主单位<span class="req-star">*</span>
                    </td>
                    <td class="td-m" colspan="5">
                        <zhongsoft:LightObjectSelector runat="server" ID="lbsCustomerName" SourceMode="SelectorPage"
                            SelectPageMode="Dialog" PageUrl="~/MM/Obsolete/CustomerSelector.aspx" ShowJsonRowColName="True"
                            req="1" ResultForControls="{'tbCustomerEntityAddress':'ADDRESS','hiCustomerID':'id'}"
                            ResultAttr="name" Filter="{'IsShowNewBtn':'0'}" activestatus="(23.*)" />
                        <input type="hidden" runat="server" id="hiCustomerID" field="CustomerID" tablename="EPMS_ProjectEntity" />
                        <input type="hidden" runat="server" id="Hidden1" field="MarketProjectID" tablename="EPMS_ProjectEntity" />
                    </td>
                </tr>
                <tr>
                    <td class="td-l">业主联系地址
                    </td>
                    <td class="td-m" colspan="5">
                        <zhongsoft:LightTextBox ID="tbCustomerEntityAddress" runat="server" MaxLength="128"
                            activestatus="(23.*)" />
                    </td>
                </tr>
                <tr>
                    <td class="td-l">联系人
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText runat="server" ID="txtContactName" class="kpms-textbox"
                            readonly="readonly" activestatus="(23.*)">
                        </zhongsoft:XHtmlInputText>
                    </td>
                    <td class="td-l">联系电话
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText runat="server" ID="txtContactPhone" class="kpms-textbox"
                            readonly="readonly" activestatus="(23.*)">
                        </zhongsoft:XHtmlInputText>
                    </td>
                </tr>
                <%-- <tr>
                    <td class="td-l">
                        联系人信息
                    </td>
                    <td class="td-m" colspan="5">
                        <zhongsoft:LightTextBox ID="tbContactPerson" runat="server" TextMode="MultiLine"
                            MaxText="512" CssClass="kpms-textarea" EnableTheming="false" activestatus="(23.*)(23.启动项目)(3.修改项目启动)"
                            Field="ProjectContactPerson" TableName="EPMS_ProjectEntity"></zhongsoft:LightTextBox>
                    </td>
                </tr>--%>
                <tr>
                    <td class="td-m" rowspan="3">业主要求
                    </td>
                    <td class="td-l" style="width: 15%">进度要求
                    </td>
                    <td class="td-m" colspan="4">
                        <zhongsoft:LightTextBox ID="tbRequireOfSchedule" runat="server" MaxLength="256" Field="RequireOfSchedule"
                            TableName="EPMS_ProjectEntity" activestatus="(23.*)" />
                    </td>
                </tr>
                <tr>
                    <td class="td-l">质量要求
                    </td>
                    <td class="td-m" colspan="4">
                        <zhongsoft:LightTextBox ID="tbRequireOfQuality" runat="server" MaxLength="128" activestatus="(23.*)"
                            Field="RequireOfQuality" TableName="EPMS_ProjectEntity" />
                    </td>
                </tr>
                <tr>
                    <td class="td-l">其他要求
                    </td>
                    <td class="td-m" colspan="4">
                        <zhongsoft:LightTextBox ID="tbRequireOfOther" runat="server" MaxLength="128" activestatus="(23.*)"
                            Field="RequireOfOther" TableName="EPMS_ProjectEntity" />
                    </td>
                </tr>
                <!--业主end-->
            </table>
        </td>
    </tr>
</table>
<!--进度begin-->
<div style="height: 5px">
</div>
<table class="tz-table" width="100%">
    <tr>
        <td class="flexible" colspan="6" onclick="openDetail('completeInfo')">项目进度信息&nbsp;<img src="<%=WebAppPath%>/Themes/Images/lright.png" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <table width="100%" id="completeInfo">
                <tr>
                    <td class="td-l">项目启动日期<span class="req-star">*</span>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText runat="server" ID="tbFormDate" activestatus="(23.?)" EnableTheming="false"
                            req="1" class="kpms-textbox-date" readonly="readonly" />
                        <input type="hidden" id="hiFormDate" runat="server" field="FormDate" tablename="EPMS_ProjectEntity" />
                    </td>
                    <td class="td-l">业主要求进度<%--<span class="req-star">*</span>--%>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText runat="server" ID="tbOuterCompleteDate" activestatus="(23.*)(23.启动项目)(3.修改项目启动)"
                            class="kpms-textbox-date" readonly="readonly" field="OuterCompleteDate" tablename="EPMS_ProjectEntity" />
                    </td>
                    <td class="td-l">院计划进度<%--<span class="req-star">*</span>--%>
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText runat="server" ID="tbInnerCompleteDate" activestatus="(23.*)(23.启动项目)(3.修改项目启动)"
                            class="kpms-textbox-date" readonly="readonly" field="InnerCompleteDate" tablename="EPMS_ProjectEntity" />
                    </td>
                </tr>
                <tr>
                    <td class="td-l">实际完成日期
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText runat="server" ID="tbFactCompleteDate" activestatus="(23.?)"
                            EnableTheming="false" class="kpms-textbox-date" readonly="readonly" field="FactCompleteDate"
                            tablename="EPMS_ProjectEntity" />
                    </td>
                    <td class="td-l">完成进度百分比
                    </td>
                    <td class="td-r"></td>
                    <td class="td-m" colspan="2"></td>
                </tr>
                <!--进度end-->
            </table>
        </td>
    </tr>
</table>
<!--模板begin-->
<div style="height: 5px">
</div>
<table class="tz-table" width="100%">
    <tr>
        <td colspan="6" class="flexible" onclick="openDetail('templateInfo')">操作项&nbsp;<img src="<%=WebAppPath%>/Themes/Images/lright.png" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <table width="100%" id="templateInfo">
                <tr>
                    <td class="td-l">项目模板<span class="req-star">*</span>
                    </td>
                    <td class="td-m" colspan="5">
                        <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectTemplate" IsMutiple="false"
                            SelectPageMode="Dialog" field="ProjectTemplateName" tablename="EPMS_ProjectEntity"
                            ResultForControls="{'hiProjectTemplateID':'id','hiPhaseID':'id'}" EnableTheming="false"
                            req="1" Text="选择模板" PageUrl="~/EPMS/Obsolete/ProjectTemplateSelector.aspx" ShowJsonRowColName="true"
                            ResultAttr="name" FilterFunction="projTempFilter()" activestatus="(23.*)(23.启动项目)(3.修改项目启动)"
                            BeforeSelect="beforeSelectTemplate()" AfterSelect="return afterSelTemplate()" />
                        <asp:Button ID="btnAdd" Text="选择项目模板" runat="server" DisplayStatus="(3.*)(23.启动项目)(3.修改项目启动)"
                            class="kpms-buttonfree" Visible="false" />
                        <asp:Button ID="Button1" Text="套用同类历史工程" runat="server" DisplayStatus="(3.*)(23.启动项目)(3.修改项目启动)"
                            class="kpms-buttonfree" Visible="false" />
                        <input type="hidden" runat="server" id="hiProjectTemplateID" name="hiProjectTemplateID"
                            field="ProjectTemplateID" tablename="EPMS_ProjectEntity" />
                        <input type="hidden" runat="server" id="hiPhaseID" />
                        <font color="red" displaystatus="(23.*)(23.启动项目)(3.修改项目启动)" runat="server">如果找不到合适的模板请选择“空模板”</font>
                        <input type="hidden" runat="server" id="hiOrginalTemplateID" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<!--暂时隐藏：团队角色、存储结构、计划开始节点-->
<!--
<tr>
    <td class="td-l">
        团队角色
    </td>
    <td class="td-m" colspan="5">
        主管院长、主管总工、设计总工程师、计划工程师、控制工程师、质量工程师
    </td>
</tr>
<tr>
    <td class="td-l">
        存储结构
    </td>
    <td class="td-m" colspan="5">
        <table class="list" width="100%">
            <tr class="list-header">
                <th scope="col">
                    一级目录
                </th>
                <th scope="col">
                    二级目录
                </th>
                <th scope="col">
                    三级目录
                </th>
                <th scope="col">
                    四级目录
                </th>
            </tr>
            <tr class="list-evennew">
                <td>
                    项目名称【项目编号】
                </td>
                <td>
                    Folder文档分类（成品、原始资料、外部资料）
                </td>
                <td>
                    专业（热机汽机、电气一次、电气二次）
                </td>
                <td>
                    Object文档（成品以卷册为单位展现形式为虚拟文档、资料为各类文档）
                </td>
            </tr>
        </table>
    </td>
</tr>
<tr>
    <td class="td-l">
        计划开始节点
    </td>
    <td class="td-m" colspan="5">
        热机J0001司令图
    </td>
</tr>
-->
<!--模板end-->
<input runat="server" id="hiProjectId" type="hidden" field="OrganizationID" tablename="EPMS_ProjectEntity" />
<input type="hidden" runat="server" id="hiFlag" value="0" field="Flag" tablename="EPMS_ProjectEntity" />
<input type="hidden" runat="server" id="hiProjectState" field="ProjectState" tablename="EPMS_ProjectEntity"
    value="0" />
<%--项目标识--%>
<input runat="server" id="hiProjectFlag1" type="hidden" value="创优" />
<input type="hidden" runat="server" id="hiProjectFlag2" value="数字化设计" />
<input type="hidden" runat="server" id="hiProjectFlag3" value="打捆" />
<%--工程类别--%>
<input type="hidden" runat="server" id="hiProjType" value="输变电工程可研" />
<%--设计阶段--%>
<input type="hidden" runat="server" id="hiPhase" value="可研（K）" />
<input type="hidden" runat="server" id="hiMarketProjectID" field="MarketProjectID"
    tablename="EPMS_ProjectEntity" />
<asp:Button runat="server" ID="btnBindInfo" OnClick="btnBindInfo_Click" Visible="false" />
<asp:Button runat="server" ID="btnBindByCode" OnClick="btnBindByCode_Click" Visible="false" />
<asp:Button ID="btnBindTemSpe" runat="server" OnClick="btnBindTemSpe_Click" Style="display: none" />
<asp:Button runat="server" ID="btnRebindSacle" OnClick="btnRebindSacle_Click" Style="display: none" />
<style type="text/css">
    .backpanel-inner {
        position: fixed;
        z-index: 1001;
        margin-left: 10px;
        left: 5%;
        bottom: 60%;
        padding-bottom: 10px;
    }

        .backpanel-inner td {
            height: 20px;
            background-color: Silver;
        }
</style>
<script type="text/javascript">

    function projectInfo_init() {
        //新建项目规模
        //        $('[flag="addScale"]').each(function () {
        //            $(this).bind('click', function () {
        //              return  addScale();
        //         });
        //        });

        if ("<%=ActionType %>" == "Update") {
            //$("#//<//%//=ddlProjectScale.ClientID //%>//").attr("req","1");
            //可编辑状态下，项目模板必填
            $("#<%=lbsSelectTemplate.ClientID %>").attr("req", "1");
        }
        else if ("<%=ActionType %>" == "Create") {
            $("#spanScale").hide();
        }

        var projType = $('#<%=hiProjectType.ClientID %>').val();
        //非输变电科研不显示长度信息
        if (projType != '输变电工程可研') {
            $('[flag="len"]').hide();
            $('#hideTd').attr('colspan', 4);
        }
    }

    function addScale() {
        var paramProjectTypeID = $("#<%=ddlProjectType.ClientID %>").val();
        var json = { paramProjectTypeId: paramProjectTypeID };
        var url = buildBizUrl(2, null, "EPMS/List/Sys/ParamProjectScaleEditor.aspx", json);
        var callBack = null;
        callBack = afteraddScale;
        showDivDialog(url, null, 850, 550, callBack);
        return false;
    }

    //查看关联项目任务通知单
    function ViewProjectTask(formid, processid) {
        url = "~/Sys/Workflow/FormDetail.aspx?actionType=1&FormID=" + formid + "&wfInstId=" + processid;
        window.open(url, '_blank');
        return false;
    }

    function CompareDate() {
        //院计划进度不能晚于业主要求进度
        var collegeDate = document.getElementById('<%=tbInnerCompleteDate.ClientID %>').value;
        var ownerDate = document.getElementById('<%=tbOuterCompleteDate.ClientID %>').value;
        if (collegeDate != '' && ownerDate != '') {
            var college = collegeDate.replace('-', '/');
            var owner = ownerDate.replace('-', '/');
            if (Date.parse(college) > Date.parse(owner)) {
                alert('院计划进度不能晚于业主要求进度！');
                return false;
            }
        }
        return true;
    }

    function afterSelect() {
        <%=Page.ClientScript.GetPostBackEventReference(this.btnBindInfo,"")%>;
    }

    function afteraddScale() {
        <%=Page.ClientScript.GetPostBackEventReference(this.btnRebindSacle,"")%>;
    }

    //项目编号
    function selPhaseCode() {
        var plateId = $("#<%=ddlBusinessPlate.ClientID %>").val();
        var projectTypeId = $("#<%=ddlProjectType.ClientID %>").val();
        var projectCode = $("#<%=tbProjectCode.ClientID %>").val();
        var url = buildQueryUrl("EPMS/List/Project/ProjectCodeCheck.aspx", { "PlateId": plateId, "OrganizationID":"<%=BusinessId %>", "ProjectTypeId": projectTypeId, "ProjectCode": projectCode });
        showDivDialog(encodeURI(url), null, 850, 600, afterCodeFilter);
        return false;
    }
    function afterCodeFilter(re) {
        var arr = re.split('|');
        $("#<%=tbProjectCode.ClientID %>").val(arr[0]);
        <%=Page.ClientScript.GetPostBackEventReference(this.btnBindByCode,"")%>;
        return false;
    }
    function afterSelTemplate() {
        <%=Page.ClientScript.GetPostBackEventReference(this.btnBindTemSpe,"")%>;
        return false;
    }

    //选择项目模板筛选（业务类型、业务板块筛选）
    function projTempFilter() {
        return { 'BusinessPlateID': $('#<%=ddlBusinessPlate.ClientID %>').val() };
    }

    //选择项目模板前
    function beforeSelectTemplate() {
        $("#<%=hiOrginalTemplateID.ClientID %>").val($("#<%=hiProjectTemplateID.ClientID %>").val());
        return true;
    }

</script>
