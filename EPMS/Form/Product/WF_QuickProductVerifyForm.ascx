<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_QuickProductVerifyForm.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.Product.WF_QuickProductVerifyForm" %>
<%@ Import Namespace="DAL.EPMS" %>
<!--任务的设计条件-->
<%@ Register Src="../../UI/Product/WBSConditonStats.ascx" TagName="WBSConditonStats"
    TagPrefix="uc1" %>
<!--任务的校审人-->
<%@ Register Src="../../UI/Product/WBSVerifyOperator2.ascx" TagName="WBSVerifyOperator"
    TagPrefix="uc2" %>
<!--任务的校审成品清单-->
<%@ Register Src="../../UI/Product/ProductList2.ascx" TagName="ProductList" TagPrefix="uc3" %>
<!--校审意见清单-->
<%@ Register Src="../../UI/Product/ProductOpinionList.ascx" TagName="ProductOpinionList"
    TagPrefix="uc4" %>
<!--校审要点-->
<%@ Register Src="../../UI/Product/WBSVerifyPoint.ascx" TagName="WBSVerifyPoint"
    TagPrefix="uc5" %>
<!--质量评语-->
<%@ Register Src="../../UI/Product/WBSQualityEvaluation.ascx" TagName="WBSQualityEvaluation"
    TagPrefix="uc6" %>
<!--强条-->
<%@ Register Src="../../UI/Product/WBSMandatory.ascx" TagName="WBSMandatory" TagPrefix="uc6" %>
<%@ Register Src="../../UI/Product/RollSignInfo.ascx" TagName="RollSignInfo" TagPrefix="uc7" %>
<%@ Register Src="../../UI/Product/JoinSignOperator.ascx" TagName="JoinSignOperator"
    TagPrefix="uc8" %>
<div>
    <table class="tz-table" width="100%">
        <asp:UpdatePanel ID="upProject" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <tr>
                    <td class="td-l">
                        项目编号<span class="req-star">*</span>
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightObjectSelector runat="server" ID="txtProjectCode" SourceMode="SelectorPage"
                            IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                            PageWidth="850" EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector2.aspx"
                            ResultForControls="{'hiOrganizationID':'id','txtProjectName':'ProjectName'}"
                            TableName="EPMS_ProductVerifyForm" Field="ProjectCode" activestatus="(2.建立校审单)"
                            req="1" Writeable="true" ShowAttrs="name" onkeyup="toUpperCase('1')" OnClick="btnAfterSelectProject_Click">
                        </zhongsoft:LightObjectSelector>
                        <input type="hidden" runat="server" id="hiOrganizationID" tablename="EPMS_ProductVerifyForm"
                            field="OrganizationID" />
                        <input type="hidden" runat="server" id="hiParamProjectTypeID" />
                    </td>
                    <td class="td-l">
                        项目名称<span class="req-star">*</span>
                    </td>
                    <td class="td-m" colspan="3">
                        <zhongsoft:XHtmlInputText runat="server" ID="txtProjectName" activestatus="(2.建立校审单)"
                            readonly="readonly" class="kpms-textbox" TableName="EPMS_ProductVerifyForm" Field="ProjectName"
                            req="1" />
                    </td>
                </tr>
                <tr>
                    <td class="td-l" flag="hide">
                        任务类别<span class="req-star">*</span>
                    </td>
                    <td class="td-r" flag="hide">
                        <zhongsoft:LightDropDownList runat="server" ID="ddlWBSType" TableName="EPMS_ProductVerifyForm"
                            Field="ParamWBSTypeID" activestatus="(2.建立校审单)" req="1">
                        </zhongsoft:LightDropDownList>
                        <input type="hidden" runat="server" id="hiWBSType" tablename="EPMS_ProductVerifyForm"
                            field="WBSType" />
                    </td>
                    <td class="td-l">
                        卷册编号<span class="req-star">*</span>
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightObjectSelector runat="server" ID="txtWBSCode" SourceMode="SelectorPage"
                            IsMutiple="false" ShowJsonRowColName="true" DoCancel="false" ResultAttr="WBSCode"
                            PageWidth="900" EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/WBSSelector2.aspx"
                            ResultForControls="{'hiWBSID':'id','txtWBSName':'WBSName','txtBelongSpecialtyName':'ExecSpecialtyName','hiBelongSpecialtyID':'ExecSpecialtyID','hiBelongSpecialtyCode':'ExecSpecialtyCode','hiBelongSpecialtyName':'ExecSpecialtyName','hiDeptName':'BelongDeptName','txtBelongDeptName':'BelongDeptName','hiBelongDeptID':'BelongDeptID','ddlWBSType':'ParamWBSTypeID','hiWBSType':'WBSType','hiWBSFlag':'WBSFlag'}"
                            activestatus="(2.建立校审单)" BeforeSelect="beforeSelectWbs()" FilterFunction="wbsFilter()"
                            req="1" OnClick="btnAfterSelectWBS_Click" tablename="EPMS_ProductVerifyForm"
                            field="WBSCode" Writeable="true" ShowAttrs="WBSCode" onblur="checkWBSAdd()" onkeyup="toUpperCase('2')">
                        </zhongsoft:LightObjectSelector>
                        <input type="hidden" runat="server" id="hiWBSID" tablename="EPMS_ProductVerifyForm"
                            field="WBSID" />
                        <input type="hidden" runat="server" id="hiCheckWBSCode" />
                    </td>
                    <td class="td-l">
                        卷册名称<span class="req-star">*</span>
                    </td>
                    <td class="td-m" colspan="3">
                        <zhongsoft:XHtmlInputText runat="server" ID="txtWBSName" activestatus="(2.建立校审单)"
                            class="kpms-textbox" TableName="EPMS_ProductVerifyForm" Field="WBSName" req="1"
                            onfocus="afterWBSAdd()" />
                    </td>
                </tr>
            </ContentTemplate>
        </asp:UpdatePanel>
        <%--隐藏   --%>
        <tr id="trCom" style="display: none;">
            <td class="td-l">
                选择关联卷册/成品<asp:ImageButton ID="ibtnSelectReleWBS" runat="server" OnClientClick="return selectRelaWBS();"
                    displaystatus="(3.建立校审单)" OnClick="btnReleWBS_Click" ImageUrl="~/themes/images/look-up.gif"
                    ToolTip="您可以添加关联的卷册/成品并行完成校审" />
            </td>
            <td colspan="5" class="td-m">
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvReleWBSList" AllowPaging="false"
                    PageSize="50" ShowExport="true" AutoGenerateColumns="false" AllowSorting="true"
                    DataKeyNames="WBSID" UseDefaultDataSource="true" BindGridViewMethod="BindRelateWBSList"
                    EmptyDataText="没有关联卷册/成品信息" OnRowDataBound="gvReleWBSList_RowDataBound" OnRowCommand="gvReleWBSList_RowCommand">
                    <Columns>
                        <zhongsoft:LightTemplateField ItemStyle-Width="30px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="卷册编号" />
                        <zhongsoft:LightBoundField DataField="WBSName" HeaderText="卷册名称" />
                        <zhongsoft:LightBoundField DataField="WBSOwnerName" HeaderText="卷册负责人" />
                        <zhongsoft:LightTemplateField HeaderText="校审信息" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="ibtnViewFlow" EnableTheming="false" Visible="false">
                                                 <img alt="" style="cursor: pointer"  src="<%=WebAppPath%>/Themes/Images/btn_dg_detail.gif" />
                                </asp:LinkButton>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="修改状态">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbModifyInfo"></asp:Label>
                                <asp:LinkButton runat="server" ID="lbtnStartModifyFlow" OnClientClick="if(!confirm('确认要发起成品设计修改流程吗？')) return false;"
                                    Visible="false" EnableTheming="false" CommandArgument='<%#Eval("WBSID") %>' OnClick="lbtnStartModifyFlow_Click">发起成品修改流程</asp:LinkButton>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <asp:TemplateField HeaderText="删除" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center"
                            Visible="false">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" ToolTip="删除" CommandName="del"
                                    CommandArgument='<%# Eval("WBSID") %>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="<%=this.WebAppPath %>/Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
        <tr>
            <td class="td-l" flag="hide">
                设计/编制人<span class="req-star">*</span>
            </td>
            <td class="td-r" flag="hide">
                <zhongsoft:XHtmlInputText runat="server" ID="hiWBSOwnerName" activestatus="(2.建立校审单)"
                    readonly="readonly" class="kpms-textbox" TableName="EPMS_ProductVerifyForm" Field="WBSOwnerName"
                    req="1" />
                <input type="hidden" runat="server" id="hiWBSOwnerId" tablename="EPMS_ProductVerifyForm"
                    field="WBSOwnerID" />
            </td>
            <td class="td-l">
                专业<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtBelongSpecialtyName" activestatus="(2.建立校审单)"
                    readonly="readonly" class="kpms-textbox" />
                <input type="hidden" runat="server" id="hiBelongSpecialtyID" field="BelongSpecialtyID"
                    tablename="EPMS_ProductVerifyForm" />
                <input type="hidden" runat="server" id="hiBelongSpecialtyCode" field="BelongSpecialtyCode"
                    tablename="EPMS_ProductVerifyForm" />
                <zhongsoft:LightDropDownList runat="server" ID="ddlExecSpecialty" activestatus="(2.建立校审单)"
                    req="1" OnSelectedIndexChanged="ddlExecSpecialty_SelectedIndexChanged" AutoPostBack="true"
                    displaystatus="(2.建立校审单)">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiExecSpecialtyName" />
                <input type="hidden" runat="server" id="hiExecSpecialtyCode" />
                <!-- 所属专业-->
                <input type="hidden" runat="server" id="hiBelongSpecialtyName" tablename="EPMS_ProductVerifyForm"
                    field="BelongSpecialtyName" />
            </td>
            <td class="td-l">
                部门<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:XHtmlInputText runat="server" ID="txtBelongDeptName" activestatus="(2.建立校审单)"
                    readonly="readonly" class="kpms-textbox" />
                <input type="hidden" runat="server" id="hiBelongDeptID" field="BelongDeptID" tablename="EPMS_ProductVerifyForm" />
                <zhongsoft:LightDropDownList runat="server" ID="ddlDept" activestatus="(2.建立校审单)"
                    req="1" displaystatus="(2.建立校审单)">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiDeptName" field="BelongDeptName" tablename="EPMS_ProductVerifyForm" />
            </td>
        </tr>
        <%--隐藏   --%>
        <tr style="display: none;">
            <td rowspan="2" class="td-l">
                <asp:LinkButton ID="lkbFiles" runat="server" OnClientClick="return openFileDetail()"
                    EnableTheming="false" ForeColor="Blue">
                接口资料
                </asp:LinkButton>
            </td>
            <td class="td-r" rowspan="2">
                <uc1:WBSConditonStats ID="wbsCondition" runat="server" />
            </td>
            <td class="td-l" rowspan="2">
                校审条件
            </td>
            <td class="td-r" title="卷册存在没有提交、没有接收的资料项或者项目没有综合项目计划书，为不具备条件，如果要开始校审，必须经过审批允许 ">
                <%--<asp:RadioButtonList runat="server" ID="rbtnFlag" RepeatDirection="Horizontal" activestatus="(23.*)">
                    <asp:ListItem Value="0">不具备</asp:ListItem>
                    <asp:ListItem Value="1">具备</asp:ListItem>
                </asp:RadioButtonList>--%>
                <span class="req-star">如果不具备校审条件，是否需要发起例外转续申请</span>
            </td>
            <td rowspan="2" colspan="2" class="td-r">
                <table width="100%">
                    <tr>
                        <td>
                            <a class="aStyle" href="<%=WebAppPath %>/Sys/Workflow/FormDetail.aspx?actionType=2&packageName=EPMSExceptionOrder.xpdl&xpdlId=DesignChageNotice_wp1&formId=205&ver="
                                target="_blank">例外转序申请书</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a class="aStyle" href="<%=WebAppPath %>/EPMS/List/Sys/ProjVerifyRange.aspx?VerifyType=big"
                                target="_blank">大型工程勘测设计成品审签范围表</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a class="aStyle" href="<%=WebAppPath %>/EPMS/List/Sys/ProjVerifyRange.aspx?VerifyType=mid"
                                target="_blank">中小型工程勘测设计成品审签范围表</a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="display: none;">
            <td class="td-l">
                岗位人员
            </td>
            <td class="td-m" colspan="5">
                <uc2:WBSVerifyOperator ID="WBSVerifyOperator" runat="server" />
            </td>
        </tr>
        <%--隐藏   --%>
        <tr style="display: none;">
            <td class="td-l">
                会签人
            </td>
            <td class="td-m" colspan="5">
                <uc8:JoinSignOperator ID="UCJoinSignOperator" runat="server" />
            </td>
        </tr>
        <tr id="trNext">
            <td colspan="6" style="text-align: center;">
                <span class="req-star">请确认并完善项目、卷册基本信息，然后点击下一步,上传成品。</span>
                <br />
                <input type="button" runat="server" id="btnNext" value="下一步" onclick="return saveFormData()" />
            </td>
        </tr>
        <tr id="trStart">
            <td colspan="6">
                <a href="javascript:OpenCAD();" id='cadStart' style="text-decoration: underline;
                    color: Blue; float: right;">启动校审工具</a>
            </td>
        </tr>
        <tr runat="server" id="trOperate2PDF">
            <td colspan="6">
                <table width="100%">
                    <tr>
                        <td>
                            <span class="req-star">签转说明：</span><br />
                            <asp:Button ID="btnDWG2PDF" runat="server" OnClientClick="OpenCAD()" Text="图纸签转确认" />
                            <span class="req-star">请点击该按钮，实现该卷册下的图纸、文本签署、转PDF操作；在CAD中操作如下：定位到该卷册节点下右键【签出】——右键【转PDF】，确认成功后——右键【签入】；</span>
                            <br />
                            <asp:Button ID="btnOffice2PDF" runat="server" OnClick="btnOffice2PDF_Click" Text="文本签转确认" />
                            <span class="req-star">请点击该按钮，实现对该卷册下的全部文本的签署、转PDF操作。</span>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>
<div id="divSignIndo" runat="server" displaystatus="(*.?)">
    <%--签署确认--%>
    <uc7:RollSignInfo ID="rollSignInfo" runat="server" />
</div>
<div style="height: 5px">
</div>
<%--校审要点去掉 20170714 by hehs delete--%>
<table class="tz-table" width="100%" style="display: none;">
    <tr id="verifyPointHeader">
        <td colspan="6" class="flexible" onclick="openDetail('verifyPoint')">
            校审要点&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr id="verifyPoint">
        <td colspan="6">
            <uc5:WBSVerifyPoint ID="WBSVerifyPoint" runat="server" />
        </td>
    </tr>
</table>
<div style="height: 5px">
</div>
<%--执行强条去掉 20170714 by hehs delete--%>
<table class="tz-table" width="100%" style="display: none;">
    <tr id="mandatoryHeader">
        <td colspan="6" class="flexible" onclick="openDetail('mandatory')">
            执行强条&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr id="mandatory">
        <td colspan="6">
            <uc6:WBSMandatory ID="WBSMandatory" runat="server" />
        </td>
    </tr>
</table>
<div style="height: 5px">
</div>
<div id="ouPutPorduct">
    <uc3:ProductList ID="ProductList" runat="server" OnDataChanged="ProductList_DataChanged" />
</div>
<div style="height: 5px">
</div>
<div id="outPutOpinion">
    <uc4:ProductOpinionList ID="ProductOpinionList" runat="server" />
</div>
<div style="height: 5px">
</div>
<table id="quality" class="tz-table" width="100%">
    <tr id="Tr1">
        <td colspan="6" class="flexible" onclick="openDetail('qualityEvaluation')">
            质量评语&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr id="qualityEvaluation">
        <td colspan="6">
            <uc6:WBSQualityEvaluation ID="WBSQualityEvaluation" runat="server" />
        </td>
    </tr>
</table>
<div id="loading" style="display: none">
    <span><strong>文件正在签转中</strong></span>
    <br />
    <span style="text-align: center;">
        <img src="/portal/themes/Images/loading.gif" alt="文件正在签转中" /></span>
</div>
<!--用于检查协同校审工具是否安装-->
<object id="CADActive" style="display: none" classid="clsid:F4B25887-127F-46A9-BF75-30332B826B51">
</object>
<!--主键-->
<input type="hidden" id="hiFormID" runat="server" tablename="EPMS_ProductVerifyForm"
    field="ProductVerifyFormID" />
<%--综合卷册校审流程Code--%>
<input type="hidden" id="hiZHFormCode" runat="server" value="EPMS14B" />
<input type="hidden" id="hiPassManRole" runat="server" value="商务经理" />
<!--关联任务-->
<input runat="server" id="hiReleXml" type="hidden" />
<!--校审类型：快捷校审，默认99-->
<input type="hidden" runat="server" id="hiVerifyType" tablename="EPMS_ProductVerifyForm"
    field="VerifyType" value="99" />
<input type="hidden" id="hiSWJLRoleName" runat="server" value="商务经理" />
<style type="text/css">
    .wpf_header div
    {
        background: url(../../Themes/Images/wp-header.png) no-repeat left top;
        height: 21px;
        line-height: 21px;
        padding-left: 35px;
        font-size: 12px;
        color: #fff;
        cursor: pointer;
    }
    .wpf_header div span
    {
        float: left;
    }
</style>
<script type="text/javascript">
    function initCustomerPlugin() {

        //检查是否安装了协同校审
        var object = document.all.CADActive.object;
        if (object == null || object == undefined) {
            $("#cadInstall").show();
        }
        else {
            $("#cadStart").show();
        }

        if (typeof (initProductList) == 'function') {
            initProductList();
        }

        $('[flag="hide"]').hide();

        //由于页面内容较多，所以默认全屏显示
        setScrFull();
        ShowControlDetail();

        //20181210 by hehs Modify 初始化为进行校审意见控件显隐控制
        if (typeof (initDisplayDIV) == 'function') {
            initDisplayDIV();
        }
    }

    //控制页面内容的显隐
    function ShowControlDetail() {
        if ("<%=ActionType %>" == "Create") {
            $("#trNext").show();
            $("#trStart").hide();
            $("#cadStart").hide();
            $("#trOperate2PDF").hide();
            $("#ouPutPorduct").hide();
            $("#outPutOpinion").hide();
            $("#quality").hide();
        }
        else {
            $("#trNext").hide();
            $("#trStart").show();
            $("#cadStart").show();
            $("#trOperate2PDF").show();
            $("#ouPutPorduct").show();
            $("#outPutOpinion").show();
            $("#quality").show();
        }
    }

    //在页面直接启动校审工具，不用借助中间页面
    function OpenCAD() {
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
        var wbsId = $('#<%=hiWBSID.ClientID %>').val();
        if (orgId != '') {
            try {
                //参数列表：项目ID、专业名称、任务卷册ID
                document.getElementById("CADActive").QiDongCheckOutIn(orgId, "全部", wbsId);
            }
            catch (e) {
                alert("如果您未安装协同校审系统，请先安装、再启动；如果您已安装请运行加载项！");
            }
        }
    }

    //安装在线助手
    function InstallCAD() {
        var strPath = "<%=WebAppPath %>/Sys/Download/协同校审安装包.rar";
        window.open(strPath);
    }

    ///查看关联任务的详细档案信息
    function releWBSDetail(wbsId) {

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

    //选择任务负责人前必须选择任务
    function beforeSelectOwner() {
        var wbsId = $('#<%=hiWBSID.ClientID %>').val();
        if (wbsId == '' || wbsId == undefined) {
            alert('请先选择校审任务，再选择任务负责人！');
            return false;
        }
        return true;
    }

    //选择任务的筛选条件
    function wbsFilter() {
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
        var ownerId = '<%=KPMSUser.Id %>';
        var formType = '<%=Zhongsoft.Portal.EPMS.Obsolete.WBSFormTypeSelect.校审.ToString() %>';
        return { OrganizationID: orgId, WBSType: '<%=WBSMode.卷册管理.GetHashCode() %>', OwnerId: ownerId, WBSFormTypeSelect: formType, IsShowMore: "1" };
    }

    //选择负责人的筛选
    function ownerFilter() {
        var projTypeId = $('#<%=hiParamProjectTypeID.ClientID %>').val();
        var specId = $('#<%=hiBelongSpecialtyID.ClientID %>').val();
        var roleId = '646F4096-E8DA-49F2-9C5E-42DDD22623F4'; //卷册负责人角色
        return { ProjectTypeID: projTypeId, SpecialtyID: specId, RoleID: roleId };
    }

    ///选择关联任务，需要按项目、专业
    function selectRelaWBS() {
        var wbsId = $('#<%=hiWBSID.ClientID %>').val();
        if (wbsId == '' || wbsId == undefined) {
            alert('请先选择校审任务，再选择相关任务！');
            return false;
        }
        var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
 
        var json = { OrganizationID: orgId, WBSType: '<%=(int)WBSMode.卷册管理 %>'};

        //        var url = buildQueryUrl('/EPMS/Obsolete/WBSSelector.aspx', json);
        //        showDivDialog(url, null, 1050, 600, null);
        var param = new InputParamObject("m");
        getWBS("<%=hiReleXml.ClientID %>", param, json, afterReleSelect);
        return false;
    }   
    
    //选择关联任务后
    function afterReleSelect() {
        <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.ibtnSelectReleWBS, "")%>;
    }

    function afterWBSSelect() {
        <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.txtWBSCode, "")%>;
    }

    function afterWBSAdd(){
        if("<%=ActionType %>"=="Create"){
            var wbsId = $('#<%=hiWBSID.ClientID %>').val();
            //20171020 by hehs Modify 增加项目Id、卷册编号不为空的判断；
//            var wbsCode=$('#<%=txtWBSCode.ClientID %>').val();
//            var organizationId=$('#<%=hiOrganizationID.ClientID %>').val();
//            if (organizationId!='' && wbsCode!='' &&  (wbsId == '' || wbsId == undefined)) {
        if (wbsId == '' || wbsId == undefined) {
                alert("当前卷册不存在，系统会作为新卷册进行保存，请完善卷册名称、专业、部门信息！");
                var wbsCode = $('#<%=txtWBSCode.ClientID %>').text();
                $('#<%=hiCheckWBSCode.ClientID %>').val(wbsCode);
                afterWBSSelect();
            }
        }
    }

    function checkWBSAdd(){
        if("<%=ActionType %>"=="Create"){
            var wbsCheckCode = $('#<%=hiCheckWBSCode.ClientID %>').val();
            var wbsCode = $('#<%=txtWBSCode.ClientID %>').text();
            if(wbsCheckCode!=""&&wbsCheckCode!=wbsCode){
                if(confirm("您修改了卷册编号，是否按新卷册进行添加？")){
                    $('#<%=hiCheckWBSCode.ClientID %>').val(wbsCode);
                    $('#<%=hiWBSID.ClientID %>').val("");
                    afterWBSSelect();
                }
                else{
                    $('#<%=txtWBSCode.ClientID %>').text(wbsCheckCode);
                }
            }
            else{
                    $('#<%=txtWBSName.ClientID %>').text();
            }
        }
    }

    function toUpperCase(type){
    if(type=="1"){
        var a=$('#<%=txtProjectCode.ClientID %>').text();
        $('#<%=txtProjectCode.ClientID %>').text(a.toUpperCase());
    }
    else if(type=="2"){
        var a=$('#<%=txtWBSCode.ClientID %>').text();
        $('#<%=txtWBSCode.ClientID %>').text(a.toUpperCase());
        }
    }

    function checkForm() {//原有方法: KPMSCheckSubmit       
        if ($formAction == 0) {//原有属性: $readyFormSend
            var organizationId = $('#<%=hiOrganizationID.ClientID %>').val();
            var bizId = '<%=BusinessObjectId %>';
            var result;
            var checkType = "VerifyLock";
            if ($actName == "建立校审单"
             || $actName.indexOf("修改") > -1
             || $actName == "参与人确认"
             || $actName == "汇总校审成品") {
                checkType = "VerifyAll";
                if(!isAddedSigner()){
                    return false; 
                }
            }
            else if ($actName == "分配校审任务") {
                checkType = "VerifyOperator";
            }
            $.ajax({
                type: 'POST',
                url: buildQueryUrl("/EPMS/Handler/CheckCodeHandler.ashx", null),
                data: { 'checkType': checkType, 'OrganizationID': organizationId, 'BizID': bizId, 'CurUserId': '<%=KPMSUser.Id %>' },
                async: false,
                cache: false,
                success: function (res) {
                    result = res;
                },
                error: function (err) {
                    //alert(err);
                }
            });
            if (result != "" && result != null && result != undefined) {
                alert(result);
                return false;
            }
            else {
                return true;
            }
        }
        return true;
    }

    var $checkbox = $(':checkbox:not(":enabled")');
    var $input = $(':input:not(":enabled")');
    $input.css({ 'behavior': 'none', 'background': '#dddddd', 'color': '#000000' });
    $checkbox.css('background', '#fff');
    //接口资料下载页面
    function openFileDetail() {
        var releWBSID = $("#<%=hiWBSID.ClientID %>").val();
        var organizationID = $("#<%=hiOrganizationID.ClientID %>").val();
        var specialtyID = $("#<%=hiBelongSpecialtyID.ClientID %>").val();
        var json = { actionType: 1, ReleWBSID: releWBSID, OrganizationID: organizationID, SpecialtyID: specialtyID };
        var url = buildQueryUrl("/EPMS/List/WBS/WBSFileDownload.aspx", json);
        showDivDialog(url, null, 800, 600, null);
        return false;
    }

    function showLoading() {
        $('#loading').dialog({ height: 130, width: 270, resizable: false });
        $('#loading').dialog('open');
    }
    function endLoading() {

        $('#loading').dialog('close');
    }

    //20170811 by hehs Add 前台按钮调用流程表单通用按钮事件
    //默认调用流程表单通用按钮的保存按钮点击事件
    function saveFormData() {
        WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions("FormToolBar$LinkSave", "", true, "", "", false, true));

        $("#trNext").hide();
    }


</script>
