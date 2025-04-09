<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectList.Master"
    Title="数据字典" CodeBehind="DictMgr.aspx.cs" Inherits="Zhongsoft.Portal.BDM.List.DictMgr" %>

<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.Controls" TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
    <asp:TreeView ID="treeModule" runat="server" Height="100%" Width="100%" ShowLines="true"
        OnSelectedNodeChanged="treeModule_Change">
        <SelectedNodeStyle BackColor="#F7F7F7" />
    </asp:TreeView>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                
            </td>
            <td>
                
            </td>
            <td>
                
            </td>
            <td>
                
            </td>
            <td>
                
            </td>
            <td>
                
            </td>
        </tr>
    </table>
    <span class="filter-block"><span class="filter-block-lb">名称/编号</span> <span>
        <asp:TextBox ID="tbTableInfo" runat="server" EnableViewState="true" CssClass="kpms-textboxsearch"
            EnableTheming="false">
                </asp:TextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">类&nbsp;型</span> <span>
        <asp:DropDownList runat="server" ID="ddlDictType" class="kpms-ddlsearch"
            EnableTheming="false">
                </asp:DropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">连&nbsp;接</span>
        <span>            
            <asp:DropDownList runat="server" ID="ddlDataCon" class="kpms-ddlsearch"
            EnableTheming="false">
                </asp:DropDownList>
        </span></span>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <table style="border-collapse: collapse;">
            <tr>
                <td>
                    <asp:LinkButton runat="server" CssClass="subtoolbarlink" EnableTheming="false" ID="btnNew"
                        OnClientClick="return newDict();" ToolTip='新建' OnClick="btnNew_Click">
                        <span>
                            <img src="../../Themes/Images/btn_new.gif" width="16" height="16" />新建</span>
                    </asp:LinkButton>
                </td>
                <td>
                    <asp:LinkButton runat="server" CssClass="subtoolbarlink" EnableTheming="false" ID="btnEdit"
                         OnClientClick="return editDict()" ToolTip='编辑' OnClick="btnEdit_Click">
                        <span>
                            <img src="../../Themes/Images/btn_editor.gif" width="16" height="16" />编辑</span>
                    </asp:LinkButton>
                </td>
                <td>
                    <asp:LinkButton runat="server" CssClass="subtoolbarlink" EnableTheming="false" ID="btnView"
                        OnClientClick="return viewDict();" ToolTip='查看' Style="display: none">
                        <span>
                            <img src="../../Themes/Images/btn_chakan.gif" width="16" height="16" />查看</span>
                    </asp:LinkButton>
                </td>
                <td>
                    <asp:LinkButton runat="server" CssClass="subtoolbarlink" EnableTheming="false" ID="btnDelete"
                        OnClick="btnDelete_Click" OnClientClick="return confirm('确定删除?');" ToolTip='删除'
                        Style="display: none">
                        <span>
                            <img src="../../Themes/Images/btn_delete.gif" width="16" height="16" />删除</span>
                    </asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>
    <div class="subtoolbarbg">
        <table style="border-collapse: collapse;">
            <tr>
                <td>
                    <asp:LinkButton runat="server" CssClass="subtoolbarlink" EnableTheming="false" ID="btnDefault"
                        OnClientClick="return setDefault();" ToolTip='默认页' Style="display: none">
                        <span>
                            <img src="../../Themes/Images/btn_defaultpage.gif" width="16" height="16" />默认页</span>
                    </asp:LinkButton>
                </td>
                <td>
                    <asp:LinkButton runat="server" CssClass="subtoolbarlink" EnableTheming="false" ID="btnAction"
                        OnClientClick="return setAction();" ToolTip='功能' Style="display: none">
                        <span>
                            <img src="../../Themes/Images/btn_function.gif" width="16" height="16" />功能</span>
                    </asp:LinkButton>
                </td>
                <td>
                    <asp:LinkButton runat="server" CssClass="subtoolbarlink" EnableTheming="false" ID="btnTrigger"
                        OnClientClick="return setTrigger();" ToolTip='触发器' Style="display: none">
                        <span>
                            <img src="../../Themes/Images/btn_triggergif.gif" width="16" height="16" />触发器</span>
                    </asp:LinkButton>
                </td>
                <td>
                    <asp:LinkButton runat="server" ID="btnRelation" EnableTheming="false" DisplayStatus="(3.*)"
                        Style="display: none" CssClass="subtoolbarlink" OnClientClick="return showRelation();">
                        <span><img  src="../../Themes/Images/btn-relation.png" width="16" height="16" />关联</span>
                    </asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>
    <div class="subtoolbarbg">
        <asp:LinkButton runat="server" ID="btnExport" EnableTheming="false" CssClass="subtoolbarlink"
            OnClick="btnExport_Click">
            <span>
                <img title="导出" src="<%=WebAppPath %>/Themes/Images/btn_submit.gif" width="15" height="15" /></span></asp:LinkButton>
        <asp:LinkButton runat="server" ID="btnImport" EnableTheming="false" CssClass="subtoolbarlink"
            OnClick="btnImport_Click" OnClientClick="return openImport();">
            <span>
                <img title="导入" src="<%=WebAppPath %>/Themes/Images/ico_hq.gif" width="15" height="15" /></span></asp:LinkButton></div>
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
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" DataKeyNames="DictId,DictType,DictCode"
        AutoGenerateColumns="False" AllowPaging="True" BindGridViewMethod="BindDictGrid"
        OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="setRowIds">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightBoundField DataField="DictName" HeaderText="表名称" ShowToolTip="true"
                DialogMode="Dialog" EditItemClick="editFieldDict" DataParamFields="DictId" />
            <asp:BoundField DataField="DictCode" HeaderText="表编号" />
            <asp:TemplateField HeaderStyle-Width="100px" ItemStyle-HorizontalAlign="Center" HeaderText="类型">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lblDictType"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="DataConName" HeaderText="连接" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <input type="hidden" runat="server" id="hiRowIds" />
    <script type="text/javascript">

        var $hiRowIds = $("#<%=hiRowIds.ClientID %>");
        var $btnEdit = $("#<%=btnEdit.ClientID %>");
        var $btnView = $("#<%=btnView.ClientID %>");
        var $btnDelete = $("#<%=btnDelete.ClientID %>");
        var $btnDefault = $("#<%=btnDefault.ClientID %>");
        var $btnAction = $("#<%=btnAction.ClientID %>");
        var $btnTrigger = $("#<%=btnTrigger.ClientID %>");
        var $btnRelation = $("#<%=btnRelation.ClientID %>");

        function initCustomerPlugin() {
            if ($hiRowIds.val() != "") {
                var arry = $hiRowIds.val().split(',');
                if (arry.length == 0) {
                    $btnEdit.hide();
                    $btnView.hide();
                    $btnDelete.hide();
                    $btnDefault.hide();
                    $btnAction.hide();
                    $btnTrigger.hide();
                    $btnRelation.hide();
                }
                else if (arry.length == 1) {
                    $btnEdit.show();
                    $btnView.show();
                    $btnDelete.show();
                    $btnDefault.show();
                    $btnAction.show();
                    $btnTrigger.show()
                    $btnRelation.show();
                }
                else if (arry.length > 1) {
                    $btnEdit.hide();
                    $btnView.hide();
                    $btnDelete.show();
                    $btnDefault.hide();
                    $btnAction.hide();
                    $btnTrigger.hide();
                    $btnRelation.hide();
                }
            }

        }
        function setRowIds(arry) {
            $hiRowIds.val(arry.toString());
            if (arry.length == 0) {
                $btnEdit.hide();
                $btnView.hide();
                $btnDelete.hide();
                $btnDefault.hide();
                $btnAction.hide();
                $btnTrigger.hide();
                $btnRelation.hide();
            }
            else if (arry.length == 1) {
                $btnEdit.show();
                $btnView.show();
                $btnDelete.show();
                $btnDefault.show();
                $btnAction.show();
                $btnTrigger.show()
                $btnRelation.show();
            }
            else if (arry.length > 1) {
                $btnEdit.hide();
                $btnView.hide();
                $btnDelete.show();
                $btnDefault.hide();
                $btnAction.hide();
                $btnTrigger.hide();
                $btnRelation.hide();
            }
        }

        function newDict() {
            return detailOfTable(null, "2");
        }

        function editDict() {
            return detailOfTable($hiRowIds.val(), "3");
        }

        function viewDict() {
            return detailOfTable($hiRowIds.val(), "1");
        }

        function setDefault() {
            var url = buildBizUrl("3", $hiRowIds.val(), "Custom/list/DictFeatureEditor.aspx", null);
            //showModal(url, null, 600, 400);
            showDivDialog(url, null, 600, 400, null);
            return false;
        }

        function setAction() {
            var url = buildBizUrl("3", null, "Custom/list/BDDictActionMgr.aspx", { dictid: $hiRowIds.val() });
            //showModal(url, null, 800, 400);
            showDivDialog(url, null, 900, 500, null);
            return false;
        }
        function setTrigger() {
            var url = buildBizUrl("3", null, "Custom/list/TriggerMgr.aspx", { sourceId: $hiRowIds.val(), IsModalDialog: "1" });
            showDivDialog(url, null, 700, 500, null);
            return false;
        }
        function showRelation() {
            var url = buildQueryUrl("Custom/List/RelationMgr.aspx", { "DictId": $hiRowIds.val() });
            //showModal(url, "", 800, 500);
            showDivDialog(url, null, 830, 500, afterOpen);
            return false;
        }
        function editFieldDict(bizId) {
            var url = buildBizUrl("3", bizId, "bdm/list/DictEditor.aspx", null);
            showDivDialog(url, null, 900, 600, afterOpen);
//            if (checkReturn(showModal(url, null, 900, 600))) {
//                rebindGridData();
//            }
            return false;
        }
        function detailOfTable(bizId, actionType) {
            var url = buildBizUrl(actionType, bizId, "bdm/list/DictEditor.aspx", null);
            showDivDialog(url, null, 900, 600, afterOpen);
            return true;
            //return checkReturn(showModal(url, null, 900, 600));
        }
        function editXTable(bizId, actionType) {
            var url = buildBizUrl(actionType, bizId, "bdm/list/XTableEditor.aspx", null);
            showDivDialog(url, null, 1080, 600, afterOpen);
            return true;
            //return checkReturn(showModal(url, null, 1080, 600));
        }
        function afterOpen(re) {
            rebindGridData();
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
