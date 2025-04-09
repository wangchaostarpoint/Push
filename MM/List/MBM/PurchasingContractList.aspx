<%@ Page Title="付费合同台账" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="PurchasingContractList.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.MBM.PurchasingContractList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton ID="lbtnNew" runat="server" EnableTheming="false" CssClass="subtoolbarlink"
            OnClientClick="return false;" Visible="false">
            <span>
                <img runat="server" id="img1" src="~/Themes/Images/btn_new.gif" alt="新建合同" height="16" />新建合同</span>
        </asp:LinkButton>
        <asp:LinkButton runat="server" ID="btnStartWF" EnableTheming="false" CssClass="subtoolbarlink"
            OnClientClick="return startWF()" ToolTip="点击发起新的合同评审单">
            <img src="../../../Themes/Images/btn_new.gif"/><span>合同评审单</span></asp:LinkButton>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block" runat="server" id="spanContractType"><span class="filter-block-lb">合同类型</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlContractType" />
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
    <span class="filter-block" style="display: none"><span class="filter-block-lb"></span><span>
        <asp:CheckBox runat="server" ID="ckbThisMonth" Text="本月新签" TextAlign="Left" />
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">签约日期</span> <span>
        <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtStartTime"
            runat="server" readonly="readonly" compare="1" />
        <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtEndTime"
            runat="server" readonly="readonly" compare="1" />
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView runat="server" ID="gvList" UseDefaultDataSource="True" AllowPaging="True" PageSize="15" ShowExport="True"
        BindGridViewMethod="BindData" OnRowDataBound="gvList_OnRowDataBound" ShowFooter="True" AllowSorting="true" HideFieldOnExport="查看,编辑,合同评审,附件组,付款审批单,合同状态管理,合同变更">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%#Container.DataItemIndex+1 %>
                    <input type="hidden" id="hiContractID" runat="server" flag="contractID" value='<%#Eval("ContractID") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="查看" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false" OnClientClick="return false">
                                    <img alt="img" src="../../../Themes/Images/btn_dg_view.gif"  title="查看采购合同信息"
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
            <zhongsoft:LightTemplateField HeaderText="合同评审" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center" Visible="false">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnStartCheckWF" EnableTheming="False" OnClientClick="return false" ToolTip="发起采购合同评审">
                        <img alt="img" src="../../../Themes/Images/btn_submit.gif" onclick="return startCheckWF('<%# Eval("ContractID") %>','<%# Eval("IsContractChecking") %>','<%# Eval("IsContractChecked") %>');"/>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightButtonField HeaderText="附件组" EditItemClick="showCustomerDetail" ToolTip="附件组" DataParamFields="ContractID"
                ImageUrl="../../../Themes/Images/btn_dg_upfile.gif" Visible="False">
            </zhongsoft:LightButtonField>
            <zhongsoft:LightTemplateField HeaderText="付款审批单" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <a id="clickmenu" flag="clickmenu" contractid='<%#Eval("ContractID") %>'>发起<img src="<%=WebAppPath %>/Themes/Images/ddl.gif" /></a>
                    <div id="overlay" flag="overlay">
                    </div>
                    <div id="poplayer" flag="poplayer">
                        <div class="item-sub sl-shadow">
                            <table class="item-table">
                                <tbody>
                                    <tr>
                                        <td>
                                            <a onclick="startPayWF('<%#Eval("ContractID") %>')">付款审批单</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <a onclick="startPayESWF('<%#Eval("ContractID") %>')">设备、软件付款审批单</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <a onclick="startPayGEWF('<%#Eval("ContractID") %>')">总包工程付款审批单</a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
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
            <zhongsoft:LightBoundField HeaderText="合同编号" DataField="ContractCode" SortExpression="ContractCode" />
            <zhongsoft:LightBoundField HeaderText="合同名称" DataField="ContractName" ShowToolTip="True" Width="200px" SortExpression="ContractName" />
            <zhongsoft:LightBoundField HeaderText="费用性质" DataField="CostType" SortExpression="CostType" />
            <zhongsoft:LightBoundField HeaderText="签约状态" DataField="ContractStatus" SortExpression="ContractStatus" />
            <zhongsoft:LightBoundField HeaderText="会签状态" DataField="SignState" Visible="False" SortExpression="SignState" />
            <zhongsoft:LightBoundField HeaderText="单位名称" DataField="EntrustUnitName" SortExpression="EntrustUnitName" />
            <zhongsoft:LightBoundField HeaderText="主要联系人" DataField="ContactUserName" SortExpression="ContactUserName" />
            <zhongsoft:LightBoundField HeaderText="主要联系电话" DataField="ContactPhone" SortExpression="ContactPhone" />
            <zhongsoft:LightBoundField HeaderText="单位地址" DataField="BuildPlace" SortExpression="BuildPlace" />
            <zhongsoft:LightBoundField HeaderText="合作内容描述" DataField="ContractContent" Width="200" ShowToolTip="True" SortExpression="ContractContent" />
            <zhongsoft:LightTemplateField HeaderText="我方签约人" SortExpression="ContractorName">
                <ItemTemplate>
                    <%#(string.IsNullOrEmpty(Convert.ToString(Eval("ContractorDept")))?"":Eval("ContractorDept")+"：" )+Eval("ContractorName") %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="签约日期" DataField="SignDate" DataFormatString="{0:yyyy-MM-dd}" SortExpression="SignDate" />
            <zhongsoft:LightBoundField HeaderText="计划结束日期" DataField="PlanEndDate" DataFormatString="{0:yyyy-MM-dd}" Visible="false" SortExpression="PlanEndDate" />
            <zhongsoft:LightBoundField HeaderText="实施日期" DataField="ImplementDate" DataFormatString="{0:yyyy-MM-dd}" Visible="false" SortExpression="ImplementDate" />
            <zhongsoft:LightBoundField HeaderText="完成日期" DataField="FinishDate" DataFormatString="{0:yyyy-MM-dd}" Visible="false" SortExpression="FinishDate" />
            <zhongsoft:LightBoundField HeaderText="报表年度" Visible="False" />
            <zhongsoft:LightBoundField HeaderText="合同金额（万元）" DataField="ContractValue" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:N2}" SortExpression="ContractValue" />
            <zhongsoft:LightBoundField HeaderText="合同总金额（万元）" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:N2}" Visible="False" />
            <zhongsoft:LightBoundField HeaderText="质保金（万元）" DataField="WarrantyGold" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:N2}" SortExpression="WarrantyGold" />
            <zhongsoft:LightBoundField HeaderText="合同变更金额（万元）" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:N2}" Visible="False" />
            <zhongsoft:LightBoundField HeaderText="已付款（万元）" DataField="HadPay" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:N2}" SortExpression="HadPay" />
            <zhongsoft:LightBoundField HeaderText="已付款比例（%）" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:N2}" />
            <zhongsoft:LightBoundField HeaderText="未付款（万元）" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:N2}" />
            <zhongsoft:LightBoundField HeaderText="未付款比例（%）" ItemStyle-HorizontalAlign="Right" DataFormatString="{0:N2}" />
            <zhongsoft:LightBoundField HeaderText="申请人" DataField="ApplyUserName" SortExpression="ApplyUserName" />
            <zhongsoft:LightBoundField HeaderText="备注" DataField="Memo" ShowToolTip="True" Width="200px" SortExpression="Memo" />
        </Columns>
        <FooterStyle ForeColor="Red" HorizontalAlign="Right" />
    </zhongsoft:LightPowerGridView>
    <asp:Button runat="server" ID="btnBindData" OnClick="btnBindData_Click" Style="display: none" />

    <script type="text/javascript">

        function initCustomerPlugin() {
            initOperate();
<%--            //右键弹出菜单
            document.getElementById('<%=gvList.ClientID %>').oncontextmenu = function (ev) {
                showMenu(ev);
                if (!showInit) {
                    return false;
                }
            };
            document.onmousedown = function () { if (!over) hideMenu(); };--%>
        }

        //弹出菜单具体方法
        //用于指定是否禁止原有菜单，主要是为了当右击表头以及翻页行是禁止右键自定义菜单，展示原有右键菜单
        var showInit = null;
        var over = false;
        var menu = null;
        function showMenu(ev) {
            ev = ev || window.event;
            hideMenu();
            var e = ev.srcElement || ev.target;
            if (e.tagName == "TH") {
                showInit = true;
                return;
            }

            //表头以及翻页行右键时不是合同数据，没有合同ID，此时弹出原有右键菜单
            var parent = e.parentNode;
            //名称列由于showtooltip的原因多了一层div，导致当前父级为td
            if (e.parentNode.tagName == "TD") {
                parent = e.parentNode.parentNode;
            }
            var id = $(parent).find("[flag='contractID']").val();
            if (id == "" || id == undefined) {
                showInit = true;
                return;
            }

            var x = ev.pageX || ev.clientX + document.documentElement.scrollLeft;
            var y = ev.pageY || ev.clientY + document.documentElement.scrollTop;
            menu = document.createElement("DIV");
            menu.className = "menu";
            menu.style.left = x + 4 + "px";
            menu.style.top = y + "px";
            document.body.appendChild(menu);
            var s = "<a onclick=" + "startPayWF('" + id + "')" + ">付款审批单</a>";
            s += "<a onclick=" + "startPayESWF('" + id + "')" + ">设备、软件付款审批单</a>";
            s += "<a onclick=" + "startPayGEWF('" + id + "')" + ">总包工程付款审批单</a>";
            showInit = false;
            menu.innerHTML = s;
            menu.onmouseover = function () { over = true; };
            menu.onmouseout = function () { over = false; };
        }

        //隐藏菜单
        function hideMenu() {
            if (menu) {
                document.body.removeChild(menu);
                menu = null;
            }
        }


        //查看流程
        function viewForm(bizId, extendedAttribute) {
            var url = '/Custom/List/C_FormDetailLoading.aspx';
            var json = { bizId: bizId, IsOld: 0, ExtendedAttribute: extendedAttribute };
            url = buildQueryUrl(url, json);
            window.open(url);
            return false;
        }

        //发起合同变更流程  
        function startChangeWF(contractID) {
            var url = buildQueryUrl("/Sys/Workflow/FormDetail.aspx", {
                actionType: 2, packageName: 'MBMContractChangePurchase.xpdl', xpdlId: 'MBMContractChangePurchase_wp1', formId: 349, ver: '|', contractID: contractID
            });
            window.open(url);
            return false;
        }

        //发起合同状态管理流程  
        function startStateWF(contractID) {
            var url = buildQueryUrl("/Sys/Workflow/FormDetail.aspx", {
                actionType: 2, packageName: 'MBMContractStateManage.xpdl', xpdlId: 'MBMContractStateManage_wp1', formId: 350, ver: '|', contractID: contractID
            });
            window.open(url);
            return false;
        }

        //发起采购合同评审流程
        function startWF(contractID) {
            var contractType = '<%=ContractTypeNameID%>';
            var url = buildQueryUrl("/Sys/Workflow/FormDetail.aspx", {
                actionType: 2, packageName: 'MBMPurchaseConCheck.xpdl', xpdlId: 'MBMPurchaseConCheck_wp1', formId: 120, ver: '|', contractID: contractID, contractType: contractType
            });
            window.open(url);
            return false;
        }

        //发起付款审批单
        function startPayWF(contractID) {
            var url = buildQueryUrl("/Sys/Workflow/FormDetail.aspx", {
                actionType: 2, packageName: 'MBMContractPay.xpdl', xpdlId: 'MBMContractPay_wp1', formId: 125, ver: '|', contractID: contractID
            });
            window.open(url);
            return false;
        }

        //设备、软件付款审批单
        function startPayESWF(contractID) {
            var url = buildQueryUrl("/Sys/Workflow/FormDetail.aspx", {
                actionType: 2, packageName: 'MBMContractPayES.xpdl', xpdlId: 'MBMContractPayES_wp1', formId: 347, ver: '|', contractID: contractID
            });
            window.open(url);
            return false;
        }

        //总包工程付款审批单
        function startPayGEWF(contractID) {
            var url = buildQueryUrl("/Sys/Workflow/FormDetail.aspx", {
                actionType: 2, packageName: 'MBMContractPayGE.xpdl', xpdlId: 'MBMContractPayGE_wp1', formId: 348, ver: '|', contractID: contractID
            });
            window.open(url);
            return false;
        }

        function initOperate() {
            var i = 0;
            $('[flag="clickmenu"]').each(function () {
                var $oPop = $('[flag="poplayer"]');
                var $oLay = $('[flag="overlay"]');
                var oLay = $oLay[i];
                var oPop = $oPop[i];

                $(this).bind('click', function () {
                    oLay.style.display = "block";
                    oPop.style.display = "block"
                });

                oLay.onclick = function () {
                    oLay.style.display = "none";
                    oPop.style.display = "none"
                }

                i++;
            });
        }

        $('#<%=lbtnNew.ClientID %>').bind('click', function () {
            viewItem(2, '');
        });

        function viewItem(actionType, bizId) {
            var contractType = '<%=ContractTypeNameID%>';
            var json = { actionType: actionType, bizId: bizId, contractType: contractType };
            var url = buildQueryUrl('/MM/List/MBM/PurchaseContractEditorNew.aspx', json);
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
            var contractType = '<%=ContractTypeNameID%>';

            var url = buildQueryUrl("/Sys/Workflow/FormDetail.aspx", {
                actionType: 2, packageName: 'MBMPurchaseConCheck.xpdl', xpdlId: 'MBMPurchaseConCheck_wp1', formId: 120, ver: '|', contractID: contractID, contractType: contractType
            });
            window.open(url);
            return false;
        }
    </script>
    <style type="text/css">
        /*下拉弹出层样式开始*/
        a {
            text-decoration: none;
            color: #000;
            background: transparent;
            outline: none;
        }

            a:visited {
            }

            a:focus {
                outline: none;
            }

        #toolbarlay {
            /*width: 140px;
            height: 35px;
            line-height: 35px;*/ /*去掉注释后，legend的标题与按钮同行*/
            z-index: 3;
            /*position: fixed;
            left: 0;
            top: 0;
            right: 0;*/
        }

        #clickmenu {
            cursor: pointer;
            display: block;
            text-align: center;
            margin: 0 auto;
            /*line-height: 35px;*/ /*去掉注释后，legend的标题与按钮同行*/
            color: #000;
        }

            #clickmenu img {
                margin-bottom: 3px;
            }

        #overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: #fff;
            opacity: 0;
            filter: alpha(opacity=0);
            display: none;
            z-index: 4;
        }

        #poplayer {
            position: fixed;
            /*top: 25px;
            left: 20px;*/
            width: auto;
            margin: 0;
            display: none;
            z-index: 555;
        }

        table {
            border-collapse: collapse;
            border-spacing: 0;
        }

        th {
            text-align: inherit;
        }

        .sl-shadow {
            -moz-box-shadow: 0 0 4px #999;
            -o-box-shadow: 0 0 4px #999;
            -webkit-box-shadow: 0 0 4px #999;
            box-shadow: 0 0 4px #999;
            -ms-filter: "progid:DXImageTransform.Microsoft.Glow(color=#a0a0a0,strength=0) progid:DXImageTransform.Microsoft.Shadow(color=#a0a0a0,direction=0,strength=2) progid:DXImageTransform.Microsoft.Shadow(color=#a0a0a0,direction=90,strength=2) progid:DXImageTransform.Microsoft.Shadow(color=#a0a0a0,direction=180,strength=2) progid:DXImageTransform.Microsoft.Shadow(color=#a0a0a0,direction=270,strength=2)";
            *filter: progid:DXImageTransform.Microsoft.Shadow(color=#a0a0a0,direction=0,strength=2) progid:DXImageTransform.Microsoft.Shadow(color=#a0a0a0,direction=90,strength=2) progid:DXImageTransform.Microsoft.Shadow(color=#a0a0a0,direction=180,strength=2) progid:DXImageTransform.Microsoft.Shadow(color=#a0a0a0,direction=270,strength=2)
        }

        .item-sub {
            /*position: absolute;*/
            padding: 12px 3px;
            background: #fff;
            top: 0px;
        }

        .item-table {
            background: none repeat scroll 0 0 #fff;
            white-space: nowrap;
        }

            .item-table td, .item-table th {
                border-right: 1px solid #e7e7e7;
                padding: 3px 16px;
                white-space: nowrap
            }

            .item-table th {
                font-weight: 700;
                padding: 0 14px 3px 17px;
                border-collapse: separate;
                white-space: nowrap
            }

                .item-table th.last, .item-table td.last {
                    border-right: 0
                }

            .item-table a {
                color: #555;
                display: block;
                padding-left: 6px;
                position: relative;
                vertical-align: middle
            }

                .item-table a:hover {
                    background-color: #aaa;
                    border-radius: 2px 2px 2px 2px;
                    color: #fff;
                    text-decoration: none;
                    vertical-align: middle
                }
        /*下拉弹出层样式结束*/
        .menu {
            position: absolute;
            z-index: 101;
            width: 140px;
            border: solid 1px #999;
            padding: 2px;
            background-color: #ffffff;
        }

            .menu a {
                display: block;
                padding: 3px 6px;
                font-size: 12px;
                color: #000000;
                cursor: default;
                text-decoration: none;
            }

                .menu a:hover {
                    background-color: #507cd1;
                    color: #ffffff;
                }
    </style>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
