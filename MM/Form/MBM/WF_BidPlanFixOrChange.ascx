<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_BidPlanFixOrChange.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.Form.MBM.WF_BidPlanFixOrChange" %>
<%--<%@ Register Src="../../../Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>--%>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            投标计划安排
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlPlanOrChange" field="PLANORCHAGE"
                tablename="MBM_BIDPLANFIXORCHANGE" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">
            项目名称
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:XHtmlInputText runat="server" ID="txtMarketProjectName" Field="MARKETPROJECTNAME"
                class="kpms-textbox" tableName="MBM_BIDPLANFIXORCHANGE" readonly="readonly" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            项目编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtMarketProjectCode" Field="MARKETPROJECTCODE"
                class="kpms-textbox" tableName="MBM_BIDPLANFIXORCHANGE" readonly="readonly" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            招标单位
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:XHtmlInputText runat="server" ID="txtCustomerName" Field="CUSTOMERNAME"
                class="kpms-textbox" tableName="MBM_BIDPLANFIXORCHANGE" readonly="readonly" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            招标编号
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbBidNumber" field="BIDNUMBER" tablename="MBM_BIDPLANFIXORCHANGE"
                MaxLength="36" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">
            招标单位联系人<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbContactManName" field="CONTACTMANNAME"
                tablename="MBM_BIDPLANFIXORCHANGE" MaxLength="36" req="1" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">
            联系电话<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbContactManPhone" field="CONTACTMANPHONE"
                tablename="MBM_BIDPLANFIXORCHANGE" MaxLength="36" req="1" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            招标单位地址<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbCustomerAddress" field="CUSTOMERADDRESS"
                tablename="MBM_BIDPLANFIXORCHANGE" MaxLength="512" req="1" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)"
                Width="98%"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            招标阶段
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtInVitePhase" Field="INVITEPHASE"
                class="kpms-textbox" tableName="MBM_BIDPLANFIXORCHANGE" readonly="readonly" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            标段号
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbBidNum" field="BIDNUM" tablename="MBM_BIDPLANFIXORCHANGE"
                MaxLength="36" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)"></zhongsoft:LightTextBox>
        </td>
        <td class="td-l">
            包号
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbPackageNumber" field="PACKAGENUMBER"
                tablename="MBM_BIDPLANFIXORCHANGE" MaxLength="36" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            项目类型
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectTypeId" Field="PROJECTTYPEID"
                class="kpms-textbox" tableName="MBM_BIDPLANFIXORCHANGE" readonly="readonly" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            规模等级
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtScaleRank" Field="SCALERANK" class="kpms-textbox"
                tableName="MBM_BIDPLANFIXORCHANGE" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            台数/线路回数
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbProjectItemCount" field="PROJECTITEMCOUNT"
                tablename="MBM_BIDPLANFIXORCHANGE" MaxLength="36" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            境内、外
        </td>
        <td class="td-r">
            <asp:RadioButtonList ID="rblFrontierInOrNot" runat="server" RepeatDirection="Horizontal"
                readonly="readonly" field="FRONTIERINORNOT" tablename="MBM_BIDPLANFIXORCHANGE"
                activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)">
                <asp:ListItem Value="0">境内</asp:ListItem>
                <asp:ListItem Value="1">境外</asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td class="td-l">
            省份、洲
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProvinceOrNot" Field="PROVINCEORNOT"
                readonly="readonly" class="kpms-textbox" tableName="MBM_BIDPLANFIXORCHANGE" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            地市（国家）
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtCityOrCountry" Field="CITYORCOUNTRY"
                readonly="readonly" class="kpms-textbox" tableName="MBM_BIDPLANFIXORCHANGE" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            建设性质<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlBuildType" field="BUILDTYPE" req="1"
                tablename="MBM_BIDPLANFIXORCHANGE" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">
            投标性质<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <asp:RadioButtonList ID="rblTenderCharacter" runat="server" RepeatDirection="Horizontal"
                req="1" field="TENDERCHARACTER" tablename="MBM_BIDPLANFIXORCHANGE" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)">
                <asp:ListItem Value="0">公开</asp:ListItem>
                <asp:ListItem Value="1">邀请</asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            投标文件递交时间
        </td>
        <td class="td-r">
            请以下三种递交时间选择其一即可
        </td>
    </tr>
    <tr>
        <td class="td-1">
            商务文件递交时间<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtBusinessdocSubmit" class="kpms-textbox-date"
                req="1" tablename="MBM_BIDPLANFIXORCHANGE" readonly="readonly" field="BUSINESSDOCSUBMIT"
                activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)" />
        </td>
        <td class="td-1">
            技术文件递交时间<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtTechnologydocSubmit" class="kpms-textbox-date"
                req="1" tablename="MBM_BIDPLANFIXORCHANGE" readonly="readonly" field="TECHNOLOGYDOCSUBMIT"
                activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)" />
        </td>
    </tr>
    <tr>
        <td class="td-1">
            投标报价递交时间<span class="req-star">*</span>
        </td>
        <td>
            <zhongsoft:XHtmlInputText runat="server" ID="txtBiddingDocSubmit" req="1"
                tablename="MBM_BIDPLANFIXORCHANGE" readonly="readonly" class="kpms-textbox-date"
                field="BIDDINGDOCSUBMIT" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)" />
           <%-- &nbsp;<font color="Red">如：yyyy-MM-ddHH:mm:ss</font>--%>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            投标文件递交地点<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbTbBidSubmitPlace" field="TBBIDSUBMITPLACE"
                tablename="MBM_BIDPLANFIXORCHANGE" MaxLength="512" req="1" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)"
                Width="98%"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            是否竞争性<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <asp:RadioButtonList ID="rblIsCompetition" runat="server" RepeatDirection="Horizontal"
                req="1" field="ISCOMPETITION" tablename="MBM_BIDPLANFIXORCHANGE" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)">
                <asp:ListItem Value="0">竞争性</asp:ListItem>
                <asp:ListItem Value="1">非竞争性</asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td class="td-l">
            接标时间<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtSplicingDateTime" req="1"
                tablename="MBM_BIDPLANFIXORCHANGE" readonly="readonly" class="kpms-textbox-date"
                field="SPLICINGDATETIME" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)" />
        </td>
        <td class="td-l">
            开标日期<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtStartBidDay" req="1"
                tablename="MBM_BIDPLANFIXORCHANGE" readonly="readonly" class="kpms-textbox-date"
                field="STARTBIDDAY" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            相关部门
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtRelevantDeptName" field="RELEVANTDEPTNAME"
                tablename="MBM_BIDPLANFIXORCHANGE" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                IsMutiple="true" EnableTheming="false" Writeable="true" ShowAttrs="name,UserCode"
                ResultForControls="{'hiRelevantDeptId':'id','txtRelevantDeptName':'RELEVANTDEPTNAME'}"
                PageUrl="~/Sys/OrgUsers/OrgSelector.aspx"></zhongsoft:LightObjectSelector>
            <input type="hidden" runat="server" id="hiRelevantDeptId" field="RELEVANTDEPTID"
                tablename="MBM_BIDPLANFIXORCHANGE" />
        </td>
        <td class="td-l">
            投标保证金（万元）<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbBailSum" CssClass="kpms-textbox-money"
                req="1" MaxLength="13" Style="text-align: right" regex="(^[1-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)"
                errmsg="金额小写必填填写数字，并且小数点前最多保留10位，小数点后最多保留2位" field="BAILSUM" tablename="MBM_BIDPLANFIXORCHANGE"
                activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            投标保证金递交方式<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlBidSecuritySumit" field="BIDSECURITYSUMIT"
                req="1" tablename="MBM_BIDPLANFIXORCHANGE" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)"
                onclick="IsTelegraph()">
                <asp:ListItem Value="电汇" Selected="True">电汇</asp:ListItem>
                <asp:ListItem Value="现金">现金</asp:ListItem>
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">
            招标代理单位
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtInviteUnitName" field="INVITEUNITNAME"
                tablename="MBM_BIDPLANFIXORCHANGE" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)"
                SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                IsMutiple="true" EnableTheming="false" Writeable="true" ShowAttrs="name,UserCode"
                ResultForControls="{'hiInviteUnitId':'id','txtInviteUnitName':'INVITEUNITNAME','txtBankName':'BANKNAME','txtBankAccount':'BANKACCOUNT'}"
                PageUrl="~/Sys/OrgUsers/OrgSelector.aspx"></zhongsoft:LightObjectSelector>
            <%--<input type="hidden" runat="server" id="hiInviteUnitId" field="INVITEUNITID" tablename="MBM_BIDPLANFIXORCHANGE" />--%>
        </td>
    </tr>
    <tr id="isBank">
        <td class="td-l">
            开户行
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtBankName" field="BANKNAME" tablename="MBM_BIDPLANFIXORCHANGE"
                class="kpms-textbox" readonly="readonly" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            账号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtBankAccount" field="BANKACCOUNT"
                tablename="MBM_BIDPLANFIXORCHANGE" class="kpms-textbox" readonly="readonly" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-m" colspan="6" height="25" style="font-weight: bold; text-align: center">
            相关文件
        </td>
    </tr>
    <tr>
        <td colspan="6" style="text-align: right">
            <asp:Button ID="btnUpload" runat="server" Text="上传相关资料" activestatus="(23.发起投标计划安排/变更流程)(23.修改投标计划安排/变更流程)"
                OnClick="btnAdd_Click" OnClientClick="return upLoadFiles()" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvList" runat="server" AllowPaging="true" UseDefaultDataSource="true"
                AutoGenerateColumns="false" DataKeyNames="FileId" OnRowCommand="gvList_RowCommand"
                ShowExport="true" OnExport="gvList_Export" OnRowDataBound="gvList_RowDataBound">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="文件名称">
                        <ItemTemplate>
                            <a runat="server" id="aFileName" style="text-decoration: underline; color: #0033FF;">
                                <%#Eval("FileName")%></a>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="删除">
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <input type="hidden" runat="server" id="hiFilePath" value='<%#Eval("FilePath") %>' />
                            <asp:LinkButton ID="lbDelete" runat="server" alt="" CommandName="DeleteData" OnClientClick="return confirm('确认要删除吗？');"
                                EnableTheming="false" CommandArgument='<%#Eval("FileId") %>'><img id="btDelete" title="删除" style="CURSOR: hand" src="../../Themes/Images/btn_dg_delete.gif" border="0"></asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiBIDPLANFIXORCHANGEID" field="BIDPLANFIXORCHANGEID"
    tablename="MBM_BIDPLANFIXORCHANGE" />
<script type="text/javascript">

    function initCustomerPlugin() {
        //验证正则表达式
        checkRegex();
        //验证正则表达式
        checkMaxLength();
    }

    function IsTelegraph() {
        var type = $('#<%=ddlBidSecuritySumit.ClientID%>').val();
        if (type == "电汇") {
            $("#isBank").show();
        }
        else {
            $("#isBank").hide();
        }
    }

    //上传附件
    function upLoadFiles() {
        showUploadForm($currBizId, "Form");
        return true;
    }
  
</script>
