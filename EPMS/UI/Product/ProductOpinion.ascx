<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductOpinion.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Product.ProductOpinion" %>
<style>
    .closeleft
    {
        width: 5px;
        background: #22334d url(../../themes/custom/images/closeleftbg1.png) center no-repeat;
        background-position-y: 50%;
        cursor: pointer;
    }
</style>
<div id="divBars" style="width: 100%;">
    <table class="tz-table">
        <tr id="trleader">
            <td class="flexible" onclick="openDetail('opinionListDetail')">
                校审意见清单&nbsp;<img src="../../themes/images/lright.png" />
            </td>
        </tr>
        <tr id="opinionListDetail">
            <td>
                <table width="100%">
                    <tr>
                        <td rowspan="2" valign="top" style="width: 180px;" id="tdLeft">
                            <!--成品树-->
                            <asp:Label runat="server" ID="lbRoll" Visible="false"></asp:Label>
                            检索
                            <zhongsoft:LightTextBox runat="server" ID="tbProduct" ToolTip="输入成品编号、名称自动筛选" Width="75%"
                                OnTextChanged="tbProduct_TextChanged" AutoPostBack="true"></zhongsoft:LightTextBox>
                            <div style="max-height: 500px; overflow-y: auto;">
                                <asp:CheckBoxList runat="server" ID="cblProduct" AutoPostBack="true" OnSelectedIndexChanged="cblProduct_SelectedIndexChanged">
                                </asp:CheckBoxList>
                            </div>
                        </td>
                        <td rowspan="2" onclick="showLeft()" style="width: 6px;">
                            <div class="closeleft">
                            </div>
                            <script>
                                function showLeft() {
                                    $("#tdLeft").toggle(null, null, 500);
                                }
                            </script>
                        </td>
                        <td valign="top" style="height: 30px;" id="tdToolbar">
                            <div id="divSystemBar" class="subtoolbarbg" runat="server" style="float: left; margin-bottom: 0">
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
                            <!--添加意见、批量已执行功能隐藏-->
                            <div id="divCustomBar" style="float: left; display: none;" class="subtoolbarbg" runat="server">
                                <asp:LinkButton runat="server" ID="lbtnOpinionEdit" CssClass="subtoolbarlink" EnableTheming="false"
                                    ToolTip="点击您可以编辑、添加校审意见" OnClientClick="return ProductEditOpinion();">
                                    <span>
                                        <img runat="server" id="imgOk" src="~/Themes/Images/btn_editor.gif" alt="添加校审意见"
                                            width="16" height="16" />添加意见</span>
                                </asp:LinkButton>
                            </div>
                            <asp:LinkButton runat="server" ID="lbtnUpdateState" CssClass="subtoolbarlink" EnableTheming="false"
                                ToolTip="点击您可以编辑、添加校审意见" OnClick="lbtnUpdateState_Click" OnClientClick="return showUpdateInfo()"
                                Visible="false">
                                <span runat="server" id="spanUpdate">
                                    <img runat="server" id="imgUpdate" src="~/Themes/Images/btn_editor.gif" alt="批量更新列表中选择成品的执行状态"
                                        width="16" height="16" />批量更新为已执行</span>
                            </asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" id="tdList">
                            <!--意见编辑区域-->
                            <table width="100%" runat="server" id="tbOpinion">
                                <tr>
                                    <td class="td-l" style="width: 10%">
                                        校审意见<span class="req-star">*</span>
                                    </td>
                                    <td class="td-r">
                                        <zhongsoft:LightTextBox ID="tbVerifyOpinion" runat="server" TextMode="MultiLine"
                                            ToolTip="请输入校审意见" CssClass="kpms-textarea" EnableTheming="false" Height="20px"
                                            Width="100%" maxtext="1024"></zhongsoft:LightTextBox>
                                    </td>
                                    <td class="td-l" style="width: 10%">
                                        差错性质<span class="req-star">*</span>
                                    </td>
                                    <td class="td-r" style="width: 20%">
                                        <asp:RadioButtonList ID="rblMistakeType" runat="server" RepeatDirection="Vertical"
                                            RepeatColumns="2" CssClass="kpms-radio" ToolTip="请选择差错性质">
                                        </asp:RadioButtonList>
                                    </td>
                                    <td class="td-r" style="width: 10%">
                                        <asp:LinkButton runat="server" ID="ibtnSave" OnClick="ibtnSave_Click" OnClientClick="return checkProduct();">
                                <span>保存</span>
                                        </asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                            <!--意见列表区域，只能修改自己的数据哦-->
                            <div style="max-height: 470px; overflow-y: auto;">
                                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvOpinionList" AllowPaging="True"
                                    PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                                    EmptyDataText="没有校审意见" DataKeyNames="VerifyOpinionID" UseDefaultDataSource="true"
                                    OnRowCommand="gvOpinionList_RowCommand" OnRowDataBound="gvOpinionList_RowDataBound"
                                    OnExport="gvOpinionList_Export">
                                    <Columns>
                                        <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="30px" Visible="false">
                                        </zhongsoft:LightCheckField>
                                        <zhongsoft:LightTemplateField ItemStyle-Width="30px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex+1 %>
                                            </ItemTemplate>
                                        </zhongsoft:LightTemplateField>
                                        <zhongsoft:LightBoundField DataField="RoleName" HeaderText="校审角色" ItemStyle-Width="30px" />
                                        <%--<zhongsoft:LightBoundField DataField="VerifyPost" HeaderText="校审岗位" ItemStyle-Width="30px" />--%>
                                        <zhongsoft:LightBoundField DataField="ProductCode" HeaderText="校审成品" ItemStyle-Width="180px"
                                            MaxLength="30" />
                                        <zhongsoft:LightBoundField DataField="VerifyOpinion" HeaderText="校审意见" Visible="false" />
                                        <zhongsoft:LightTemplateField HeaderText="校审意见" ItemStyle-Width="210px">
                                            <ItemTemplate>
                                                <%--<div style="word-break: break-all !important; white-space: normal !important; width: 150px"
                                                            title='<%#Eval("VerifyOpinion")%>'>
                                                            <%# gvOpinionList.GetSubString(Eval("VerifyOpinion"), 30)%>
                                                        </div>--%>
                                                <div style="word-break: break-all !important; white-space: normal !important; width: 210px;">
                                                    <asp:Label ID="lbVerifyOpinion" Text='<%# Eval("VerifyOpinion")%>' runat="server"></asp:Label></div>
                                                <zhongsoft:LightTextBox ID="tbOpinion" runat="server" TextMode="MultiLine" ToolTip="请输入校审意见"
                                                    CssClass="kpms-textarea" Text='<%#Eval("VerifyOpinion") %>' EnableTheming="false"
                                                    Width="95%" maxtext="1024"></zhongsoft:LightTextBox>
                                            </ItemTemplate>
                                        </zhongsoft:LightTemplateField>
                                        <%--<zhongsoft:LightBoundField DataField="MistakeType" HeaderText="差错性质" ItemStyle-Width="60px" />--%>
                                        <zhongsoft:LightTemplateField HeaderText="差错性质" ItemStyle-Width="60px">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lbMistake" Text='<%#Eval("MistakeType") %>'></asp:Label>
                                                <asp:RadioButtonList ID="rblMistakeTypeList" runat="server" RepeatDirection="Vertical"
                                                    RepeatColumns="1" ToolTip="请选择差错性质">
                                                </asp:RadioButtonList>
                                            </ItemTemplate>
                                        </zhongsoft:LightTemplateField>
                                        <zhongsoft:LightBoundField HeaderText="添加时间" DataField="CreateDate" HtmlEncode="false"
                                            DataFormatString="{0:yyyy-MM-dd<br/>HH:mm}">
                                        </zhongsoft:LightBoundField>
                                        <zhongsoft:LightTemplateField HeaderText="修改情况" ItemStyle-Width="50px">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lbExcutionState" content="state"></asp:Label>
                                                <asp:RadioButtonList ID="rblExcutionState" runat="server" RepeatDirection="Horizontal"
                                                    RepeatColumns="1" Width="60px" content="state">
                                                    <asp:ListItem Value="1">已执行</asp:ListItem>
                                                    <asp:ListItem Value="0">不执行</asp:ListItem>
                                                </asp:RadioButtonList>
                                                <zhongsoft:LightTextBox ID="tbMemo" Width="100%" runat="server" TextMode="MultiLine"
                                                    CssClass="kpms-textarea" EnableTheming="false" maxtext="256" Height="10px" Text='<%#Eval("Memo")%>'
                                                    content="reason"></zhongsoft:LightTextBox>
                                                <div style="word-break: break-all !important; white-space: normal !important; width: 60px">
                                                    <asp:Label runat="server" ID="lbMemo" Text='<%#Eval("Memo")%>'></asp:Label>
                                                </div>
                                            </ItemTemplate>
                                        </zhongsoft:LightTemplateField>
                                        <zhongsoft:LightTemplateField HeaderText="质量<br/>判定" ItemStyle-Width="30px">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="cbIsQuality" runat="server" ToolTip="如果校审意见较重要，具有借鉴意义，请选中该项"></asp:CheckBox>
                                                <asp:Label runat="server" ID="lbIsQuality"><%#Eval("IsQuality").ToString()=="1"?"是":"否"%></asp:Label>
                                            </ItemTemplate>
                                        </zhongsoft:LightTemplateField>
                                        <zhongsoft:LightBoundField DataField="PutUserName" HeaderText="提出人" HeaderStyle-Width="30px" />
                                        <asp:TemplateField HeaderText="保存" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="lbtnSave" EnableTheming="false" CommandName="SaveData"
                                                    Visible="false" key='<%#Eval("VerifyOpinionID") %>' OnClick="lbtnSave_Click">
                                <img alt="保存" title="保存" src="../../Themes/Images/btn_save.gif"                                     />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <zhongsoft:LightTemplateField HeaderText="删除">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="lbtnDel" CommandName="del" EnableTheming="false"
                                                    Visible="false" OnClientClick="return confirm('确定删除吗？')" CommandArgument='<%# Eval("VerifyOpinionID")%>'>
                                                    <img id="Img1" src="~/Themes/Images/btn_dg_delete.gif" runat="server" />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </zhongsoft:LightTemplateField>
                                    </Columns>
                                </zhongsoft:LightPowerGridView>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>
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
            showDivDialog(encodeURI(url), null, 1200, 600, afterOpinionEditor);
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

    function checkProduct() {
        var len = $('#<%=cblProduct.ClientID %> input:checked').length;
        if (len == 0) {
            alert('请先选择成品，再保存意见！');
            return false;
        }
        else {
            var content = $("#<%=tbVerifyOpinion.ClientID %>").val().trim();
            var type = $("#<%=rblMistakeType.ClientID %> input[type='radio']:checked").val();
            if (content == '' || content == undefined) {
                alert("请输入校审意见！");
                return false;
            }
            else if (type == '' || type == undefined) {
                alert("请选择差错性质");
                return false;
            }
            return true;
        }
    }

    //是否执行意见为“不执行”时，是否填写原因
    function checkNoExeReason() {
        var isAllWrite = true;
        var isWrite = true;
        //需要保证二者的数量一致，否则对应不上，判断就会有问题
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

    //控制工具栏高度，解决左侧高度大于右侧高度，工具栏高度变高的样式问题
    function initOpinionTdHeight() {
        $('#tdList').height($('#tdLeft').height() - 30);
        $('.closeleft').height($('#tdList').height());
    }

</script>
