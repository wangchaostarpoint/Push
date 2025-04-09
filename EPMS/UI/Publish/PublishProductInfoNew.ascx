<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PublishProductInfoNew.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Publish.PublishProductInfoNew" %>
<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<table class="tz-table" width="100%" id="Table1">
    <tr id="trleader">
        <td class="flexible" onclick="openDetail('productDetail')">产品列表&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
</table>
<table class="tz-table" id="productDetail" style="width: 100%">
    <tr runat="server" id="trInitBarCode">
        <td colspan="6">
            <div id="divCustomBar" style="float: left;" class="subtoolbarbg">
                <asp:LinkButton runat="server" ID="lbtnInitBarCode" CssClass="subtoolbarlink" EnableTheming="false"
                    ToolTip="生成条形码" OnClick="lbtnInitBarCode_Click">
                    <span>
                        <img runat="server" id="img1" src="~/Themes/Images/btn_editor.gif" alt="生成统一的条形码"
                            width="16" height="16" />生成条形码</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="lbtnInitSameBarCode" CssClass="subtoolbarlink"
                    EnableTheming="false" OnClientClick="return initSameBarCode();" ToolTip="生成统一的条形码"
                    OnClick="lbtnInitSameBarCode_Click">
                    <span>
                        <img runat="server" id="img5" src="~/Themes/Images/btn_editor.gif" alt="生成统一的条形码"
                            width="16" height="16" />生成统一的条形码</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="lbtnEditBarCode" CssClass="subtoolbarlink" EnableTheming="false"
                    ToolTip="编辑条形码" OnClientClick="return editBar()">
                    <span>
                        <img runat="server" id="img2" src="~/Themes/Images/btn_editor.gif" alt="编辑条形码"
                            width="16" height="16" />编辑条形码</span>
                </asp:LinkButton>

                <zhongsoft:LightFileUploader runat="server" ID="btnNew" EnableTheming="false" CssClass="subtoolbarlink"
                    OnClick="btnNew_Click"> 
                        <span>
                        <img  src="<%=WebAppPath%>/Themes/Images/btn_new.gif" title="上传产品"  width="16"
                                height="16" />产品上传</span></zhongsoft:LightFileUploader>

                <asp:LinkButton runat="server" ID="lbtnStartCAD" CssClass="subtoolbarlink" EnableTheming="false"
                    ToolTip="上传图纸类产品" OnClientClick="return StartCAD();" Visible="false">
                    <span>
                        <img runat="server" id="img4" src="~/Themes/Images/btn_new.gif" alt="上传图纸类产品" width="16"
                            height="16" />CAD工具上传</span>
                </asp:LinkButton>
                <%--编辑功能，根本不能用，暂且取消，TODO，后续需要完善该功能;--%>
                <asp:LinkButton runat="server" ID="lbtnEdit" CssClass="subtoolbarlink" EnableTheming="false"
                    ToolTip="编辑/修改产品基本信息" OnClientClick="return ProductEdit(3);" Visible="false">
                    <span>
                        <img runat="server" id="imgOk" src="~/Themes/Images/btn_editor.gif" alt="编辑、修改产品信息、会签、添加校审意见"
                            width="16" height="16" />编辑</span>
                </asp:LinkButton>
            </div> 
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView Width="100%" ID="gvList" runat="server" AllowPaging="true"
                ShowFooter="false" UseDefaultDataSource="true" PageSize="100" AutoGenerateColumns="false"
                DataKeyNames="ProductID" EmptyDataText="没有产品信息" BindGridViewMethod="UserControl.BindInfo"
                OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand">
                <Columns>
                    <zhongsoft:LightCheckField HeaderText="全选" ItemStyle-Width="40px">
                    </zhongsoft:LightCheckField>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%#((GridViewRow)Container).DataItemIndex + 1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="新版本" ItemStyle-Width="4%" ItemStyle-HorizontalAlign="Center" Visible="false">
                        <ItemTemplate>
                            <zhongsoft:LightFileUploader runat="server" ID="lfUpload" CssClass="subtoolbarlink"  EnableTheming="false" OnClick="lfUpload_OnClick"> <span>
                            <img id="imgFile" src="<%=WebAppPath %>/Themes/Images/btn_new.gif" alt="上传" width="16"  height="16" />上传</span></zhongsoft:LightFileUploader>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="图纸清单" ItemStyle-Width="4%" ItemStyle-HorizontalAlign="Center" Visible="false">
                        <ItemTemplate>
                            <asp:ImageButton ID="imgDrawListView" runat="server" CausesValidation="False" ImageUrl="~/Themes/Images/btn_editor.gif"></asp:ImageButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="签署页" ItemStyle-Width="4%" ItemStyle-HorizontalAlign="Center" Visible="false">
                        <ItemTemplate>
                            <asp:ImageButton ID="signPage" runat="server" CausesValidation="False" ImageUrl="~/Themes/Images/btn_dg_view.gif"  CommandName="del"></asp:ImageButton>
                            <asp:ImageButton ID="convertPage" runat="server" CausesValidation="False" ImageUrl="~/Themes/Images/btn_dg_view.gif"></asp:ImageButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="任务编号" HeaderStyle-Width="4%">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="FileFormat" HeaderText="产品类别" HeaderStyle-Width="4%">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="产品编号">
                        <ItemTemplate>
                            <div style="word-break: break-all !important; white-space: normal !important; width: 100%">
                                <%#Eval("ProductCode")%>
                            </div>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="产品名称" SortExpression="ProductName">
                        <ItemTemplate>
                            <div style="word-break: break-all !important; white-space: normal !important; width: 100%">
                                <asp:Label ID="lbProductInfo" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ProductName") %>'
                                    Style="color: Blue; text-decoration: underline; cursor: pointer"></asp:Label>
                                <asp:Label runat="server" ID="lbProductName" Text='<%# DataBinder.Eval(Container.DataItem, "ProductName") %>'></asp:Label>
                            </div>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="产品等级" HeaderStyle-Width="10%" Visible="false">
                        <ItemTemplate>
                            <div style="word-break: break-all !important; white-space: normal !important; width: 100%">
                                <%#Eval("ProductType")%>
                            </div>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="图幅" HeaderStyle-Width="4%" Visible="false">
                        <ItemTemplate>
                            <div style="word-break: break-all !important; white-space: normal !important; width: 100%">
                                <%#Eval("Mapsize")%>
                            </div>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="是否活用" HeaderStyle-Width="4%" Visible="false">
                        <ItemTemplate>
                            <%#Convert.ToString( Eval("IsReuse"))=="1"?"是":"否"%>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="CreateDate" HeaderText="上传日期" DataFormatString="{0:yyyy-MM-dd}"
                        HeaderStyle-Width="8%">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="BelongSpecialtyName" HeaderText="专业" HeaderStyle-Width="4%">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="设计人" HeaderStyle-Width="10%">
                        <ItemTemplate>
                            <asp:Label ID="lbDesigners" runat="server"></asp:Label>
                            <zhongsoft:LightObjectSelector runat="server" ID="lboDesignerName" Visible="false" IsMutiple="false"
                                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                                EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode" ResultForControls="{'hidDesignerID':'id','hidDesignerCode':'UserCode'}"
                                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" req="1"></zhongsoft:LightObjectSelector>
                            <input id="hidDesignerID" type="hidden" runat="server" />
                            <input id="hidDesignerCode" type="hidden" runat="server" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="长" HeaderStyle-Width="3%" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="lbLength" runat="server"></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="宽" HeaderStyle-Width="3%" Visible="false">
                        <ItemTemplate>
                            <asp:Label ID="lbWidth" runat="server"></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="StandardPage" HeaderText="标准张" ItemStyle-HorizontalAlign="right"
                        HeaderStyle-Width="4%" Visible="false">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="BarCode" HeaderText="条形码" ItemStyle-HorizontalAlign="right"
                        HeaderStyle-Width="10%" Visible="false">
                    </zhongsoft:LightBoundField>
                    <asp:TemplateField HeaderText="删除" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center" Visible="false">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" ToolTip="删除" CommandName="del"
                                CommandArgument='<%# Eval("ProductID") %>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="<%=this.WebAppPath %>/Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<div id="divDownLoad" style="display: none;">
    <table class="tz-table" width="100%">
        <tr>
            <td class="td-l">请填写条形码:
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtBar" EnableTheming="false"
                    class="kpms-textbox" />
            </td>
        </tr>
    </table>
</div>
<asp:Button ID="btnSaveBar" runat="server" Text="Button" Style="display: none" OnClick="btnSaveBar_Click" />
<input type="hidden" id="hiStrCode" runat="server" />
<div id="divSignInfo" style="display: none" title="获取签名">
    <table class="tz-table" width="100%">
        <tr>
            <td class="td-l">请输入签署页每行显示的签名个数:
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" value="5" ID="txtNum" EnableTheming="false"
                    class="kpms-textbox" />
                <asp:HiddenField ID="hidID" runat="server" />
            </td>
        </tr>
    </table>
</div>
<asp:Button ID="btnProductRefresh" runat="server" content="Refresh" Style="display: none"
    OnClick="btnNew_Click" />
<script type="text/javascript">
    $gridCheckedProduct = "<%=this.gvList.CheckedClientID %>";
    //加载div默认事件
    function initEvent(div, productId) {
        $("#" + div + ":ui-dialog").dialog("destroy");
        $("#" + div).dialog({
            resizable: false,
            autoOpen: false,
            minHeight: 150,
            minWidth: 300,
            modal: true,
            buttons: {
                "确定": function () {
                    var num = $("#<%=txtNum.ClientID %>").val();
                    window.open('/portal/EPMS/List/Publish/GetSignatureInfo.aspx?ProductId=' + productId + '&Num=' + num);

                    $(this).dialog("close");
                },
                "取消": function () {
                    $(this).dialog("close");
                }
            }
        });
    }

    //弹出对应层
    function showSetInfo(div, productId) {
        initEvent(div, productId);
        $("#" + div).dialog('open');
        $("#" + div).parent().appendTo("#<%=this.Page.Form.ClientID%>");
        return false;
    }

    //弹出对应层
    function showCovertInfo(productId) {
        window.open('/portal/EPMS/List/Publish/PulishCoverPrint.aspx?ProductId=' + productId);
        return false;
    }

    ///下载成品
    function downloadProduct(productId) {
        var urlStr = "Sys/Handler/FileDownloadHandler.ashx?fileType=sign&fileId=" + productId;
        window.open(urlStr);
        //showDivDialog(urlStr, null, 750, 550);
        return false;
    }

    //判断是否勾选了信息
    function initSameBarCode() {
        var updateNum = getCheckNum();
        if (updateNum < 1) {
            alert("请勾选产品信息");
            return false;
        }
        return true;
    }

    //获取选中的任务数量
    function getCheckNum() {
        var checkedValue = $("#" + $gridCheckedProduct).val().length;
        var updateNum = 0;
        if (checkedValue > 1) {
            checkedValue = $("#" + $gridCheckedProduct).val().substring(1, checkedValue - 1);
            if (checkedValue != "")
                updateNum = checkedValue.split(",").length;
        }
        return updateNum;
    }
    function editBar() {
        var updateNum = getCheckNum();
        if (updateNum < 1) {
            alert("请勾选产品信息");
            return false;
        }
        if (updateNum > 1) {
            alert("请勾选一个产品信息进行编辑");
            return false;
        }
        initBar();
        var checkedValue = $("#" + $gridCheckedProduct).val().length;
        updateNum = $("#" + $gridCheckedProduct).val().substring(2, checkedValue - 2);
        var arr = $("#<%=hiStrCode.ClientID%>").val().split(';');
        for (var i = 0; i < arr.length; i++) {
            if (arr[i].indexOf(updateNum) > -1) {
                $("#<%=txtBar.ClientID%>").val(arr[i].split(',')[1]);
            }
        }
        $("#<%=hidID.ClientID%>").val(updateNum);
        $("#divDownLoad").dialog('open');
        $("#divDownLoad").parent().appendTo("#<%=this.Page.Form.ClientID%>");
        return false;
    }
    function initBar() {
        var width = 200;
        var height = 200;
        $("#divDownLoad :ui-dialog").dialog("destroy");
        $("#divDownLoad").dialog({
            title: "修改条形码",
            resizable: true,
            autoOpen: false,
            minHeight: height,
            minWidth: width,
            modal: true,
            buttons: {
                "确定": function () {
                    <%=Page.ClientScript.GetPostBackEventReference(this.btnSaveBar,"")%>;
                    $(this).dialog("close");
                }
            }
        });
    }

    //上传成品20180706 by hehs Add
    function productUpload() {
        var wbsId = '<%=SinglePublishWBSID %>';
        if (wbsId == "") {
            alert("请先保存流程！");
            return false;
        }
        return true;
    }

    //查看、编辑成品20180706 by hehs Add
    function ProductEdit(actionType) {
        var action = actionType;
        if (action == "") {
            action = 1;
        }
        var wbsId = '<%=SinglePublishWBSID %>';
        var json = { actionType: actionType, bizId: wbsId, wbsId: wbsId, action: action, isOnlyShowMainWBS: "True" };
        // var url = buildQueryUrl('EPMS/List/Product/ProductEditor.aspx', json);
        var url = buildQueryUrl('EPMS/List/Product/ProductDetailEditor.aspx', json);
        showDivDialog(url, null, 1000, 600, afterOpenProduct);
        return false;
    }

    function afterOpenProduct() {
        <%=this.Page.ClientScript.GetPostBackEventReference(this.btnProductRefresh, "")%>;
    }

    //启动协同校审20180706 by hehs Add
    function StartCAD() {
        var orgId = '<%=PublishProjectID %>';
        if (orgId == "") {
            alert("-请先选择项目");
        }
        else {
            var url = "/Portal/EPMS/List/Product/ProductCADStart.aspx?OrganizationId=" + orgId;
            window.open(url);
        }
    }

    //查看、编辑成品
    function productListDetail(bizId) {
        var json = { actionType: '<%=Enum.Parse(typeof(AccessLevel),ActionType.ToString()).GetHashCode()%>', ProductID: bizId };
        var url = buildQueryUrl('EPMS/List/Product/DrawingList.aspx', json);
        showDivDialog(url, null, 1050, 550, null);
        return false;
    }
</script>
