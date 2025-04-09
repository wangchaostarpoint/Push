<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_CollectDataForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Project.WF_CollectDataForm" %>
<%@ Register Src="~/EPMS/UI/Project/ProjectGrid.ascx" TagName="ProjectGrid" TagPrefix="uc1" %>
<script type="text/javascript">
    function initCustomerPlugin() {
        if (typeof (initProjectGrid) == 'function') {
            initProjectGrid();
        }
    }

    function checkForm() {
        if ($formAction == 0) {//0 表示发送
            //必须选定一个主项目
            //            if ($actName == "编写搜资提纲/报告" || $actName == "重新编写搜资提纲/报告") {
            //                var json = { "bizid": "<%=BusinessObjectId %>" };
            //                var count = formCallback("MajorProjectNum", json);
            //                if (count > 0) {
            //                    return true;
            //                } else {
            //                    alert("请添加项目并指定一个主项目");
            //                    return false;
            //                }
            //            }
        }
        return true;
    }
</script>
<table class="tz-table" width="100%">
    <tr>
        <td colspan="6" class="td-m flexible">
            搜资信息
        </td>
    </tr>
    <tr>
        <td class="td-l">
            项目名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectProject" req="1" IsMutiple="false"
                SelectPageMode="Dialog" ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode'}"
                EnableTheming="false" Text="选择项目" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                PageWidth="850" ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.编写搜资提纲/报告)(23.重新编写搜资提纲/报告)"
                TableName="EPMS_CollectData" field="ProjectName" />
        </td>
        <td class="td-l">
            项目编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtProjectCode" runat="server" readonly="readonly"
                activestatus="(23.编写搜资提纲/报告)(23.重新编写搜资提纲/报告)" maxlength="16" class="kpms-textbox" TableName="EPMS_CollectData"
                field="ProjectCode" />
            <input type="hidden" id="hiOrganizationID" runat="server" tablename="EPMS_CollectData"
                field="OrganizationID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            搜资类型<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlCollectType" tablename="EPMS_CollectData"
                field="CollectType" req="1" activestatus="(23.编写搜资提纲/报告)(23.重新编写搜资提纲/报告)">
                <asp:ListItem Value="" Text="请选择"></asp:ListItem>
                <asp:ListItem Value="综合搜资" Text="综合搜资"></asp:ListItem>
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">
            计划耗时（天）
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbPlanDays" tablename="EPMS_CollectData"
                field="PlanDays" regex="^[1-9]\d*$" errMsg="请填写正整数" activestatus="(23.编写搜资提纲/报告)(23.重新编写搜资提纲/报告)"
                CssClass="kpms-textbox-money" EnableTheming="false">
            </zhongsoft:LightTextBox>
        </td>
        <td class="td-l">
            实际耗时（天）
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbFactDays" tablename="EPMS_CollectData"
                field="FactDays" regex="^[1-9]\d*$" errMsg="请填写正整数" activestatus="(23.编写搜资提纲/报告)(23.重新编写搜资提纲/报告)"
                CssClass="kpms-textbox-money" EnableTheming="false">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            搜资人员
        </td>
        <td class="td-m" colspan="5">
            <asp:ImageButton runat="server" ID="ibtnSelectParter" ImageUrl="~/Themes/Images/btn_select.gif"
                activestatus="(3.编写搜资提纲/报告)(3.重新编写搜资提纲/报告)" displaystatus="(3.编写搜资提纲/报告)(3.重新编写搜资提纲/报告)"
                OnClientClick="return batchAddUser();" />
            <asp:DataList runat="server" ID="dlList" DataKeyField="CollectDataPartakerID" RepeatDirection="Horizontal"
                OnItemCommand="dlList_ItemCommand" OnItemDataBound="dlList_ItemDataBound">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbPartakeUserName" Text='<%#Eval("PartakeUserName") %>'></asp:Label>
                    <input type="hidden" runat="server" id="hiPartakeUserID" value='<%#Eval("PartakeUserID") %>' />
                    <asp:ImageButton runat="server" ID="ibtnDel" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"CollectDataPartakerID") %>'
                        CommandName="Del" ImageUrl="~/Themes/Images/btn_dg_delete.gif" OnClientClick="return checkBeforeDel(this);"
                        Visible="false" />
                </ItemTemplate>
            </asp:DataList>
            <asp:Label runat="server" ID="lbTips" Text="请先保存表单再选择搜资人员" displaystatus="(2.编写搜资提纲/报告)"
                Style="color: Red;"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            搜资目的及范围
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbCollectRange" TextMode="MultiLine" CssClass="kpms-textarea"
                EnableTheming="false" MaxLength="1024" tablename="EPMS_CollectData" field="CollectRange"
                activestatus="(23.编写搜资提纲/报告)(23.重新编写搜资提纲/报告)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            搜资地点及单位
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbCollectPlace" TextMode="MultiLine" CssClass="kpms-textarea"
                EnableTheming="false" MaxLength="512" tablename="EPMS_CollectData" field="CollectPlace"
                activestatus="(23.编写搜资提纲/报告)(23.重新编写搜资提纲/报告)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            搜资汇报内容
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbCollectContent" TextMode="MultiLine"
                CssClass="kpms-textarea" EnableTheming="false" MaxLength="2048" tablename="EPMS_CollectData"
                field="CollectContent" activestatus="(23.编写搜资提纲/报告)(23.重新编写搜资提纲/报告)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <uc1:ProjectGrid runat="server" ID="ucProjectGrid" />
</table>
<input type="hidden" runat="server" id="hiKeyId" tablename="EPMS_CollectData" field="CollectDataID" />
<input type="hidden" runat="server" id="hiUserXML" />
<asp:Button runat="server" ID="btnAddUser" OnClick="btnAddUser_Click" Visible="false" />
<script type="text/javascript">
    //添加搜资人员
    function batchAddUser() {
        var param = new InputParamObject("m");
        getEPMSUser('<%=hiUserXML.ClientID %>', param, null, addUser);
        return false;
    }
    function addUser() {
        <%=Page.ClientScript.GetPostBackEventReference(this.btnAddUser,"")%>;
    }
    function checkBeforeDel(obj) {
            return confirm("您确定要删除吗？");
    }
</script>
