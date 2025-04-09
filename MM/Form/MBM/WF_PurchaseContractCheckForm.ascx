<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_PurchaseContractCheckForm.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.Form.MBM.WF_PurchaseContractCheckForm" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            合同类型<span  class="req-star">*</span>
        </td>
        <td class="td-r">
            <asp:RadioButtonList ID="rblContractAddState" runat="server" RepeatDirection="Horizontal"
                field="CONTRACTADDSTATE" tablename="MBM_PURCHASECONTRACTSPFORM" activestatus="(23.拟定采购合同初稿)(23.修改采购合同初稿)">
                <asp:ListItem Value="0" Selected="True">新签</asp:ListItem>
                <asp:ListItem Value="1">补充</asp:ListItem>
                <asp:ListItem Value="2">变更</asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td class="td-l">
            评审方式<span id="span1" class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlCheckMode" runat="server" field="CHECKMODE" tablename="MBM_PURCHASECONTRACTSPFORM"
                activestatus="(23.拟定采购合同初稿)(23.修改采购合同初稿)(3.审核)(3.评审)">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">
            评审时间
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText runat="server" ID="txtCheckDate" tablename="MBM_PURCHASECONTRACTSPFORM"
                readonly="readonly" class="kpms-textbox-date" field="CHECKDATE" compare="1" activestatus="(23.拟定采购合同初稿)(23.修改采购合同初稿)(3.审核)" />
        </td>
    </tr>
    <tr id="name2">
        <td class="td-l">
            原采购合同名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsPurchaseContract" field="PARENTCONTRACTNAME"
                tablename="MBM_PURCHASECONTRACTSPFORM" activestatus="(23.拟定采购合同初稿)(23.修改采购合同初稿)"
                SelectPageMode="Dialog" SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true"
                ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name" ResultForControls="{'hiParentId':'id','txtParentContractCode':'CONTRACTCODE'}"
                PageWidth="750" Filter="{IsOutsourcing:'1'}" PageUrl="~/MM/Obsolete/ContractSelector.aspx">
            </zhongsoft:LightObjectSelector>
        </td>
        <td class="td-l">
            原采购合同编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtParentContractCode" runat="server" type="text" class="kpms-textbox"
                readonly="readonly" activestatus="(23.拟定采购合同初稿)(23.修改采购合同初稿)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            采购合同名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox ID="tbContractName" activestatus="(23.拟定采购合同初稿)(23.修改采购合同初稿)"
                req="1" runat="server" maxtext="64" field="CONTRACTNAME" tablename="MBM_PURCHASECONTRACTSPFORM">
            </zhongsoft:LightTextBox>
        </td>
        <td class="td-l">
            合同编号<span id="span2" class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtContractCode" runat="server" type="text" class="kpms-textbox"
                 style="width: 120px" tablename="MBM_PURCHASECONTRACTSPFORM" field="CONTRACTCODE"
                activestatus="(23.拟定采购合同初稿)(23.修改采购合同初稿)(3.审核)(3.合同确认)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            采购合同类型<span id="span3" class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlPurchaseContractType" activestatus="(23.拟定采购合同初稿)(23.修改采购合同初稿)(3.审核)"
                runat="server" tablename="MBM_PURCHASECONTRACTSPFORM" field="PARAMCONTRACTTYPEID"
                Width="100%">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiParamContractType" field="PURCHASECONTRACTTYPE"
                tablename="MBM_PURCHASECONTRACTSPFORM" />
        </td>
        <td class="td-l">
            采购方式<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <asp:RadioButtonList ID="rblPurchaseType" runat="server" RepeatDirection="Horizontal"
                req="1" field="PURCHASETYPE" tablename="MBM_PURCHASECONTRACTSPFORM" activestatus="(23.拟定采购合同初稿)(23.修改采购合同初稿)">
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            采购合同相对方<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsContractRelativesName" PageUrl="~/MM/Obsolete/SupplierSelector.aspx"
                ShowJsonRowColName="true" ResultAttr="name" Filter="{SupplierType:'2'}" ActiveStatus="(23.拟定采购合同初稿)(23.修改采购合同初稿)"
                SelectPageMode="Dialog" SourceMode="SelectorPage" field="CONTRACTRELATIVESNAME"
                tablename="MBM_PURCHASEAPPLYORBGFORM" req="1" ResultForControls="{'hiContractRelativesId':'id'}" />
            <input type="hidden" id="hiContractRelativesId" runat="server" field="CONTRACTRELATIVESID"
                tablename="MBM_PURCHASECONTRACTSPFORM" />
        </td>
        <td class="td-l">
            采购合同额（万元）<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="txtContractMoney" Field="CONTRACTMONEY" regex="^[-+]?([[1-9]\d{0,7}(\.\d{1,6})?$)|(^[0](\.\d{1,6})?$)"
                errmsg="请输入数字，最多8位整数、6位小数！" CssClass="kpms-textbox-money" EnableTheming="false"
                req="1" tableName="MBM_PURCHASECONTRACTSPFORM" activestatus="(23.拟定采购合同初稿)(23.修改采购合同初稿)"
                runat="server" onblur="checkValue()">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            采购合同承办人
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbUndertakePersonName" Field="UNDERTAKEPERSONNAME" CssClass="kpms-textbox-short"
                EnableTheming="false" ReadOnly="true" tableName="MBM_PURCHASECONTRACTSPFORM"
                activestatus="(23.拟定采购合同初稿)(23.修改采购合同初稿)" runat="server">
            </zhongsoft:LightTextBox>
            <input type="hidden" id="hiUndertakePersonId" runat="server" field="UNDERTAKEPERSONID"
                tablename="MBM_PURCHASECONTRACTSPFORM" />
            <input type="hidden" id="hiUndertakePersonCode" runat="server" field="UNDERTAKEPERSONCODE"
                tablename="MBM_PURCHASECONTRACTSPFORM" />
        </td>
        <td class="td-l">
            合同承办部门<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlUndertakeDeptId" Field="UNDERTAKEDEPTID" tableName="MBM_PURCHASECONTRACTSPFORM"
                req="1" activestatus="(23.拟定采购合同初稿)(23.修改采购合同初稿)" runat="server">
            </zhongsoft:LightDropDownList>
            <input type="hidden" id="hiUndertakeDeptName" runat="server" field="UNDERTAKEDEPTNAME"
                tablename="MBM_PURCHASECONTRACTSPFORM" />
        </td>
        <td class="td-l">
            采购申请部门<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlApplyId" Field="APPLYID" tableName="MBM_PURCHASECONTRACTSPFORM"
                req="1" activestatus="(23.拟定采购合同初稿)(23.修改采购合同初稿)" runat="server">
            </zhongsoft:LightDropDownList>
            <input type="hidden" id="hiApplyName" runat="server" field="APPLYNAME" tablename="MBM_PURCHASECONTRACTSPFORM" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            主要内容及采购价款<span class="req-star">*</span>
        </td>
        <td colspan="5" class="td-m">
            <zhongsoft:LightTextBox activestatus="(23.拟定采购合同初稿)(23.修改采购合同初稿)" ID="tbContent"
                runat="server" req="1" CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine"
                Field="CONTENT" TableName="MBM_PURCHASECONTRACTSPFORM" maxtext="512" />
        </td>
    </tr>
</table>
<table class="tz-table" width="100%" id="projData">
    <tr>
        <td align="center" style="font-weight: bold" colspan="6">
            项目信息<span id="Span1" class="req-star" runat="server" displaystatus="(123.?)">请先保存再添加</span>
        </td>
    </tr>
    <tr displaystatus="(23.拟定采购合同初稿)(3.修改采购合同初稿)(3.审核)" runat="server">
        <td align="right" colspan="6">
            <%-- <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectProj" IsMutiple="true"
                SelectPageMode="Dialog" EnableTheming="false" Text="选择项目" OnlyShowButton="true"
                PageUrl="~/MM/Obsolete/PurchaseProjectSelector.aspx" ShowJsonRowColName="true"
                ResultAttr="name" activestatus="(3.拟定采购合同初稿)(3.修改采购合同初稿)" OnClick="lbsSelectProj_Click" />--%>
            <asp:Button ID="btnChooseProject" Text="选择项目" runat="server" EnableTheming="false"
                OnClientClick="return selPhaseProject()" OnClick="lbsSelectProj_Click" />
        </td>
    </tr>
    <tr runat="server">
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvList" runat="server" DataKeyNames="PROJECTDETAILID"
                AutoGenerateColumns="False" AllowPaging="True" UseDefaultDataSource="true" OnRowCommand="gvList_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px">
                        <ItemTemplate>
                            <%#((GridViewRow)Container).DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="APPLYCODE" HeaderText="采购申请编号" />
                    <asp:BoundField DataField="APPLYLITTLETYPE" HeaderText="采购申请类型" />
                    <asp:BoundField DataField="PROJCODE" HeaderText="项目编号" />
                    <asp:BoundField DataField="PROJNAME" HeaderText="项目名称" />
                    <asp:BoundField DataField="PROJTYPE" HeaderText="工程类型" />
                    <asp:BoundField DataField="NAME" HeaderText="经营经理" />
                    <asp:BoundField DataField="VALUE" HeaderText="合同额（万元）" DataFormatString="{0:F2}" />
                    <asp:TemplateField HeaderText="查看申请流程" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnViewA" EnableTheming="false">
                                <img alt="查看" title="查看" src="../../Themes/Images/btn_dg_view.gif"                                 
                                     onclick="return viewApply('<%#Eval("PROJID") %>');" />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="详细" HeaderStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnViewB" runat="server" EnableTheming="false">
                        <img alt="" src="../../Themes/Images/btn_dg_detail.gif" onclick="return showProj('<%#Eval("PROJECTDETAILID") %>');" />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="编辑" HeaderStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnEdit" runat="server" EnableTheming="false">
                        <img alt="" src="../../Themes/Images/btn_dg_edit.gif" onclick="return editProj('<%#Eval("PROJECTDETAILID") %>');" />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="删除" Visible="false" ItemStyle-HorizontalAlign="Center"
                        HeaderStyle-Width="40px">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnDelete" runat="server" CommandArgument='<%#Eval("PROJECTDETAILID") %>'
                                CommandName="DeleteData" EnableTheming="false">
						             <img  alt=""  onclick="if(!confirm('确认要删除吗？')) return false;" src="../../Themes/Images/btn_dg_delete.gif"  />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<%--主键ID--%>
<input type="hidden" id="hiCheckId" runat="server" field="CHECKID" tablename="MBM_PURCHASECONTRACTSPFORM" />
<input type="hidden" id="hiContractId" runat="server" field="CONTRACTID" tablename="MBM_PURCHASECONTRACTSPFORM" />
<input type="hidden" id="hiParentId" runat="server" field="PARENTID" tablename="MBM_PURCHASECONTRACTSPFORM" />
<input type="hidden" id="hiRoleNameA" runat="server" value="经营经理" />
<input type="hidden" id="hiRoleNameB" runat="server" value="部门负责人" />
<input type="hidden" id="hiRoleNameC" runat="server" value="主管院长" />
<input type="hidden" id="hiRoleNameD" runat="server" value="审计员" />
<input type="hidden" id="hiRoleNameE" runat="server" value="法律人员" />
<input type="hidden" id="hiDeptNameA" runat="server" value="技术质量部" />
<input type="hidden" id="hiDeptNameB" runat="server" value="总承包事业部" />
<asp:LinkButton runat="server" ID="lbtnAfterEditProj" OnClick="lbtnAfterEditProj_Click"
    Style="display: none"></asp:LinkButton>
<input type="hidden" runat="server" id="hiProjectXml" />
<script type="text/javascript">
    function initCustomerPlugin() {
        //验证正则表达式
        checkRegex();
        //验证正则表达式
        checkMaxLength();

        //$("#projData").hide();

        //合同类型若为新签，则采购合同名称手填；若为补充，则为选择
        var contractType = $("#<%=rblContractAddState.ClientID %> input[type='radio']:checked").val();
        setContractTypeControl(contractType);

        $('#<%=rblContractAddState.ClientID %>').click(function () {
            var type = $("#<%=rblContractAddState.ClientID %> input[type='radio']:checked").val();
            setContractTypeControl(type);
        })

        //采购合同类型若为勘测设计外委，则显示项目信息；其余不显示
        var purchaseType;
        if($action != "2") {
			purchaseType = $('#<%=hiParamContractType.ClientID %>').val();
        }
        else{
            purchaseType = $('#<%=ddlPurchaseContractType.ClientID %> option:selected').text();
        }


        setPurchaseTypeControl(purchaseType);

        $('#<%=ddlPurchaseContractType.ClientID %>').live('change', function () {
            var purType = $('#<%=ddlPurchaseContractType.ClientID %> option:selected').text();
            setPurchaseTypeControl(purType);
		})

		if ($actName == "审核") {
			$("#span1").show();
			$("#span3").show();
			$('#<%=ddlCheckMode.ClientID %>').attr('req', '1');
			$('#<%=ddlPurchaseContractType.ClientID %>').attr('req', '1');
		}
		else {
			$("#span1").hide();
			$("#span3").hide();
			$('#<%=ddlCheckMode.ClientID %>').removeAttr('req');
			$('#<%=ddlPurchaseContractType.ClientID %>').removeAttr('req');
        }
        if ($actName == "合同确认") {
            $("#span2").show();
            $('#<%=txtContractCode.ClientID %>').attr('req', '1');
        }
        else {
            $("#span2").hide();
            $('#<%=txtContractCode.ClientID %>').removeAttr('req');
        }
    }

    function checkForm() {
        if ($formAction == 0) {
            var contractType = $('#<%=ddlPurchaseContractType.ClientID %> option:selected').text();
            if (contractType == "勘测设计外委") {
                var count = $('#<%=gvList.ClientID %>')[0].rows.length;
                if (count < 3) {
                    alert("请选择项目！");
                    return false;
                }
            }
        }
        return true;
    }

    //合同类型若为新签，则采购合同名称手填；若为补充，则为选择
    function setContractTypeControl(contractType) {
        if (contractType == "0") {
            $("#name2").hide();
            $('#<%=lbsPurchaseContract.ClientID %>').removeAttr('req');
              //清空父级合同信息
            $('#<%=lbsPurchaseContract.ClientID %>').val("");
            $('#<%=lbsPurchaseContract.ClientID %>').next().val("");
            $('#<%=txtParentContractCode.ClientID %>').val("");
            $('#<%=hiParentId.ClientID %>').val("");
        }
        else {
            $("#name2").show();
            $('#<%=lbsPurchaseContract.ClientID %>').attr('req', '1');
        }
        checkValue();
    }

    //合同类型为新签时，采购合同额不可以为负数，合同类型为补充时，采购合同额可以为负数
    function checkValue() {
        var contractMoney = $("#<%=txtContractMoney.ClientID %>").val();
        if (contractMoney != "") {
            var contractType = $("#<%=rblContractAddState.ClientID %> input[type='radio']:checked").val();
            if (contractType == "0") {
                if (contractMoney < 0) {
                    alert("新签合同的采购合同额不可以为负数！");
                    $("#<%=txtContractMoney.ClientID %>").val("");
                }
            }
        }
    }

    //采购合同类型若为工程项目外委，则显示项目信息；其余不显示
	function setPurchaseTypeControl(purchaseType) {
        if (purchaseType == "勘测设计外委") {
            $("#projData").show();
        }
        else {
            $("#projData").hide();
        }
    }

    function viewFlow(formid, processInstanceId) {
        var urlStr = "<%=WebAppPath %>/Sys/Workflow/FormDetail.aspx?actionType=1&formId=" + formid + "&prcInstId=" + processInstanceId;
        window.open(urlStr);
        return false;
    }

    function viewApply(id) {
        var url = buildQueryUrl("MM/List/MBM/PurchaseApplyProjList.aspx", { ProjId: id });
        showDivDialog(url, null, 900, 500);
        return false;
    }

    //查看项目详细信息
    function showProj(id) {
        var url = buildQueryUrl("MM/List/MBM/ProjSplitEditor.aspx", { actionType: 1, ProjId: id });
        showDivDialog(url, null, 800, 800);
        return false;
    }

    //编辑项目详细信息
    function editProj(id) {
        var url = buildQueryUrl("MM/List/MBM/ProjSplitEditor.aspx", { actionType: 3, ProjId: id });
        showDivDialog(url, null, 800, 800,afterEditProj);
        return false;
    }

    function afterEditProj(){
       <%=this.Page.ClientScript.GetPostBackEventReference(this.lbtnAfterEditProj, "")%>;
    }

    function selPhaseProject() {
        var param = new InputParamObject("m");
        getDivPurchaseProj('<%=hiProjectXml.ClientID %>', param, null, afterSelPhaseProject);
        return false;
    }

    //选择外委项目后
    function afterSelPhaseProject() { 
      <%=Page.ClientScript.GetPostBackEventReference(this.btnChooseProject,"")%>;
    }
</script>
