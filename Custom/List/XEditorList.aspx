<%@ Page Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true"
    CodeBehind="XEditorList.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.XEditorList" %>

<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                页面名称
            </td>
            <td>
                <asp:TextBox ID="tbEditorInfo" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>
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
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" DataKeyNames="ListId" AutoGenerateColumns="False"
        BindGridViewMethod="BindListGrid" AllowPaging="True">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="60px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightBoundField DataField="ListName" HeaderText="页面名称" ShowToolTip="true"
                EditItemClick="editList" DataParamFields="ListId" />
            <asp:BoundField DataField="ListCode" HeaderText="编号" />
            <asp:BoundField DataField="CreateUserName" HeaderText="创建人" HeaderStyle-Width="100px" />
            <asp:BoundField DataField="CreateDate" HeaderText="创建时间" DataFormatString="{0:yyyy-MM-dd}"
                HeaderStyle-Width="100px" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">

        function editList(bizId) {
            var url = buildBizUrl(3, bizId, "Custom/List/XEditorBuilder.aspx", null);
            if (checkReturn(showModal(url, "", 1080, 600))) {
                if (typeof (rebindGridData) == "function") {
                    rebindGridData();
                }
            }
        }

        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";

        function beforeDialog(actionType, bizId) {
            var url = buildBizUrl(actionType, bizId, "Custom/List/XEditorBuilder.aspx", null);
            switch (actionType) {
                case "1":
                    showModal(url, "", 1080, 600);
                    break;
                case "3":
                case "2":
                    if (checkReturn(showModal(url, "", 1080, 600))) {
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
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
