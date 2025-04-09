<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WBSOfSpecialtyList.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.WBS.WBSOfSpecialtyList" %>
<tr>
    <td class="td-m" colspan="6">
        <b>WBS信息</b>
    </td>
</tr>
<tr>
    <td colspan="6">
        <asp:DataList runat="server" ID="dlWBS" OnItemDataBound="dlWBS_ItemDataBound" Width="100%">
            <ItemTemplate>
                <!-- 折叠-->
                <span flag="wbsSpan" id="spanTitle" style="cursor: pointer;">
                    <img src="../../Themes/Images/TreeImages/minus.gif" />
                    部门：<%#Eval("DeptName")%>专业：<%#Eval("SpecialtyName")%>
                    &nbsp;&nbsp;已有WBS（<asp:Label runat="server" ID="lbWbsNum" Text="0"></asp:Label>）个，
                    提出资料（<asp:Label runat="server" ID="lbOutFile" Text="0"></asp:Label>）项， 接受资料（<asp:Label
                        runat="server" ID="lbInFile" Text="0"></asp:Label>）项， 外部资料（<asp:Label runat="server"
                            ID="lbExteral" Text="0"></asp:Label>）项， 相关设备（<asp:Label runat="server" ID="lbEquip"
                                Text="0"></asp:Label>）个</span>
                <div flag="wbsDiv" id="divWbs">
                    <p>
                        模板中有<a class="aStyle" flag="wbsTemp" speid='<%#Eval("ParamSpecialtyID") %>'>WBS（
                            <asp:Label runat="server" ID="lbTempWbs" Text="0"></asp:Label>）供选择</a>， <a class="aStyle"
                                flag="outFileTemp" speid='<%#Eval("ParamSpecialtyID") %>'>提出资料（<asp:Label runat="server"
                                    ID="lbTempOutFile" Text="0"></asp:Label>）供选择</a>，<a class="aStyle" flag="inFileTemp"
                                        speid='<%#Eval("ParamSpecialtyID") %>'>接受资料（
                                        <asp:Label runat="server" ID="lbTempInFile" Text="0"></asp:Label>）供选择</a>，<a class="aStyle"
                                            flag="externalTemp" speid='<%#Eval("ParamSpecialtyID") %>'>外部资料（
                                            <asp:Label runat="server" ID="lbTempExteral" Text="0"></asp:Label>）供选择</a>，<a class="aStyle"
                                                flag="equipTemp" speid='<%#Eval("ParamSpecialtyID") %>'>设备（
                                                <asp:Label runat="server" ID="lbTempEquip" Text="0"></asp:Label>）供选择</a>&nbsp;
                        <!-- 不可以添加服务器控件，否则翻页后无法显示-->
                        <a class="subtoolbarlink" flag="selectWbs" speid='<%#Eval("ParamSpecialtyID") %>'><span>
                            <img runat="server" id="imgSelect" src="~/Themes/Images/look-up.gif" alt="选择历史项目任务"
                                width="16" height="16" />选择历史项目任务</span></a> <a class="subtoolbarlink" flag="addWbs"
                                    speid='<%#Eval("ParamSpecialtyID") %>' deptid='<%#Eval("DeptID")%>'><span>
                                        <img runat="server" id="imgAdd" src="~/Themes/Images/btn_add.gif" alt="新建任务" width="16"
                                            height="16" />新建任务</span></a>
                        <input type="hidden" runat="server" id="hiSpeId" value='<%#Eval("ParamSpecialtyID") %>' />
                    </p>
                    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="true"
                        PageSize="10" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                        DataKeyNames="WBSID" UseDefaultDataSource="true" OnRowDataBound="gvList_RowDataBound"
                        OnRowCommand="gvList_RowCommand">
                        <Columns>
                            <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </zhongsoft:LightTemplateField>
                            <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="任务编号">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField DataField="WBSName" HeaderText="任务名称">
                            </zhongsoft:LightBoundField>
                            <%--<zhongsoft:LightBoundField DataField="SerialCoe" HeaderText="成品号（校验号）">
                        </zhongsoft:LightBoundField>--%>
                            <zhongsoft:LightBoundField DataField="WBSType" HeaderText="任务类别">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField DataField="WBSWay" HeaderText="任务作业（系统）方式">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField DataField="WBSState" HeaderText="任务状态">
                            </zhongsoft:LightBoundField>
                            <zhongsoft:LightBoundField DataField="Memo" HeaderText="来源">
                            </zhongsoft:LightBoundField>
                            <%--<zhongsoft:LightBoundField DataField="WorkDayOfTrade" HeaderText="行业定额" ItemStyle-HorizontalAlign="Right">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="WorkDayOfEnterprise" HeaderText="企业定额" ItemStyle-HorizontalAlign="Right">
                        </zhongsoft:LightBoundField>--%>
                            <asp:TemplateField HeaderText="查看" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false" OnClientClick="return false">
                                    <img alt="img" src="../../Themes/Images/btn_dg_view.gif" 
                                    onclick="wbsItem('1','<%# Eval("WBSID") %>');"/>
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="编辑" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtnEdit" runat="server" EnableTheming="false" OnClientClick="return false">
                                    <img alt="img" src="../../Themes/Images/btn_dg_edit.gif" 
                                    onclick="wbsItem('3','<%# Eval("WBSID") %>');"/>
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del"
                                        CommandArgument='<%# Eval("WBSID") %>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="../../Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </zhongsoft:LightTemplateField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </td>
</tr>
<tr>
    <td class="td-m" colspan="6">
    </td>
</tr>
<asp:Button runat="server" ID="btnBindWbs" OnClick="btnBindWbs_Click" Visible="false" />
<script type="text/javascript">

    function initWBSGenerate() {

        //todo初始化各专业wbs列表的显隐

        //控制显隐
        var $WbsSpan = $('[flag="wbsSpan"]');
        //var $WbsDiv = $('[flag="wbsDiv"]');

        var wbsSpanLen = $WbsSpan.length;
        if (wbsSpanLen > 0) {
            for (var i = 0; i < wbsSpanLen; i++) {
                $WbsSpan.eq(i).bind('click', function () {
                    //查找当前元素的下一个元素
                    var wbsDiv = $(this).next('[flag="wbsDiv"]');
                    //wbsDiv.slideToggle();导致hidden判断不起作用
                    //控制列表显隐、图片切换
                    if (wbsDiv.is(':hidden')) {
                        wbsDiv.show();
                        $(this).children('img').attr('src', '../../Themes/Images/TreeImages/minus.gif');
                    }
                    else {
                        wbsDiv.hide();
                        $(this).children('img').attr('src', '../../Themes/Images/TreeImages/plus.gif');
                    }
                });
            }
        }

        //选择任务模板
        $('[flag="wbsTemp"]').each(function () {
            var speId = $(this).attr('speId');
            $(this).bind('click', function () {
                wbsTemp(speId);
            });
        });

        //选择提出资料模板
        $('[flag="outFileTemp"]').each(function () {
            var speId = $(this).attr('speId');
            $(this).bind('click', function () {
                //                addWbs(speId);
            });
        });

        //选择接收资料模板
        $('[flag="inFileTemp"]').each(function () {
            var speId = $(this).attr('speId');
            $(this).bind('click', function () {
                //                addWbs(speId);
            });
        });

        //选择外部资料模板
        $('[flag="externalTemp"]').each(function () {
            var speId = $(this).attr('speId');
            $(this).bind('click', function () {
                //                addWbs(speId);
            });
        });

        //选择设备模板
        $('[flag="equipTemp"]').each(function () {
            var speId = $(this).attr('speId');
            $(this).bind('click', function () {
                //                addWbs(speId);
            });
        });


        //新建WBS任务
        $('[flag="addWbs"]').each(function () {
            var speId = $(this).attr('speId');
            var deptId = $(this).attr('deptId');
            $(this).bind('click', function () {
                addWbs(speId, deptId);
            });
        });

        //选择历史工程WBS任务
        $('[flag="selectWbs"]').each(function () {
            var speId = $(this).attr('speId');
            $(this).bind('click', function () {
                selectWbs(speId);
            });
        });
    }

    //新建wbs任务
    function addWbs(speId, deptId) {
        var json = { actionType: 2, OrganizationID: '<%=OrganizationID %>', ExecSpecialtyID: speId, DeptID: deptId, WBSSplitFormID: '<%=WBSSplitFormID %>' };
        var url = buildQueryUrl('/EPMS/List/WBS/WBSEditor.aspx', json);
        showDivDialog(url, "", 1050, 600, bindWbs);
        return false;
    }

    //wbs任务详细
    function wbsItem(actionType, bizId) {
        var json = { actionType: actionType, bizId: bizId, WBSSplitFormID: '<%=WBSSplitFormID %>' };
        var url = buildQueryUrl('/EPMS/List/WBS/WBSDetailEditor.aspx', json);
        var callBack = null;
        if (actionType == '3') {
            callBack = bindWbs;
        }
        showDivDialog(url, "", 1050, 600, callBack);
        return false;
    }

    //选择wbs任务模板
    function wbsTemp(speId) {
        var json = { OrganizationID: '<%=OrganizationID %>', ExecSpecialtyID: speId, ProjectTemplateID: '<%=ProjectTemplateID %>', WBSSplitFormID: '<%=WBSSplitFormID %>' };
        var url = buildQueryUrl('/EPMS/List/Sys/RelateWBSTemplate.aspx', json);
        showDivDialog(url, "", 1050, 600, bindWbs);
        return false;
    }

    //选择历史项目WBS任务
    function selectWbs(speId) {
        var json = { OrganizationID: '<%=OrganizationID %>', ExecSpecialtyID: speId, WBSSplitFormID: '<%=WBSSplitFormID %>' };
        var url = buildQueryUrl('/EPMS/Obsolete/OldProjectWBSSelector.aspx', json);
        showDivDialog(url, "", 1050, 600, bindWbs);
        return false;
    }

    //绑定WBS列表
    function bindWbs() {
        <%=Page.ClientScript.GetPostBackEventReference(this.btnBindWbs,"")%>;
    }

</script>
