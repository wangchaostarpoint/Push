<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjectSpeUser.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.OBS.ProjectSpeUser" %>
<tr id="trRoles" runat="server" displaystatus="(3.填写任务书)(3.汇总意见)(23.编制计划)(3.汇总)(3.汇总人员)(23.提出人员需求)">
    <td class="td-l">选择专业角色
    </td>
    <td colspan="5" class="td-m">
        <asp:Label runat="server" ID="lbTips" Text="请先保存表单再选择需配置专业角色" displaystatus="(2.?)"
            Style="color: Red;"></asp:Label>
        <asp:CheckBoxList Style="display: inline" runat="server" ID="cblRoles" RepeatDirection="Horizontal"
            RepeatColumns="10" activestatus="(3.填写任务书)(3.汇总意见)(23.编制计划)(23.提出人员需求)(3.编制项目策划)(3.修改策划)(3.编制项目策划、配置人员)(3.编制项目方案)(3.会签调整)(3.汇总人员)(3.汇总审核结果)(3.修改计划)"
            displaystatus="(123.*)" AutoPostBack="true" OnSelectedIndexChanged="cblRoles_SelectedIndexChanged">
        </asp:CheckBoxList>
        <asp:Label runat="server" ID="lbMaxTip" Text="注：最多选择5个专业角色。" displaystatus="(23.*)"
            CssClass="req-star"></asp:Label>
    </td>
</tr>
<tr id="Tr1" runat="server" displaystatus="(3.填写任务书)(3.汇总意见)(23.编制计划)(3.汇总)(3.汇总人员)">
    <td colspan="6" style="color: Red">如有人员配置不满足要求，可电话与相关科室领导沟通，根据沟通结果由设总自行调整人员
    </td>
</tr>
<tr runat="server" id="trUser" style="width: 100%">
    <td colspan="6" style="border-right: 1px solid #cbccce;">
        <div style="float: right">
            <asp:Button ID="btnAddSpecialty" Text="添加专业" runat="server" OnClientClick="return addSpecialty();"
                DisplayStatus="(3.填写任务书)(3.汇总意见)(3.编制计划)(23.提出人员需求)(23.汇总)(3.编制项目策划)(3.编制项目策划、配置人员)(3.汇总人员)(3.编制项目方案)(3.会签调整)(3.汇总审核结果)(3.修改计划)" class="kpms-buttonfree"
                OnClick="btnAddSpecialty_Click" Visible="false" />
            <asp:Button ID="btnAllDel" Text="批量删除" runat="server" DisplayStatus="(3.填写任务书)(3.汇总意见)(3.编制计划)(23.提出人员需求)(3.编制项目策划)(3.编制项目策划、配置人员)(3.汇总人员)(3.编制项目方案)(3.会签调整)(3.汇总审核结果)(3.修改计划)"
                class="kpms-buttonfree" OnClick="btnAllDelete_Click" Visible="false" />
            <asp:Button ID="btnChangeUser" runat="server" Text="变更人员" OnClientClick='return openChangeUser();'
                Visible="false" />
        </div>
        <zhongsoft:LightPowerGridView runat="server" ID="gridViewUser" PageSize="100" Width="100%"
            UseDefaultDataSource="true" AutoGenerateColumns="false" AllowSorting="true" OnRowDataBound="gridViewUser_RowDataBound"
            OnRowCommand="gridViewUser_RowCommand" DataKeyNames="ProjectSpecialtyID" BindGridViewMethod="BindUserGrid">
            <Columns>
                <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" Visible="false">
                </zhongsoft:LightCheckField>
                <asp:TemplateField HeaderText="序号" HeaderStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <%#Container.DataItemIndex+1 %>
                        <input type="hidden" runat="server" id="hiProjectSpecialtyID" value='<%#Eval("ProjectSpecialtyID") %>' />
                        <input type="hidden" runat="server" id="hiParamSpecialtyID" value='<%#Eval("ParamSpecialtyID") %>' />
                        <input type="hidden" runat="server" id="hiDeptID" value='<%#Eval("DeptID") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="部门<span class='req-star'>*</span>">
                    <ItemStyle Width="100px" />
                    <ItemTemplate>
                        <zhongsoft:LightDropDownList ID="ddlDept" runat="server" Visible="false" req="1">
                        </zhongsoft:LightDropDownList>
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
                        <zhongsoft:LightObjectSelector runat="server" ID="tbReservedName1" IsMutiple="true" Writeable="True"
                            SelectPageMode="Dialog" activestatus="(2.*)" SourceMode="SelectorPage" ShowJsonRowColName="true"
                            DoCancel="true" ResultAttr="name" ShowAttrs="name,LoginId" ResultForControls="{'hiReservedId1':'id'}"
                            PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" PageWidth="850" content="value"></zhongsoft:LightObjectSelector>
                        <input type="hidden" runat="server" id="hiReservedId1" value="" />
                        <input type="hidden" runat="server" id="hiRoleId1" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="预留列2" ItemStyle-Wrap="false" Visible="false">
                    <ItemTemplate>
                        <zhongsoft:LightObjectSelector runat="server" ID="tbReservedName2" IsMutiple="true" Writeable="True"
                            SelectPageMode="Dialog" activestatus="(2.*)" SourceMode="SelectorPage" ShowJsonRowColName="true"
                            DoCancel="true" ResultAttr="name" ShowAttrs="name,LoginId" ResultForControls="{'hiReservedId2':'id'}"
                            PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" PageWidth="850" content="value"></zhongsoft:LightObjectSelector>
                        <input type="hidden" runat="server" id="hiReservedId2" value="" />
                        <input type="hidden" runat="server" id="hiRoleId2" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="预留列3" ItemStyle-Wrap="false" Visible="false">
                    <ItemTemplate>
                        <zhongsoft:LightObjectSelector runat="server" ID="tbReservedName3" IsMutiple="true" Writeable="True"
                            SelectPageMode="Dialog" activestatus="(2.*)" SourceMode="SelectorPage" ShowJsonRowColName="true"
                            DoCancel="true" ResultAttr="name" ShowAttrs="name,LoginId" ResultForControls="{'hiReservedId3':'id'}"
                            PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" PageWidth="850" content="value"></zhongsoft:LightObjectSelector>
                        <input type="hidden" runat="server" id="hiReservedId3" value="" />
                        <input type="hidden" runat="server" id="hiRoleId3" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="预留列4" ItemStyle-Wrap="false" Visible="false">
                    <ItemTemplate>
                        <zhongsoft:LightObjectSelector runat="server" ID="tbReservedName4" IsMutiple="true" Writeable="True"
                            SelectPageMode="Dialog" activestatus="(2.*)" SourceMode="SelectorPage" ShowJsonRowColName="true"
                            DoCancel="true" ResultAttr="name" ShowAttrs="name,LoginId" ResultForControls="{'hiReservedId4':'id'}"
                            PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" PageWidth="850" content="value"></zhongsoft:LightObjectSelector>
                        <input type="hidden" runat="server" id="hiReservedId4" value="" />
                        <input type="hidden" runat="server" id="hiRoleId4" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="预留列5" ItemStyle-Wrap="false" Visible="false">
                    <ItemTemplate>
                        <zhongsoft:LightObjectSelector runat="server" ID="tbReservedName5" IsMutiple="true" Writeable="True"
                            SelectPageMode="Dialog" activestatus="(2.*)" SourceMode="SelectorPage" ShowJsonRowColName="true"
                            DoCancel="true" ResultAttr="name" ShowAttrs="name,LoginId" ResultForControls="{'hiReservedId5':'id'}"
                            PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" PageWidth="850" content="value"></zhongsoft:LightObjectSelector>
                        <input type="hidden" runat="server" id="hiReservedId5" value="" />
                        <input type="hidden" runat="server" id="hiRoleId5" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="产值分配比例(%)" Visible="false">
                    <ItemStyle Width="10%" />
                    <ItemTemplate>
                        <zhongsoft:LightTextBox ID="tbOutputValue" Regex="^([1-9]\d{0,1}|[0])(\.\d{1,2})?$"
                            errmsg="请输入正数，最多2位整数，2位小数"
                            runat="server" EnableTheming="false" CssClass="kpms-textbox-money"
                            Text='<%#Eval("OutputValue") %>'></zhongsoft:LightTextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="备注" Visible="false">
                    <ItemStyle Width="25%" />
                    <ItemTemplate>
                        <zhongsoft:LightTextBox ID="tbMemo" runat="server" EnableTheming="false" CssClass="kpms-textboxdg"
                            Text='<%#Eval("Memo") %>'></zhongsoft:LightTextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="删除" Visible="false">
                    <ItemStyle HorizontalAlign="Center" Width="30px" />
                    <ItemTemplate>
                        <asp:ImageButton ID="ibtnDelete" runat="server" ImageUrl="~/Themes/Images/btn_dg_delete.gif"
                            CommandName="DeleteData" CausesValidation="false" OnClientClick='if(!confirm("确定要删除该专业吗？\n删除后，专业下卷册、资料也将一并删除")) return false;'
                            CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ProjectSpecialtyID") %>'></asp:ImageButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </zhongsoft:LightPowerGridView>
        <input runat="server" id="hiXml" type="hidden" />
        <input runat="server" id="hiZHSpeCode" type="hidden" value="1" />
        <input runat="server" id="hiZHSpeName" type="hidden" value="综合" />
        <input runat="server" id="hiSpeRoleName" type="hidden" value="主任工程师" />
        <!----项目类型--->
        <input runat="server" id="hiParamProjectTypeID" type="hidden" />
        <%--是否存在没有配置的人员--%>
        <input runat="server" id="hiIsHaveNoUser" type="hidden" value="false" />
        <input runat="server" id="hiProjectId" type="hidden" />
    </td>
</tr>
<script type="text/javascript" language="javascript">

    //添加专业
    function addSpecialty() {
        //        var xml = $("#<%=hiXml.ClientID %>").val();
        //         //Modified by wanglj 20150921 将按照项目模板筛选专业，改为 按照项目类型筛选专业
        //        var projectTypeId = $('#<%=hiParamProjectTypeID.ClientID %>').val();
        //        var json= {ActionFlag : '1',SelectFlag:'1',ParamProjectTypeID:projectTypeId,SelectForOrg:'1',OrganizationID:'<%=ProjectId %>'};
        //        var url = buildQueryUrl("EPMS/Obsolete/SpeSelector.aspx", json);
        //        showDivDialog(encodeURI(url), xml, 850, 600, afterAddSpecialty);
        var orgID ="<%=ProjectId %>";
        if (orgID == "") {
            alert("请先选择项目");
            return false;
        }
        var projectTypeId = $('#<%=hiParamProjectTypeID.ClientID %>').val();
        var param = new InputParamObject("m");
        //var josn = { ParamProjectTypeID: projectTypeId, SelectForOrg: '1' };
        var josn = { SelectForOrg: '1', ShowLittleSpe: '1' };
        //var josn = { SelectForOrg: '1' };
        getDivSpecialty("<%=hiXml.ClientID %>", param, josn, afterAddSpecialty);
        return false;
    }
    function afterAddSpecialty(re) {
        //$("#<%=hiXml.ClientID %>").val(re);
        <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.btnAddSpecialty, "")%>;
        return false;
    }
    function openChangeUser(re) {
        var json = { OrganizationID: '<%=ProjectId %>' };
        var url = buildQueryUrl("Sys/Workflow/FormDetail.aspx?actionType=2&packageName=EPMSProjResourceChange.xpdl&xpdlId=ProjResourceChange_wp1&formId=146&ver=|", json);
        window.open(url);
        return false;
    }

    function beforSend() {
        //发送时需要约束必须选择专业，如果没有选择专业，给出提示“请选择专业后发送” （综合专业除外） xuning
        //处理方式：列表中至少有2个专业以上的专业数量才可发送
        //暂时简单处理，排除没有综合专业但是有一个其他专业的问题 tianhl 20160510
        var num = $('#<%=gridViewUser.ClientID %>')[0].rows.length;
        if (num > 1) {
            return true;
        } else if (num <= 1) {
            alert("请选择专业后发送");
            return false;
        }
        return false;
    }

    //判断当前可编辑的专业人员文本框是否已经全部填写完毕
    function checkHasUser() {
        var $value = $('#<%=gridViewUser.ClientID %> [content="value"]');
        //列表中非固定列不可编辑的列数
        var $filteValue = $('#<%=gridViewUser.ClientID %> [flag="filteValue"]');
        //非固定列总列数（专业设总、专业主设人、专业设计人...）
        var len = $value.length;
        //总行数
        var num = $('#<%=gridViewUser.ClientID %>')[0].rows.length;
        //非固定列总列数加上不可编辑的列数
        if ($filteValue != null || $filteValue != undefined) {
            len = len + $filteValue.length;
        }
        //单行非固定列列数，num-1减去标题行
        len = len / (num - 1);
        //固定列列数（专业后即动态文本选择控件）
        var fixedLen = 0;
        var cellLen = $('#<%=gridViewUser.ClientID %>')[0].rows[0].cells.length;
        for (var i = 0; i < cellLen; i++) {
            var $headerText = $('#<%=gridViewUser.ClientID %>')[0].rows[0].cells[i].innerText;
            if ($headerText == "专业") {
                fixedLen = i;
                break;
            }
        }
        //长度需要在索引基础+1
        fixedLen = fixedLen + 1;

        //循环$value
        for (var i = 0; i < $value.length; i++) {
            //modified by biye 20210225 排除专业设计人的控制
            var index = (i % len) + fixedLen;
            var $headerText = $('#<%=gridViewUser.ClientID %>')[0].rows[0].cells[index].innerText;
            if ($value.eq(i)[0].attributes.isdisabled == undefined && $value.eq(i)[0].innerText == '') {
                return false;
            }
        }
        return true;
    }
</script>
