<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WBSInfoSimple.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.WBS.WBSInfoSimple" %>
<%@ Register Src="FileReceiveSpeList.ascx" TagName="FileReceiveSpeList"
    TagPrefix="uc1" %><%@ Register Src="FileReceiveWBSList.ascx" TagName="FileReceiveWBSList"
    TagPrefix="uc2" %><%@ Register Src="FileUpgradeList.ascx" TagName="FileUpgradeList" TagPrefix="uc3" %><%@ Register Src="WBSReleSpecialtyList.ascx" TagName="WBSReleSpecialtyList"
    TagPrefix="uc4" %>
<%@ Import Namespace="DAL.EPMS" %>
<tr>
    <td class="td-l">任务类别
    </td>
    <td class="td-m" colspan="3">
        <asp:Label runat="server" ID="lbWBStype"></asp:Label>
        <input type="hidden" runat="server" id="hiParamWBSTypeID" tablename="EPMS_WBSEntity"
            field="ParamWBSTypeID" />
        <input type="hidden" runat="server" id="hiWBSType" tablename="EPMS_WBSEntity" field="WBSType" />
        <input type="hidden" runat="server" id="hiWBSModeID" />
        <input type="hidden" runat="server" id="hiWBSMode" />
    </td>
</tr>
<tr flag="type" style="display: none;">
    <td class="td-l">任务类型<span class="req-star">*</span>
    </td>
    <td class="td-m" colspan="3">
        <asp:RadioButtonList runat="server" ID="rblType" activestatus="(2.*)" RepeatDirection="Horizontal">
        </asp:RadioButtonList>
        <%--<zhongsoft:LightDropDownList runat="server" ID="ddlType" activestatus="(2.*)" AutoPostBack="true"
            OnSelectedIndexChanged="ddlTypeSelectedIndexChanged" req="1">
        </zhongsoft:LightDropDownList>--%>
    </td>
    <%-- <td class="td-m" colspan="4">
    </td>--%>
</tr>
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
<tr style="display: none">
    <td class="td-l" flag="serial">成品号(校验号)<span class="req-star">*</span>
    </td>
    <td class="td-r" flag="serial">
        <zhongsoft:LightTextBox runat="server" ID="tbSerialCode" TableName="EPMS_WBSEntity"
            Field="SerialCode" activestatus="(23.*)" ReadOnly="true"></zhongsoft:LightTextBox>
    </td>
    <td class="td-l" flag="onlyCe" style="display: none">任务类别
    </td>
    <td class="td-r" flag="onlyCe" style="display: none">
        <zhongsoft:LightDropDownList runat="server" ID="ddlRollType" activestatus="(0.*)">
        </zhongsoft:LightDropDownList>
    </td>
</tr>
<tr flag="ce" style="display: none;">
    <td class="td-l" flag="batch">卷<span flag="rollreq" class="req-star" id="rollreq">*</span>
    </td>
    <td class="td-r">
        <zhongsoft:LightDropDownList runat="server" ID="ddlOwnRoll" activestatus="(2.*)">
        </zhongsoft:LightDropDownList>
    </td>
    <td class="td-m" colspan="2"></td>
</tr>
<tr flag="parent">
    <td class="td-l">任务名称<span class="req-star" id="spanRoll">*</span>
    </td>
    <td class="td-r">
        <zhongsoft:LightObjectSelector runat="server" ID="txtWBSName" SourceMode="SelectorPage"
            IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
            EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/WBSSelector.aspx"
            ResultForControls="{'hiParentID':'id','txtWBSCode':'WBSCode'}" activestatus="(2.*)"
            BeforeSelect="beforeSelectWbs()" FilterFunction="wbsFilter()"></zhongsoft:LightObjectSelector>
        <input type="hidden" runat="server" id="hiParentID" tablename="EPMS_WBSEntity" field="ParentID" />
    </td>
    <td class="td-l">任务编号
    </td>
    <td class="td-m">
        <zhongsoft:XHtmlInputText runat="server" ID="txtWBSCode" activestatus="(2.*)" readonly="readonly"
            class="kpms-textbox" />
    </td>
</tr>
<tr flag="upgrade">
    <td class="td-l">
        <span flag="name">原版任务名称</span>
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtOriginalName" activestatus="(23.*)"
            readonly="readonly" class="kpms-textbox" />
    </td>
    <td class="td-l">
        <span flag="name">原版任务编号</span><span class="req-star">*</span>
    </td>
    <td class="td-m">
        <zhongsoft:XHtmlInputText runat="server" ID="txtOriginalCode" activestatus="(23.*)"
            readonly="readonly" class="kpms-textbox" />
        <zhongsoft:LightDropDownList runat="server" ID="ddlOriginalVer" Visible="false">
        </zhongsoft:LightDropDownList>
        <input type="hidden" runat="server" id="hiOriginalCode" />
    </td>
</tr>
<tr>
    <td class="td-l">
        <span flag="name" id="spanName">任务名称</span><span class="req-star">*</span>
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="tbWBSName" TableName="EPMS_WBSEntity"
            Field="WBSName" activestatus="(23.*)" class="kpms-textbox" req="1" />
        <zhongsoft:LightDropDownList runat="server" ID="ddlRoll" Visible="false">
        </zhongsoft:LightDropDownList>
    </td>
    <td class="td-l">
        <span flag="name">任务编号</span><span class="req-star">*</span>
    </td>
    <td class="td-m">
        <zhongsoft:XHtmlInputText runat="server" ID="tbWBSCode" TableName="EPMS_WBSEntity"
            readonly="readonly" Field="WBSCode" activestatus="(23.*)" class="kpms-textbox" />
        <zhongsoft:LightDropDownList runat="server" ID="ddlNowVer" Visible="false">
        </zhongsoft:LightDropDownList>
        <zhongsoft:XHtmlInputText runat="server" ID="txtVersionNum" Visible="false"
            readonly="readonly" activestatus="(23.*)" class="kpms-textbox" />
        <input type="hidden" runat="server" id="hiWBSCode" />
    </td>
</tr>
<tr flag="type">
    <td class="td-l"><span flag="wbsSpeName">专业</span><span class="req-star">*</span>
    </td>
    <td class="td-m">
        <zhongsoft:LightDropDownList runat="server" ID="ddlExecSpecialtyId" TableName="EPMS_WBSEntity"
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
    <td class="td-l">所属部门<span class="req-star">*</span>
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtBelongDeptName" activestatus="(23.*)"
            readonly="readonly" class="kpms-textbox" tablename="EPMS_WBSEntity" field="BelongDeptName" /> 
        <input type="hidden" runat="server" id="hiBelongDeptID" tablename="EPMS_WBSEntity"
            field="BelongDeptID" />
    </td>
</tr>
<tr style="display: none">
    <td class="td-l">任务作业（系统）方式
    </td>
    <td class="td-r">
        <zhongsoft:LightDropDownList runat="server" ID="ddlWBSWay" TableName="EPMS_WBSEntity"
            Field="WBSWay" activestatus="(23.*)">
        </zhongsoft:LightDropDownList>
    </td>
    <td class="td-l">所属模块（系统、区域）
    </td>
    <td class="td-m">
        <zhongsoft:LightDropDownList runat="server" ID="ddlBelongModule" TableName="EPMS_WBSEntity"
            Field="BelongModuleID" activestatus="(23.*)">
        </zhongsoft:LightDropDownList>
        <input type="hidden" runat="server" id="hiBelongModule" tablename="EPMS_WBSEntity"
            field="BelongModule" />
    </td>
</tr>
<tr flag="onlyCe" style="display: none">
    <td class="td-l" style="display: none">企业定额工日
    </td>
    <td class="td-r" style="display: none">
        <zhongsoft:XHtmlInputText runat="server" ID="txtWorkDayOfEnterprise" activestatus="(23.*)"
            readonly="readonly" class="kpms-textbox-money" tablename="EPMS_WBSEntity" field="WorkDayOfEnterprise" />
    </td>
    <td class="td-l" style="display: none">行业定额工日
    </td>
    <td class="td-r" style="display: none">
        <zhongsoft:XHtmlInputText runat="server" ID="txtWorkDayOfTrade" activestatus="(23.*)"
            readonly="readonly" class="kpms-textbox-money" tablename="EPMS_WBSEntity" field="WorkDayOfTrade" />
    </td>
</tr>
<tr flag="roll">
    <td class="td-l" style="display: none">任务定额工日
    </td>
    <td class="td-m" colspan="3" style="display: none">
        <zhongsoft:LightTextBox runat="server" ID="tbWorkDayOfDesign" CssClass="kpms-textbox-money" EnableTheming="false"
            tablename="EPMS_WBSEntity" DataType="Decimal2" field="WorkDayOfConfirm" activestatus="(23.*)">
        </zhongsoft:LightTextBox>
    </td>
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
<tr flag="relSpe">
    <td class="td-l">
        <span>相关专业</span>
    </td>
    <td colspan="3" class="td-m">
        <span id="Span5" runat="server" style="float: right" class="req-star" displaystatus="(2.*)">请先保存，再添加专业</span>
        <uc4:WBSReleSpecialtyList ID="ucWBSReleSpecialtyList" runat="server" />
    </td>
</tr>
<tr flag="recspe">
    <td class="td-l">
        <span flag="recSpeName">接受专业</span>
    </td>
    <td colspan="3" class="td-m">
        <span id="Span1" runat="server" style="float: right" class="req-star" displaystatus="(2.*)">请先保存，再添加专业</span>
        <uc1:FileReceiveSpeList ID="fileSpeList" runat="server" OnDataChanged="fileSpeList_DataChanged" />
    </td>
</tr>
<tr flag="recroll">
    <td class="td-l">
        <span flag="recRollName">接受任务</span>
    </td>
    <td colspan="3" class="td-m">
        <span id="Span2" runat="server" style="float: right" class="req-star" displaystatus="(2.*)"
            flag="rollPaper">请先保存，再添加任务</span>
        <uc2:FileReceiveWBSList ID="fileWBSList" runat="server" WbsType="任务" />
    </td>
</tr>
<tr flag="manufacturefile">
    <td class="td-l">
        <span flag="ManufactureFileName">厂家资料</span>
    </td>
    <td colspan="3" class="td-m">
        <span id="Span3" runat="server" style="float: right" class="req-star" displaystatus="(2.*)">请先保存，再添加资料</span>
        <uc2:FileReceiveWBSList ID="ManufactureFile" runat="server" WbsType="厂家资料" />
    </td>
</tr>
<tr flag="affectedinterface">
    <td class="td-l">
        <span flag="AffectedInterfaceName">受影响的接口</span>
    </td>
    <td colspan="3" class="td-m">
        <span id="Span4" runat="server" style="float: right" class="req-star" displaystatus="(2.*)">请先保存，再添加接口</span>
        <uc2:FileReceiveWBSList ID="AffectedInterface" runat="server" WbsType="接口资料" />
    </td>
</tr>
<tr flag="upgradememo">
    <td class="td-l">继承方式说明
    </td>
    <td colspan="3" class="td-m" style="color: Red;">1.全部继承：升版任务继承原版任务的资料项：包括资料编号、名称等，提交状态为已提交，不继承具体资料文件，在资料台帐中查看流程时会跳转到继承的资料提交流程<br />
        2.部分继承：升版任务继承原版任务的资料项：包括资料编号、名称等，提交状态为未提交，需要单独走资料提交流程，不继承具体的资料文件：升版任务继承原版任务的资料项：包括资料编号、名称等，提交状态为未提交，需要单独走资料提交流程，不继承具体的资料文件<br />
        3.不 继 承：升版任务不继承原版任务的任何资料，需要单独走资料提交流程
    </td>
</tr>
<tr flag="fileupgrade" style="display: none;">
    <td class="td-l">继承方式<span class="req-star">*</span>
    </td>
    <td class="td-m" colspan="3">
        <asp:RadioButtonList runat="server" ID="rblInhreit" RepeatDirection="Horizontal"
            activestatus="(2.*)">
        </asp:RadioButtonList>
    </td>
</tr>
<tr flag="rollupgrade">
    <td class="td-l">互提资料
    </td>
    <td colspan="3" class="td-m">
        <uc3:FileUpgradeList ID="mutualFile" runat="server" WBSType="内部专业间提资" WBSTypeID="1" />
    </td>
</tr>
<tr flag="rollupgrade">
    <td class="td-l">外部资料
    </td>
    <td colspan="3" class="td-m">
        <uc3:FileUpgradeList ID="externalFile" runat="server" WBSType="外部接口资料接收" WBSTypeID="2" />
    </td>
</tr>
<tr flag="form" style="display: none;">
    <td class="td-l" style="display: none;">任务书
    </td>
    <td class="td-r" style="display: none;">
        <a runat="server" id="aTask" title="点击查看任务书" class="aStyle">查看</a>
        <asp:Label runat="server" ID="lbNoTaskMsg" Text="该任务没有任务书" CssClass="aStyle-red"
            Visible="false"></asp:Label>
    </td>
    <td class="td-l">产品校审单
    </td>
    <td class="td-r" colspan="3">
        <a runat="server" id="aVerify" title="点击查看产品校审单" class="aStyle">查看</a>
        <asp:Label runat="server" ID="lbNoVerifyMsg" Text="该任务没有产品校审单" CssClass="aStyle-red"
            Visible="false"></asp:Label>
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
<tr id="projectPlanContent">
    <td class="td-l">
        <asp:Label runat="server" ID="lbContent">内容</asp:Label>
    </td>
    <td class="td-m" colspan="3">
        <zhongsoft:LightTextBox runat="server" ID="tbContent" TextMode="MultiLine" CssClass="kpms-textarea"
            EnableTheming="false" MaxLength="512" tablename="EPMS_WBSEntity" field="Content"
            activestatus="(23.*)">
        </zhongsoft:LightTextBox>
    </td>
</tr>
<tr id="showInCalculate">
    <td class="td-l">预计工期(小时)
    </td>
    <td class="td-m" colspan="3">
        <zhongsoft:LightTextBox ID="tbWorkDayOfConfirm" runat="server" CssClass="kpms-textbox-money"
            EnableTheming="false" activestatus="(23.*)" field="PlanTerm" tablename="EPMS_WBSEntity"
            Regex="^([1-9]\d{0,11}|[0])(\.\d{1,2})?$" errmsg="请输入正数，最多12位整数，2位小数">
        </zhongsoft:LightTextBox>
    </td>
</tr>
<tr>
    <td class="td-l">负责人<span class="req-star">*</span></td>
    <td class="td-r">
        <zhongsoft:LightObjectSelector runat="server" ID="tbWBSOwnerName" req="1" IsMutiple="false" 
            SelectPageMode="Dialog" ResultForControls="{'hiWBSOwnerID':'id','hiWBSOwnerCode':'LoginId'}" EnableTheming="false" 
            Text="选择人员" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" PageWidth="850"
            ShowJsonRowColName="true"  ResultAttr="name" activestatus="(23.*)" tablename="EPMS_WBSEntity"
            field="WBSOwnerName" />
        <input type="hidden" runat="server" id="hiWBSOwnerID" tablename="EPMS_WBSEntity"
            field="WBSOwnerID" />
        <input type="hidden" runat="server" id="hiWBSOwnerCode" tablename="EPMS_WBSEntity"
            field="WBSOwnerCode" />
    </td>
    <td colspan="2"></td>
</tr>
<!-- 业务主键-->
<input type="hidden" runat="server" id="hiWBSId" tablename="EPMS_WBSEntity" field="WBSID" />
<!-- 任务模板id-->
<input type="hidden" runat="server" id="hiWBSTemplateID" tablename="EPMS_WBSEntity"
    field="WBSTemplateID" />
<!-- 任务状态-->
<input type="hidden" runat="server" id="hiWBSState" tablename="EPMS_WBSEntity" field="WBSState"
    value="0" />
<!-- 任务来源，Memo字段-->
<input type="hidden" runat="server" id="hiSource" value="新建" />
<input type="hidden" runat="server" id="hiFlag" tablename="EPMS_WBSEntity" field="Flag"
    value="1" />
<!-- 任务级别-->
<input type="hidden" runat="server" id="hiWBSLevel" tablename="EPMS_WBSEntity" field="WBSLevel" />
<!-- 父级任务ID-->
<%--<input type="hidden" runat="server" id="hiParentID" tablename="EPMS_WBSEntity" field="ParentID" />--%>
<!-- 版本号-->
<input type="hidden" runat="server" id="hiVersionNumber" tablename="EPMS_WBSEntity"
    field="VersionNumber" />
<input type="hidden" runat="server" id="hiOriginalVerNum" />
<!-- 版本类型-->
<input type="hidden" runat="server" id="hiVersionType" tablename="EPMS_WBSEntity"
    field="VersionType" />
<input type="hidden" runat="server" id="hiSXRule" value="SK" />
<script type="text/javascript">

    function initCustomerPlugin() {
        //        if ('<%=ActionType %>' == 'Create' || '<%=ActionType %>' == 'Update') {
        //            //卷册编号再进行验证
        //            $('#<%=tbWBSCode.ClientID %>').live('blur', function () {
        //                checkWBSCode();
        //            });
        //        }

        initWbsName(false);

        //任务类型变化，相应字段名变化
        $('#<%=rblType.ClientID %>').live('change', function () {
            initWbsName(true);
        });

        initFileSpe();
        initRelSpe();

        initFileWbs<%=fileWBSList.ClientID %>();
        initFileWbs<%=ManufactureFile.ClientID %>();
        initFileWbs<%=AffectedInterface.ClientID %>();
        //$('#<%=ddlNowVer.ClientID %>').live('change', function () {
        //    initWbsName();
        //});

        //$('#<%=ddlOriginalVer.ClientID %>').live('change', function () {
        //    initWbsName();
        //});

        $('#<%=ddlRoll.ClientID %>').live('change', function () {
            initRollName();
        });
        initUpgrade();
        showTimeAndMemoInfo();
    }
    //控制是否显示备注信息
    function showTimeAndMemoInfo() {
        //综合评审、专业评审，显示时间及备注信息
        var wbsType = $('#<%=hiWBSType.ClientID %>').val();
        if (wbsType == '<%=DAL.EPMS.WBSType.综合评审 %>' || wbsType == '<%=DAL.EPMS.WBSType.专业评审 %>' || wbsType == '<%=DAL.EPMS.WBSType.计算书 %>') {
            $("#projectPlanContent").show();
        }
        else {
            $("#projectPlanContent").hide();
        }
    }

    //初始化升版相关信息
    function initUpgrade() {
        $('#<%=ddlExecSpecialtyId.ClientID %>').attr('req', '1');
        var type = $('#<%=rblType.ClientID %> input[type=radio]:checked').val();
        var verType = '<%=VerType %>';
        if (verType == '') {
            $('[flag $= "upgrade"]').hide();
            $('[flag = "upgradememo"]').hide();
        }
        else {
            //隐藏任务类型
            $('[flag = "type"]').hide();
            $('#<%=ddlExecSpecialtyId.ClientID %>').removeAttr('req');
            if (verType == '<%=(int)VersionType.升版 %>' || verType == '<%=(int)VersionType.收口版 %>') {
                if ('<%=ActionType %>' == 'Create') {
                    if (verType == '<%=(int)VersionType.升版 %>') {
                        $('#<%=ddlNowVer.ClientID %>').attr('req', '1');
                        //缩短文本框、下拉框宽度，在一行显示
                        $('#<%=ddlNowVer.ClientID %>').css('width', '45%');
                    }
                    else if (verType == '<%=(int)VersionType.收口版 %>') {
                        $('#<%=ddlNowVer.ClientID %>').removeAttr('req');
                        //缩短文本框、下拉框宽度，在一行显示
                        $('#<%=txtVersionNum.ClientID %>').css('width', '45%');
                    }
                    $('#<%=tbWBSCode.ClientID %>').css('width', '45%');
                }

                $('[flag = "recspe"]').hide();
                $('[flag = "recroll"]').hide();
                //任务相关专业隐藏
                $('[flag = "relSpe"]').hide();

                if (type != '<%=(int)WBSMode.任务管理 %>') {
                    //资料升版，隐藏资料继承方式列表
                    $('[flag = "rollupgrade"]').hide();
                    //$('#<%=rblInhreit.ClientID %>').attr('req', '1');
                    $('[flag = "upgradememo"]').hide();
                }
                else {
                    //隐藏资料升版的继承方式信息
                    $('[flag = "fileupgrade"]').hide();
                }
            }
            else {
                if ('<%=ActionType %>' == 'Create') {
                    $('#<%=ddlOriginalVer.ClientID %>').attr('req', '1');
                    $('#<%=ddlOriginalVer.ClientID %>').css('width', '45%');
                    $('#<%=txtOriginalCode.ClientID %>').css('width', '45%');
                }
            }
        }
    }

    function checkWBSCode() {
        var type = $('#<%=rblType.ClientID %> input[type=radio]:checked').val();

        if (type != '<%=(int)WBSMode.任务管理 %>') {
            return true;
        }

        var wbsCode = $('#<%=tbWBSCode.ClientID %>').val();
        var wbsType = $('#<%=hiWBSType.ClientID %>').val();
        //        if (wbsType == '<%=DAL.EPMS.WBSType.册 %>' && wbsCode.length < 5) {
        //            alert('卷册编号，请输入至少四位数字！');
        //            $('#<%=tbWBSCode.ClientID %>').focus();
        //            return false;
        //        }

        //升版类型
        var verType = '<%=VerType %>';

        var wbsCode = $('#<%=tbWBSCode.ClientID %>').val();

        if (verType != '') {
            if (verType == '<%=(int)VersionType.升版 %>') {
                var ver = $('#<%=ddlNowVer.ClientID %>').val();
                wbsCode = wbsCode + ver;
            }
            else if (verType == '<%=(int)VersionType.收口版 %>') {
                var oldVer = $('#<%=hiOriginalVerNum.ClientID %>').val();
                var newVer = $('#<%=txtVersionNum.ClientID %>').val();
                wbsCode = wbsCode.replace(oldVer, newVer);
            }
            else {
                var ver = $('#<%=ddlOriginalVer.ClientID%>:selected ').text();
                wbsCode = wbsCode + '(' + ver + ')';
            }
        }

        var organizationId = '<%=OrganizationID %>';
        var wbsWay = $('#<%=ddlWBSWay.ClientID %>').val();
        var bizId = '<%=BizId %>';
        var isRepeat = false;
        $.ajax({
            type: 'POST',
            url: buildQueryUrl("/EPMS/Handler/CheckCodeHandler.ashx", null),
            data: { 'checkType': 'WBSCode', 'code': wbsCode, 'OrganizationID': organizationId, 'BizID': bizId, 'WBSWay': wbsWay },
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
            if (verType != '') {
                if (verType == '<%=(int)VersionType.升版 %>') {
                    $('#<%=ddlNowVer.ClientID %>').focus();
                }
                else {
                    $('#<%=ddlOriginalVer.ClientID %>').focus();
                }
            }
            else {
                //$('#<%=tbWBSCode.ClientID %>').val('');
                if (wbsType == '<%=DAL.EPMS.WBSType.卷 %>') {
                    $('#<%=ddlRoll.ClientID %>').focus();
                }
                else {
                    $('#<%=tbWBSCode.ClientID %>').focus();
                }
            }

            return false;
        }
        else {
            //验证通过，将任务编号默认为成品校验号
            if ($('#<%=tbSerialCode.ClientID %>').val() == '')
                $('#<%=tbSerialCode.ClientID %>').val(wbsCode);
            return true;
        }
    }

    //isChange是否选项发生变化执行
    function initWbsName(isChange) {
        var action = '<%=Action %>';
        if (action == 'batch') {
            $('[flag = "name"]').each(function () {
                $(this).text($(this).text().replace('任务', '批次'));
            });
            $('[flag = "roll"]').hide();
            $('[flag = "batch"]').hide();
            $('[flag = "serial"]').hide();
            $('[flag = "parent"]').hide();
            $('[flag = "recroll"]').hide();
            $('[flag = "manufacturefile"]').hide();
            $('[flag = "affectedinterface"]').hide();
            $('[flag = "recspe"]').hide();
            //任务相关专业隐藏
            $('[flag = "relSpe"]').hide();
            $('#<%=ddlRoll.ClientID %>').css('width', '45%');
            $('#<%=tbWBSName.ClientID %>').css('width', '45%');
        }
        else {
            var wbsMode = $('#<%=rblType.ClientID %> input[type=radio]:checked').val();
            var wbsType = $('#<%=hiWBSType.ClientID %>').val();
            $('[flag = "manufacturefile"]').hide();
            $('[flag = "affectedinterface"]').hide();
            if (wbsMode == '<%=(int)WBSMode.任务管理 %>') {
                //卷册信息
                $('[flag = "roll"]').show(); 
                $('#<%=txtWBSCode.ClientID %>').removeAttr('req');
                $('#<%=txtWBSName.ClientID %>').removeAttr('req');
                $('#<%=tbWBSCode.ClientID %>').attr('req', '1');

                $('[flag = "parent"]').hide();
                $('[flag = "recspe"]').hide();
                $('[flag = "recroll"]').hide();

                if (wbsType == '<%=DAL.EPMS.WBSType.卷 %>') {
                    if ('<%=ActionType %>' == 'Create') {
                        $('#<%=ddlRoll.ClientID %>').attr('req', '1');
                        $('#<%=ddlRoll.ClientID %>').css('width', '45%');
                        $('#<%=tbWBSName.ClientID %>').css('width', '45%');
                    }
                }
                else if (wbsType == '<%=DAL.EPMS.WBSType.册 %>') {
                    if ('<%=ActionType %>' == 'Read') {
                        //$('[flag="ce"]').show();
                    }
                    //只有“册”才显示“系统方式、模块、企业定额日、行业定额工日、卷册类别”
                    $('[flag="onlyCe"]').show();
                    //
                    $('#<%=ddlOwnRoll.ClientID %>').removeAttr('req');
                    $('[flag="rollreq"]').hide();
                    //                if ($('#<%=ddlOwnRoll.ClientID %> option').length <= 1) {
                    //                    $('#<%=ddlOwnRoll.ClientID %>').removeAttr('req');
                    //                }
                }

                $('[flag="form"]').show();
            }
            else if (wbsType == '<%=DAL.EPMS.WBSType.内部专业间提资 %>' || wbsType == '<%=DAL.EPMS.WBSType.外部接口资料接收 %>') {
                //资料编号、资料名称…
                $('[flag = "parent"]').show();
                //注释by wanglj  内部专业间提资和外部接口资料接收显示 任务标识信息
                //$('[flag = "roll"]').hide();
                $('[flag = "name"]').each(function () {
                    $(this).text($(this).text().replace('任务', '资料'));
                });

                //$('#<%=txtWBSCode.ClientID %>').attr('req', '1');
                //$('#<%=txtWBSName.ClientID %>').attr('req', '1');
                $('#<%=tbWBSCode.ClientID %>').attr('title', '编号自动生成');
                $('#<%=tbWBSCode.ClientID %>').removeAttr('req');
                $('#<%=tbSerialCode.ClientID %>').removeAttr('req');

                if (wbsType == '<%=DAL.EPMS.WBSType.内部专业间提资 %>') {
                    //互提资料
                    //$('[flag = "parent"]').show();
                    $('[flag = "recspe"]').show();
                    $('[flag = "recroll"]').show();
                    $('[flag = "recRollName"]').text('接受任务');
                    $('[flag = "recSpeName"]').text('接受专业');
                    $('[flag = "wbsSpeName"]').each(function () {
                        $(this).text('提出专业');
                    });
                }
                else if (wbsType == '<%=DAL.EPMS.WBSType.外部接口资料接收 %>') {
                    //外部资料
                    //$('[flag = "parent"]').show();
                    $('[flag = "recspe"]').show();
                    $('[flag = "recroll"]').show();
                    $('[flag = "recRollName"]').text('关联任务');
                    $('[flag = "recSpeName"]').text('相关专业');
                }
            }
            else {
                if (wbsMode == '<%=(int)WBSMode.设备管理 %>') {
                    $('[flag = "name"]').each(function () {
                        $(this).text($(this).text().replace('任务', '设备'));
                    });
                    $('[flag = "rollPaper"]').each(function () {
                        $(this).text($(this).text().replace('卷册', '图纸'));
                    });
                }
                else {
                    $('[flag = "name"]').each(function () {
                        $(this).text($(this).text().replace('任务', ''));
                    });
                    //只有综合评审、专业评审显示名称为评审内容
                    if (wbsType == '<%=DAL.EPMS.WBSType.综合评审 %>' || wbsType == '<%=DAL.EPMS.WBSType.专业评审 %>') {
                        $('#spanName').text("评审内容");
                    }
                }
                $('#<%=tbWBSCode.ClientID %>').attr('title', '编号自动生成');
                $('#<%=txtWBSCode.ClientID %>').removeAttr('req');
                $('#<%=txtWBSName.ClientID %>').removeAttr('req');
                //$('#<%=tbWBSCode.ClientID %>').attr('req', '1');
                //任务相关专业隐藏
                $('[flag = "relSpe"]').hide();
                $('[flag = "parent"]').hide();
                if (wbsMode == '<%=(int)WBSMode.设备管理 %>') {
                    $('[flag = "recspe"]').show();
                    $('[flag = "recSpeName"]').text('相关专业');
                    ////注释by wanglj  设备管理下任务显示任务标识信息
                    // $('[flag = "roll"]').hide();
                    //$('[flag="ce"]').show();
                    $('[flag = "batch"]').each(function () {
                        $(this).text($(this).text().replace('卷', '批次'));
                    });
                    $('[flag = "batch"]').each(function () {
                        $(this).text($(this).text().replace('*', ''));
                    });
                    $('#<%=ddlOwnRoll.ClientID %>').removeAttr('req');
                    $('[flag = "recspe"]').show();
                    $('[flag = "recroll"]').show();
                    $('[flag = "manufacturefile"]').show();
                    $('[flag = "affectedinterface"]').show();
                    $('[flag = "recRollName"]').text('受影响的图纸');
                    $('[flag = "recSpeName"]').text('相关专业');

                }
                else {
                    $('[flag = "recspe"]').hide();
                    $('[flag = "recroll"]').hide();
                }
            }

            $("#showInCalculate").hide();
            if (wbsType == '<%=DAL.EPMS.WBSType.计算书 %>') {
                //计算书显示卷册信息，且卷册信息必选
                $('[flag = "parent"]').show();
                $('[flag = "roll"]').hide();
                $("#<%=txtWBSName.ClientID %>").attr("req", "1");
                $("#spanRoll").show();
                //显示预计工期信息
                $("#showInCalculate").show();
                $("#<%=lbContent.ClientID %>").text("程序");
            }
            else if (wbsType == '<%=DAL.EPMS.WBSType.内部专业间提资 %>' || wbsType == '<%=DAL.EPMS.WBSType.外部接口资料接收 %>') {
                $("#<%=txtWBSName.ClientID %>").removeAttr("req");
                $("#spanRoll").hide();
                $('[flag = "roll"]').hide();
            }
            else {
                $('#<%=txtWBSName.ClientID %>').removeAttr('req');
                $("#spanRoll").hide();
            }

            //只有卷册、成品管理才显示检索号
            if (wbsMode == '<%=(int)WBSMode.任务管理 %>' || wbsMode == '<%=(int)WBSMode.成品管理 %>') {
                $('[flag="serial"]').show();
                //$('[flag="noserial"]').hide();
            }
            else {
                $('[flag="serial"]').hide();
                //$('[flag="noserial"]').show();
            }
            //只有综合评审、专业评审才显示任务相关专业
            if (wbsType == '<%=DAL.EPMS.WBSType.综合评审 %>' || wbsType == '<%=DAL.EPMS.WBSType.专业评审 %>') {
                //  //任务相关专业隐藏
                $('[flag = "relSpe"]').show();
                //综合评审，内容显示为计划情况
                $("#<%=lbContent.ClientID %>").text("计划情况");
                $("#<%=lbContent.ClientID %>").text("计划情况");
            }
            else {
                $('[flag = "relSpe"]').hide();
            }
        }
    }

    function initRollName() {
        var name = $('#<%=ddlRoll.ClientID%> :selected ').text();
        var code = $('#<%=ddlRoll.ClientID%>').val();
        var speCode = $('#<%=hiExecSpecialtyCode.ClientID %>').val();
        if (code != '') {
            $('#<%=tbWBSCode.ClientID %>').val(speCode + code);
            $('#<%=tbWBSName.ClientID %>').val(name);
        }
    }

    //选择任务之前的逻辑判断
    function beforeSelectWbs() {
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
        if (orgId == '' || orgId == undefined) {
            alert('请先选择项目，再选择任务！');
            return false;
        }
        return true;
    }

    //选择任务的筛选条件
    function wbsFilter() {
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
        var extSpeId = $("#<%=ddlExecSpecialtyId.ClientID %>").val();
        return { OrganizationID: orgId, WBSType: '<%=(int)WBSMode.任务管理 %>', ExeSpecialtyID: extSpeId };
    }
    
    function viewForm(bizId, extendedAttribute) {
        var url = '/Custom/List/C_FormDetailLoading.aspx';
        var json = { bizId: bizId, IsOld: 2, ExtendedAttribute: extendedAttribute };
        url = buildQueryUrl(url, json);
        window.open(url);
        return false;
    }


    //验证时间 计划结束时间不能超过阶段项目计划结束时间
    function CompareDate(planDate) {
        var thisDate = planDate.value;
        var planFinishDate = '<%=PlanFinishDate%>';
        if (planFinishDate != "" && thisDate != "") {
            if (new Date(thisDate.replaceAll('-', '/')) > new Date(planFinishDate.replaceAll('-', '/'))) {
                alert("任务或提资计划完成日期不能超过阶段计划完成日期" + planFinishDate.replaceAll('/', '-').replaceAll('0:00:00','') + "，如需修改请联系设总修改项目计划");
                planDate.value = "";
            }
        }
    }
</script>
