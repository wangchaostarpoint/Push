<%@ Page Language="C#" Title="成品资料" AutoEventWireup="true" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master"
    CodeBehind="C_ProductList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Product.C_ProductList" %>

<asp:Content ID="Content4" ContentPlaceHolderID="toolBtn" runat="server">
    <span>
        <asp:LinkButton runat="server" ID="lbtnDownLoad" CssClass="subtoolbarlink" EnableTheming="false"
            ToolTip="批量下载" OnClientClick="return batchDownload();" Visible="false">
            <span>
                <img runat="server" id="img3" src="~/Themes/Images/ico_fujian.gif" alt="批量下载" width="16"
                    height="16" />批量下载</span>
        </asp:LinkButton></span>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block" flag="proj"><span>项目名称 </span><span>
        <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
            IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
            EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
            PageWidth="850" ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode'}"
            OnClick="txtProjectName_Click" Style="width: 255px;"></zhongsoft:LightObjectSelector>
        <input type="hidden" runat="server" id="hiOrganizationID" />
    </span></span><span class="filter-block" flag="proj"><span>项目编号 </span><span>
        <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" readonly="readonly"
            class="kpms-textbox" style="width: 75px;" />
    </span></span><span class="filter-block" flag="noproj"><span class="filter-block-lb">
        项目编号/名称</span> <span>
            <asp:TextBox ID="tbProjectInfo" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
                EnableTheming="false"></asp:TextBox>
        </span></span><span class="filter-block"><span class="filter-block-lb">卷册编号/名称</span>
            <span>
                <asp:TextBox ID="tbWBSInfo" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
                    EnableTheming="false"></asp:TextBox>
            </span></span><span class="filter-block"><span class="filter-block-lb">成品编号/名称</span>
                <span>
                    <asp:TextBox ID="tbProductInfo" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
                        EnableTheming="false"></asp:TextBox>
                </span></span><span class="filter-block"><span class="filter-block-lb">专业</span><span>
                    <zhongsoft:LightDropDownList ID="ddlSpeInfo" runat="server" class="kpms-ddlsearch"
                        EnableTheming="false">
                    </zhongsoft:LightDropDownList>
                </span></span>
    <%-- <span class="filter-block"><span class="filter-block-lb">任务类型</span> <span>
                <zhongsoft:LightDropDownList ID="ddlWBSType" runat="server" class="kpms-ddlsearch"
                    EnableTheming="false">
                </zhongsoft:LightDropDownList>
            </span></span>--%>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <style>
        html
        {
            overflow-x: hidden;
        }
    </style>
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvList" AutoGenerateColumns="false"
        DataKeyNames="ProductID,ExecSpecialtyCode,ExecSpecialtyName" ShowExport="true"
        HideFieldOnExport="全部" runat="server" BindGridViewMethod="BindDataGrid" ShowPageSizeChange="true"
        OnRowCommand="gvList_RowCommand" OnRowDataBound="gvList_RowDataBound" OnSorting="gvList_Sorting"
        AllowSorting="true">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全部" PostBackClick="checkGridPostBack">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="签署页" ItemStyle-HorizontalAlign="Center"
                ItemStyle-Width="60px">
                <ItemTemplate>
                    <asp:ImageButton ID="signPage" runat="server" CausesValidation="False" ImageUrl="~/Themes/Images/btn_dg_view.gif"
                        CommandName="del"></asp:ImageButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="任务类型" DataField="WBSType" SortExpression="WBSType"
                Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="卷册编号" DataField="WBSCode" SortExpression="WBSCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="卷册名称" DataField="WBSName" SortExpression="WBSName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="专业代字" DataField="ExecSpecialtyCode" SortExpression="ExecSpecialtyCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="专业名称" DataField="ExecSpecialtyName" SortExpression="ExecSpecialtyName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="成品编号" DataField="ProductCode" SortExpression="ProductCode">
            </zhongsoft:LightBoundField>
            <%--    <zhongsoft:LightBoundField DataField="ProductName" HeaderText="成品名称" MaxLength="30"
                DataParamFields="ProductID" DialogMode="Dialog" EditItemClick="viewItem" />--%>
            <zhongsoft:LightTemplateField HeaderText="成品名称">
                <ItemTemplate>
                    <asp:LinkButton ID="lkbWbsInfo" runat="server" OnClientClick='<%# String.Format("return viewItem(\"{0}\")", Eval("ProductID")) %>'
                        EnableTheming="false" ForeColor="Blue"><span><%#Eval("ProductName")%></span></asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="成品等级" DataField="ProductType" SortExpression="ProductType">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="成品类别" DataField="FileFormat" SortExpression="FileFormat">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="图幅" DataField="Mapsize" SortExpression="Mapsize">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="是否活用" SortExpression="IsReUse">
                <ItemTemplate>
                    <%# Convert.ToInt32(Eval("IsReUse"))==0?"否":"是" %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="上传日期" DataField="CreateDate" SortExpression="CreateDate"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode" SortExpression="ProjectCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" SortExpression="ProjectName">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <div id="divSignInfo" style="display: none" title="获取签名">
        <table class="tz-table" width="100%">
            <tr>
                <td class="td-l">
                    请输入签署页每行显示的签名个数:
                </td>
                <td class="td-r">
                    <zhongsoft:XHtmlInputText runat="server" value="5" ID="txtNum" EnableTheming="false"
                        class="kpms-textbox" />
                </td>
            </tr>
        </table>
    </div>
    <script type="text/javascript">

        $gridCheckedClientID = "<%=this.gvList.CheckedClientID %>";

        function batchDownload() {
            var prodIds = $("#" + $gridCheckedClientID).val();
            if (prodIds != "" && prodIds != undefined && prodIds.length > 10) {
                var productIds = prodIds.replace("[", '""').replace("]", '""');
                productIds = productIds.replace(/\"/g, "");
                var fileRelateId = productIds;
                var urlStr = "Sys/FileDocument/BatchFileDownload.aspx?docType=product&productIds=" + fileRelateId;
                showDivDialog(urlStr, null, 750, 550);
            } else {
                alert("请选择要下载的成品");
            }
            return false;
        }

        function showProductDetail(productID) {
            var json = { actionType: 1, bizId: productID };
            var url = buildQueryUrl('EPMS/List/Product/ProductDetailView.aspx', json);
            showDivDialog(url, null, 1000, 600, null);
            return false;
        }

        function viewItem(productId) {
            return showProductDetail(productId);
        }

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

        function initPagePlugin() {
            //根据是否在项目网站展示，显隐一些信息
            if ('<%=QueryOrgID %>' != '') {
                $('[flag="proj"]').hide();
            }
            else {
                $('[flag="noproj"]').hide();
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
