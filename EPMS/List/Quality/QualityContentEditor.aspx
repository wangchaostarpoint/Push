<%@ Page Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true"
    CodeBehind="QualityContentEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Quality.QualityContentEditor"
    Title="评审主题、评审内容" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table id="tz-table" class="tz-table" width="100%">
        <tr runat="server" id="Spe1">
            <td class="td-l">
                专业<span class="req-star">*</span>
            </td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightDropDownList ID="ddlSpecialty" runat="server" activestatus="(23.*)"
                    field="ParamSpecialtyId" tablename="EPMS_QualityActivityOfProject" EnableTheming="false"
                    req="1" AutoPostBack="true" OnSelectedIndexChanged="ddlSpecialty_SelectedIndexChanged">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiSpecialtyCode" field="SpecialtyCode" tablename="EPMS_QualityActivityOfProject" />
                <input type="hidden" runat="server" id="hiSpecialtyName" field="SpecialtyName" tablename="EPMS_QualityActivityOfProject" />
                <input type="hidden" runat="server" id="hiDeptID" />
            </td>
        </tr>
        <tr id="theme">
            <td class="td-l">
                主题<span class="req-star">*</span>
            </td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox ID="tbTheme" ActiveStatus="(23.*)" MaxLength="100" Field="Theme"
                    TableName="EPMS_QualityActivityContent" runat="server"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                <span content="content">内容</span><span class="req-star" id="req">*</span>
            </td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox TextMode="MultiLine" ActiveStatus="(23.*)" maxtext="1024"
                    ID="tbContent" field="Content" tablename="EPMS_QualityActivityContent" runat="server"
                    CssClass="kpms-textarea" EnableTheming="false"></zhongsoft:LightTextBox>
                <asp:ImageButton ID="ibtnSelectContent" runat="server" CausesValidation="False" DisplayStatus="(23.*)"
                    ImageUrl="~/Themes/Images/btn_select.gif" OnClientClick="return SelectContent();"
                    ToolTip="选择" Visible="false" />
            </td>
        </tr>
        <tr style="display: none">
            <td class="td-l">
                评审结论<span class="req-star">*</span>
            </td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightDropDownList ID="ddlMeasure" runat="server" Field="Measure" TableName="EPMS_QualityActivityContent"
                    ActiveStatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr style="display: none">
            <td class="td-l">
                执行人<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtExecUserName" IsMutiple="false"
                    SelectPageMode="Dialog" activestatus="(23.*)" SourceMode="SelectorPage" ShowJsonRowColName="true"
                    DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode" ResultForControls="{'hiExecUserID':'id'}"
                    PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" PageWidth="850" field="ExecUserName"
                    tablename="EPMS_QualityActivityContent" FilterFunction="execUserFilter()"></zhongsoft:LightObjectSelector>
                <input type="hidden" id="hiExecUserID" runat="server" field="ExecUserID" tablename="EPMS_QualityActivityContent" />
            </td>
            <td class="td-l">
                要求完成日期<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtRequireComDate" activestatus="(23.*)"
                    EnableTheming="false" class="kpms-textbox-date" readonly="readonly" field="RequireComDate"
                    tablename="EPMS_QualityActivityContent" />
            </td>
        </tr>
        <tr style="display: none">
            <td class="td-l">
                提出人
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtPutUserName" IsMutiple="false"
                    SelectPageMode="Dialog" activestatus="(23.*)" SourceMode="SelectorPage" ShowJsonRowColName="true"
                    DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode" PageWidth="850" ResultForControls="{'hiPutUserID':'id','tbUserCode':'UserCode'}"
                    PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" field="PutUserName" tablename="EPMS_QualityActivityContent">
                </zhongsoft:LightObjectSelector>
                <input type="hidden" id="hiPutUserID" runat="server" field="PutUserID" tablename="EPMS_QualityActivityContent" />
            </td>
            <td class="td-l">
                提出时间
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="tbPutDate" activestatus="(23.*)" EnableTheming="false"
                    class="kpms-textbox-date" readonly="readonly" field="PutDate" tablename="EPMS_QualityActivityContent" />
            </td>
        </tr>
    </table>
    <input type="hidden" id="hiQualityActivityContentID" runat="server" field="QualityActivityContentID"
        tablename="EPMS_QualityActivityContent" />
    <input type="hidden" id="hiQualityActivityOfProjectID" runat="server" field="QualityActivityOfProjectID"
        tablename="EPMS_QualityActivityContent" />
    <input type="hidden" id="hiOrganizationID" runat="server" field="OrganizationID"
        tablename="EPMS_QualityActivityContent" />
    <input type="hidden" id="hiFlag" runat="server" field="Flag" value="1" tablename="EPMS_QualityActivityContent" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkMaxLength();
            initOpinion();
            if ("<%=FormCode %>" == "EPMS36") {
                $("#theme").hide();
                $("[content='content']").html("主题");
                $("#req").show();
                $("#<%=tbContent.ClientID %>").attr("req", "1");
                $("#<%=tbTheme.ClientID %>").removeAttr("req");
            }
            else {
                $("#theme").show();
                $("[content='content']").html("内容");
                $("#req").hide();
                $("#<%=tbTheme.ClientID %>").attr("req", "1");
                $("#<%=tbContent.ClientID %>").removeAttr("req");
            }
        }

        //选择评审内容
        function SelectContent() {
            var param = new InputParamObject("s");
            var reObj = null;
            reObj = getJudgeContent("re", param, null);
            if (reObj != null) {
                var name = reObj.getAttrVal(0, "o", "name");
                if (name != null) {
                    $("#<%=tbContent.ClientID %>").val(name);
                }
            }
            return false;
        }

        function initOpinion() {
            $("#<%=this.tbContent.ClientID %>").autocomplete({
                source: function (request, response) {
                    $.getJSON("/Portal/EPMS/SOA/EPMSJsonSelectorHandler.ashx", {
                        term: 'judgecontent,' + request.term
                    }, response);
                },
                minLength: 0
            }).dblclick(function () {
                $(this).autocomplete("search");
            });
        }

        function execUserFilter() {
            return { OrganizationID: $('#<%=hiOrganizationID.ClientID %>').val(), IsShowMore: '1', IsFilterByOrg: '1' };
        }
    </script>
</asp:Content>
