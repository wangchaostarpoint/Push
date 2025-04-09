<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParamSplitItemEditor.aspx.cs"
    Title="合同拆分项详细" Inherits="Zhongsoft.Portal.MM.List.MCM.ParamSplitItemEditor"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                项目类型<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="2">
                <zhongsoft:LightDropDownList runat="server" ID="ddlParamProjectTypeID" activestatus="(23.*)"
                    req="1" AutoPostBack="True"  Width="120px" OnSelectedIndexChanged="ddlParamProjectTypeID_SelectedIndexChanged">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="flexible" colspan="4">
                阶段详细<span runat="server" displaystatus="(3.*)" style="float: right">
                    <table>
                        <tr>
                            <td>
                                阶段
                            </td>
                            <td>
                                <zhongsoft:LightDropDownList runat="server" ID="ddlPHASEID" activestatus="(23.*)"
                                    AutoPostBack="True" OnSelectedIndexChanged="ddlPHASEID_SelectedIndexChanged">
                                </zhongsoft:LightDropDownList>
                            </td>
                            <td>
                                <asp:Button runat="server" ID="btnAdd" Text="添加" OnClientClick="return chackAdd()"
                                    OnClick="btnAdd_Click" />
                            </td>
                        </tr>
                    </table>
                </span>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false"
                    AllowPaging="true" PageSize="10" UseDefaultDataSource="true" DataKeyNames="ParamSplitItemID,PHASEID,BELONGTYPE,SPLITITEMVALUE,SPLITITEMNAME"
                    OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="阶段">
                            <ItemTemplate>
                                <zhongsoft:LightDropDownList runat="server" ID="ddlPHASEID" req="1" activestatus="(23.*)">
                                </zhongsoft:LightDropDownList>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="产值名称">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbSPLITITEMVALUE" activestatus="(23.*)"
                                    req="1"></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="类别">
                            <ItemTemplate>
                                <zhongsoft:LightDropDownList runat="server" ID="ddlBELONGTYPE" req="1" activestatus="(23.*)">
                                </zhongsoft:LightDropDownList>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="合同额名称">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbSPLITITEMNAME" activestatus="(23.*)"
                                    req="1"></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightButtonField HeaderText="删除" CommandName="deleteData">
                        </zhongsoft:LightButtonField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input type="hidden" id="hiProjectType" runat="server" />
    <script type="text/javascript">

        function chackAdd() {
            var ddlProjectType = $("#<%=ddlParamProjectTypeID.ClientID %> option:selected").val();
            if (ddlProjectType != "" && ddlProjectType != null && ddlProjectType != undefined) {

            } else {
                alert("请选择项目类型")
                return false;
            }
            var ddlPhasevalue = $("#<%=ddlPHASEID.ClientID %> option:selected").val();
            if (ddlPhasevalue != "" && ddlPhasevalue != null && ddlPhasevalue != undefined) {

            } else {
                alert("请选择阶段")
                return false;
            }
        }

        parent.returnValue = "Saved";
    </script>
</asp:Content>
