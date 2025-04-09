<%@ Page Title="触发器套用" Language="C#" MasterPageFile="~/UI/Master/ObjectCfg.Master"
    AutoEventWireup="true" CodeBehind="TriggerReuse.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Workflow.TriggerReuse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolTip" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="topBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                套用步骤
            </td>
            <td class="td-r">
                <select id="listActs" multiple="true" size="10" style="width: 80%">
                </select>
                <asp:ImageButton ID="ibtnSelActs" runat="server" OnClientClick="return selActivity();"
                    ImageUrl="~/Themes/Images/btn_select.gif" />
            </td>
        </tr>
    </table>
    <input runat="server" id="hiUrlParam" type="hidden" />
    <input runat="server" id="hiActs" type="hidden" />
    <script>

        function selActivity() {
            var listActs = $("#listActs");
            var hiActs = $("#<%=hiActs.ClientID %>");

            var selectMode = { selectMode: 'm' };
            var selectedActs = [];

            listActs.find("option").each(function () {
                var thisName = $(this).text().split('[')[0];
                var thisId = $(this).val();

                selectedActs.push({ id: thisId, name: thisName });
            });

            var selParams = $.extend(selectMode, { selectedActs: selectedActs });
            var urlParams = $.parseJSON($("#<%=hiUrlParam.ClientID %>").val());
            var url = buildQueryUrl("Sys/Workflow/ActivitySelector.aspx", urlParams);
            var result = showModal(url, selParams, 600, 500);
            if (checkReturn(result)) {
                var reJson = $.parseJSON(result);
                listActs.find("option").remove();
                hiActs.val("");
                if (reJson.length > 0) {
                    var acts = [];
                    $.each(reJson, function (i, obj) {
                        var text = obj.name + "[" + obj.id + "]";
                        listActs.append($("<option value='" + obj.id + "'>" + text + "</option>"))
                    });
                    hiActs.val(result);
                }
            }
            return false;
        }

        function okClick() {
            if ($("#listActs option").length == 0) {
                alert("请选择套用步骤！");
                return false;
            }
            window.returnValue = "Saved";
            return true;
        }

        function cancelClick() {
            window.returnValue = null;
            window.close();
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bottomBar" runat="server">
    <asp:LinkButton runat="server" ID="btnOK" CssClass="kpms-btn" OnClientClick="return okClick();"
        OnClick="btnOK_Click"><span>确定</span></asp:LinkButton>
    <asp:LinkButton runat="server" ID="btnCancel" CssClass="kpms-btn" OnClientClick="return cancelClick();"><span>取消</span></asp:LinkButton>
</asp:Content>
