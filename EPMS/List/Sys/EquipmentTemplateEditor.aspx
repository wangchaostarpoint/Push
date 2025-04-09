<%@ Page Language="C#" AutoEventWireup="true" Title="设备模板详细" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="EquipmentTemplateEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.EquipmentTemplateEditor" %>

<asp:Content runat="server" ID="Content2" ContentPlaceHolderID="toolBtn">
    <asp:LinkButton runat="server" ID="btnAddSpe" OnClientClick="return false" CssClass="subtoolbarlink"
        EnableTheming="false" displaystatus="(3.*)" Visible="false">
        <span>添加关联专业</span>
    </asp:LinkButton>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                设备编号
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbCode" TableName="EPMS_QuipmentTemplate"
                    Field="QuipmentCode" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                设备名称
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbName" TableName="EPMS_QuipmentTemplate"
                    Field="QuipmentName" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                KKS编码
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbKKS" TableName="EPMS_QuipmentTemplate"
                    Field="KKSCode" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                适用范围
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="txtUseRange" SourceMode="SelectorPage"
                    IsMutiple="true" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                    EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/TemplateUsingRangeSelector.aspx"
                    TableName="EPMS_QuipmentTemplate" Field="UsingRange" activestatus="(23.*)"></zhongsoft:LightObjectSelector>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                描述
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbDescription" TableName="EPMS_QuipmentTemplate"
                    Field="Description" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                是否启用
            </td>
            <td class="td-m" colspan="3">
                <asp:RadioButtonList runat="server" ID="rblFlag" RepeatDirection="Horizontal" TableName="EPMS_QuipmentTemplate"
                    Field="FLAG" activestatus="(23.*)">
                    <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                    <asp:ListItem Value="0">不启用</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-m" colspan="4" style="text-align: center;">
                <b>设备技术信息及处理意见</b> <span runat="server" style="float: right" displaystatus="(3.*)">
                    <asp:Button runat="server" ID="btnAdd" Text="添加" OnClick="btnAdd_Click" />
                    <zhongsoft:LightTextBox runat="server" ID="tbNum" Style="text-align: right; width: 70px;"
                        regex="^\d{0,2}$" errmsg="请输入最多2位整数"></zhongsoft:LightTextBox>行 </span>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
                    PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                    DataKeyNames="EquiTechTemplateID" UseDefaultDataSource="true" BindGridViewMethod="BindGrid"
                    OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="设备技术信息及处理意见">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbEquiTechInfo" activestatus="(23.*)"
                                    Text='<%#Eval("EquiTechInfo") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="描述">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbDescription" activestatus="(23.*)" Text='<%#Eval("DESCRIPTION") %>'>
                                </zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="是否启用">
                            <ItemTemplate>
                                <asp:RadioButtonList runat="server" ID="rbl" RepeatDirection="Horizontal" key='<%#Eval("EquiTechTemplateID") %>'
                                    OnSelectedIndexChanged="rbl_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Value="1">启用</asp:ListItem>
                                    <asp:ListItem Value="0">不启用</asp:ListItem>
                                </asp:RadioButtonList>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del"
                                    CommandArgument='<%#Eval("EquiTechTemplateID") %>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="../../../Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                                </asp:LinkButton>
                                <input type="hidden" runat="server" id="hiKeyId" value='<%#Eval("EquiTechTemplateID") %>' />
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input id="hikeyID" type="hidden" tablename="EPMS_QuipmentTemplate" field="QuipmentTemplateID"
        runat="server" />
    <input type="hidden" runat="server" id="hiSpeXML" />
    <asp:Button runat="server" ID="btnBindSpe" Visible="false" OnClick="btnBindSpe_Click" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();

            $('#<%=btnAddSpe.ClientID %>').live('click', function () {
                addSpe();
            });
        }

        //批量添加专业
        function addSpe() {
            var param = new InputParamObject("m");
            getSpecialty('<%=hiSpeXML.ClientID %>', param, '', bindSpe);
        }

        //执行后台添加专业数据
        function bindSpe(){
            <%=Page.ClientScript.GetPostBackEventReference(this.btnBindSpe,"")%>;
        }
    </script>
</asp:Content>
