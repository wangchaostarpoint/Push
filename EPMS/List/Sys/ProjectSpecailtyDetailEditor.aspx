<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="ProjectSpecailtyDetailEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.ProjectSpecailtyDetailEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                专业编号
            </td>
            <td>
                <zhongsoft:LightTextBox runat="server" ID="tbSpecialtyCode" ReadOnly="true"></zhongsoft:LightTextBox>
            </td>
            <td class="td-r">
                专业名称
            </td>
            <td>
                <zhongsoft:LightTextBox runat="server" ID="tbSpecialtyName" ReadOnly="true"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-m" colspan="4">
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
                    PageSize="10" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                    DataKeyNames="ProjectSpecialtyDetailId" UseDefaultDataSource="true" BindGridViewMethod="BindData()">
                    <Columns>
                        <zhongsoft:LightBoundField HeaderText="工作类别" DataField="WorkType">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="企业定额工日">
                            <ItemTemplate>
                                <input runat="server" id="hiProjectSpecialtyDetailId" type="hidden" value='<%#Eval("ProjectSpecialtyDetailId") %>' />
                                <zhongsoft:LightTextBox runat="server" ID="tbWorkDays" onblur="CaculateSpe(this)"
                                    req="1" Style="text-align: right" regex="^[0-9]{0,6}$" errmsg="请输入最多6位整数" Text='<%#Eval("WorkQuota") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="专业工日占比">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbSpeProportion" Style="text-align: right"
                                    req="1" Text='<%#Eval("SpeProportion") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="行业定额工日">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbIndustryWorkDays" Style="text-align: right"
                                    req="1" regex="^[0-9]{0,6}$" errmsg="请输入最多6位整数" Text='<%#Eval("IndustryWorkDays") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input runat="server" id="hiWorkDays" type="hidden" />
    <input runat="server" id="hiSpareWorkDays" type="hidden" />
    <input runat="server" id="hikeyID" type="hidden" tablename="EPMS_ProjectSpecialtyTemp"
        field="ProjectSpecialtyTempID" />
    <input runat="server" id="hiProjectTemplateID" type="hidden" tablename="EPMS_ProjectSpecialtyTemp"
        field="ProjectTemplateID" />
    <input runat="server" id="hiParamSpecialtyID" type="hidden" tablename="EPMS_ProjectSpecialtyTemp"
        field="ParamSpecialtyID" />
    <script language="javascript" type="text/javascript">
        function CaculateSpe(obj) {
            var sum = 0;
            $("[id$='tbWorkDays']").each(function (index) {
                var num = 0;
                if ($(this).val() != "") {
                    num = parseInt($(this).val());
                    sum = sum + num;
                }
            });
            var id = $(obj).attr("id").replace("tbWorkDays", "tbSpeProportion");
            var workDays = parseInt($(obj).val());
            var totalDays = parseInt($('#<%=hiWorkDays.ClientID %>').val());
            var sperDays = parseInt($('#<%=hiSpareWorkDays.ClientID %>').val());
            if (sum > (totalDays - sperDays)) {
                alert("各专业额定工日总额应该小于项目总工日减去备用工日");
                $(obj).val("");
            }
            else {
                var proportion = (workDays / (totalDays - sperDays)).toFixed(2);
                if (!isNaN(proportion)) {
                    $("#" + id).val(proportion);
                }
            }
        }
    </script>
</asp:Content>
