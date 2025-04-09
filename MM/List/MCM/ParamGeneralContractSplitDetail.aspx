<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ParamGeneralContractSplitDetail.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MCM.ParamGeneralContractSplitDetail" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                分项名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbGeneralSplitName" runat="server" req="1" activestatus="(23.*)"
                    MaxLength="32" field="GENERALSPLITNAME" tablename="MCM_PARAMGENERALCONSPLIT"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                父级分项
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtParentName" field="PARENTNAME"
                    tablename="MCM_CONTRACTCHANGEFORM" activestatus="(23.*)" SourceMode="SelectorPage"
                    ShowJsonRowColName="true" DoCancel="false" ResultAttr="name" Writeable="false"
                    ShowAttrs="name,UserCode" ResultForControls="{'hiParentID':'id'}" PageUrl="~/MM/Obsolete/ParamGeneralContractSplitSelector.aspx">
                </zhongsoft:LightObjectSelector>
                <input id="hiParentID" type="hidden" field="PARENTID" runat="server" tablename="MCM_PARAMGENERALCONSPLIT" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                排序
            </td>
            <td class="td-R">
                <zhongsoft:LightTextBox runat="server" ID="tbSort" field="SORT" tablename="MCM_PARAMGENERALCONSPLIT"
                    regex="^\d+$" errmsg="请填写两位正整数！" class="kpms-textbox" MaxLength="2" Width="30px"
                    activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <!---总包拆分项主键ID-->
    <input type="hidden" runat="server" id="hiParamGeneralConSplitID" field="PARAMGENERALCONSPLITID"
        tablename="MCM_PARAMGENERALCONSPLIT" />
    <!---是否启用--->
    <input type="hidden" runat="server" id="hiFlag" field="FLAG" tablename="MCM_PARAMCONTRACTTYPE" />
</asp:Content>
