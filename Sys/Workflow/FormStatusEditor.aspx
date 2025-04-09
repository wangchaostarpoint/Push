<%@ Page Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true"
    CodeBehind="FormStatusEditor.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Workflow.FormStatusEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="False"
      OnRowCommand="gvList_RowCommand"   OnRowDataBound="gvList_RowDataBound" AllowPaging="True" >
        <Columns>
            <asp:BoundField DataField="CtrlId" HeaderText="ID" />
            <asp:BoundField DataField="CtrlName" HeaderText="名称" />
            <asp:BoundField DataField="TypeName" HeaderText="类型" />
            <asp:TemplateField HeaderText="ActiveStatus">
                <ItemTemplate>
                    <input type="hidden" runat="server" id="hiCtrlId" value='<%#Eval("CtrlId") %>' />
                    <input type="text" runat="server" id="txtActive" class="kpms-textbox" readonly="readonly"
                        title="点击编辑" />
                    <input type="hidden" runat="server" id="hiActive" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DisplayStatus">
                <ItemTemplate>
                    <input type="text" runat="server" id="txtDisplay" class="kpms-textbox" readonly="readonly"
                        title="点击编辑" />
                    <input type="hidden" runat="server" id="hiDisplay" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <input type="hidden" runat="server" id="hiFormStatus" field="FormStatus" tablename="WorkflowFormDefinition" />
    <div id='iframediv' style='display: none'>
        <iframe id='editiframe' name="editiframe" src='' frameborder='0' width='100%' height='100%'
            scrolling='no' allowtransparency='true'></iframe>
    </div>
    <script>
        function setStatus(hiid, tid) {

            var xpdlId = "<%=XPDLID%>";
            var packName = "<%=PackageName %>"
            var json = $("#" + hiid).val();

            var url = buildQueryUrl("sys/workflow/StatusEditor.aspx", { XPDLID: xpdlId, PackageName: packName, Status: encodeURI(json) });

            document.getElementById('editiframe').src = url;
            $("#iframediv").dialog({
                title: "状态设置",
                height: 500,
                width: 800,
                modal: true,
                buttons: {
                    "确定": function () {
                        var status = editiframe.window.getStatus();
                        var texts = editiframe.window.getTexts();
                        $("#" + hiid).val(status)
                        $("#" + tid).val(texts)
                        $(this).dialog("close");
                        document.getElementById('editiframe').src = "";
                    },
                    "取消": function () {
                        $(this).dialog("close");
                        document.getElementById('editiframe').src = "";
                    }
                }
            });
        } 
    </script>
</asp:Content>
