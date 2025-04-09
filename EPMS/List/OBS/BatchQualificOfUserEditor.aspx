<%@ Page Title="批量更新人员资质信息" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="BatchQualificOfUserEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.OBS.BatchQualificOfUserEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                资质名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlQualificationName" req="1" AutoPostBack="true"
                    onselectedindexchanged="ddlQualificationName_SelectedIndexChanged">
                </zhongsoft:LightDropDownList>
                <input runat="server" id="hiQualificationId" type="hidden" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                项目类型
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbProjType" ReadOnly="true" CssClass="kpms-textbox"></zhongsoft:LightTextBox>
                <input type="hidden" runat="server" id="hiXml" />
                <asp:LinkButton runat="server" ID="btnProjType" OnClientClick="return setProjType()" Style="height: 18px; width: 20px;
                    padding: 0px" CssClass="btn-look-up" EnableTheming="false"><img src="../../../Themes/Images/look-up.gif"  style="padding:0px"/>
                </asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                专业
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbSpeType" ReadOnly="true" CssClass="kpms-textbox"></zhongsoft:LightTextBox>
                <input type="hidden" runat="server" id="hiSpeXml" />
                <input type="hidden" runat="server" id="hiName" />
                <asp:LinkButton runat="server" ID="btnSpeType" OnClientClick="return setSpeType()" Style="height: 18px; width: 20px;
                    padding: 0px" CssClass="btn-look-up" EnableTheming="false"><img src="../../../Themes/Images/look-up.gif"  style="padding:0px"/>
                </asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                操作
            </td>
            <td class="td-r">
                <asp:Button runat="server" ID="btnAdd" Text="批量添加" onclick="btnAdd_Click" />
                <asp:Button runat="server" ID="btnDel" Text="批量删除" onclick="btnDel_Click" />
            </td>
        </tr>
    </table>
    <script>
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();
        }
        $hiXmlId = "";
        $tbId = "";
        //选择项目类型
        function setProjType() {
            qualificationID = $("#<%=hiQualificationId.ClientID %>").val();
            if (qualificationID == "") { alert("请先选择资质！"); return false; }
            $hiXmlId = "<%=hiXml.ClientID %>";
            $tbId = "<%=tbProjType.ClientID %>";
            var url = buildQueryUrl("EPMS/List/OBS/QuaProjTypeEditor.aspx", { "qualificationID": qualificationID, "ViewId": "<%=BusinessObjectId%>" });
            showDivDialog(encodeURI(url), "", 1000, 500, afterParamFilter);
            return false;
        }
        function afterParamFilter(re) {
            var arr = re.split('|');
            $("#" + $hiXmlId).val(arr[0]);
            $("#" + $tbId).val(arr[1]);
        }

        //配置专业
        function setSpeType() {
            qualificationID = $("#<%=hiQualificationId.ClientID %>").val();
            if (qualificationID == "") { alert("请先选择资质！"); return false; }
            $hiXmlId = "<%=hiSpeXml.ClientID %>";
            $tbId = "<%=tbSpeType.ClientID %>";
            var url = buildQueryUrl("EPMS/Obsolete/SpeTypeSelector.aspx", null);
            showDivDialog(encodeURI(url), "", 850, 350, afterParamFilter);
            return false;
        }
    </script>
</asp:Content>
