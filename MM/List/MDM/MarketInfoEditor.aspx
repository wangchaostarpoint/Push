<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MarketInfoEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MDM.MarketInfoEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    Title="跟踪项目信息详细" %>

<%@ Import Namespace="Zhongsoft.Portal.MM.Entity" %>

<%@ Register Src="../../../Sys/FileDocument/AttachmentView.ascx" TagName="UpLoadFile"
    TagPrefix="uc3" %>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton runat="server" ID="lbtnReceive" EnableTheming="false" CssClass="subtoolbarlink" Visible="false"
            OnClientClick="return checkCanReceive();"
            OnClick="lbtnReceive_Click" ToolTip="接受"><span>
             <img src="../../../Themes/Images/btn_submit.gif" />接受</span></asp:LinkButton>
    </div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" width="100%">
        <tr>
            <td class="td-l">所属工程包
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbBelongProjectPackage" field="BelongProjectPackage"
                    tablename="MM_MarketInfo" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">工程名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbProjectName" field="ProjectName"
                    req="1" tablename="MM_MarketInfo" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">建设单位<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightObjectSelector runat="server" ID="txtCustomerName" IsMutiple="false"
                    ShowSelectBtn="true" SelectPageMode="Dialog" ResultForControls="{'hiCustomerID':'id','hiEntrustUnitID':'id','txtEntrustUnitName':'name','txtEntrustUnitName_hivalue':'name'}"
                    EnableTheming="false" Text="选择建设单位" PageWidth="850" PageUrl="../../Obsolete/CustomerSelector.aspx"
                    ShowJsonRowColName="true" ResultAttr="name" tablename="MM_MarketInfo" Filter="{IsOrderByHit:'1'}"
                    req="1" field="CustomerName" activestatus="(23.*)" DoCancel="false" Writeable="false" AfterSelect="checkUser()" />
                <input type="hidden" id="hiCustomerID" name="hiCustomerID" runat="server" field="CustomerID"
                    tablename="MM_MarketInfo" />
            </td>
        </tr>
        <tr>
            <td class="td-l">委托单位<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightObjectSelector runat="server" ID="txtEntrustUnitName" IsMutiple="false"
                    ShowSelectBtn="true" SelectPageMode="Dialog" ResultForControls="{'hiEntrustUnitID':'id'}"
                    EnableTheming="false" Text="选择委托单位" PageWidth="850" PageUrl="../../Obsolete/CustomerSelector.aspx"
                    ShowJsonRowColName="true" ResultAttr="name" tablename="MM_MarketInfo" Filter="{IsOrderByHit:'1'}"
                    req="1" field="EntrustUnitName" activestatus="(23.*)" DoCancel="false" Writeable="false" AfterSelect="checkUser()" />
                <input type="hidden" id="hiEntrustUnitID" name="hiEntrustUnitID" runat="server" field="EntrustUnitID"
                    tablename="MM_MarketInfo" />
            </td>
        </tr>
        <tr>
            <td class="td-l">联系人<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtContacter" IsMutiple="false"
                    ShowSelectBtn="true" SelectPageMode="Dialog" activestatus="(23.*)" SourceMode="SelectorPage"
                    ResultForControls="{ 'hiContacterID':'id','txtContacterPhone':'Phone'}" ShowJsonRowColName="true"
                    FilterFunction="contacteFilter()" ResultAttr="name" ShowAttrs="name,UserCode"
                    PageUrl="../../Obsolete/CustomerContactSelector.aspx" req="1" field="ContacterName"
                    DoCancel="false" tablename="MM_MarketInfo"></zhongsoft:LightObjectSelector>
                <input type="hidden" id="hiContacterID" name="hiContacterID" runat="server" field="ContacterID"
                    tablename="MM_MarketInfo" />
            </td>
            <td class="td-l">业主联系人电话<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtContacterPhone"
                    req="1" class="kpms-textbox" activestatus="(23.*)" field="ContacterPhone"
                    tablename="MM_MarketInfo">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">重要程度<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblImportantLevel" field="ImportantLevel" tablename="MM_MarketInfo"
                    req="1" RepeatDirection="Horizontal" activestatus="(23.*)">
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-l">是否境内<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rbIsChurchyard" field="IsChurchyard" tablename="MM_MarketInfo"
                    req="1" RepeatDirection="Horizontal" activestatus="(23.*)" AutoPostBack="true"
                    OnSelectedIndexChanged="rbIsChurchyard_SelectedIndexChanged">
                </asp:RadioButtonList>
            </td>
            <td class="td-l">省份(洲)<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlProvince" runat="server" activestatus="(23.*)"
                    AutoPostBack="True" OnSelectedIndexChanged="ddlProvince_SelectedIndexChanged"
                    req="1">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiProvince" field="Province" tablename="MM_MarketInfo" />
            </td>
            <td class="td-l">市(国家)<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <input type="hidden" runat="server" id="hiArea" field="Area" tablename="MM_MarketInfo" />
                <zhongsoft:LightDropDownList ID="ddlArea" runat="server" activestatus="(23.*)" field="Area" tablename="MM_MarketInfo" req="1" onchange="return autoBuildPlace();">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">建设地点<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbBuildPlace" field="BuildPlace"
                    req="1" tablename="MM_MarketInfo" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">业务板块<span class="req-star">*</span>
            </td>
            <td class="td-r" colspan="5">
                <asp:RadioButtonList runat="server" ID="rblBusinessPlate" field="ParamBusinessPlateID" tablename="MM_MarketInfo"
                    RepeatDirection="Horizontal" activestatus="(23.*)" req="1">
                </asp:RadioButtonList>
                <input type="hidden" runat="server" id="hiBusinessPlate" field="BusinessPlate" tablename="MM_MarketInfo" />

            </td>
        </tr>
        <tr>
            <td class="td-l">工程类别<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlProjectType" TableName="MM_MarketInfo"
                    Field="ParamProjectTypeID" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiProjectType" field="ProjectType" tablename="MM_MarketInfo" />
            </td>
            <td class="td-l">服务性质<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlServiceType" TableName="MM_MarketInfo"
                    req="1" Field="ServiceType" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">建设性质<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblBuildType" field="BuildType" tablename="MM_MarketInfo"
                    req="1" RepeatDirection="Horizontal" activestatus="(23.*)">
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-l">电压等级
            </td>
            <td class="td-r" style="white-space: nowrap">
                <zhongsoft:LightTextBox runat="server" ID="tbVoltageGrade" field="VoltageGrade" EnableTheming="false"
                    CssClass="kpms-textbox-money" DataType="PositiveInteger" Width="80%" tablename="MM_MarketInfo" activestatus="(23.*)"></zhongsoft:LightTextBox>KV
            </td>
            <td class="td-l">装机容量
            </td>
            <td class="td-r" style="white-space: nowrap">
                <zhongsoft:LightTextBox runat="server" ID="tbInstalledCapacity" field="InstalledCapacity" EnableTheming="false"
                    CssClass="kpms-textbox-money" DataType="PositiveInteger" Width="80%" tablename="MM_MarketInfo" activestatus="(23.*)"></zhongsoft:LightTextBox>MW
            </td>
            <td class="td-m" colspan="2"></td>
        </tr>
        <tr>
            <td class="td-l">工程阶段<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <asp:CheckBoxList runat="server" ID="cblProjectPhases" activestatus="(23.*)"
                    RepeatDirection="Horizontal" req="1">
                </asp:CheckBoxList>
                <input type="hidden" runat="server" id="hiProjectPhaseIDs" field="ProjectPhaseIDs" tablename="MM_MarketInfo" />
                <input type="hidden" runat="server" id="hiProjectPhaseNames" field="ProjectPhaseNames" tablename="MM_MarketInfo" />
            </td>
        </tr>
        <tr>
            <td class="td-l">信息提供人<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtInfoProviderName" IsMutiple="false"
                    ShowSelectBtn="true" SelectPageMode="Dialog" activestatus="(23.*)" SourceMode="SelectorPage"
                    ResultForControls="{ 'hiInfoProviderID':'id'}" ShowJsonRowColName="true"
                    ResultAttr="name" ShowAttrs="name,UserCode" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
                    req="1" field="InfoProviderName" FilterFunction="userFilter()"
                    DoCancel="false" tablename="MM_MarketInfo"></zhongsoft:LightObjectSelector>
                <input type="hidden" id="hiInfoProviderID" runat="server" field="InfoProviderID"
                    tablename="MM_MarketInfo" />
            </td>
            <td class="td-l">跟踪执行人<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtTrackingExecutor" IsMutiple="false"
                    ShowSelectBtn="true" SelectPageMode="Dialog" activestatus="(23.*)" SourceMode="SelectorPage"
                    ResultForControls="{ 'hiTrackingExecutorID':'id'}" ShowJsonRowColName="true"
                    ResultAttr="name" ShowAttrs="name,UserCode" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
                    req="1" field="TrackingExecutor" FilterFunction="userFilter()"
                    DoCancel="false" tablename="MM_MarketInfo"></zhongsoft:LightObjectSelector>
                <input type="hidden" id="hiTrackingExecutorID" runat="server" field="TrackingExecutorID"
                    tablename="MM_MarketInfo" />
            </td>
            <td class="td-l">负责部门
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtDutyDeptName" readonly="readonly"
                                          class="kpms-textbox" activestatus="(23.*)" field="DutyDeptName"
                                          tablename="MM_MarketInfo">
                </zhongsoft:XHtmlInputText>
                <input type="hidden" id="hiDutyDeptID" runat="server" field="DutyDeptID"
                       tablename="MM_MarketInfo" />
            </td>
        </tr>
        <tr>
            <td class="td-l">跟踪状态
            </td>
            <td class="td-m" style="white-space: nowrap" colspan="3">
                <asp:RadioButtonList runat="server" ID="rblTrackingState" field="TrackingState" tablename="MM_MarketInfo"
                    req="1" RepeatDirection="Horizontal" activestatus="(23.*)">
                </asp:RadioButtonList>
            </td>
            <td class="td-l" flag="JS" style="display: none">任务(委托)形式<span class="req-star">*</span>
            </td>
            <td class="td-r" flag="JS" style="display: none">
                <zhongsoft:LightDropDownList runat="server" ID="ddlDelegateType" field="DelegateType" tablename="MM_MarketInfo" activestatus="(23.*)" />
            </td>
            <td class="td-m" colspan="2" flag="NoJS"></td>
        </tr>
        <tr>
            <td class="td-l">工程计划开始时间<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtPlanStartTime" runat="server" activestatus="(23.*)" req="1"
                    class="kpms-textbox-date" readonly="readonly" field="PlanStartTime" tablename="MM_MarketInfo">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">工程计划完成时间<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtPlanFinishTime" runat="server" activestatus="(23.*)" req="1"
                    class="kpms-textbox-date" readonly="readonly" field="PlanFinishTime" tablename="MM_MarketInfo">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l" flag="cPlanFinishTime" style="display: none">初设计划完成时间<span class="req-star">*</span>
            </td>
            <td class="td-r" flag="cPlanFinishTime" style="display: none">
                <zhongsoft:XHtmlInputText ID="txtCPlanFinishTime" runat="server" activestatus="(23.*)"
                    class="kpms-textbox-date" readonly="readonly" field="CPlanFinishTime" tablename="MM_MarketInfo">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-m" colspan="2" flag="cNoPlanFinishTime"></td>
        </tr>
        <tr>
            <td class="td-l">预估合同额（万元）<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbEstimateContractVal" EnableTheming="false" req="1"
                    CssClass="kpms-textbox-money" DataType="Decimal2" activestatus="(23.*)"></zhongsoft:LightTextBox>
                <input type="hidden" runat="server" id="hiEstimateContractVal" field="EstimateContractVal"
                    tablename="MM_MarketInfo" />
            </td>
            <td class="td-l">项目投资（万元）
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbProjectInvestment" EnableTheming="false"
                    CssClass="kpms-textbox-money" DataType="Decimal2" activestatus="(23.*)"></zhongsoft:LightTextBox>
                <input type="hidden" runat="server" id="hiProjectInvestment" field="ProjectInvestment"
                    tablename="MM_MarketInfo" />
            </td>
            <td colspan="2" class="td-m"></td>
        </tr>
        <tr>
            <td class="td-l">工程情况说明<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbProjectDescription" runat="server" TextMode="MultiLine" MaxLength="1024" req="1"
                    field="ProjectDescription" tablename="MM_MarketInfo" activestatus="(23.*)" CssClass="kpms-textarea"
                    EnableTheming="false"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">工程规模<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbProjectScale" runat="server" TextMode="MultiLine" MaxLength="1024" req="1"
                    field="ProjectScale" tablename="MM_MarketInfo" activestatus="(23.*)" CssClass="kpms-textarea"
                    EnableTheming="false"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">信息来源
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbInfoResource" field="InfoResource"
                    tablename="MM_MarketInfo" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">备注
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbMemo" runat="server" TextMode="MultiLine" MaxLength="1024"
                    field="Memo" tablename="MM_MarketInfo" activestatus="(23.*)" CssClass="kpms-textarea"
                    EnableTheming="false"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">相关附件
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightFileUploader runat="server" ID="lbtnUpload" EnableTheming="false"
                    DisplayStatus="(3.*)" OnClick="lbtnUpload_Click"><img src="../../../Themes/Images/btn_upload.gif" />
                        <span>上传附件</span></zhongsoft:LightFileUploader><span class="req-star" style="float: right;"
                            runat="server" displaystatus="(2.*)"> 请先保存再上传附件</span>
                <uc3:UpLoadFile ID="uploadFile" runat="server" />
            </td>
        </tr>
        <tr>
            <td colspan="6" class="flexible" onclick="openDetail('divRecord')">跟踪记录信息&nbsp;<img src="../../../themes/images/lright.png" />
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <div id="divRecord">
                    <span style="float: right;" id="spAdd">
                        <asp:LinkButton runat="server" ID="ibtnRecord" CssClass="subtoolbarlink" EnableTheming="false"
                            OnClientClick="return false" DisplayStatus="(3.*)">
                            <span>
                                <img runat="server" id="img" src="~/Themes/Images/btn_add.gif" alt="添加跟踪记录信息" width="16"
                                    height="16" />添加跟踪记录信息</span>
                        </asp:LinkButton></span>
                    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
                        PageSize="10" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                        DataKeyNames="TrackingRecordID" UseDefaultDataSource="true" BindGridViewMethod="BindList"
                        OnRowCommand="gvList_RowCommand" OnRowDataBound="gvList_RowDataBound">
                        <Columns>
                            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                                HeaderStyle-Width="40px">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </zhongsoft:LightTemplateField>
                            <zhongsoft:LightBoundField HeaderText="记录时间" DataField="RecordTime" DataFormatString="{0:yyyy-MM-dd}">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="跟踪主题" DataField="Theme">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="跟踪内容" DataField="Content" ItemStyle-Width="200px" ShowToolTip="true">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField HeaderText="备注" DataField="Memo">
                            </zhongsoft:LightBoundField>
                            <asp:TemplateField HeaderText="查看" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false" OnClientClick="return false">
                                    <img alt="img" src="../../../Themes/Images/btn_dg_view.gif" 
                                    onclick="viewItem('1','<%# Eval("TrackingRecordID") %>');"/>
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="编辑" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center"
                                Visible="false">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnEdit" runat="server" EnableTheming="false" OnClientClick="return false" Visible="false">
                                    <img alt="img" src="../../../Themes/Images/btn_dg_edit.gif" 
                                    onclick="viewItem('3','<%# Eval("TrackingRecordID") %>');"/>
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center"
                                Visible="false">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del" Visible="false"
                                        CommandArgument='<%# Eval("TrackingRecordID") %>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="../../../Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </zhongsoft:LightTemplateField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </div>
            </td>
        </tr>
    </table>
    <input runat="server" type="hidden" id="hiMarketInfoID" tablename="MM_MarketInfo"
        field="MarketInfoID" />
    <input runat="server" type="hidden" id="hiFlag" tablename="MM_MarketInfo"
        field="Flag" value="1" />
    <input runat="server" type="hidden" id="hiReviewState" tablename="MM_MarketInfo"
        field="ReviewState" />

    <asp:Button runat="server" ID="btnBindRecord" OnClick="btnBindRecord_Click" Style="display: none" />

    <asp:Button runat="server" ID="btnCheckUser" OnClick="btnCheckUser_OnClick" Style="display: none" />

    <script type="text/javascript">
        function initCustomerPlugin() {
            //将工程包的值默认给工程名称
            $('#<%=tbBelongProjectPackage.ClientID %>').bind('blur', function () {
                var package = $('#<%=tbBelongProjectPackage.ClientID %>').val();
                $('#<%=tbProjectName.ClientID %>').val(package);
            });
            $("#<%=this.tbVoltageGrade.ClientID %>").autocomplete({
                source: function (request, response) {
                    $.getJSON("<%=WebAppPath %>/JsonSelectorHandler.ashx", {
                        term: request.term + ',voltagegrade'
                    }, response);
                },
                minLength: 1,
                select: function (event, ui) {
                    if (ui.item) {
                        $("#<%=tbVoltageGrade.ClientID %>").attr("value", ui.item.value);
                    }
                }
            });

            setCPlanInfo();
            $('#<%=cblProjectPhases.ClientID %>').live('change', function () {
                setCPlanInfo();
            });
            //添加跟踪记录
            $('#<%=ibtnRecord.ClientID %>').bind('click', function () {
                viewItem('2', '');
            });
            $('#<%=rblTrackingState.ClientID %>').each(function () {
                $(this).unbind();
            });
            var trackingState = $("#<%=rblTrackingState.ClientID %> input[type=radio]:checked").val();
            if (trackingState == '<%=TrackingState.接受.ToString()%>') {
                $("[flag='NoJS']").hide();
                $("[flag='JS']").show();
                $("#<%=ddlDelegateType.ClientID%>").attr("req","1");
            } else {
                $("[flag='NoJS']").show();
                $("[flag='JS']").hide();
                $("#<%=ddlDelegateType.ClientID%>").removeAttr("req");
            }
            $("#<%=rblTrackingState.ClientID %> input[type=radio]").each(function () {
                $(this).bind('click', function () {
                    var trackingState = $("#<%=rblTrackingState.ClientID %> input[type=radio]:checked").val();
                    if (trackingState == '<%=TrackingState.接受.ToString()%>') {
                        $("[flag='NoJS']").hide();
                        $("[flag='JS']").show();
                        $("#<%=ddlDelegateType.ClientID%>").attr("req","1");
                    } else {
                        $("[flag='NoJS']").show();
                        $("[flag='JS']").hide();
                        $("#<%=ddlDelegateType.ClientID%>").removeAttr("req");
                    }
                });
            });
        }

        //联系人选择筛选
        function contacteFilter() {
            var entrustUnitID = $("#<%=hiEntrustUnitID.ClientID %>").val();
            return "{CustomerID:'" + entrustUnitID + "'}";
        }

        function setCPlanInfo() {
            $('[flag = "cPlanFinishTime"]').hide();
            $('[flag = "cNoPlanFinishTime"]').show();
            $("#<%=txtCPlanFinishTime.ClientID %>").removeAttr("req");
            $('#<%=cblProjectPhases.ClientID %>').find("input[type='checkbox']:checked").each(function () {
                sValue = $(this).parent().attr("phaseID");
                if (sValue.match("C")) {
                    $('[flag = "cPlanFinishTime"]').show();
                    $('[flag = "cNoPlanFinishTime"]').hide();
                    $("#<%=txtCPlanFinishTime.ClientID %>").attr("req", "1");
                    return;
                }
            })
        }

        //查看编辑跟踪记录
        function viewItem(actionType, bizId) {
            var marketInfoID = $("#<%=hiMarketInfoID.ClientID%>").val();
            var json = { actionType: actionType, bizId: bizId, MarketInfoID: marketInfoID };
            var url = buildQueryUrl('/MM/List/MDM/TrackingRecordEditor.aspx', json);
            var callBack = null;
            if (actionType == '2' || actionType == '3') {
                callBack = bindRecord;
            }
            showDivDialog(url, "", 650, 400, callBack);
            return false;
        }

        //执行后台绑定跟踪记录
        function bindRecord() {
            $('#<%=btnBindRecord.ClientID %>').click();

        }

        //信息提供人、跟踪执行人选择筛选
        function userFilter() {
            var organizationID = "<%=KPMSUser.DeptId%>";
            return { organizationID: organizationID };
        }

        function checkCanReceive() {
            if (saveData()) {
                return confirm('确认接受吗？');
            }
            return false;
        }

        function autoBuildPlace() {
            var province = $("#<%=ddlProvince.ClientID %>").find("option:selected")[0].innerText;
            var city = $("#<%=ddlArea.ClientID %>").find("option:selected")[0].innerText;
            if (city != "") {
                $("#<%=tbBuildPlace.ClientID%>").val(province + city);
            }
            return false;
        }

        function checkUser() {
            <%=this.Page.ClientScript.GetPostBackEventReference(this.btnCheckUser, "")%>;
        }
    </script>
</asp:Content>
