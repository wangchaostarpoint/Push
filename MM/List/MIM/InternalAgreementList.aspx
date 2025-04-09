<%@ Page Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true"
    CodeBehind="InternalAgreementList.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.MIM.InternalAgreementList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                原协议书编号
                <zhongsoft:XHtmlInputText ID="txtCode" runat="server" />
                变更协议编号
                <zhongsoft:XHtmlInputText ID="txtChangeCode" runat="server" />
                </td>
                </tr>
           <tr>
             <td>
                委托单位
                <zhongsoft:LightDropDownList runat="server" ID="ddlEntrust" Width="150px">
                </zhongsoft:LightDropDownList>
                受托单位
                <zhongsoft:LightDropDownList runat="server" ID="ddlEntrusted" Width="150px">
                </zhongsoft:LightDropDownList>
                协议类型
                <zhongsoft:LightDropDownList runat="server" ID="ddlType">
                    <asp:ListItem Value="0" Selected="True">签订</asp:ListItem>
                    <asp:ListItem Value="1">变更</asp:ListItem>
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView runat="server" ID="gvList" AllowPaging="True" PageSize="15"
        UseDefaultDataSource="true" AutoGenerateColumns="false" ShowExport="true" DataKeyNames="INTERNALAGREEMENTMAGID">
        <Columns>
            <zhongsoft:LightBoundField DataField="INTERNALAGREEMENTCODE" HeaderText="原协议书编号"
                ItemStyle-Width="8%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="CHANGEAGREEMENTCODE" HeaderText="变更协议编号" ItemStyle-Width="8%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ENTRUSTDEPTNAME" HeaderText="委托单位" ItemStyle-Width="8%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="受托单位" DataField="ENTRUSTEDDEPTNAME" ItemStyle-Width="8%" />
            <zhongsoft:LightBoundField HeaderText="工程名称" DataField="PROJECTNAME">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="CONTRACTCODE" HeaderText="合同编号" ItemStyle-Width="8%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="CONTRACTNAME" HeaderText="合同名称" ItemStyle-Width="17%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PROXYCODE" HeaderText="委托书编号" ItemStyle-Width="8%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PROXYNAME" HeaderText="委托书名称" ItemStyle-Width="17%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField HeaderText="协议单" EditItemClick="viewFlow" DataParamFields="FId,PId"
                ItemStyle-Width="40px" ImageUrl="../../../Themes/Images/btn_dg_view.gif">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>

        function viewFlow(formid, processInstanceId) {
            var urlStr = "<%=WebAppPath %>/Sys/Workflow/FormDetail.aspx?actionType=1&formId=" + formid + "&prcInstId=" + processInstanceId;
            window.open(urlStr);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
