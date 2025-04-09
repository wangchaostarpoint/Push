<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PurchaseApplyProjList.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MBM.PurchaseApplyProjList" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                采购内容
                <zhongsoft:LightTextBox ID="tbContent" runat="server" Width="150px" MaxLength="20"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false"
        ShowFooter="true" ShowExport="true" AllowPaging="true" PageSize="12" UseDefaultDataSource="true"
        DataKeyNames="APPLYID">
        <Columns>
            <zhongsoft:LightBoundField DataField="APPLYCODE" HeaderText="流水号" ItemStyle-Width="12%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="APPLYBIGTYPE" HeaderText="申请类型（大类）" ItemStyle-Width="18%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="APPLYLITTLETYPE" HeaderText="申请类型（小类）" ItemStyle-Width="18%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PURCHASECONTENT" HeaderText="采购内容" ItemStyle-Width="50%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="viewFlow" DataParamFields="Fid,Pid"
                ItemStyle-Width="40px" ImageUrl="../../../Themes/Images/btn_dg_view.gif">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        //查看流程信息
        function viewFlow(formid, processInstanceId) {
            var urlStr = "<%=WebAppPath %>/Sys/Workflow/FormDetail.aspx?actionType=1&formId=" + formid + "&prcInstId=" + processInstanceId;
            window.open(urlStr);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
