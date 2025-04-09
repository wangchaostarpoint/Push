<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCMainBody.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.UI.Controls.UCMainBody" %>
<table class="tz-table" style="width: 100%">
    <tr id="trMainSure">
        <td colspan="6" style="text-align: right">
            新增<zhongsoft:LightTextBox runat="server" ID="tbInShowNum" Width="50px" regex="^\d+$"
                Style="text-align: right" errmsg="请填写最多两位正整数" MaxLength="2"></zhongsoft:LightTextBox>
            <asp:Button EnableTheming="false" runat="server" ID="btnInSure" OnClick="btnInSure_Click"
                Text="确定" OnClientClick="return checkUFillNum()" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvMainBody" runat="server" AutoGenerateColumns="False"
                DataKeyNames="PRIMARYID" PowerPageCount="0" PowerPageIndex="0" RecordsCount="0"
                UseDefaultDataSource="true" OnRowDataBound="gvMainBody_RowDataBound" OnRowCommand="gvMainBody_RowCommand">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="类型<span class='req-star'>*</span>" >
                        <ItemTemplate>
                            <zhongsoft:LightDropDownList runat="server" ID="ddlMainBodyType" req="1">
                            </zhongsoft:LightDropDownList>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="相对方名称<span class='req-star'>*</span>">
                        <ItemTemplate>
                            <zhongsoft:LightObjectSelector runat="server" ID="losCustomerName" req="1" clearEmpty="true"
                                SourceMode="SelectorPage" ShowJsonRowColName="true" SelectPageMode="Dialog" DoCancel="true"
                                Value='<%#Eval("MAINBODYNAME") %>' ResultAttr="name" EnableTheming="false" Writeable="false"
                                ShowAttrs="name" ResultForControls="{'hiMainBodyID':'id'}" PageUrl="~/MM/Obsolete/CustomerSelector.aspx">
                            </zhongsoft:LightObjectSelector>
                            <input type="hidden" runat="server" id="hiMainBodyID" value='<%#Eval("CUSTOMERID") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="联系人" ItemStyle-Width="120px">
                        <ItemTemplate>
                            <zhongsoft:LightObjectSelector runat="server" ID="losContactName" SourceMode="SelectorPage"
                                ShowJsonRowColName="true" SelectPageMode="Dialog" DoCancel="true" ResultAttr="name"
                                EnableTheming="false" Writeable="false" ShowAttrs="name" ResultForControls="{'hiContactID':'id'}"
                                PageUrl="~/MM/Obsolete/CustomerContactSelector.aspx"></zhongsoft:LightObjectSelector>
                            <input type="hidden" runat="server" id="hiContactID" value='<%#Eval("CONTACTID") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="签署日期" ItemStyle-Width="120px">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText ID="txtSignDate" runat="server" MaxLength="16" Value='<%# (Eval("SIGNDATE")==null||string.IsNullOrEmpty(Eval("SIGNDATE").ToString())) ? Eval("SIGNDATE") : Convert.ToDateTime(Eval("SIGNDATE")).ToString("yyyy-MM-dd") %>'
                                readonly="readonly" class="kpms-textbox-date" activestatus="(23.填写报销单)(3.修改报销单)(3.财务处理)" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除">
                    </zhongsoft:LightButtonField>
                </Columns>
            </zhongsoft:LightPowerGridView>
           </td>
    </tr>
</table>
<script>
    //页面加载事件
    function ucMainBody_Init() {
        $('[attr=select]').attr('src', $appCtx.portalUrl + "/Themes/Images/look-up.gif");
    }
    function filterContact(mainBody) {
        return "{CUSTOMERID:'" + $('#' + mainBody).val() + "'}";
    }

    function beforeSelContact(mainBodyName) {
        if ($('#' + mainBodyName).val() == "") {
            alert("请先选择相对方信息");
            return false;
        }
        return true;
    }

    //选择合同相对方联系人
    function selContactName(contactName, contactID, mainBodyName, mainBodyID) {
        if ($('#' + mainBodyName).val() == "") {
            alert("请先选择相对方信息");
            return false;
        }
        var param = new InputParamObject("s");
        var json = "{CUSTOMERID: '" + $("#" + mainBodyID).val() + "' }";
        getDivCustomerContact(null, param, json, afterSelCustomerOrContact);
        return false;
    }


    //获取相对方数量
    function getMainBodyNum() {
        var count = 0;
        $("#<%=gvMainBody.ClientID %> [id$=ddlMainBodyType]").each(function () {
            var txtMainBodyName = $(this).parent('td').parent('tr').find('[id$=txtMainBodyName]');
            if ($(this).val() != "" && txtMainBodyName.val() != "") {
                count = count + 1;
            }
        });
        return count;
    }

    //确定行是否隐藏
    function accessOfMainSureDisplay(isHide) {
        if (isHide) {
            $("#trMainSure").hide();
        }
        else {
            $("#trMainSure").show();
        }
    }


    function checkUFillNum() {
        var fillNum = $("#<%=tbInShowNum.ClientID %>").val();
        if (fillNum == "") {
            alert("请输入要添加的行数");
            return false;
        }
        return true;
    }
</script>
