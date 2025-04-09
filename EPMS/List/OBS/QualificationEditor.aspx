<%@ Page Language="C#" AutoEventWireup="true" Title="资格类型编辑" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="QualificationEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.QualificationEditor" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <script src="../../UI/Script/EPMSGeneralScript.js" type="text/javascript"></script>
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">资格编号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbCode" TableName="EPMS_Qualification"
                    Field="QualificationCode" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">资格名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbName" TableName="EPMS_Qualification"
                    Field="QualificationName" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">岗位/角色<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlRoleType" runat="server" TableName="EPMS_Qualification"
                    Field="ROLEID" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">父级资质
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlParentQualification" TableName="EPMS_Qualification"
                    Field="ParentId" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
                <input runat="server" id="hiQualificationGrade" type="hidden" tablename="EPMS_Qualification"
                    field="QualificationGrade" />
            </td>
            <td class="td-l">控制项目类型<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblIsControlProject" RepeatDirection="Horizontal" onclick="isControlProjectChange();"
                    TableName="EPMS_Qualification" Field="IsControlProject" activestatus="(23.*)">
                    <asp:ListItem Value="1">是</asp:ListItem>
                    <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="td-l">是否启用
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblFlag" RepeatDirection="Horizontal" activestatus="(23.*)">
                    <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                    <asp:ListItem Value="0">不启用</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-l">排序号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSort" TableName="EPMS_Qualification" Field="Sort" Style="text-align: right; width: 70px;"
                    activestatus="(23.*)" regex="^[1-9]{0,6}$" errmsg="请输入最多6位整数" runat="server"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">描述
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbDescription" TableName="EPMS_Qualification"
                    Field="Description" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr runat="server" id="trTitle" name="controlled">
            <td class="td-m" colspan="6" style="text-align: center;">
                <b>资格适用的项目类型</b>
            </td>
        </tr>
        <tr runat="server" id="trGVList" name="controlled">
            <td class="td-m" colspan="6">
                <!--增加permissionstatus="true"会导致保存后列表没有了！-->
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
                    PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                    DataKeyNames="ParamProjectTypeID" UseDefaultDataSource="true" BindGridViewMethod="BindGrid"
                    OnRowDataBound="gvList_RowDataBound">
                    <Columns>
                        <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkControl">
                        </zhongsoft:LightCheckField>
                        <zhongsoft:LightTemplateField HeaderText="项目类别">
                            <ItemTemplate>
                                <asp:Label ID="lbProjctType" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                <input type="hidden" runat="server" id="hiKeyId" value='<%#Eval("ParamProjectTypeID") %>' />
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="控制项目规模<span class='req-star'>*</span>">
                            <ItemTemplate>
                                <asp:RadioButtonList runat="server" ID="rblIsControlScale" RepeatDirection="Horizontal"
                                    key='<%#Eval("ParamProjectTypeID") %>'>
                                    <asp:ListItem Value="1">是</asp:ListItem>
                                    <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
                                </asp:RadioButtonList>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="最低规模">
                            <ItemTemplate>
                                <zhongsoft:LightDropDownList ID="ddlLowScale" runat="server">
                                </zhongsoft:LightDropDownList>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="最高规模">
                            <ItemTemplate>
                                <zhongsoft:LightDropDownList ID="ddlHighScale" runat="server">
                                </zhongsoft:LightDropDownList>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="描述">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbDescription" activestatus="(23.*)" Text='<%#Eval("Description") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input id="hikeyID" type="hidden" tablename="EPMS_Qualification" field="QualificationID"
        runat="server" />
    <%--不知道为什么之前会一直保存不启用 同页面其他控件没问题 找不到解决方法!!!!!!!!!!!!!!!!!! 改用隐藏域 --%>
    <input type="hidden" runat="server" id="hiFlag" tablename="EPMS_Qualification" field="Flag" />
    <script>
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();
            isControlProjectChange();
        }

        //点击控制规模禁用最低、最高规模控件
        function checkControlScale(rbl, ddl1, ddl2) {
            var val = $("#" + rbl).find("[checked]").val();
            //            if (val == "0") {
            //                $("#" + ddl1).val("");
            //                $("#" + ddl2).val("");
            //                $("#" + ddl1).attr("disabled", "disabled");
            //                $("#" + ddl2).attr("disabled", "disabled");
            //            }
            //            else {
            //                $("#" + ddl1).remove("disabled");
            //                $("#" + ddl2).remove("disabled");
            //            }
        }

        //点击复选框控制是否可用
        function checkControl(re1, re2, re3, re4) {
        }

        //是否控制项目类型 根据点击控制下面控件的显隐
        function isControlProjectChange() {
            var selectVal = $("#<%= rblIsControlProject.ClientID%>").find("input:checked").val();
            if (selectVal == "0") {
                $("[name$='controlled']").hide();
            } else {
                $("[name$='controlled']").show();
            }
        }

    </script>
</asp:Content>
