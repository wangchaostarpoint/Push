<%@ Page Language="C#" AutoEventWireup="true" Title="项目专业参数编辑" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="ParamSpecialtyEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.ParamSpecialtyEditor" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <script src="../../UI/Script/EPMSGeneralScript.js" type="text/javascript"></script>
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">项目专业代字<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="LightTextBox1" TableName="EPMS_PARAMSPECIALTY"
                    Field="SpecialtyCode" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">项目专业名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="LightTextBox2" TableName="EPMS_PARAMSPECIALTY"
                    Field="SpecialtyName" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">专业简称编码
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbSpecialityDrawCode" TableName="EPMS_PARAMSPECIALTY"
                    Field="SpecialityDrawCode" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">专业简称
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbSpecialityDrawName" TableName="EPMS_PARAMSPECIALTY"
                    Field="SpecialityDrawName" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">专业类型<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlType" TableName="EPMS_PARAMSPECIALTY"
                    Field="ParamSpecialtyTypeId" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiSpecialtyType" tablename="EPMS_PARAMSPECIALTY"
                    field="SpecialtyType" />
            </td>
            <td class="td-l">设计难度系数
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbDesignHardRatio" TableName="EPMS_PARAMSPECIALTY" Field="DesignHardRatio"
                    activestatus="(23.*)" Regex="^([1-9]\d{0,11}|[0])(\.\d{1,2})?$" errmsg="请输入正数，最多12位整数，2位小数"
                    runat="server" EnableTheming="false" CssClass="kpms-textbox-money"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">校核难度系数
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbCheckHardRatio" TableName="EPMS_PARAMSPECIALTY" Field="CheckHardRatio"
                    activestatus="(23.*)" Regex="^([1-9]\d{0,11}|[0])(\.\d{1,2})?$" errmsg="请输入正数，最多12位整数，2位小数"
                    runat="server" EnableTheming="false" CssClass="kpms-textbox-money"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">校核工作比例
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbCheckWorkRatio" TableName="EPMS_PARAMSPECIALTY" Field="CheckWorkRatio"
                    activestatus="(23.*)" Regex="^([1-9]\d{0,11}|[0])(\.\d{1,2})?$" errmsg="请输入正数，最多12位整数，2位小数"
                    runat="server" EnableTheming="false" CssClass="kpms-textbox-money"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr runat="server" visible="false">
            <td class="td-l">业务板块
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightDropDownList ID="ddlBusinessPlate" runat="server" activestatus="(23.*)"
                    Field="ParamBusinessPlateID" TableName="EPMS_PARAMSPECIALTY" AutoPostBack="true">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">所在部门
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="txtDept" SourceMode="SelectorPage"
                    IsMutiple="true" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" Filter="{showTree:'1'}"
                    EnableTheming="false" ShowAttrs="ORGUNITNAME,ORGUNITCODE" SelectPageMode="Dialog"
                    PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx" activestatus="(23.*)"></zhongsoft:LightObjectSelector>
            </td>
        </tr>
        <tr>
            <td class="td-l">描述
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbDescription" TableName="EPMS_PARAMSPECIALTY"
                    Field="DESCRIPTION" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr runat="server" visible="false">
            <td class="td-l">适用的项目类型
            </td>
            <td class="td-m" colspan="3">
                <asp:CheckBox runat="server" ID="cbAllProjType" Text="选择全部项目类型" activestatus="(23.*)" />
                <asp:CheckBoxList runat="server" ID="cblProjType" RepeatDirection="Horizontal" RepeatColumns="5"
                    activestatus="(23.*)">
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td class="td-l">排序号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSort" TableName="EPMS_PARAMSPECIALTY" Field="SORT"
                    Style="text-align: right; width: 70px;" activestatus="(23.*)" regex="^([1-9]\d{0,1}|0)$"
                    errmsg="请输入最多2位整数" runat="server"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">是否启用
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblFlag" RepeatDirection="Horizontal" TableName="EPMS_PARAMSPECIALTY"
                    Field="FLAG" activestatus="(23.*)">
                    <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                    <asp:ListItem Value="0">不启用</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr runat="server" displaystatus="(3.*)" style="display: normal" flag="childSpe">
            <td class="td-m" colspan="4" style="text-align: center;">
                <b>小专业</b> <span runat="server" style="float: right">
                    <asp:Button runat="server" ID="btnAdd" Text="添加" OnClick="btnAdd_Click" />
                    <zhongsoft:LightTextBox runat="server" ID="tbNum" Style="text-align: right; width: 70px;"
                        regex="^[1-9]{0,2}$" errmsg="请输入最多2位整数"></zhongsoft:LightTextBox>行 </span>
            </td>
        </tr>
        <tr style="display: normal" flag="childSpe">
            <td colspan="4">
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
                    PageSize="100" AutoGenerateColumns="false" DataKeyNames="ParamSpecialtyId" UseDefaultDataSource="true"
                    BindGridViewMethod="BindChildSpecialty" OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="项目专业代字">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbCode" activestatus="(23.*)" Text='<%#Eval("SpecialtyCode") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="项目专业名称">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbName" activestatus="(23.*)" Text='<%#Eval("SpecialtyName") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="描述">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbDescription" activestatus="(23.*)" Text='<%#Eval("DESCRIPTION") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="排序号">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox ID="tbSort" Style="text-align: right; width: 70px;" activestatus="(23.*)"
                                    regex="^[0-9]{0,2}$" errmsg="请输入最多2位整数" runat="server" Text='<%#Eval("SORT") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="是否启用">
                            <ItemTemplate>
                                <asp:RadioButtonList runat="server" ID="rbl" RepeatDirection="Horizontal" key='<%#Eval("ParamSpecialtyId") %>'
                                    OnSelectedIndexChanged="rbl_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Value="1">启用</asp:ListItem>
                                    <asp:ListItem Value="0">不启用</asp:ListItem>
                                </asp:RadioButtonList>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del"
                                    CommandArgument='<%#Eval("ParamSpecialtyId") %>'>
                                <span><img src="../../../Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                                </asp:LinkButton>
                                <input type="hidden" runat="server" id="hiKeyId" value='<%#Eval("ParamSpecialtyId") %>' />
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <!-- 专业级别，默认新建为1-->
    <input id="hiSpecialtyLevel" type="hidden" tablename="EPMS_PARAMSPECIALTY" field="SpecialtyLevel" runat="server" value="1" />
    <input id="hikeyID" type="hidden" tablename="EPMS_PARAMSPECIALTY" field="ParamSpecialtyId" runat="server" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            //非一级专业（大专业）不显示添加小专业相关界面
            var level = $('#<%=hiSpecialtyLevel.ClientID%>').val();
            if (level != '1') {
                $('[flag="childSpe"]').hide();
            }

            //适用的项目类型
            initCBoxAll('<%=cblProjType.ClientID %>', '<%=cbAllProjType.ClientID %>');
            $('#<%=cblProjType.ClientID %> input:checkbox').live('click', function () {
                initCBoxAll('<%=cblProjType.ClientID %>', '<%=cbAllProjType.ClientID %>');
            });

            $('#<%=cbAllProjType.ClientID %>').live('change', function () {
                initCBoxList('<%=cblProjType.ClientID %>', '<%=cbAllProjType.ClientID %>');
            });
        }
    </script>
</asp:Content>
