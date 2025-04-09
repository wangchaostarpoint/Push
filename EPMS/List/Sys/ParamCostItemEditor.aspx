<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParamCostItemEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Sys.ParamCostItemEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                所属分类<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightDropDownList runat="server" ID="ddlParamName" TableName="EPMS_ParamWorkType"
                    Field="ParamPublishID" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
                <input id="hiParamName" type="hidden" tablename="EPMS_ParamWorkType" field="ParamName"
                    runat="server" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                工种类型名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbWorkTypeName" TableName="EPMS_ParamWorkType"
                    Field="WorkTypeName" activestatus="(23.*)" req="1" MaxLength="32"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                排序号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSort" TableName="EPMS_ParamWorkType" Field="Sort" Style="text-align: right;
                    width: 70px;" activestatus="(23.*)" regex="^[1-9]\d*$" errmsg="请输入最多2位整数" runat="server"
                    MaxLength="2"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                是否启用
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblFlag" RepeatDirection="Horizontal" TableName="EPMS_ParamWorkType"
                    Field="FLAG" activestatus="(23.*)">
                    <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                    <asp:ListItem Value="0">不启用</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                描述
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbMemo" TableName="EPMS_ParamWorkType"
                    Field="Memo" activestatus="(23.*)" MaxLength="1024" CssClass="kpms-textarea"
                    EnableTheming="false" TextMode="MultiLine" Rows="3"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td colspan="6" style="text-align: center">
                费用项目列表 <span id="Span1" runat="server" displaystatus="(2.*)" style="float: right;
                    color: Red">先保存再添加记录</span> <span id="Span2" runat="server" displaystatus="(3.*)"
                        style="float: right">添加行数
                        <zhongsoft:LightTextBox ID="tdNum" runat="server" Width="80px" MaxLength="3" Regex="^[1-9]\d*$"
                            errmsg="请输入整数" Style="text-align: right">
                        </zhongsoft:LightTextBox>
                        <asp:Button ID="btnAdd" runat="server" Text="确定" OnClick="btnAdd_Click" class="btn" />
                    </span>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <zhongsoft:LightPowerGridView ID="gvList" runat="server" AllowPaging="true" ShowFooter="true"
                    UseDefaultDataSource="true" PageSize="10" AutoGenerateColumns="false" Width="100%"
                    DataKeyNames="CostItemID" EmptyDataText="没有申请信息" OnRowCommand="gvList_RowCommand"
                    OnRowDataBound="gvList_RowDataBound" BindGridViewMethod="UserControl.BindInfo"
                    ShowExport="true" HideFieldOnExport="删除" ShowPageSizeChange="true">
                    <Columns>
                        <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px">
                            <ItemTemplate>
                                <%#((GridViewRow)Container).DataItemIndex + 1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <zhongsoft:LightTemplateField HeaderText="费用项目名称<span class='req-star'>*</span>"
                            HeaderStyle-Width="25%">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox ID="tbCostItemName" runat="server" class="kpms-textbox" MaxLength="32"
                                    req="1" Text='<%# DataBinder.Eval(Container.DataItem, "CostItemName") %>'>
                                </zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="是否加长" HeaderStyle-Width="15%" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:CheckBox ID="ckbIsLengthen" runat="server" />
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="规格单位<span class='req-star'>*</span>" HeaderStyle-Width="10%">
                            <ItemTemplate>
                                <zhongsoft:LightDropDownList ID="ddlUnitName" runat="server" req="1">
                                </zhongsoft:LightDropDownList>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="单价（元）<span class='req-star'>*</span>" HeaderStyle-Width="8%">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox ID="tbPrice" runat="server" Regex="^([1-9]\d{0,2}|[0])(\.\d{1,2})?$"
                                    req="1" errmsg="单价必须填写数字，最多3位整数，2位小数" MaxLength="6" CssClass="kpms-textbox-money"
                                    EnableTheming="false" Text='<%# DataBinder.Eval(Container.DataItem, "Price") %>'>
                                </zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="排序" HeaderStyle-Width="10%">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox ID="tbSort" runat="server" class="kpms-textbox-money" MaxLength="2"
                                    Text='<%# DataBinder.Eval(Container.DataItem, "Sort") %>' Regex="^[1-9]\d*$"
                                    errmsg="请输入整数">
                                </zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="是否启用" HeaderStyle-Width="15%" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:CheckBox ID="ckbFlag" runat="server" />
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightButtonField HeaderText="删除" CommandName="DeleteData" ItemStyle-Width="40px"
                            Visible="false">
                        </zhongsoft:LightButtonField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input id="hikeyID" type="hidden" tablename="EPMS_ParamWorkType" field="WorkTypeID"
        runat="server" />
    <%--    <input id="hiFlag" type="hidden" tablename="EPMS_ParamWorkType" field="Flag" runat="server"
        value="1" />--%>
    <script>
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();
        }
    </script>
</asp:Content>
