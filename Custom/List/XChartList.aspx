<%@ Page Title="自定义图表管理" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master"
    AutoEventWireup="true" CodeBehind="XChartList.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.XChartList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">列表名称</span> <span>
        <asp:TextBox ID="tbListInfo" runat="server"  CssClass="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton runat="server" ID="btnExport" EnableTheming="false" CssClass="subtoolbarlink"
            OnClick="btnExport_Click"><span>
                                        <img  title="导出" src="<%=WebAppPath %>/Themes/Images/btn_submit.gif" width="15" height="15" /></span></asp:LinkButton>
        <asp:LinkButton runat="server" ID="btnImport" EnableTheming="false" CssClass="subtoolbarlink"
            OnClick="btnImport_Click" OnClientClick="return openImport();"><span>
                                        <img  title="导入" src="<%=WebAppPath %>/Themes/Images/ico_hq.gif" width="15" height="15" /></span></asp:LinkButton></div>
    <input type="hidden" runat="server" id="hipath" />
    <div id="divImport" style="display: none;">
        <table width="100%">
            <tr>
                <td>
                    <asp:FileUpload ID="fileUpload" runat="server" Width="300px" /><br />
                </td>
            </tr>
        </table>
    </div>
    <script>
        function openImport() {

            $("#divImport").dialog({
                height: 120,
                width: 350,
                modal: true,
                title: "导入数据",
                buttons: {
                    "确定": function () {
                        var file = document.getElementById("<%=fileUpload.ClientID %>");
                        $("#<%=hipath.ClientID %>").val(file.value);
                        <%=Page.GetPostBackEventReference(this.btnImport,"") %>;
                    },
                    "取消": function () {
                        $(this).dialog("close");
                    }
                }

            })

            return false;
        }
        
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvCharts" runat="server" DataKeyNames="ViewId,ListId"
        AutoGenerateColumns="False" HideFieldOnExport="编辑,删除" OnChangeSize="changeSize"
        BindGridViewMethod="BindListGrid" OnRowDataBound="gvCharts_RowDataBound" ShowExport="true"
        AllowPaging="True">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全部" OnClientClick="checkList">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightBoundField DataField="ListName" HeaderText="图表名称" HeaderStyle-Width="300px"
                ItemStyle-Width="300px" EditItemClick="editList" DataParamFields="ViewId">
            </zhongsoft:LightBoundField>
            <asp:BoundField DataField="ListCode" HeaderText="图表编号" HeaderStyle-Width="300px"
                ItemStyle-Width="300px" />
            <asp:BoundField DataField="CreateUserName" HeaderText="创建人" HeaderStyle-HorizontalAlign="Justify"
                HeaderStyle-Width="200px" ItemStyle-Width="200px" />
            <asp:BoundField DataField="CreateDate" HeaderText="创建时间" DataFormatString="{0:yyyy-MM-dd}"
                HeaderStyle-Width="200px" ItemStyle-Width="200px" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        //新建、编辑、查看弹出窗口方式
        function beforeDialog(actionType, bizId) {
            var url = buildBizUrl(actionType, bizId, "Custom/List/XChartEditor.aspx", null);
            if (checkReturn(showModal(url, "", 1085, 600))) {
                if (typeof (rebindGridData) == "function") {
                    rebindGridData();
                }
            }
        }
        //图表名称链接弹出页面
        function editList(bizId) {
            var url = buildBizUrl(3, bizId, "Custom/List/XChartEditor.aspx", null);
            if (checkReturn(showModal(url, "", 1085, 600))) {
                if (typeof (rebindGridData) == "function") {
                    rebindGridData();
                }
            }
        }

        function checkList(array) {
            //向顶部工具条传入参数
            transParamToToolBar(array, null);
        }

        function transGridParam() {
            //获取列表选中行Id集合  
            var array = buildGirdRowIds("<%=gvCharts.CheckedClientID %>");
            //
            checkList(array);
        }

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
