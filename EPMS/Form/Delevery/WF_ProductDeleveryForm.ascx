<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ProductDeleveryForm.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.Delevery.WF_ProductDeleveryForm" %>
<%@ Import Namespace="DAL.EPMS" %>
<table class="tz-table">
    <tr>
        <td class="td-l">项目名称<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectProject" req="1" IsMutiple="false" SelectPageMode="Dialog"
                ResultForControls="{'hiOrganizationId':'id','tbProjectCode':'ProjectCode','tbPhaseName':'PhaseName','hiPhaseCode':'PhaseCode'}"
                EnableTheming="false" Text="选择项目" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                PageWidth="850" ShowJsonRowColName="true" ResultAttr="name"
                activestatus="(23.填写申请)" tablename="EPMS_PublishDeliver" field="ProjectName" FilterFunction="projFilter()" />
        </td>
        <td class="td-l">项目编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="tbProjectCode" runat="server" readonly="readonly"
                activestatus="(23.填写申请)" class="kpms-textbox" tablename="EPMS_PublishDeliver" field="ProjectCode" />
            <input type="hidden" id="hiOrganizationId" runat="server" tablename="EPMS_PublishDeliver" field="OrganizationID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">设计阶段
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="tbPhaseName" runat="server" readonly="readonly" maxlength="16"
                class="kpms-textbox" activestatus="(23.填写申请)" tablename="EPMS_PublishDeliver" field="PhaseName" />
            <input type="hidden" id="hiPhaseCode" runat="server" tablename="EPMS_PublishDeliver" field="PhaseCode" />
        </td>
        <td class="td-l">资料交付单编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtProductDeliverCode" runat="server" field="ProductDeliverCode"
                tablename="EPMS_PublishDeliver" activestatus="(23.填写申请)" class="kpms-textbox" />
        </td>
    </tr>
    <tr runat="server" displaystatus="(13.校核)(13.审查)(13.盖章交付)">
        <td class="td-l">项目状态<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlProjectState" activestatus="(3.校核)">
            </zhongsoft:LightDropDownList></td>
        <td class="td-l">实际完成时间<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtFactCompleteDate" runat="server" activestatus="(3.校核)"
                class="kpms-textbox-date" readonly="readonly">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">是否涉密<span class="req-star">*</span>
        </td>
        <td class="td-r tdIsSecret">
            <asp:RadioButtonList runat="server" ID="rblIsSecret" tablename="EPMS_PublishDeliver" field="IsSecret" RepeatDirection="Horizontal" req="1" activestatus="(23.填写申请)" />
        </td>
        <td class="td-l tdIsAgreement">是否签署保密协议<span class="req-star">*</span>
        </td>
        <td class="td-r tdIsAgreement">
            <asp:RadioButtonList runat="server" ID="rblIsAgreement" tablename="EPMS_PublishDeliver" field="IsAgreement" RepeatDirection="Horizontal" activestatus="(23.填写申请)" />
        </td>
    </tr>

</table>
<table class="tz-table" width="100%" id="Table1" style="display: none">
    <tr id="Tr1" runat="server" displaystatus="(3.填写申请)">
        <td class="flexible" onclick="openDetail('proList')">
            <span id="projInfo1">待交付任务清单</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
</table>
<table class="tz-table" width="100%" id="proList" style="display: none">
    <tr id="Tr3" runat="server" displaystatus="(3.填写申请)">
        <td>
            <span class="filter-block"><span class="filter-block-lb">任务名称/编号</span>
                <span>
                    <zhongsoft:LightTextBox ID="tbRoll" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
                        EnableTheming="false" />
                </span></span>
            <asp:LinkButton runat="server" ID="btnSearch" OnClick="btnSearch_Click"><span>查找</span></asp:LinkButton>
            <asp:LinkButton runat="server" ID="btnReset" OnClick="btnReset_Click"><span>重置</span></asp:LinkButton>
            <asp:LinkButton runat="server" ID="btnAdd" Visible="false" OnClientClick="return addProduct()"
                OnClick="btnAdd_Click"><span>批量添加</span></asp:LinkButton>
        </td>
    </tr>
    <tr id="Tr2" runat="server" displaystatus="(3.填写申请)">
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvConsignList" runat="server" AllowPaging="true"
                PageSize="10" AutoGenerateColumns="false" UseDefaultDataSource="true" DataKeyNames="WBSID"
                OnRowCommand="gvList_RowCommand" ShowExport="true" BindGridViewMethod="UserControl.BindConsignGrid">
                <Columns>
                    <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" Visible="false"
                        OnClientClick="checkConsignGridView">
                    </zhongsoft:LightCheckField>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField HeaderText="任务编号" DataField="WBSCode" />
                    <zhongsoft:LightBoundField HeaderText="任务名称" DataField="WBSName" />
                    <zhongsoft:LightTemplateField HeaderText="数量">
                        <ItemTemplate>
                            <input type="hidden" runat="server" id="hiDetailID" value='<%#Eval("WBSID") %>' />
                            <input type="hidden" runat="server" id="hiPublishConsignID" value='<%#Eval("PublishConsignID") %>' />
                            <input type="hidden" runat="server" id="hiPublishConsignWBSID" value='<%#Eval("PublishConsignWBSID") %>' />
                            <zhongsoft:LightTextBox ID="tbCount" runat="server" EnableTheming="false" regex="^[0-9]\d*$"
                                errmsg="请填写正整数" CssClass="kpms-textbox-money" Width="30px" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="接收单位">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbReceivingUnit" runat="server" EnableTheming="false" CssClass="kpms-textbox" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="地址">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbAddress" runat="server" EnableTheming="false" CssClass="kpms-textbox" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="邮编">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbPostCode" runat="server" EnableTheming="false" CssClass="kpms-textbox" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="签收人">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbSigner" runat="server" EnableTheming="false" CssClass="kpms-textbox" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="签收日期">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="tbSignDate" runat="server" readonly="readonly" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightButtonField CommandName="AddData" HeaderText="添加" CausesValidation="false"
                        ImageUrl="../../../Themes/Images/btn_add.gif" />
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<table class="tz-table" width="100%" id="Table2">
    <tr id="Tr4" runat="server" displaystatus="(13.*)">
        <td class="flexible" onclick="openDetail('proDelevery')">
            <span id="Span1">产品交付列表</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
</table>
<table class="tz-table" width="100%" id="proDelevery">
    <tr id="Tr6" runat="server" displaystatus="(3.填写申请)">
        <td class="td-m" colspan="6" style="text-align: right;">您已添加&nbsp;<asp:Label ID="lbNum" runat="server" Text="0" ForeColor="Red" Font-Bold="true"
            Font-Size="Large"></asp:Label>&nbsp;任务
            <asp:LinkButton runat="server" ID="btnCancel" OnClientClick="return cancelProduct();"
                OnClick="btnCancel_Click" Visible="false"><span>批量撤销</span></asp:LinkButton>
            <asp:LinkButton runat="server" ID="lbtnSelProduct" CssClass="subtoolbarlink" EnableTheming="false" ToolTip="选择产品"
                OnClientClick="return false;">
                <span>
                    <img runat="server" id="img6" src="~/Themes/Images/btn_add.gif" alt="选择产品" width="16"
                        height="16" />选择待交付任务</span>
            </asp:LinkButton></span>
        </td>
    </tr>
    <tr id="Tr5" runat="server" displaystatus="(13.*)">
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvDeliverList" runat="server" AllowPaging="true" OnRowDataBound="gvDeliverList_RowDataBound"
                PageSize="10" AutoGenerateColumns="false" UseDefaultDataSource="true" DataKeyNames="DeliverProductID"
                OnRowCommand="gvList_RowCommand" ShowExport="true" BindGridViewMethod="UserControl.BindDeliverGrid">
                <Columns>
                    <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkDeliverGridView"
                        Visible="false">
                    </zhongsoft:LightCheckField>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField HeaderText="任务编号" DataField="WBSCode" />
                    <zhongsoft:LightBoundField HeaderText="任务名称" DataField="WBSName" />
                    <zhongsoft:LightTemplateField HeaderText="数量">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbCount" runat="server" EnableTheming="false" regex="^[0-9]\d*$" Text='<%# Eval("Count") %>'
                                errmsg="请填写正整数" CssClass="kpms-textbox-money" Width="30px" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="接收单位">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbReceivingUnit" runat="server" EnableTheming="false" Text='<%# Eval("ReceivingUnit") %>' CssClass="kpms-textbox" activestatus="(3.填写申请)" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="地址">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbAddress" runat="server" EnableTheming="false" Text='<%# Eval("Address") %>' CssClass="kpms-textbox" activestatus="(3.填写申请)" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="邮编">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbPostCode" runat="server" EnableTheming="false" Text='<%# Eval("PostCode") %>' CssClass="kpms-textbox" activestatus="(3.填写申请)" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="签收人">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox ID="tbSigner" runat="server" EnableTheming="false" Text='<%# Eval("Signer") %>' CssClass="kpms-textbox" activestatus="(3.填写申请)" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="签收日期">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="tbSignDate" runat="server" Value='<%# (Eval("SignDate")==null||string.IsNullOrEmpty(Eval("SignDate").ToString())) ? Eval("SignDate") : Convert.ToDateTime(Eval("SignDate")).ToString("yyyy-MM-dd") %>' readonly="readonly" activestatus="(3.填写申请)" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="撤销" CausesValidation="false" DeleteText="确认撤销该记录吗？" Visible="false" />
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<input type="hidden" id="hiPublishDeliverID" name="hiPublishDeliverID" runat="server" tablename="EPMS_PublishDeliver" field="PublishDeliverID" />
<input type="hidden" id="hiCreateDate" name="hiCreateDate" runat="server" tablename="EPMS_PublishDeliver" field="CreateDate" />
<input type="hidden" id="hiConsignID" runat="server" />
<input type="hidden" id="hiDeliverID" runat="server" />
<input type="hidden" runat="server" id="hiProductXML" />
<asp:Button runat="server" ID="btnSelProduct" OnClick="btnSelProduct_Click" Style="display: none" />
<input type="hidden" id="hiRoleName" runat="server" value="勘测设计章管理员" />
<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
        if ($action == "<%=(int)Zhongsoft.Portal.ACL.AccessLevel.Update %>" && $actName == "校核") {
            $("#<%=ddlProjectState.ClientID%>").attr("req", "1");
            controlProjectInfo();
        }
        hiddenControl();
    }

    function checkConsignGridView(array) {
        $("#<%=hiConsignID.ClientID %>").val(array);
    }

    function checkDeliverGridView(array) {
        $("#<%=hiDeliverID.ClientID %>").val(array);
    }

    function addProduct() {
        if ($("#<%=hiConsignID.ClientID %>").val() == "") {
            alert("请选择交付成品！");
            return false;
        }
        return true;
    }

    function cancelProduct() {
        if ($("#<%=hiDeliverID.ClientID %>").val() == "") {
            alert("请选择撤销成品！");
            return false;
        }
        return confirm("确认撤销选中项？");
    }

    //批量打印
    function beforePrint() {
        var a = $("#<%=hiPublishDeliverID.ClientID %>").val();
        window.open("<%=WebAppPath %>" + "/EPMS/List/Delevery/ProductDeleveryPrint.aspx?bizId=" + a);
        return false;
    }

    function checkForm() {
        if ($formAction == 0) {
            if ($action == "<%=(int)Zhongsoft.Portal.ACL.AccessLevel.Update %>" && $actName == "填写申请") {
                var grid = $('#<%=gvDeliverList.ClientID %>')[0];
                if (grid.rows.length < 3) {
                    alert("请先选定交付任务！")
                    return false;
                }
            }
        }
        return true;
    }
    $("#<%=rblIsSecret.ClientID%>").change(function () {
        hiddenControl();
    });

    $("#<%=ddlProjectState.ClientID%>").change(function () {
        controlProjectInfo();
    });

    function hiddenControl() {
        var type = $("#<%=rblIsSecret.ClientID %> input:checked").val();
        if (type == "1") {
            $(".tdIsSecret").removeAttr("colspan");
            $(".tdIsAgreement").show();
            $("#<%=rblIsAgreement.ClientID%>").attr("req", "1");
        } else {
            $(".tdIsSecret").attr("colspan", "3");
            $(".tdIsAgreement").hide();
            $("#<%=rblIsAgreement.ClientID%>").removeAttr("req");
        }
    }

    //项目选择条件
    function projFilter() {
        return { IsShowOwner: 1 };
    }

    function controlProjectInfo() {
        var projectState = $("#<%=ddlProjectState.ClientID %> option:selected").val();
        if (projectState == '<%=ProjectState.设计完成.GetHashCode().ToString()%>') {
            $("#<%=txtFactCompleteDate.ClientID%>").attr("req", "1");
            $("#<%=txtFactCompleteDate.ClientID%>").removeAttr("disabled");
            $("#<%=txtFactCompleteDate.ClientID%>").attr("style", "background: rgb(238, 248, 252);");

        } else {
            $("#<%=txtFactCompleteDate.ClientID%>").removeAttr("req");
            $("#<%=txtFactCompleteDate.ClientID%>").attr("disabled", "disabled");
            $("#<%=txtFactCompleteDate.ClientID%>").attr("style", "background: rgb(255, 255, 255);border: none; width: 70px;");
        }
    }

    //验证是否选择了项目
    function checkProject() {
        var orgID = $('#<%=hiOrganizationId.ClientID %>').val();
        if (orgID == "") {
            alert("请先选择项目");
            return false;
        }
        return true;
    }

    $('#<%=lbtnSelProduct.ClientID %>').live('click', function () {
        if (checkProject()) {
            selProduct();
        }
    });

    //选择任务
    function selProduct() {
        var param = new InputParamObject("m");
        var organizationID = $("#<%=hiOrganizationId.ClientID %>").val();
        var json = { OrganizationID: organizationID, DeliveryState: <%=DeliveryState.待交付.GetHashCode()%> };
        buildDivSelector('<%=hiProductXML.ClientID %>', param, json, buildQueryUrl("EPMS/Obsolete/WBSSelector.aspx", null), 850, 550, bindProduct);
        return false;
    }

    function bindProduct() {
        $("#<%=btnSelProduct.ClientID %>").click();
    }
</script>
