<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ATestCtrl.ascx.cs" Inherits="Zhongsoft.Portal.TestSubSys.List.ATestCtrl" %>
<table class="tz-table">
    <tr>
        <td>
            <asp:LinkButton runat="server" CssClass="btn-link" ID="btn1" OnClientClick="return setDashboardTab('web1')"><span>跳转1</span></asp:LinkButton>
        </td>
    </tr>
    <tr>
        <td>
            <asp:LinkButton runat="server" CssClass="btn-link" ID="btn2" OnClientClick="setDashboardParam('web2',this)"><span>跳转2</span></asp:LinkButton>
        </td>
    </tr>
    <tr>
        <td>
            <asp:TextBox runat="server" ID="tbInfo"></asp:TextBox>
            <asp:LinkButton runat="server" CssClass="btn-link" ID="btn3" OnClientClick="return queryListMgr()"><span>查询</span></asp:LinkButton>
            <asp:LinkButton runat="server" CssClass="btn-link" ID="btn4" OnClientClick="return resetListMgr()"><span>重置</span></asp:LinkButton>
        </td>
    </tr>
</table>
<script>

    ///跳转



    //调用另一个iframe页面的方法方法
    function queryListMgr() {
        if (isDashBoardPage()) {
            var web2 = getIframeByKey("web2");
            web2.queryListMgr($("#<%=tbInfo.ClientID %>").val());
        }
        else {
            var web2 = parent.getIframeByKey("web2");
            web2.queryListMgr($("#<%=tbInfo.ClientID %>").val());
        }
        return false;
    }

</script>
