<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjectSpeUserChange.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.OBS.ProjectSpeUserChange" %>
<tr runat="server" id="trInfo">
    <td class="td-l">需变更专业角色
    </td>
    <td colspan="5" class="td-m">
        <asp:Label runat="server" ID="lbTips" Text="请先保存表单再选择需变更专业角色" displaystatus="(2.?)"
            CssClass="aStyle-red"></asp:Label>
        <asp:CheckBoxList runat="server" ID="cblRoles" RepeatDirection="Horizontal" RepeatColumns="10"
            activestatus="(23.提出成员变更)" displaystatus="(123.*)" AutoPostBack="true" OnSelectedIndexChanged="cblRoles_SelectedIndexChanged">
        </asp:CheckBoxList>
    </td>
</tr>
<tr runat="server" id="trUser" style="width: 100%">
    <td colspan="6">
        <zhongsoft:LightPowerGridView runat="server" ID="gridViewUser" PageSize="100" Width="100%"
            UseDefaultDataSource="true" AutoGenerateColumns="false" AllowSorting="true" OnRowDataBound="gridViewUser_RowDataBound"
            OnRowCommand="gridViewUser_RowCommand" DataKeyNames="ProjectSpecialtyID" BindGridViewMethod="BindUserGrid">
            <Columns>
                <asp:TemplateField HeaderText="序号" ItemStyle-Width="2%" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <%#Container.DataItemIndex+1 %>
                        <input type="hidden" runat="server" id="hiProjectSpecialtyID" value='<%#Eval("ProjectSpecialtyID") %>' />
                        <input type="hidden" runat="server" id="hiParamSpecialtyID" value='<%#Eval("ParamSpecialtyID") %>' />
                        <input type="hidden" runat="server" id="hiDeptID" value='<%#Eval("DeptID") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="所属部室">
                    <ItemStyle Width="100px" />
                    <ItemTemplate>
                        <asp:Label ID="lbDeptName" runat="server" Text='<%#Eval("DeptName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="专业">
                    <ItemStyle Width="60px" />
                    <ItemTemplate>
                        <asp:Label ID="lbSpecialtyName" SpecialtyName="SpecialtyName" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="预留列1" ItemStyle-Wrap="false" Visible="false">
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td style="width: 36px">
                                    <asp:Label ID="lbOldUserName1" runat="server"></asp:Label>
                                    <input type="hidden" runat="server" id="hiOldUserId1" />
                                </td>
                                <td>
                                    <asp:Label ID="lbTip1" runat="server" Text="拟变更为" CssClass="aStyle-red" Visible="false"></asp:Label>
                                </td>
                                <td>
                                    <zhongsoft:LightObjectSelector runat="server" ID="tbReservedName1" IsMutiple="true"
                                        Visible="false" SelectPageMode="Dialog" activestatus="(2.*)" SourceMode="SelectorPage"
                                        ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode"
                                        PageWidth="850" ResultForControls="{'hiReservedId1':'id'}" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx"></zhongsoft:LightObjectSelector>
                                    <input type="hidden" runat="server" id="hiReservedId1" />
                                    <input type="hidden" runat="server" id="hiRoleId1" />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="预留列2" ItemStyle-Wrap="false" Visible="false">
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td style="width: 36px">
                                    <asp:Label ID="lbOldUserName2" runat="server"></asp:Label>
                                    <input type="hidden" runat="server" id="hiOldUserId2" />
                                </td>
                                <td>
                                    <asp:Label ID="lbTip2" runat="server" Text="拟变更为" CssClass="aStyle-red" Visible="false"></asp:Label>
                                </td>
                                <td align="left">
                                    <zhongsoft:LightObjectSelector runat="server" ID="tbReservedName2" IsMutiple="true"
                                        Visible="false" SelectPageMode="Dialog" activestatus="(2.*)" SourceMode="SelectorPage"
                                        ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode"
                                        PageWidth="850" ResultForControls="{'hiReservedId2':'id'}" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx"></zhongsoft:LightObjectSelector>
                                    <input type="hidden" runat="server" id="hiReservedId2" />
                                    <input type="hidden" runat="server" id="hiRoleId2" />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="预留列3" ItemStyle-Wrap="false" Visible="false">
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td style="width: 36px">
                                    <asp:Label ID="lbOldUserName3" runat="server"></asp:Label>
                                    <input type="hidden" runat="server" id="hiOldUserId3" />
                                </td>
                                <td>
                                    <asp:Label ID="lbTip3" runat="server" Text="拟变更为" CssClass="aStyle-red" Visible="false"></asp:Label>
                                </td>
                                <td align="left">
                                    <zhongsoft:LightObjectSelector runat="server" ID="tbReservedName3" IsMutiple="true"
                                        Visible="false" SelectPageMode="Dialog" activestatus="(2.*)" SourceMode="SelectorPage"
                                        ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode"
                                        PageWidth="850" ResultForControls="{'hiReservedId3':'id'}" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx"></zhongsoft:LightObjectSelector>
                                    <input type="hidden" runat="server" id="hiReservedId3" />
                                    <input type="hidden" runat="server" id="hiRoleId3" />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="预留列4" ItemStyle-Wrap="false" Visible="false">
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td style="width: 36px">
                                    <asp:Label ID="lbOldUserName4" runat="server"></asp:Label>
                                    <input type="hidden" runat="server" id="hiOldUserId4" />
                                </td>
                                <td>
                                    <asp:Label ID="lbTip4" runat="server" Text="拟变更为" CssClass="aStyle-red" Visible="false"></asp:Label>
                                </td>
                                <td align="left">
                                    <zhongsoft:LightObjectSelector runat="server" ID="tbReservedName4" IsMutiple="true"
                                        Visible="false" SelectPageMode="Dialog" activestatus="(2.*)" SourceMode="SelectorPage"
                                        ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode"
                                        PageWidth="850" ResultForControls="{'hiReservedId4':'id'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
                                    <input type="hidden" runat="server" id="hiReservedId4" />
                                    <input type="hidden" runat="server" id="hiRoleId4" />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="预留列5" ItemStyle-Wrap="false" Visible="false">
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td style="width: 36px">
                                    <asp:Label ID="lbOldUserName5" runat="server"></asp:Label>
                                    <input type="hidden" runat="server" id="hiOldUserId5" />
                                </td>
                                <td>
                                    <asp:Label ID="lbTip5" runat="server" Text="拟变更为" CssClass="aStyle-red" Visible="false"></asp:Label>
                                </td>
                                <td align="left">
                                    <zhongsoft:LightObjectSelector runat="server" ID="tbReservedName5" IsMutiple="true"
                                        Visible="false" SelectPageMode="Dialog" activestatus="(2.*)" SourceMode="SelectorPage"
                                        ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode"
                                        ResultForControls="{'hiReservedId5':'id'}" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx"></zhongsoft:LightObjectSelector>
                                    <input type="hidden" runat="server" id="hiReservedId5" />
                                    <input type="hidden" runat="server" id="hiRoleId5" />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="备注" Visible="false">
                    <ItemStyle Width="10%" />
                    <ItemTemplate>
                        <zhongsoft:LightTextBox ID="tbMemo" runat="server" EnableTheming="false" CssClass="kpms-textboxdg"></zhongsoft:LightTextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="删除" Visible="false">
                    <ItemStyle HorizontalAlign="Center" Width="30px" />
                    <ItemTemplate>
                        <asp:ImageButton ID="ibtnDelete" runat="server" ImageUrl="~/Themes/Images/btn_dg_delete.gif"
                            CommandName="DeleteData" CausesValidation="false" OnClientClick='if(!confirm("确定要删除吗？")) return false;'
                            CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ProjectSpecialtyID") %>'></asp:ImageButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </zhongsoft:LightPowerGridView>
        <asp:Button ID="btnAddSpecialty" Text="添加专业" runat="server" OnClientClick="return addSpecialty();"
            DisplayStatus="(3.提出成员变更)" class="kpms-buttonfree" OnClick="btnAddSpecialty_Click"
            Visible="false" />
        <input runat="server" id="hiXml" type="hidden" />
        <!----项目类型--->
        <input runat="server" id="hiParamProjectTypeID" type="hidden" />
        <input runat="server" id="hiZHSpeCode" type="hidden" value="A" />
        <input runat="server" id="hiZHSpeName" type="hidden" value="综合" />
        <input runat="server" id="hiProjectId" type="hidden" />
    </td>
</tr>
<input runat="server" id="hiIsSelAllUserRole" type="hidden" value="1" />
<script type="text/javascript" language="javascript">
    //添加专业
    function addSpecialty() {
        //        var xml = $("#<%=hiXml.ClientID %>").val();
        //               //Modified by wanglj 20150921 将按照项目模板筛选专业，改为 按照项目类型筛选专业
        //        var projectTypeId = $('#<%=hiParamProjectTypeID.ClientID %>').val();
        //        var json= {ActionFlag : '1',SelectFlag:'1',ParamProjectTypeID:projectTypeId,SelectForOrg:'1',OrganizationID:'<%=ProjectId %>'};
        //        var url = buildQueryUrl("EPMS/Obsolete/SpeSelector.aspx", json);
        //        showDivDialog(encodeURI(url), xml, 850, 600, afterAddSpecialty);
        var orgID = $("#<%=hiProjectId.ClientID%>").val();
        if (orgID == "") {
            alert("请先选择项目");
            return false;
        }
        var projectTypeId = $('#<%=hiParamProjectTypeID.ClientID %>').val();
        var param = new InputParamObject("m");
        //var josn = { ParamProjectTypeID: projectTypeId, SelectForOrg: '1' };
        //var josn = { SelectForOrg: '1' };
        var josn = { SelectForOrg: '1', ShowLittleSpe: '1' };
        getDivSpecialty("<%=hiXml.ClientID %>", param, josn, afterAddSpecialty);
        return false;
    }
    function afterAddSpecialty(re) {
        //$("#<%=hiXml.ClientID %>").val(re);
        <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.btnAddSpecialty, "")%>;
        return false;
    }

    //判断主任工、主设人是否都填写了
    //checkScope 检查范围 1:主任工  2:主任工/主设人  3:设计人/主设人/主任工
    function CheckZrgAndAsr(checkScope) {
        //主任工所在列
        var zrg = -1;
        //主设人所在列
        var zsr = -1;
        //专业设计人所在列
        var sjr = -1;
        //专业所在列
        var spec = -1;
        var megs = "";
        var ths = $("#<%=gridViewUser.ClientID %>").children("thead").children("tr").children("th");
        for (var i = 0; i < ths.length; i++) {
            if ($(ths[i]).text() == "专业设总") {
                zrg = i;
            } else if ($(ths[i]).text() == "专业主设人") {
                zsr = i;
            } else if ($(ths[i]).text() == "专业设计人") {
                sjr = i;
            }
            else if ($(ths[i]).text() == "专业") {
                spec = i;
            }

        }
        $("#<%=gridViewUser.ClientID %>").children("tbody").children("tr").each(function () {
            var tds = $(this).children("td");
            //专业
            if (tds.length >= spec) {
                if (spec >= 0) {
                    var specName = $(tds[spec]).children("span").text();
                    if (specName.indexOf("综合") > -1) {
                        //综合专业不做判断
                    } else {
                        //非综合专业

                        //主任工
                        if (tds.length >= zrg) {
                            if (zrg >= 0) {
                                //存在主任工列
                                //原主任工名称
                                var yzrgname = $($(tds[zrg]).children("table").children("tbody").children("tr").children("td")[0]).children("span").text();
                                var bghzrg = $($($($(tds[zrg]).children("table").children("tbody").children("tr").children("td")[2]).children("table").children("tbody").children("tr").children("td")[0]).children("input[type='text']")[0]);
                                var bghzrgname = bghzrg.val();
                                //可编辑情况下，才进行判断 tianhl 20161010
                                if (yzrgname == "" && bghzrgname == "" && ((bghzrg.attr('isdisabled') != undefined && bghzrg.attr('isdisabled') != 'true') || bghzrg.attr('isdisabled') == undefined)) {
                                    megs += "专业：" + specName + "没有安排专业设总\r\n";
                                }
                            }
                        }
                        if (checkScope == 1) {
                            return true;
                        }
                        //主设人
                        if (tds.length >= zsr) {
                            if (zsr >= 0) {
                                //存在主设人列
                                //原主设人名称
                                var yzsr = $($(tds[zsr]).children("table").children("tbody").children("tr").children("td")[0]).children("span").text();
                                var bghzsr = $($($($(tds[zsr]).children("table").children("tbody").children("tr").children("td")[2]).children("table").children("tbody").children("tr").children("td")[0]).children("input[type='text']")[0]);
                                var bghzsrname = bghzsr.val();
                                //可编辑情况下，才进行判断 tianhl 20161010
                                if (yzsr == "" && bghzsrname == "" && ((bghzsr.attr('isdisabled') != undefined && bghzsr.attr('isdisabled') != 'true') || bghzsr.attr('isdisabled') == undefined)) {
                                    megs += "专业：" + specName + "没有安排专业主设人\r\n";
                                }
                            }
                        }

                        if (checkScope == 2) {
                            return true;
                        }
                        //设计人
                        if (tds.length >= sjr) {
                            if (sjr >= 0) {
                                //存在主设人列
                                //原主设人名称
                                var yzsr = $($(tds[sjr]).children("table").children("tbody").children("tr").children("td")[0]).children("span").text();
                                var bghzsr = $($($($(tds[sjr]).children("table").children("tbody").children("tr").children("td")[2]).children("table").children("tbody").children("tr").children("td")[0]).children("input[type='text']")[0]);
                                var bghzsrname = bghzsr.val();
                                //可编辑情况下，才进行判断 tianhl 20161010
                                if (yzsr == "" && bghzsrname == "" && ((bghzsr.attr('isdisabled') != undefined && bghzsr.attr('isdisabled') != 'true') || bghzsr.attr('isdisabled') == undefined)) {
                                    megs += "专业：" + specName + "没有安排专业设计人\r\n";
                                }
                            }
                        }
                        if (checkScope == 3) {
                            return true;
                        }
                    }
                }
            }
        });
        return megs;
    }
    function checkSelAllUserRole() {
        $("#<%=hiIsSelAllUserRole.ClientID%>").val("1");
        $("#<%=gridViewUser.ClientID%> tbody tr td input[id*=hiReservedId]").each(function (i, n) {
            if ($(this).val().trim() == '') {
                $("#<%=hiIsSelAllUserRole.ClientID%>").val("0");
                return;
            }
        })
    }
</script>
