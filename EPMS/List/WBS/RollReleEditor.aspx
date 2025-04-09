<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RollReleEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.WBS.RollReleEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" Title="关联" %>

<%@ Register Src="~/EPMS/UI/WBS/FileItemList.ascx" TagName="FileItemList" TagPrefix="uc3" %>
<%--<%@ Register Src="../../UI/WBS/ICMInterfaceList.ascx" TagName="ICMList" TagPrefix="uc4" %>--%>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" width="100%">
        <tr>
            <td class="flexible" colspan="6">（内部接口）专业间接收资料
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <uc3:FileItemList ID="inFile" runat="server" WBSType="内部专业间提资" WBSTypeID="1" CallType="1"
                    IsShowAllDownload="true" AddFileBtnName="添加接收资料" />
            </td>
        </tr>
        <tr id="trIcmFile" runat="server">
            <td class="flexible" colspan="6">（外部接口）核电ICM清单
            </td>
        </tr>
        <tr>
            <td>
                <%--<uc4:ICMList ID="ICMList" runat="server" />--%>
            </td>
        </tr>
        <tr id="trExternalFile" runat="server">
            <td class="flexible" colspan="6">（外部接口）业主、厂家资料
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <uc3:FileItemList ID="externalFile" runat="server" WBSType="外部接口资料接收" WBSTypeID="2"
                    CallType="3" AddFileBtnName="添加关联资料" IsShowAllDownload="true" />
            </td>
        </tr>
        <tr>
            <td class="flexible" colspan="6">关联卷册
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <span style="float: right;">
                    <asp:LinkButton runat="server" ID="lbtnSelFile" CssClass="subtoolbarlink" EnableTheming="false" OnClientClick="return selReleWBS();">
                        <span>
                            <img runat="server"  src="~/Themes/Images/btn_add.gif" alt="添加关联卷册" width="16"  height="16" />添加关联卷册
                        </span>
                    </asp:LinkButton>
                </span>
                <zhongsoft:LightPowerGridView Width="100%" AllowPaging="True" PageSize="10" ID="gvReleRoll"
                    runat="server" AllowSorting="true" AutoGenerateColumns="False" ShowExport="true"
                    DataKeyNames="WBSState,ExtendedAttribute,PreOrPost,WBSOfReleID" UseDefaultDataSource="true" OnRowDataBound="gvReleRoll_RowDataBound"
                    BindGridViewMethod="BindGrid" OnRowCommand="gvReleRoll_RowCommand">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1%>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="前置/后置" ItemStyle-Width="40px" SortExpression="FrontOrBack">
                            <ItemTemplate>
                                <asp:RadioButtonList ID="rdblFrontOrBack" runat="server" AutoPostBack="true"
                                    OnSelectedIndexChanged="rdblFrontOrBack_SelectedIndexChanged" RepeatDirection="Horizontal">
                                    <asp:ListItem Text="前置" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="后置" Value="1"></asp:ListItem>
                                </asp:RadioButtonList>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <asp:BoundField DataField="WBSCode" HeaderText="卷册编号" />
                        <asp:BoundField DataField="WBSName" HeaderText="卷册名称" />
                        <zhongsoft:LightBoundField DataField="PlanCompleteTime" HeaderText="计划完成" DataFormatString="{0:yyyy-MM-dd}" SortExpression="PlanCompleteTime">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="关联" ItemStyle-HorizontalAlign="Center"
                            HeaderStyle-Width="40px">
                            <ItemTemplate>
                                <table width="100px">
                                    <tr>
                                        <td width="65px"><span wbsreleinfo='<%#Eval("WBSID") %>' style="float: left"></span>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="lbtnRele" runat="server" EnableTheming="false" ForeColor="Blue" ToolTip="关联" OnClientClick='<%# String.Format("return releItem(1,\"{0}\")",Eval("WBSID")) %>'>
                                            关联
                                            </asp:LinkButton></td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField DataField="FactCompleteTime" HeaderText="实际完成" DataFormatString="{0:yyyy-MM-dd}">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField HeaderText="卷册状态">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="ExecSpecialtyName" HeaderText="专业">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="WBSOwnerName" HeaderText="卷册负责人">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="校审单" ItemStyle-Width="40px">
                            <ItemTemplate>
                                <a verifyinfo='<%#Eval("WBSID") %>' style="color: blue">查看</a>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField DataField="CreateUserName" HeaderText="创建者">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="CreateDate" HeaderText="创建日期" DataFormatString="{0:yyyy-MM-dd}">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del"
                                    CommandArgument='<%# Eval("WBSOfReleID") %>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="<%=WebAppPath %>/Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" tablename="EPMS_WBSEntity" field="WBSName" id="hiWBSName" />
    <input type="hidden" runat="server" tablename="EPMS_WBSEntity" field="WBSCode" id="hiWBSCode" />
    <input type="hidden" runat="server" tablename="EPMS_WBSEntity" field="OrganizationID" id="hiOrganizationID" />
    <input type="hidden" runat="server" tablename="EPMS_WBSEntity" field="ExecSpecialtyID" id="hiExecSpecialtyID" />
    <input type="hidden" runat="server" id="hiFileXML" />
    <asp:Button runat="server" ID="btnBindInFile" OnClick="btnBindInFile_Click" Visible="false" />
    <asp:Button runat="server" ID="btnBindExternalFile" OnClick="btnBindExternalFile_Click" Visible="false" />
    <asp:Button runat="server" ID="btnSelReleRoll" OnClick="btnSelReleRoll_Click" Visible="false" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            getWbsReleInfo();
            getVerifyForm();
        }

        //根据业务类型确定后台调用
        function initCallBack(callType) {
            if (callType == "1") {
                //输入资料
                return bindInFile;
            } else if (callType == "3") {
                //外部资料
                return bindExternalFile;
            }
            else {
                return bindWbs;
            }
        }

        function bindInFile() {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnBindInFile,"")%>;
        }

        function bindExternalFile() {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnBindExternalFile,"")%>;
        }

        //选择输入资料
        function selInFile(callType, orgId) {
            var param = new InputParamObject("m");
            var type = "内部专业间提资";
            if (callType == "1") {
                type = "<%= DAL.EPMS.WBSType.内部专业间提资.ToString() %>";
                var filter = { OrganizationID: orgId, TypeId: type };
                getFileItem('<%=hiFileXML.ClientID %>', param, filter, bindInFile);
            }
            else if (callType == "3") {
                //外部资料
                type = "<%= DAL.EPMS.WBSType.外部接口资料接收.ToString() %>";
                var filter = { OrganizationID: orgId, TypeId: type };
                getFileItem('<%=hiFileXML.ClientID %>', param, filter, bindExternalFile);
            }
            return false;
        }

        function selReleWBS() {
            var param = new InputParamObject("m");

            var filter = { OrganizationID: "<%=OrganizationID %>", TypeId: "13" };
            getWBS('<%=hiFileXML.ClientID %>', param, filter, selReleWBSCallBack);

            return false;
        }

        function selReleWBSCallBack(re) {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnSelReleRoll,"")%>;
        }

        function releItem(actionType, bizId) {
            var json = { actionType: actionType, bizId: bizId };
            if (parseBool('<%= IsOnlyView%>')) {
                json = { actionType: actionType, bizId: bizId, isOnlyView: 1 };
            }
            var url = buildQueryUrl('/EPMS/List/WBS/RollReleEditor.aspx', json);
            showDivDialog(url, "", 1000, 600, null);
            return false;
        }

        function getWbsReleInfo() {
            var $ids = "";
            $("#<%=gvReleRoll.ClientID %> span[wbsreleinfo]").each(function () {
                $ids += $(this).attr("wbsreleinfo") + "|";
            });
            $.post(buildQueryUrl("/EPMS/List/ProjectData/ProjectRollMaintain.aspx", null),
                { asyfunc: "GetWbsReleInfo", wbsIdList: $ids, organizationID:'<%=OrganizationID%>' },
                function (res) {

                    var $l = eval('(' + res + ')');
                    $("#<%=gvReleRoll.ClientID %> span[wbsreleinfo]").each(function () {
                        $(this).html("内" + 0 + "条;" + "外" + 0 + "条");
                        var $wbsID = $(this).attr("wbsreleinfo");
                        var $div = $("#<%=gvReleRoll.ClientID %>").find("[flag=" + $wbsID + "]");
                        for (var i = 0; i < $l.length; i++) {
                            var $id = $l[i][0];
                            var $tzInfo = $l[i][1];
                            var $wzInfo = $l[i][2];
                            if ($wbsID == $id) {
                                $(this).html("内" + $tzInfo + "条;" + "外" + $wzInfo + "条");
                                $(this).attr("title", "关联的内部接口" + $tzInfo + "条;" + "关联的外部接口" + $wzInfo + "条");
                            }
                        }
                    });
                }
            );
        }

        function getVerifyForm() {
            var $ids = "";
            $("#<%=gvReleRoll.ClientID %> span[wbsreleinfo]").each(function () {
                $ids += $(this).attr("wbsreleinfo") + "|";
            });

            $.post("RollReleEditor.aspx",
                { asyfunc: "GetVerifyForm", wbsIdList: $ids },
                function (res) {
                    var $l;
                    var $l = eval('(' + res + ')');
                    $("#<%=gvReleRoll.ClientID %> a[verifyinfo]").each(function () {
                        var $wbsID = $(this).attr("verifyinfo");
                        for (var i = 0; i < $l.length; i++) {
                            var $id = $l[i][0];
                            var $formID = $l[i][1];
                            if ($wbsID == $id) {
                                if ($formID == "") {
                                    $(this).html("该卷册没有校审单");
                                    $(this).attr("style", "color:red");
                                }
                                else {
                                    $(this).attr("onclick", "viewFormDetail('" + $formID + "',0)");
                                }
                            }
                        }
                    });
                }
            );
        }
    </script>
</asp:Content>
