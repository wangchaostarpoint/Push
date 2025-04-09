<%@ Page Title="收费合同信息台帐" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="ContractListNew.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.MCM.ContractListNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton ID="lbtnNew" runat="server" EnableTheming="false" CssClass="subtoolbarlink" Visible="false"
            OnClientClick="return false;">
            <span>
                <img runat="server" id="img1" src="~/Themes/Images/btn_new.gif" alt="新建合同" height="16" />新建合同</span>
        </asp:LinkButton>
        <asp:LinkButton runat="server" ID="btnStartWF" EnableTheming="false" CssClass="subtoolbarlink"
            OnClientClick="return startWF()" ToolTip="点击发起新的合同评审单">
            <img src="../../../Themes/Images/btn_new.gif"/><span>合同评审单</span></asp:LinkButton>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">业务版块</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlBusinessPlat" CssClass="kpms-ddlsearch" EnableTheming="False" />
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">合同编号/名称</span><span>
        <zhongsoft:LightTextBox runat="server" ID="tbContract" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">合同状态</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlContractState" />
    </span></span>
    <span class="filter-block" style="display: none"><span class="filter-block-lb">会签状态</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlSignState" />
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">签约状态</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlContractStatus" />
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">签约日期</span> <span>
        <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtStartTime"
            runat="server" readonly="readonly" compare="1" />
        <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtEndTime"
            runat="server" readonly="readonly" compare="1" />
    </span></span>
    <span class="filter-block" style="display: none"><span class="filter-block-lb"></span><span>
        <asp:CheckBox runat="server" ID="ckbThisMonth" Text="本月新签" TextAlign="Left" />
    </span></span>
    
    <span class="filter-block" >
        <span class="filter-block-lb">全字段查询</span><span>
            <span>
                <zhongsoft:LightDropDownList runat="server" ID="ddlColumn" CssClass="kpms-ddlsearch" EnableTheming="False" />
                <zhongsoft:LightDropDownList runat="server" ID="ddlCondition" CssClass="kpms-ddlsearch" EnableTheming="False" onchange="conditionChange();" />
                <zhongsoft:LightTextBox runat="server" ID="tbCondition" CssClass="kpms-textboxsearch" EnableTheming="False" />
            </span>
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView runat="server" ID="gvList" UseDefaultDataSource="True" AllowPaging="True" PageSize="15"
        ShowExport="True" ShowFooter="true" BindGridViewMethod="BindData" AllowSorting="true"
        OnRowDataBound="gvList_OnRowDataBound" OnRowCommand="gvList_RowCommand" HideFieldOnExport="查看,编辑,查看收费节点,编辑收费节点,合同评审,合同变更,合同状态管理">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%#Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="查看" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnViewForm" runat="server" EnableTheming="false" OnClientClick="return false">
                                    <img alt="img" src="../../../Themes/Images/btn_dg_view.gif"  title="查看合同信息"
                                    onclick="viewItem('1','<%# Eval("ContractID") %>');"/>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="编辑" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnEdit" runat="server" EnableTheming="false" OnClientClick="return false">
                                    <img alt="img" src="../../../Themes/Images/btn_dg_edit.gif"  title="编辑"
                                    onclick="viewItem('3','<%# Eval("ContractID") %>');"/>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del" Visible="false"
                        CommandArgument='<%# Eval("ContractID") %>' OnClientClick="return confirm('您确定删除吗？');">
                                <span><img src="../../../Themes/Images/btn_dg_delete.gif" alt="删除"  title="删除"/></span>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="查看收费节点" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnViewCharge" runat="server" EnableTheming="false" OnClientClick="return false">
                        <img alt="img" src="../../../Themes/Images/btn_dg_view.gif"  title="查看收费节点"
                             onclick="viewChargePoint('1','<%# Eval("ContractID") %>');"/>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="编辑收费节点" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false" OnClientClick="return false">
                        <img alt="img" src="../../../Themes/Images/btn_dg_edit.gif"  title="编辑收费节点"
                             onclick="viewChargePoint('3','<%# Eval("ContractID") %>');"/>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="合同评审" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center" Visible="false">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnStartCheckWF" EnableTheming="False" OnClientClick="return false" ToolTip="发起合同评审">
                        <img alt="img" src="../../../Themes/Images/btn_submit.gif" onclick="return startCheckWF('<%# Eval("ContractID") %>','<%# Eval("IsContractChecking") %>','<%# Eval("IsContractChecked") %>');"/>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="合同变更" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnStartChangeWF" EnableTheming="False" OnClientClick="return false" ToolTip="发起合同变更">
                        <img alt="img" src="../../../Themes/Images/btn_submit.gif" onclick="return startChangeWF('<%# Eval("ContractID") %>');"/>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="合同状态管理" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnStartStateWF" EnableTheming="False" OnClientClick="return false" ToolTip="发起合同状态管理">
                        <img alt="img" src="../../../Themes/Images/btn_submit.gif" onclick="return startStateWF('<%# Eval("ContractID") %>');"/>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="是否绑定" SortExpression="IsBind" />
            <zhongsoft:LightBoundField HeaderText="业务版块" DataField="BusinessPlate" SortExpression="BusinessPlate" />
            <zhongsoft:LightBoundField HeaderText="记录编号" DataField="RecordNoNew" SortExpression="RecordNoNew" />
            <zhongsoft:LightBoundField HeaderText="合同编号" DataField="ContractCode" SortExpression="ContractCode" />
            <zhongsoft:LightTemplateField HeaderText="收费合同名称" SortExpression="ContractName">
                <ItemTemplate>
                    <a href="javascript:void(0)" isshow="0" prc="<%#Eval("contractID") %>" onclick="showFileList(this)">
                        <%#Eval("ContractName")%></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="合同分类" DataField="ContractTypeName" SortExpression="ContractTypeName" />
            <zhongsoft:LightBoundField HeaderText="合同签订日期" DataField="SignDate" DataFormatString="{0:yyyy-MM-dd}" SortExpression="SignDate" />
            <zhongsoft:LightBoundField HeaderText="工程建设单位" DataField="CustomerName" SortExpression="CustomerName" />
            <zhongsoft:LightBoundField HeaderText="合同金额（万元）" DataField="ContractValue" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:N2}" SortExpression="ContractValue" />
            <zhongsoft:LightBoundField HeaderText="应收款（万元）" DataField="ShouldCharge" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:N2}" SortExpression="ShouldCharge" />
            <zhongsoft:LightBoundField HeaderText="已收款（万元）" DataField="HadCharge" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:N2}" SortExpression="HadCharge" />
            <zhongsoft:LightBoundField HeaderText="已收款比例（%）" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:N2}" />
            <zhongsoft:LightBoundField HeaderText="未收款（万元）" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:N2}" />
            <zhongsoft:LightBoundField HeaderText="未收款比例（%）" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:N2}" />
            <zhongsoft:LightTemplateField HeaderText="合同签约人" SortExpression="ContractorName">
                <ItemTemplate>
                    <%#(string.IsNullOrEmpty(Convert.ToString(Eval("ContractorDept")))?"":Eval("ContractorDept")+"：" )+Eval("ContractorName") %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="合同状态" DataField="ContractState" SortExpression="ContractState" />
            <zhongsoft:LightBoundField HeaderText="会签状态" DataField="SignState" Visible="False" SortExpression="SignState" />
            <zhongsoft:LightBoundField HeaderText="签约状态" DataField="ContractStatus" SortExpression="ContractStatus" />
            <zhongsoft:LightButtonField HeaderText="附件组" EditItemClick="showCustomerDetail" DataParamFields="ContractID"
                ImageUrl="../../../Themes/Images/btn_dg_upfile.gif" Visible="False">
            </zhongsoft:LightButtonField>
        </Columns>
        <FooterStyle ForeColor="Red" HorizontalAlign="Right" />
    </zhongsoft:LightPowerGridView>
    <input type="hidden" runat="server" id="hiWFName" value="合同评审" />
    <asp:Button runat="server" ID="btnBindData" OnClick="btnBindData_Click" Style="display: none" />

    <script type="text/javascript">
        function initCustomerPlugin() {
            setListWidth();

            window.onresize = function () { setListWidth(); };
            conditionChange();
        }

        function setListWidth() {
            //将GridView列表外层div宽度设置为低于当前界面的比较小的宽度,以便于上方查询条件区域完全显示
            $("#div2").width("100");
            //获取查询条件区域宽度
            var tbQuery = $("#tbQuery");
            //设置GridView最外层div的宽度和上方查询条件区域宽度一致
            $("#divContent").width(tbQuery[0].clientWidth);
            //恢复GridView区域宽度为100%显示 此时下发横向滚动条和右面竖向滚动条正常显示
            $("#div2").width("100%");
        }

        //发起合同变更流程  
        function startChangeWF(contractID) {
            var url = buildQueryUrl("/Sys/Workflow/FormDetail.aspx", {
                actionType: 2, packageName: 'MCMContractChangeNew.xpdl', xpdlId: 'MCMContractChangeNew_wp1', formId: 346, ver: '|', contractID: contractID
            });
            window.open(url);
            return false;
        }

        //发起合同状态管理流程  
        function startStateWF(contractID) {
            var url = buildQueryUrl("/Sys/Workflow/FormDetail.aspx", {
                actionType: 2, packageName: 'MCMContractStateManage.xpdl', xpdlId: 'MCMContractStateManage_wp1', formId: 95, ver: '|', contractID: contractID
            });
            window.open(url);
            return false;
        }

        //发起收费合同评审流程
        function startWF() {
            var url = buildQueryUrl("/Sys/Workflow/FormDetail.aspx", {
                actionType: 2, packageName: 'MCMContractCheck.xpdl', xpdlId: 'MCMContractCheck_wp1', formId: 72, ver: '|'
            });
            window.open(url);
            return false;
        }

        //发起合同评审流程  
        function startCheckWF(contractID, isChecking, isChecked) {
            if (isChecking != "" && parseInt(isChecking) > 0) {
                alert("当前合同正在评审，不允许重复发起");
                return false;
            }
            else if (isChecked != "" && parseInt(isChecked) > 0) {
                if (confirm("当前合同已评审，是否再次评审？")) {
                }
                else {
                    return false;
                }
            }
            var url = buildQueryUrl("/Sys/Workflow/FormDetail.aspx", {
                actionType: 2, packageName: 'MCMContractCheck.xpdl', xpdlId: 'MCMContractCheck_wp1', formId: 72, ver: '|', contractID: contractID
            });
            window.open(url);
            return false;
        }

        //查看流程
        function viewForm(bizId, extendedAttribute) {
            var url = '/Custom/List/C_FormDetailLoading.aspx';
            var json = { bizId: bizId, IsOld: 0, ExtendedAttribute: extendedAttribute };
            url = buildQueryUrl(url, json);
            window.open(url);
            return false;
        }

        //查看收费节点
        function viewChargePoint(actionType, contractID) {
            var url = '/MM/List/MCM/ContractChargePointDetail.aspx';
            var json = { actionType: actionType, contractID: contractID };
            url = buildQueryUrl(url, json);
            showDivDialog(url, null, 850, 550, null);
            return false;
        }

        //点击显示文件列表
        function showFileList(obj) {
            var $prc = $(obj).attr("prc");
            //alert($prc);
            $("#<%=gvList.ClientID %> tr[id='" + $prc + "']").toggle();
            if ($(obj).attr("isShow") == "1") return;
            $(obj).attr("isShow", "1");
            var $prcRow = $(obj).parents('tr')[0];
            $.post("ContractListNew.aspx",
                { asyfunc: "ShowFileList", contractID: $prc },
                function (res) {
                    var $item = $("<tr id='" + $prc + "'><td></td><td colspan='18'><table cellspacing='0' rules='all' border='1' style='width:100%;border-collapse:collapse;'><tr class='kpms-detbodyheader' style='font-weight:bold;'><th scope='col' width='10%'>工程编号</th><th scope='col' width='26%'>工程名称</th><th scope='col' align='center' width='8%'>合同金额（万元）</th><th scope='col' align='center' width='8%'>已收款（万元）</th><th scope='col' width='8%'>已收款比例（%）</th><th scope='col' width='8%'>未收款（万元）</th><th scope='col' width='8%'>未收款比例（%）</th><th scope='col' align='center' width='8%'>卷册数量</th><th scope='col' align='center' width='8%'>完成数量</th><th scope='col' width='8%'>完成比例（%）</th></tr>" + res + "</table></td></tr>");
                    $($item).insertAfter($prcRow);
                    $("#<%=gvList.ClientID %> span").tooltip({ position: 'bottom center' });
                    //展开步骤详细后，改变底色 tianhl 20141103
                    $("#<%=gvList.ClientID %> tr[id='" + $prc + "']").css('background-color', '#CCFFCC');
                }
            );
        }

        $('#<%=lbtnNew.ClientID %>').bind('click', function () {
            viewItem(2, '');
        });

        function viewItem(actionType, bizId) {
            var json = { actionType: actionType, bizId: bizId };
            var url = buildQueryUrl('/MM/List/MCM/ContractEditorNew.aspx', json);
            var callBack = null;
            if (actionType == '2' || actionType == '3') {
                callBack = bindData;
            }
            showDivDialog(url, "", 1000, 600, callBack);
            return false;
        }

        //执行后台绑定列表
        function bindData() {
            $('#<%=btnBindData.ClientID %>').click();
        }

        //查看合同评审单
        function viewCheckForm(contractID) {
            var json = { contractID: contractID };
            var url = buildQueryUrl('Custom/List/DispListNew.aspx?secid=D698F306-631A-4757-8C13-898E8F0C138E', json);
            showDivDialog(encodeURI(url), "", 1000, 550, null);
            return false;
        }

        function conditionChange() {
            var checkText = $("#<%=ddlCondition.ClientID %>").find("option:selected").val();
            if (checkText.indexOf("NULL") > 0) {
                $("#<%=tbCondition.ClientID%>").val('');
                $("#<%=tbCondition.ClientID%>").attr("readonly", "readonly");
            } else {
                $("#<%=tbCondition.ClientID%>").removeAttr("readonly");
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
