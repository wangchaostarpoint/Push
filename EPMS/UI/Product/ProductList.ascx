<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductList.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Product.ProductList" %>
<div id="divBars" style="width: 100%;">
    <table class="tz-table">
        <tr id="trleader">
            <td class="flexible" onclick="openDetail('productListDetail')">成品清单&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
            </td>
            <td nowrap="nowrap">
                <div id="divSystemBar" class="subtoolbarbg" runat="server" style="float: left; padding-left: 0; padding-right: 0;">
                    <asp:LinkButton runat="server" ID="lbtnAllNum" CssClass="subtoolbarlink" EnableTheming="false"
                        OnClick="lbtnAllNum_Click">
                        <span>全部(<asp:Label ID="lbAllNum" runat="server"></asp:Label>)</span>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnNewNum" CssClass="subtoolbarlink" EnableTheming="false"
                        OnClick="lbtnNewNum_Click">
                        <span>新制(<asp:Label ID="lbNew" runat="server"></asp:Label>)</span>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnReuseNum" CssClass="subtoolbarlink" EnableTheming="false"
                        OnClick="lbtnReuseNum_Click">
                        <span>套用(<asp:Label ID="lbReuseNum" runat="server"></asp:Label>)</span>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnSignNum" CssClass="subtoolbarlink" EnableTheming="false"
                        OnClick="lbtnSignNum_Click">
                        <span>会签(<asp:Label ID="lbSignNum" runat="server"></asp:Label>)</span>
                    </asp:LinkButton>
                </div>
                <div id="divCustomBar" style="float: left; padding-left: 0; padding-right: 0;" class="subtoolbarbg">
                    <zhongsoft:LightFileUploader runat="server" ID="btnNew" EnableTheming="false" CssClass="subtoolbarlink"
                        OnClick="btnNew_Click" BeforeUpload="productUpload">
                        <span>
                <img  src="<%=WebAppPath%>/Themes/Images/btn_new.gif" title="上传文本类成品"  width="16"
                                height="16" />文本上传</span></zhongsoft:LightFileUploader>
                    <asp:LinkButton runat="server" ID="lbtnStartCAD" CssClass="subtoolbarlink" EnableTheming="false"
                        ToolTip="上传图纸类成品" OnClientClick="return StartCAD();">
                        <span>
                            <img runat="server" id="img4" src="~/Themes/Images/btn_new.gif" alt="选择/添加套用成品" width="16"
                                height="16" />图纸上传</span>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnCreateSignFile" CssClass="subtoolbarlink" EnableTheming="false"
                        ToolTip="生成签署页" OnClick="lbtnCreateSignFile_OnClick">
                        <span>
                            <img runat="server" id="img6" src="~/Themes/Images/btn_new.gif" alt="生成签署页" width="16"
                                height="16" />生成签署页</span>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnReuse" CssClass="subtoolbarlink" EnableTheming="false"
                        ToolTip="选择/添加套用成品" OnClientClick="return ProductReuseEdit(3);">
                        <span>
                            <img runat="server" id="img2" src="~/Themes/Images/btn_add.gif" alt="选择/添加套用成品" width="16"
                                height="16" />套用</span>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnEdit" CssClass="subtoolbarlink" EnableTheming="false"
                        ToolTip="编辑/修改成品基本信息" OnClientClick="return ProductEdit(3);">
                        <span>
                            <img runat="server" id="imgOk" src="~/Themes/Images/btn_editor.gif" alt="编辑、修改成品信息、会签、添加校审意见"
                                width="16" height="16" />编辑</span>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnSign" CssClass="subtoolbarlink" EnableTheming="false"
                        ToolTip="编辑/修改会签信息" OnClientClick="return ProductEdit(5);">
                        <span>
                            <img runat="server" id="img5" src="~/Themes/Images/btn_examine.gif" alt="编辑、修改成品信息、会签、添加校审意见"
                                width="16" height="16" />会签</span>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnAddOppion" CssClass="subtoolbarlink" EnableTheming="false"
                        ToolTip="添加校审意见" OnClientClick="return ProductEdit(4);" Visible="false">
                        <span>
                            <img runat="server" id="img1" src="~/Themes/Images/btn_editor.gif" alt="编辑、修改成品信息、会签、添加校审意见"
                                width="16" height="16" />添加意见</span>
                    </asp:LinkButton>
                    <%-- <asp:LinkButton runat="server" ID="lbtnView" CssClass="subtoolbarlink" EnableTheming="false"
                        OnClientClick="return ProductEdit(1);" ToolTip="查看成品信息">
                        <span>
                            <img runat="server" id="imgCancel" src="~/Themes/Images/btn_chakan.gif" alt="查看成品信息"
                                width="16" height="16" />查看</span>
                    </asp:LinkButton>--%>
                    <asp:LinkButton runat="server" ID="lbtnDownLoad" CssClass="subtoolbarlink" EnableTheming="false"
                        ToolTip="下载成品" OnClientClick="return zipDownloadFile();">
                        <span>
                            <img runat="server" id="img3" src="~/Themes/Images/ico_fujian.gif" alt="下载成品" width="16"
                                height="16" />下载</span>
                    </asp:LinkButton>
                </div>
                <div id="divGenerateQRCode" style="float: left; padding-left: 0; padding-right: 0;" class="subtoolbarbg">
                    <asp:LinkButton runat="server" ID="lbtnGenerateQRCodeOfWBS" CssClass="subtoolbarlink" EnableTheming="false"
                        ToolTip="生成并下载二维码" OnClientClick="return  downloadQRCodeOfwbs();">
                        <span>
                            <img runat="server" id="img7" src="~/Themes/Images/qrCode.png" alt="生成并下载二维码" width="16"
                                height="16" />生成二维码</span>
                    </asp:LinkButton>
                </div>
            </td>
            <td align="right" style="display: none;">
                <asp:DropDownList ID="ddlWBS" runat="server" Width="150px" AutoPostBack="true" OnSelectedIndexChanged="ddlWBS_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <table width="100%" id="productListDetail">
                    <tr>
                        <td>
                            <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvProductList" AllowPaging="false"
                                PageSize="500" ShowExport="true" AutoGenerateColumns="false" AllowSorting="true"
                                DataKeyNames="ProductID" UseDefaultDataSource="true" BindGridViewMethod="BindGrid"
                                EmptyDataText="没有成品信息" OnRowDataBound="gvProductList_RowDataBound" OnRowCommand="gvProductList_RowCommand">
                                <Columns>
                                    <zhongsoft:LightTemplateField ItemStyle-Width="30px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="成品编号" ItemStyle-Width="150px">
                                        <ItemTemplate>
                                            <div style="word-break: break-all !important; white-space: normal !important; width: 100%">
                                                <%#Eval("ProductCode")%>
                                            </div>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="成品名称" ItemStyle-Width="150px">
                                        <ItemTemplate>
                                            <div style="word-break: break-all !important; white-space: normal !important; width: 100%">
                                                <a runat="server" id="aProductName" class="aStyle">
                                                    <%#Eval("ProductName")%></a>
                                                <asp:Label runat="server" ID="lbProductName" Text='<%#Eval("ProductName")%>'></asp:Label>
                                            </div>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <%--<zhongsoft:LightBoundField DataField="ProductName" HeaderText="成品名称" MaxLength="30"
                                        ItemStyle-Width="150px" />--%>
                                    <zhongsoft:LightBoundField DataField="ProductType" HeaderText="成品类别" SortExpression="ProductType"
                                        ItemStyle-Width="50px" Visible="false" />
                                    <zhongsoft:LightBoundField DataField="PressurePipeLevel" HeaderText="压力管道级别" SortExpression="PressurePipeLevel"
                                        ItemStyle-Width="50px" Visible="false" />
                                    <%--<zhongsoft:LightBoundField DataField="FileFormat" HeaderText="格式" SortExpression="FileFormat"
                                        ItemStyle-Width="30px" />--%>
                                    <zhongsoft:LightTemplateField HeaderText="格式" ItemStyle-Width="30px">
                                        <ItemTemplate>
                                            <%# Eval("FileFormat")%>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="图幅" ItemStyle-Width="30px">
                                        <ItemTemplate>
                                            <%# Eval("Mapsize")%>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <%--<zhongsoft:LightBoundField DataField="Mapsize" HeaderText="图幅" ItemStyle-Width="30px" />--%>
                                    <zhongsoft:LightTemplateField HeaderText="设计人" ItemStyle-Width="30px">
                                        <ItemTemplate>
                                            <asp:Label ID="lbDesigners" runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="会签" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lbSignInfo" runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="套用" ItemStyle-Width="30px">
                                        <ItemTemplate>
                                            <%#Convert.ToString( Eval("IsReuse"))=="1"?"是":"否"%>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="会签" ItemStyle-Width="30px">
                                        <ItemTemplate>
                                            <%#Convert.ToString( Eval("IsJointlySign")) == "1" ? "是" : "否"%>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="版本" ItemStyle-HorizontalAlign="Center"
                                        ItemStyle-Width="35px" Visible="false">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="ibtnViewVersion" EnableTheming="false">
                                                <img alt="" style="cursor: pointer"  src="<%=WebAppPath%>/Themes/Images/btn_dg_view.gif"
                                                onclick="return viewVersions('<%#Eval("ProductID")%>');" />
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="查看" ItemStyle-HorizontalAlign="Center"
                                        ItemStyle-Width="35px">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="btnProductView" EnableTheming="false">
                                              <img alt="" style="cursor: pointer"  src="<%=WebAppPath%>/Themes/Images/btn_dg_view.gif"
                                                onclick="return showProductDetail('1','<%#Eval("ProductID")%>');" />
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="预览" ItemStyle-HorizontalAlign="Center"
                                        HeaderStyle-Width="35px" Visible="false">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="lbtnViewFile" EnableTheming="false" Text="预览"
                                                OnClientClick='<%# String.Format("return ViewFile(\"{0}\",\"{1}\",\"Product\")",Eval("ProductID"),Eval("ProductCode")) %>'></asp:LinkButton>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="签署页" ItemStyle-HorizontalAlign="Center"
                                        ItemStyle-Width="35px">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="ibtnSignPage" EnableTheming="false" Visible="false">
                                                <img alt="" style="cursor: pointer"  src="<%=WebAppPath%>/Themes/Images/btn_dg_view.gif"
                                                onclick="return viewSignPage('<%#Eval("ProductID")%>');" />
                                            </asp:LinkButton>
                                            <div style="word-break: break-all !important; white-space: normal !important; width: 100%">
                                                <a runat="server" id="aSignFile" class="aStyle"></a>
                                            </div>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="二维码" ItemStyle-HorizontalAlign="Center"
                                        ItemStyle-Width="35px" Visible="False">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="ibtnViewQRCode" EnableTheming="false">
                                                <img alt="" style="cursor: pointer"  src="<%=WebAppPath%>/Themes/Images/qrCode.png"
                                                     onclick="return downloadQRCodeOfProduct('<%#Eval("ProductID")%>');" />
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <asp:TemplateField HeaderText="删除" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center"
                                        Visible="false">
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
            </td>
        </tr>
        <tr flag="sign">
            <td class="flexible" onclick="openDetail('signProduct')" colspan="3">会签成品&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
            </td>
        </tr>
        <tr flag="sign">
            <td colspan="3">
                <table width="100%" id="signProduct">
                    <tr>
                        <td>
                            <zhongsoft:LightPowerGridView ID="gvSignList" runat="server" AllowSorting="true"
                                AutoGenerateColumns="false" BindGridViewMethod="BindSignGrid" DataKeyNames="ProductID"
                                EmptyDataText="没有会签信息" PageSize="20" UseDefaultDataSource="true" Width="100%"
                                AllowPaging="false" OnRowDataBound="gvSignList_RowDataBound">
                                <Columns>
                                    <zhongsoft:LightTemplateField ItemStyle-Width="20px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="成品编号" ItemStyle-Width="80px">
                                        <ItemTemplate>
                                            <div style="word-break: break-all !important; white-space: normal !important; width: 100%">
                                                <%#Eval("ProductCode")%>
                                            </div>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightBoundField DataField="ProductName" HeaderText="成品名称" MaxLength="30"
                                        ItemStyle-Width="120px" />
                                    <zhongsoft:LightTemplateField HeaderText="会签专业" ItemStyle-Width="150px">
                                        <ItemTemplate>
                                            <div style="word-break: break-all !important; white-space: normal !important; width: 100%">
                                                <asp:Label ID="lbSignSpe" runat="server" Width="95%"></asp:Label>
                                            </div>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="会签人员" ItemStyle-Width="200px">
                                        <ItemTemplate>
                                            <div style="word-break: break-all !important; white-space: normal !important; width: 100%">
                                                <asp:Label ID="lbSigner" runat="server" Width="95%"></asp:Label>
                                            </div>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <%--<zhongsoft:LightTemplateField HeaderText="会签信息" ItemStyle-Width="300px">
                                        <ItemTemplate>
                                            <asp:Label ID="lbSignInfo" runat="server" Width="85%"></asp:Label>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>--%>
                                </Columns>
                            </zhongsoft:LightPowerGridView>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>
<asp:Button ID="btnProductRefresh" runat="server" content="Refresh" Style="display: none"
    OnClick="btnProductRefresh_Click" />
<asp:Button ID="btnDelTempFolder" runat="server" Style="display: none;" OnClick="btnDelTempFolder_Click" />
<input runat="server" type="hidden" id="hiTempFolderPath" />
<input type="hidden" runat="server" id="hiSignNum" value="0" />
<input runat="server" id="hiPressureName" type="hidden" value='压力管道' />
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

    function initProductList() {
        var signNum = $('#<%=hiSignNum.ClientID %>').val();
        //没有会签成品的时候，隐藏会签成品列表
        if (signNum == '0') {
            $('[flag="sign"]').hide();
        }
    }

    //查看、编辑套用成品
    function ProductReuseEdit(action) {
        var wbsId = $('select#<%=ddlWBS.ClientID %> option:selected').val();
        var bizId = '<%=BizId %>';
        if (wbsId == "") {
            alert("请先选择卷册！");
            return false;
        }
        else {
            var json = { actionType: action, bizId: '<%=BizId %>', wbsId: wbsId, action: action };
            var url = buildQueryUrl('EPMS/List/Product/ProductReuseEditor.aspx', json);
            showDivDialog(url, null, 1000, 600, afterOpenProduct);
            return false;
        }
    }

    //查看、编辑成品
    function ProductEdit(actionType) {
        var action = actionType;
        if (action == "") {
            action = 1;
        }
        var wbsId = $('select#<%=ddlWBS.ClientID %> option:selected').val();
        if (wbsId == "") {
            alert("请先选择卷册！");
            return false;
        }
        var json = { actionType: actionType, bizId: '<%=BizId %>', wbsId: wbsId, action: action, formID:'<%=FormID %>' };
        // var url = buildQueryUrl('EPMS/List/Product/ProductEditor.aspx', json);
        var url = buildQueryUrl('EPMS/List/Product/ProductDetailEditor.aspx', json);
        if (action == "5") {
            showDivDialog(url, null, 850, 600, afterOpenProduct);
        }
        else {
            if (action == "3") {
                //成品编辑增加关闭提示
                url = buildQueryUrl(url, { closeHide: 1 });
            }
            showDivDialog(url, null, 1000, 600, afterOpenProduct);
        }

        return false;
    }

    //    function ProductAddEdit(actionType) {
    //        var action = '<%=Action %>';
    //        if (!(action == 2 || action == 3)) {
    //            action = 1;
    //        }
    //        var wbsId = $('select#<%=ddlWBS.ClientID %> option:selected').val();
    //        var json = { actionType: actionType, bizId: '<%=BizId %>', wbsId: wbsId, action: action };
    //        var url = buildQueryUrl('EPMS/List/Product/ProductOppinionDetailEditor.aspx', json);
    //        showDivDialog(url, null, 1050, 600, afterOpenProduct);
    //        return false;
    //    }
    function afterOpenProduct() {
        $("#<%=btnProductRefresh.ClientID %>").click();
    }
    //上传成品
    function productUpload() {
        var wbsId = $('select#<%=ddlWBS.ClientID %> option:selected').val();
        if (wbsId == "") {
            alert("请先选择卷册！");
            return false;
        }
        return true;
    }
    ///批量下载成品（注意不要多个方法重名，导致调用方法异常）
    function batchDownloadProduct() {
        var wbsIds = '<%=WBSIds %>';
        var urlStr = "Sys/FileDocument/BatchFileDownload.aspx?docType=sign&wbsIds=" + wbsIds;
        showDivDialog(urlStr, null, 750, 550, afterDownloadProduct);
        return false;
    }

    ///单个下载成品
    function downloadProductFile(productId) {
        //校审也下载带签字成品
        var urlStr = "Sys/Handler/FileDownloadHandler.ashx?fileType=sign&fileId=" + productId;
        window.open(urlStr);
        //showDivDialog(urlStr, null, 750, 550);
        return false;
    }

    //生成并下载卷册二维码
    function downloadQRCodeOfwbs() {
        var formid = '<%=BizId%>';
        var wbsID = '<%=WBSID%>';
        var urlStr = "Sys/Handler/FileDownloadHandler.ashx?QRType=2&fileType=QRCodeOfWBS&VerifyFormID=" + formid + "&wbsID=" + wbsID;
        window.open(urlStr);
        //showDivDialog(urlStr, null, 750, 550);
        return false;
    }

    //生成并下载成品二维码
    function downloadQRCodeOfProduct(productId) {
        var formid = '<%=BizId%>';
        var wbsID = '<%=WBSID%>';
        var urlStr = "Sys/Handler/FileDownloadHandler.ashx?QRType=2&fileType=QRCodeOfProduct&fileId=" + productId + "&VerifyFormID=" + formid + "&wbsID=" + wbsID;
        window.open(urlStr);
        //showDivDialog(urlStr, null, 750, 550);
        return false;
    }

    ///单个下载成品签署文件
    function downloadProductSignFile(productId) {
        //校审也下载带签字成品
        var urlStr = "Sys/Handler/FileDownloadHandler.ashx?fileType=signPage&fileId=" + productId;
        window.open(urlStr);
        //showDivDialog(urlStr, null, 750, 550);
        return false;
    }

    //删除临时文件
    function afterDownloadProduct(re) {
        $("#<%=hiTempFolderPath.ClientID %>").val(re);
        $("#<%=btnDelTempFolder.ClientID %>").click();
    }

    //启动协同校审
    function StartCAD() {
        var orgId = '<%=OrgId %>';
        if (orgId == "") {
            alert("-请先选择项目");
        }
        else {
            var url = "/Portal/EPMS/List/Product/ProductCADStart.aspx?OrganizationId=" + orgId;
            window.open(url);
        }
    }
    function showProductDetail(actionType, bizId) {
        var json = { actionType: actionType, bizId: bizId };
        var url = buildQueryUrl('EPMS/List/Product/ProductDetailView.aspx', json);
        showDivDialog(url, null, 1000, 600, null);
        return false;
    }

    function viewItem(productId) {
        return showProductDetail('1', productId);
    }
    //查看版本
    function viewVersions(productId) {
        var json = { ProductId: productId };
        var url = buildQueryUrl('EPMS/List/Product/ProductVersionList.aspx', json);
        showDivDialog(url, null, 1000, 600, null);
        return false;
    }

    //签署页
    function viewSignPage(productId) {
        var json = { ProductId: productId };
        var url = buildQueryUrl('EPMS/List/Product/SignPage.aspx', json);
        window.open(url);
        return false;
    }
    //在线预览
    function ViewFile(FileId, FileName, FileType) {
        var fileId = FileId;
        var fileName = FileName;
        var url = "/Portal/Sys/FileView/FileViewOnline.aspx?FileID=" + fileId + "&fileName=" + fileName + "&fileType=" + FileType;
        window.open(url);
    }
    // 打包下载
    function zipDownloadFile() {
        var wbsIds = '<%=WBSIds %>';
        var bizId ='<%=BizId%>'
        var urlStr = "<%= WebAppPath %>/Sys/FileDocument/ZipFileDownLoad.aspx?WBSID=" + wbsIds + "&fileTitle=成品" + "&bizId=" + bizId;
        window.open(urlStr);
    }
</script>
