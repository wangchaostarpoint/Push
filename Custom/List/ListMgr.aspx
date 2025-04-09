<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="ListMgr.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.ListMgr" %>

<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">列表名称</span> <span>
        <asp:TextBox ID="tbListInfo" runat="server"  CssClass="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="toolBtn" runat="server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" DataKeyNames="ViewId,ListId"
        AllowFrozing="true" FrozenColNum="1" AutoGenerateColumns="False" HideFieldOnExport="编辑,删除"
        BindGridViewMethod="BindListGrid" OnRowDataBound="gvList_RowDataBound" ShowExport="true"
        AllowPaging="True">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全部" OnClientClick="checkList">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightBoundField DataField="ListName" HeaderText="列表名称" HeaderStyle-Width="300px"
                ItemStyle-Width="300px" EditItemClick="editList" DataParamFields="ViewId">
            </zhongsoft:LightBoundField>
            <asp:BoundField DataField="ListCode" HeaderText="列表编号" HeaderStyle-Width="300px"
                ItemStyle-Width="300px" />
            <asp:BoundField DataField="CreateUserName" HeaderText="创建人" HeaderStyle-HorizontalAlign="Justify"
                HeaderStyle-Width="200px" ItemStyle-Width="200px" />
            <asp:BoundField DataField="CreateDate" HeaderText="创建时间" DataFormatString="{0:yyyy-MM-dd}"
                HeaderStyle-Width="200px" ItemStyle-Width="200px" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        function editList(bizId) {
            var json = { "IsBaseView": "1", "IsCustom": "1" };
            var url = buildBizUrl(3, bizId, "Custom/List/ListEditor.aspx", json);
            showDivDialog(url, null, 1080, 600, rebindGridData);
            //            if (checkReturn(showModal(url, "", 1080, 600))) {
            //                if (typeof (rebindGridData) == "function") {
            //                    rebindGridData();
            //                }
            //            }
        }
        function checkList(array) {
            //向顶部工具条传入参数
            var json = { "IsBaseView": "1", "IsCustom": "1" };
            transParamToToolBar(array, json);
        }
        function transGridParam() {
            //获取列表选中行Id集合  
            var array = buildGirdRowIds("<%=gvList.CheckedClientID %>");
            checkList(array);
        }
        function queryListMgr(filter) {
            $("#<%=tbListInfo.ClientID %>").val(filter);
            rebindGridData();
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
