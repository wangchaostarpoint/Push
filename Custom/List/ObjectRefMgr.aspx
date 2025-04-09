<%@ Page Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true"
    CodeBehind="ObjectRefMgr.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.ObjectRefMgr" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">页面名称</span> <span>
        <asp:TextBox ID="tbListInfo" runat="server"  CssClass="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
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
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" DataKeyNames="ListId" AutoGenerateColumns="False"
        BindGridViewMethod="BindListGrid" AllowPaging="True">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightBoundField DataField="ListName" HeaderText="页面名称" ShowToolTip="true"
                ItemStyle-Width="300px" EditItemClick="editList" DataParamFields="ListId" />
            <zhongsoft:LightBoundField DataField="ListCode" HeaderText="页面编号" ItemStyle-Width="300px" />
            <asp:BoundField DataField="CreateUserName" HeaderText="创建人" HeaderStyle-HorizontalAlign="Justify"
                HeaderStyle-Width="200px" ItemStyle-Width="200px" />
            <asp:BoundField DataField="CreateDate" HeaderText="创建时间" DataFormatString="{0:yyyy-MM-dd}"
                HeaderStyle-Width="200px" ItemStyle-Width="200px" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>

        function editList(bizId) {
            var url = buildBizUrl(3, bizId, "Custom/List/ObjectRefEditor.aspx", null);
            if (checkReturn(showModal(url, "", 1085, 600))) {
                if (typeof (rebindGridData) == "function") {
                    rebindGridData();
                }
            }
        }

        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";

        function beforeDialog(actionType, bizId) {
            var url = buildBizUrl(actionType, bizId, "Custom/List/ObjectRefEditor.aspx", null);
            switch (actionType) {
                case "1":
                    showModal(url, "", 1085, 600);
                    break;
                case "3":
                case "2":
                    if (checkReturn(showModal(url, "", 1085, 600))) {
                        if (typeof (rebindGridData) == "function") {
                            rebindGridData();
                        }
                    }
                    break;
            }
            return false;
        }
  
    
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
