<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PublishConsignWBSInfo.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Publish.PublishConsignWBSInfo" %>
<table class="tz-table" width="100%" id="Table1">
    <tr id="trleader">
        <td class="flexible" onclick="openDetail('publishWBSDetail')">
            出版卷册信息&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" /><span style="float: right"><asp:Button
                ID="btnSelectRoll" runat="server" OnClientClick="return selRoll();" ToolTip="选择卷册"
                OnClick="btnSelectRoll_Click" CssClass="btn" Text="选择卷册" DisplayStatus="(3.*)" />
                <asp:Label runat="server" ID="lbTip" activestatus="(2.*)" DisplayStatus="(2.*)" ForeColor="Red"
                    Text="先保存再添加卷册"></asp:Label>
            </span>
        </td>
    </tr>
</table>
<table class="tz-table" width="100%" id="publishWBSDetail">
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AutoGenerateColumns="false"
                ShowEmptyDataHeader="true" DataKeyNames="PublishConsignWBSID" UseDefaultDataSource="true"
                PageSize="10" BindGridViewMethod="UserControl.BindInfo" EmptyDataText="没有卷册信息"
                ShowFooter="True" HideFieldOnExport="删除,工种安排,拒绝出版" OnRowCommand="gvList_RowCommand"
                OnRowDataBound="gvList_RowDataBound" OnRowCreated="gvList_RowCreated">
                <Columns>
                    <zhongsoft:LightBoundField DataField="index" HeaderText="序号">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="工种安排" Visible="true" HeaderStyle-Width="200px">
                        <ItemTemplate>
                            <zhongsoft:LightDropDownList ID="ddlWork" Style="width: 100px;" key='<%# DataBinder.Eval(Container.DataItem, "PublishConsignWBSID") %>'
                                runat="server">
                            </zhongsoft:LightDropDownList>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <asp:TemplateField HeaderText="拒绝出版" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px"
                        Visible="true">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnCope" EnableTheming="false" CommandName="DelData"
                                CommandArgument='<%#Eval("WBSID") %>'>
                                <img alt="拒绝出版" title="拒绝出版" src="../../Themes/Images/ico_flow.gif"                                     />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="删除" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:ImageButton runat="server" ID="lbtnDel" ImageUrl="~/Themes/Images/btn_dg_delete.gif"
                                ToolTip="删除" CommandName="DeleteData" CommandArgument='<%# Eval("PublishConsignWBSID") %>'
                                OnClientClick="if(!confirm('您确定删除吗？')) return false;" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <zhongsoft:LightTemplateField HeaderText="修改状态">
                        <ItemTemplate>
                            <asp:Label ID="lbStateInfo" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ModifyState") %>'
                                Style="color: Blue; text-decoration: underline; cursor: pointer"></asp:Label>
                            <asp:Label runat="server" ID="lbModifyState" Text='<%# DataBinder.Eval(Container.DataItem, "ModifyState") %>'></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <%-- <zhongsoft:LightBoundField DataField="ExecSpecialtyName" HeaderText="专业<br/>名称" HtmlEncode="false">
                    </zhongsoft:LightBoundField>--%>
                    <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="卷册<br/>编号" HtmlEncode="false"
                        HeaderStyle-Width="4%">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="WBSName" HeaderText="卷册<br/>名称" HtmlEncode="false">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="WBSOwnerName" HeaderText="卷册<br/>负责人" HtmlEncode="false"
                        HeaderStyle-Width="4%">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="IsOutConsign" HeaderText="是否<br/>外部委托" HtmlEncode="false"
                        HeaderStyle-Width="4%">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="总份数<span class='req-star'>*</span>" HeaderStyle-Width="4%">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText ID="txtAmount" runat="server" Regex="^[1-9]\d*$" errmsg="请输入整数"
                                req="1" wbsID="1" Style="width: 30px" MaxLength="6" class="kpms-textbox-money"
                                EnableTheming="false" value='<%# DataBinder.Eval(Container.DataItem, "Amount") %>'>
                            </zhongsoft:XHtmlInputText>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="CatalogSum" HeaderText="目录<br/>张数" HtmlEncode="false"
                        HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="MapALLSum" HeaderText="图纸<br/>总张数" HtmlEncode="false"
                        HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="ActiveSum" HeaderText="套用图<br/>（张）" HtmlEncode="false"
                        HeaderStyle-Width="4%" ItemStyle-HorizontalAlign="right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="A0" HeaderText="A0" ItemStyle-HorizontalAlign="right"
                        HeaderStyle-Width="4%">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="A1" HeaderText="A1" ItemStyle-HorizontalAlign="right"
                        HeaderStyle-Width="4%">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="A2" HeaderText="A2" ItemStyle-HorizontalAlign="right"
                        HeaderStyle-Width="4%">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="A3" HeaderText="A3" ItemStyle-HorizontalAlign="right"
                        HeaderStyle-Width="4%">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="A4" HeaderText="A4" ItemStyle-HorizontalAlign="right"
                        HeaderStyle-Width="4%">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="文本<br/>总页数" HeaderStyle-Width="4%">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText ID="txtFileSum" runat="server" readonly="readonly" Style="width: 30px"
                                wbsID="1" content="sumCount" MaxLength="6" class="kpms-textbox-money" EnableTheming="false"
                                value='<%# DataBinder.Eval(Container.DataItem, "FileSum") %>'>
                            </zhongsoft:XHtmlInputText>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="说明书<br/>（页）" HeaderStyle-Width="4%">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText ID="txtExplainSum" runat="server" Regex="^[1-9]\d*|0$"
                                content="explainSum" wbsID="1" Style="width: 30px" errmsg="请输入整数" MaxLength="6"
                                class="kpms-textbox-money" EnableTheming="false" value='<%# DataBinder.Eval(Container.DataItem, "ExplainSum") %>'>
                            </zhongsoft:XHtmlInputText>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="清册<br/>（页）" HeaderStyle-Width="4%">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText ID="txtLiquidationSum" runat="server" Regex="^[1-9]\d*|0$"
                                wbsID="1" content="liquidationSum" Style="width: 30px" errmsg="请输入整数" MaxLength="6"
                                class="kpms-textbox-money" EnableTheming="false" value='<%# DataBinder.Eval(Container.DataItem, "LiquidationSum") %>'>
                            </zhongsoft:XHtmlInputText>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="概预算<br/>（页）" HeaderStyle-Width="4%">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText ID="txtBudgetSum" runat="server" Regex="^[1-9]\d*|0$" content="budgetSum"
                                wbsID="1" Style="width: 30px" errmsg="请输入整数" MaxLength="6" class="kpms-textbox-money"
                                EnableTheming="false" value='<%# DataBinder.Eval(Container.DataItem, "BudgetSum") %>'>
                            </zhongsoft:XHtmlInputText>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="NewStandardMapSum" HeaderText="标准张" ItemStyle-HorizontalAlign="right"
                        HeaderStyle-Width="4%">
                    </zhongsoft:LightBoundField>
                    <%--<zhongsoft:LightBoundField DataField="IsYLGD" HeaderText="是否<br/>压力管道" HtmlEncode="false">
                    </zhongsoft:LightBoundField>--%>
                    <zhongsoft:LightBoundField DataField="YlgdCheckPerson" HeaderText="压力管道<br/>审核人"
                        HeaderStyle-Width="4%" HtmlEncode="false">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="YlgdSDPerson" HeaderText="压力管道<br/>审定人" HtmlEncode="false"
                        HeaderStyle-Width="4%">
                    </zhongsoft:LightBoundField>
                    <%-- <zhongsoft:LightBoundField DataField="ModifyProduct" HeaderText="修改的成品">
                    </zhongsoft:LightBoundField>--%>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<input type="hidden" id="hiPublishConsignID" name="PublishConsignID" runat="server" />
<input type="hidden" id="hiOrganizationId" name="hiOrganizationId" runat="server" />
<input type="hidden" id="hiWBSInfo" name="hiWBSInfo" runat="server" />
<input type="hidden" id="hiType" name="type" runat="server" value="整套" />
<asp:Button ID="btnInWork" runat="server" OnClick="btnInWork_Click" class="btn" Style="display: none" />
<script type="text/javascript">
    function initConsignPlugin() {
      $("#<%=gvList.ClientID %>").find("[id$=txtExplainSum]").live("blur", function () { total($(this)); });
      $("#<%=gvList.ClientID %>").find("[id$=txtLiquidationSum]").live("blur", function () { total($(this)); });
      $("#<%=gvList.ClientID %>").find("[id$=txtBudgetSum]").live("blur", function () { total($(this)); });

      $("[wbsID]").live("change", function () {
                $("#" + $(this).attr("id")).val($(this).val());
      });

      $("#<%=gvList.ClientID %> [id$=ddlWork]").live("change",function(){
          var type=$(this).val();
          var key=$(this).attr("key");
          var key1='<%=CurActivityName %>';
          var key2='<%=IsFlowPage %>';
          creatInfo(type,key,key1,key2);
          $(this).val("");
      })
    }
    //文本总页数
    function total(obj) {
        var explainSum = 0;
        var liquidationSum = 0;
        var budgetSum  = 0;
        var sumCount = 0;
        //说明书
        var $explainSum = $(obj).parent('td').parent('tr').find('input[content="explainSum"]');
        //清册
        var $liquidationSum = $(obj).parent('td').parent('tr').find('input[content="liquidationSum"]');
        //概预算
        var $budgetSum = $(obj).parent('td').parent('tr').find('input[content="budgetSum"]');
        //文本总页数
        var $sumCount = $(obj).parent('td').parent('tr').find('input[content="sumCount"]');
        
        if ($explainSum != null) {
            explainSum = $explainSum.val();
           if( explainSum == ""){
                explainSum = 0;
           }
        }
        if ($liquidationSum != null) {
            liquidationSum = $liquidationSum.val();
            if( liquidationSum == ""){
                liquidationSum = 0;
           }
        }
        if ($budgetSum != null) {
            budgetSum = $budgetSum.val();
            if( budgetSum == ""){
                budgetSum = 0;
           }
        }

        //合计
        sumCount = parseInt(explainSum) + parseInt(liquidationSum)+ parseInt(budgetSum);
        $sumCount.val(sumCount);
    }

    //添加待送出版的卷册
    function selRoll() {
        var param = new InputParamObject("m");
        var josn = { "OrganizationID": $("#<%=hiOrganizationId.ClientID %>").val()};
        if("<%=IsFlowPage %>"=="True"){
            josn = { "OrganizationID": $("#<%=hiOrganizationId.ClientID %>").val(),"WBSFormTypeSelect":"出版公司正式图纸资料及投标书出版" };
        }
        getWBS("<%=hiWBSInfo.ClientID %>", param, josn, getWBSCallBack);
        return false;
    } 

    function getWBSCallBack(re) {
        <%=Page.ClientScript.GetPostBackEventReference(this.btnSelectRoll,"") %>
    }

    //添加工种安排
    function creatInfo(type,detailID,curActivityName,isFlow) {
        var actionType = 2;
        var url = buildQueryUrl("EPMS/List/Publish/PublishWorkEditor.aspx", { "actionType": actionType,"Type":type, "PublishConsignWBSID": detailID,"CurActivityName": curActivityName,"IsFlowPage":isFlow});
        if(type!=null && type!=""){
            showDivDialog(url, null, 950, 550, viewWorkInfo);
        }
        return false;
    }

    //编辑工种安排弹出层callback方法
    function viewWorkInfo() {
        <%=Page.ClientScript.GetPostBackEventReference(this.btnInWork,"") %>
    }

    //查看成品设计修改
    function viewFlowInfo(processid, formid) {
        var param = { formId: formid, prcInstId: processid };
        var urlStr = buildBizUrl("1", null, "/Sys/Workflow/FormDetail.aspx", param);
        window.open(urlStr);
        return false;
    }
</script>
