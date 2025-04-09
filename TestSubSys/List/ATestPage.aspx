<%@ Page Title="测试" Language="C#" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master"
    AutoEventWireup="true" CodeBehind="ATestPage.aspx.cs" Inherits="Zhongsoft.Portal.BDM.List.ATestPage" %>

<%@ Register Src="~/Sys/Workflow/Controls/FormSend.ascx" TagName="FormSend" TagPrefix="FormSend" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <!--可以自定义查询条件-->
    <table>
        <tr>
            <td>
                姓名
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbfds"></asp:TextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
    <!--可以自定义高级查询条件-->
    <table>
        <tr>
            <td>
                高级查询
            </td>
            <td>
                <asp:TextBox runat="server" ID="TextBox1"></asp:TextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="test" ContentPlaceHolderID="toolBtn" runat="server">
    <!--可以自定义按钮-->
    <asp:LinkButton runat="server" ID="lbtnTest" OnClick="lbtnTest_Click"><span>定制测试按钮</span></asp:LinkButton>
    <asp:Button runat="server" ID="btnTest" OnClick="lbtnTest_Click" Text="test" />
    <zhongsoft:LightObjectSelector runat="server" ID="txtSelector" SelectPageMode="Dialog"
        SourceMode="SelectorPage" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ShowJsonRowColName="true"
        DoCancel="true" ResultAttr="name" EnableTheming="false" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <FormSend:FormSend runat="server" ID="formSend" FormId="23" Visible="false" />
    <!-- 需要指定主键DataKeyNames="UserId" -->
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="GridViewTemplate" AutoGenerateColumns="false"
        DataKeyNames="UserId" FrozenRowNum="1" runat="server" BindGridViewMethod="BindDataGrid"
        ShowPageSizeChange="true">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全部" PostBackClick="checkGridPostBack">
            </zhongsoft:LightCheckField>
            <asp:BoundField DataField="LoginId" HeaderText="工号" />
            <asp:BoundField DataField="UserName" HeaderText="姓名" />
            <asp:BoundField DataField="Sex" HeaderText="性别" ItemStyle-Width="200px" />
            <zhongsoft:LightButtonField CommandName="ViewData" HeaderText="查看" CausesValidation="false">
            </zhongsoft:LightButtonField>
            <zhongsoft:LightButtonField CommandName="EditData" HeaderText="编辑" CausesValidation="false">
            </zhongsoft:LightButtonField>
            <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" CausesValidation="false">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>
        $gridCheckedClientID = "<%=this.GridViewList.CheckedClientID %>"
    </script>
    <script type="text/javascript">
        var $sendBtnId = "<%=btnTest.ClientID %>";
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
    <script>
        //改变新建编辑删除的操作
        function beforeDialog(actionType, bizId) {
            var url = buildBizUrl(actionType, bizId, "BDM/List/ListMgr.aspx", null);
            switch (actionType) {
                case "1":
                    showModal(url, "", 1080, 600);
                    break;
                case "3":
                case "2":
                    if (checkReturn(showModal(url, "", 1080, 600))) {
                        if (typeof (rebindGridData) == "function") {
                            rebindGridData();
                        }
                    }
                    break;
            }
            return false;
        }

        //设置弹出查询的宽度
        function setQueryWidth() {
            return 500;
        }

        //设置弹出查询的高度
        function setQueryHeight() {
            return 300;
        }
       
    </script>
</asp:Content>
