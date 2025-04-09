<%@ Page Language="C#" AutoEventWireup="true" Title="项模板详细" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="FileItemTemplateEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.FileItemTemplateEditor" %>

<asp:Content runat="server" ID="Content2" ContentPlaceHolderID="toolBtn">
    <asp:LinkButton runat="server" ID="btnAddSpe" OnClientClick="return false" CssClass="subtoolbarlink"
        EnableTheming="false" displaystatus="(3.*)" Visible="false">
        <span>添加关联专业</span>
    </asp:LinkButton>
    <asp:LinkButton runat="server" ID="btnAddWbs" OnClientClick="return false" CssClass="subtoolbarlink"
        EnableTheming="false" displaystatus="(3.*)" Visible="false">
        <span>添加关联任务</span>
    </asp:LinkButton>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                卷册编号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtRollCide" SourceMode="SelectorPage"
                    IsMutiple="true" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                    EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/WBSTemplateSelector.aspx"
                    activestatus="(23.*)" ShowSelectBtn="false" req="1"></zhongsoft:LightObjectSelector>
            </td>
            <td class="td-l">
                卷册名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbRollName" activestatus="(23.*)" ReadOnly="true"
                    req="1"></zhongsoft:LightTextBox>
                <input type="hidden" runat="server" id="hiRollID" tablename="EPMS_FileItemTemplate"
                    field="WBSTemplateID" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                资料项编号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbFileCode" TableName="EPMS_FileItemTemplate"
                    Field="FileItemCode" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                资料项名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbFileName" TableName="EPMS_FileItemTemplate"
                    Field="FileItemName" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                资料类别<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlFileType" TableName="EPMS_FileItemTemplate"
                    Field="ParamFileTypeID" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiFileType" tablename="EPMS_FileItemTemplate"
                    field="FileType" />
            </td>
            <td class="td-l">
                资料重要性
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlFileImp" TableName="EPMS_FileItemTemplate"
                    Field="FileImportance" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                资料内容<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbContent" TableName="EPMS_FileItemTemplate"
                    Field="FileContent" activestatus="(23.*)" TextMode="MultiLine" EnableTheming="false"
                    CssClass="kpms-textarea" maxtext="1024" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                资料来源
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlFileResource" TableName="EPMS_FileItemTemplate"
                    Field="FileSource" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                延迟（开工起）
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbDelay" TableName="EPMS_FileItemTemplate"
                    Field="DelayDays" activestatus="(23.*)" Style="text-align: right; width: 70px;"
                    regex="^\d{0,2}$" errmsg="请输入最多2位整数"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                所属专业
            </td>
            <td class="td-r">
                <%--  <zhongsoft:LightDropDownList runat="server" ID="ddlSpecialty" TableName="EPMS_FileItemTemplate"
                    Field="BelongSpecialtyID" activestatus="(23.*)" OnSelectedIndexChanged="ddlSpecialty_SelectedIndexChanged"
                    AutoPostBack="true">
                </zhongsoft:LightDropDownList>--%>
                <!--改变选择方式-->
                <zhongsoft:XHtmlInputText runat="server" ID="txtSpe" readonly="readonly" TableName="EPMS_FileItemTemplate"
                    Field="BelongSpecialtyName" activestatus="(23.*)" class="kpms-textbox" style="width: 50%;">
                </zhongsoft:XHtmlInputText>
                <asp:ImageButton runat="server" ID="ibtnSelectSpe" ImageUrl="~/Themes/Images/look-up.gif"
                    OnClientClick="return selectSpe()" displaystatus="(23.*)" />
                <input type="hidden" runat="server" id="hiSpecialtyID" tablename="EPMS_FileItemTemplate"
                    field="BelongSpecialtyID" />
                <input type="hidden" runat="server" id="hiSpecialtyCode" tablename="EPMS_FileItemTemplate"
                    field="BelongSpecialtyCode" />
            </td>
            <td class="td-l">
                所属模块<br />
                （系统、区域）<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlModule" TableName="EPMS_FileItemTemplate"
                    Field="BelongModuleID" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiModuleName" tablename="EPMS_FileItemTemplate"
                    field="BelongModule" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                适用范围
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="txtUseRange" SourceMode="SelectorPage"
                    IsMutiple="true" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                    EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/TemplateUsingRangeSelector.aspx"
                    TableName="EPMS_FileItemTemplate" Field="UsingRange" activestatus="(23.*)"></zhongsoft:LightObjectSelector>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                描述
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbDescription" TableName="EPMS_FileItemTemplate"
                    Field="DESCRIPTION" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                是否启用
            </td>
            <td class="td-m" colspan="3">
                <asp:RadioButtonList runat="server" ID="rblFlag" RepeatDirection="Horizontal" TableName="EPMS_FileItemTemplate"
                    Field="FLAG" activestatus="(23.*)">
                    <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                    <asp:ListItem Value="0">不启用</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
    <input id="hikeyID" type="hidden" tablename="EPMS_FileItemTemplate" field="FileItemTemplateID"
        runat="server" />
    <input type="hidden" runat="server" id="hiSpeXML" />
    <input type="hidden" runat="server" id="hiWbsXML" />
    <input type="hidden" runat="server" id="hiBelongSpeXML" />
    <asp:Button runat="server" ID="btnBindSpe" Visible="false" OnClick="btnBindSpe_Click" />
    <asp:Button runat="server" ID="btnBindWbs" Visible="false" OnClick="btnBindWbs_Click" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();

            $('#<%=btnAddSpe.ClientID %>').live('click', function () {
                addSpe();
            });

            $('#<%=btnAddWbs.ClientID %>').live('click', function () {
                addWbs();
            });
        }

        //批量添加专业
        function addSpe() {
            var param = new InputParamObject("m");
            getSpecialty('<%=hiSpeXML.ClientID %>', param, '', bindSpe);
        }

        //执行后台添加专业数据
        function bindSpe(){
            <%=Page.ClientScript.GetPostBackEventReference(this.btnBindSpe,"")%>;
        }

        //批量添加任务
        function addWbs() {
            var param = new InputParamObject("m");
            getWBSTemplate('<%=hiWbsXML.ClientID %>', param, '', bindWbs);
        }

        //执行后台添加任务数据
        function bindWbs(){
            <%=Page.ClientScript.GetPostBackEventReference(this.btnBindWbs,"")%>;
        }

        //选择所属专业
        function selectSpe() {
            var xml = $("#<%=hiBelongSpeXML.ClientID %>").val();
            var json={ActionFlag:1,SelectFlag:0};
            var url = buildQueryUrl("EPMS/Obsolete/SpeSelector.aspx", json);
            showDivDialog(url, xml, 850, 550, setSpeVal);
            return false;
        }

        //根据返回值，设置控件值
        function setSpeVal(re) {
            var arr = re.split('|');
            $("#<%=hiBelongSpeXML.ClientID %>").val(arr[0]);
            $("#<%=hiSpecialtyID.ClientID %>").val(arr[1]);
            $("#<%=hiSpecialtyCode.ClientID %>").val(arr[2]);
            $("#<%=txtSpe.ClientID %>").val(arr[3]);
        }

    </script>
</asp:Content>
