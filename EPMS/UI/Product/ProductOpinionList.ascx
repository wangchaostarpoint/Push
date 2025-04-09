<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductOpinionList.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Product.ProductOpinionList" %>
<div id="divBars" style="width: 100%;">
    <table class="tz-table">
        <tr id="trleader">
            <td class="flexible" onclick="openDetail('opinionListDetail')">
                校审意见清单&nbsp;<img src="../../themes/images/lright.png" />
            </td>
            <td>
                <div id="divSystemBar" class="subtoolbarbg" runat="server" style="float: left;">
                    <asp:DataList ID="dlRoleList" runat="server" EnableViewState="true" GridLines="Both"
                        RepeatDirection="Horizontal" BorderWidth="0" CellPadding="0" CellSpacing="0"
                        ItemStyle-BorderWidth="0" OnItemCommand="dlRoleList_ItemCommand">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnRole" CssClass="subtoolbarlink" EnableTheming="false"
                                CommandArgument='<%#Eval("RoleName") %>' CommandName="role">
                                <asp:Label ID="lbRole" runat="server" Text='<%#Eval("RoleName")+"（"+Eval("OpinionNum")+"）" %>'></asp:Label>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
                <div id="divCustomBar" style="float: left;" class="subtoolbarbg" runat="server">
                    <asp:LinkButton runat="server" ID="lbtnOpinionEdit" CssClass="subtoolbarlink" EnableTheming="false"
                        ToolTip="点击您可以编辑、添加校审意见" OnClientClick="return ProductEditOpinion();">
                        <span>
                            <img runat="server" id="imgOk" src="~/Themes/Images/btn_editor.gif" alt="添加或修改校审意见"
                                width="16" height="16" />添加/修改意见</span>
                    </asp:LinkButton>
                </div>
                <asp:LinkButton runat="server" ID="lbtnUpdateState" CssClass="subtoolbarlink" EnableTheming="false"
                    ToolTip="点击您可以编辑、添加校审意见" Visible="false" OnClick="lbtnUpdateState_Click" OnClientClick="return showUpdateInfo()">
                    <span runat="server" id="spanUpdate">
                        <img runat="server" id="imgUpdate" src="~/Themes/Images/btn_editor.gif" alt="批量更新列表中选择成品的执行状态"
                            width="16" height="16" />批量更新为已执行</span>
                </asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table width="100%" id="opinionListDetail">
                    <tr>
                        <td>
                            <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvOpinionList" AllowPaging="True"
                                PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                                EmptyDataText="没有校审意见" DataKeyNames="VerifyOpinionID" UseDefaultDataSource="true"
                                OnRowCommand="gvOpinionList_RowCommand" OnRowDataBound="gvOpinionList_RowDataBound"
                                OnExport="gvOpinionList_Export">
                                <Columns>
                                    <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" Visible="false">
                                    </zhongsoft:LightCheckField>
                                    <zhongsoft:LightTemplateField ItemStyle-Width="30px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightBoundField DataField="RoleName" HeaderText="校审角色" ItemStyle-Width="60px" />
                                    <zhongsoft:LightBoundField DataField="VerifyPost" HeaderText="校审岗位" ItemStyle-Width="60px"
                                        Visible="false" />
                                    <zhongsoft:LightBoundField DataField="ProductCode" HeaderText="校审成品" ItemStyle-Width="230px" />
                                    <zhongsoft:LightBoundField DataField="VerifyOpinion" HeaderText="校审意见" Visible="false" />
                                    <zhongsoft:LightTemplateField HeaderText="校审意见" ItemStyle-Width="260px">
                                        <ItemTemplate>
                                            <zhongsoft:LightTextBox ID="tbVerifyOpi" runat="server" class="kpms-textbox" MaxLength="1024"
                                                Text='<%# DataBinder.Eval(Container.DataItem, "VerifyOpinion") %>' CssClass="kpms-textarea"
                                                EnableTheming="false" TextMode="MultiLine" Rows="3" Width="260px">
                                            </zhongsoft:LightTextBox>
                                            <div style="word-break: break-all !important; white-space: normal !important;width: 260px">
                                                <asp:Label ID="lbVerifyOpinion" Text='<%# Eval("VerifyOpinion")%>' ToolTip='<%#Eval("VerifyOpinion") %>'
                                                    runat="server"></asp:Label></div>
                                            <input type="hidden" runat="server" id="hiProductID" value='<%#Eval("ProductID") %>' />
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <%--<zhongsoft:LightBoundField DataField="MistakeType" HeaderText="差错性质" ItemStyle-Width="60px" />--%>
                                    <zhongsoft:LightTemplateField HeaderText="差错性质" ItemStyle-Width="60px">
                                        <ItemTemplate>
                                            <asp:RadioButtonList ID="rbMistakeType" runat="server" RepeatDirection="Vertical"
                                                RepeatColumns="2" CssClass="kpms-radio">
                                            </asp:RadioButtonList>
                                            <asp:Label ID="lbMistakeType" Text='<%#Eval("MistakeType") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="修改情况" ItemStyle-Width="60px">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lbExcutionState" Width="60px"></asp:Label>
                                            <asp:RadioButtonList ID="rblExcutionState" runat="server" RepeatDirection="Horizontal"
                                                Width="60px" CssClass="kpms-radio" Enabled="false" content="state">
                                                <asp:ListItem Value="1">已执行</asp:ListItem>
                                                <asp:ListItem Value="0">不执行</asp:ListItem>
                                            </asp:RadioButtonList>
                                            <div style="word-break: break-all !important; white-space: normal !important; width: 60px">
                                                <zhongsoft:LightTextBox ID="tbMemo" Width="100%" runat="server" TextMode="MultiLine"
                                                    Enabled="false" CssClass="kpms-textarea" EnableTheming="false" maxtext="256"
                                                    Height="10px" content="reason"></zhongsoft:LightTextBox></div>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="质量<br/>判定" ItemStyle-Width="30px">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="ckbIsQuality" runat="server" Text="是"></asp:CheckBox>
                                            <asp:Label ID="lbIsQuality" runat="server"><%#Eval("IsQuality") == "1" ? "是" : "否"%></asp:Label>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightBoundField DataField="PutUserName" HeaderText="提出人" ItemStyle-Width="30px" />
                                    <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="DeleteData"
                                                OnClientClick='return confirm("确定要删除吗？");' CommandArgument='<%#Eval("VerifyOpinionID") %>'>
                                <img alt="删除" title="删除" src="../../Themes/Images/btn_dg_delete.gif"                                     />
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </zhongsoft:LightPowerGridView>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>
<%--<div id="opinionListDetail">
</div>--%>
<asp:Button ID="btnProductRefresh" runat="server" content="Refresh" Style="display: none"
    OnClick="btnProductRefresh_Click" />
<script type="text/javascript">
    $gridCheckedClientID = "<%=gvOpinionList.CheckedClientID %>";
    function ProductEditOpinion() {
        var opinionType = '<%=OpinionType %>'
        if (opinionType == "MutualFile") {
            var json = { action: 2, bizId: '<%=BizId %>', RoleName: '<%=RoleName %>', VerifyPost: '<%=VerifyPost %>', actiontype: 3 };
            //校审意见类型传参
            var opinionType = '<%=OpinionType %>';
            if (opinionType != '') {
                $.extend(json, { OpinionType: opinionType });
            }
            var url = buildQueryUrl('EPMS/List/Product/ProductOpinionList.aspx', json);
            showDivDialog(encodeURI(url), null, 1000, 800, afterOpinionEditor);
            return false;
        }
        else {

            var roleName = '<%=RoleName %>';
            if (typeof (getZGRoleName) == "function" && roleName == "") {
                roleName = getZGRoleName();
            }
            var json = { action: 4, bizId: '<%=BizId %>', RoleName: roleName, VerifyPost: '<%=VerifyPost %>' };
            //校审意见类型传参
            var opinionType = '<%=OpinionType %>';
            if (opinionType != '') {
                $.extend(json, { OpinionType: opinionType });
            }
            var url = buildQueryUrl('EPMS/List/Product/ProductDetailEditor.aspx', json);
            showDivDialog(encodeURI(url), null, 1200, 600, afterOpinionEditor);
            return false;
        }
    }

    function afterOpinionEditor() {
        $("#<%=btnProductRefresh.ClientID %>").click();
    }

    //显示
    function showUpdateInfo() {
        var updateNum = getCheckNum();
        if (updateNum < 1) {
            alert("请勾选意见信息");
            return false;
        }
        return true;
    }

    //获取选中的意见数量
    function getCheckNum() {
        var checkedValue = $("#" + $gridCheckedClientID).val().length;
        var updateNum = 0;
        if (checkedValue > 1) {
            checkedValue = $("#" + $gridCheckedClientID).val().substring(1, checkedValue - 1);
            if (checkedValue != "")
                updateNum = checkedValue.split(",").length;
        }
        return updateNum;
    }

    //是否选择了执行意见
    function checkHasChooseExeState() {
        var isAllSelected = true;
        $("#<%=gvOpinionList.ClientID %> [id$=rblExcutionState]").each(function () {
            var isSelected = false;
            $(this).find("input").each(function () {
                if ($(this)[0].checked) {
                    isSelected = true;
                }
            })
            if (!isSelected) {
                isAllSelected = false;
            }
        });
        return isAllSelected;
    }


    //是否执行意见为“不执行”时，是否填写原因
    function checkHasNoExeReason() {
        var isAllWrite = true;
        var isWrite = true;
        var $State = $('#<%=gvOpinionList.ClientID %> [content="state"]');
        var $Reason = $('#<%=gvOpinionList.ClientID %> [content="reason"]');
        var len = $Reason.length;
        for (var i = 0; i < len; i++) {
            if ($Reason.eq(i).val().trim() == '' && $State.eq(i).find('input:checked').val() == "0") {
                isWrite = false;
            }
            if (!isWrite) {
                isAllWrite = false;
            }
        }
        return isAllWrite;
    }

</script>
