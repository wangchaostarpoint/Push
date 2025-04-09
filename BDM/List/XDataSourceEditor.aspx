<%@ Page Title="数据源配置" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="XDataSourceEditor.aspx.cs" Inherits="Zhongsoft.Portal.BDM.List.XDataSourceEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                表名<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <input type="hidden" runat="server" id="hiTableCode" />
                <input type="hidden" runat="server" id="hiSourceId" />
                <zhongsoft:LightObjectSelector runat="server" ID="lselDict" PageUrl="~/BDM/List/DictSelector.aspx"
                    OnClick="btnChooseDict_Click" Width="200px" ResultAttr="name" ResultForControls="{'hiTableCode':'att3'}" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                主键
            </td>
            <td class="td-r">
                <input type="text" runat="server" id="tbPKCode" readonly="readonly" class="kpms-textbox"
                    style="width: 200px" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                类型<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:DropDownList runat="server" ID="ddlDataSourceType" Width="200px" req="1">
                </asp:DropDownList>
            </td>
        </tr>
    </table>
</asp:Content>
