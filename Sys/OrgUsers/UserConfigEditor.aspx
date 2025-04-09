<%@ Page Title="个性化配置" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="UserConfigEditor.aspx.cs" Inherits="Zhongsoft.Portal.Sys.OrgUsers.UserConfigEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <zhongsoft:PropertyGrid runat="server" ID="grid" CssClass="tz-table" CellNameClass="td-l"
        CellValueClass="td-m" Visible="false">
    </zhongsoft:PropertyGrid>
    <table class="tz-table">
        <tr style="display: none">
            <td class="td-l">
                默认工作台
            </td>
            <td class="td-m">
                <zhongsoft:LightDropDownList ID="ddlDefultWorkbench" runat="server">
                </zhongsoft:LightDropDownList>
                <zhongsoft:LightObjectSelector runat="server" ID="txtSysHome" PageUrl="~/Sys/Menu/PageSelector.aspx"
                    ResultAttr="att3" Width="210px" Visible="false" />
                <!--todo 默认页面跳转、鼠标悬浮弹出效果更好-->
            </td>
        </tr>
        <tr flag="style">
            <!--该功能还未实现，暂时隐藏-->
            <td class="td-l">
                字体大小
            </td>
            <td class="td-m">
                <zhongsoft:LightDropDownList runat="server" ID="ddlFontSize">
                    <asp:ListItem Value="">正常</asp:ListItem>
                    <asp:ListItem Value="big">大</asp:ListItem>
                    <asp:ListItem Value="large">特大</asp:ListItem>
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr flag="style">
            <!--该功能还未实现，暂时隐藏-->
            <td class="td-l">
                系统样式
            </td>
            <td class="td-m">
                <zhongsoft:LightDropDownList runat="server" ID="ddlSysStyle">
                    <asp:ListItem Value="">默认</asp:ListItem>
                    <asp:ListItem Value="blue">蓝色</asp:ListItem>
                    <asp:ListItem Value="red">红色</asp:ListItem>
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <!--个人消息提醒配置-->
            <td class="td-l">
                消息提醒方式
            </td>
            <td class="td-r">
                <asp:CheckBoxList runat="server" ID="cblAlertType" req="1" RepeatDirection="Horizontal">
                </asp:CheckBoxList>
            </td>
            <td class="td-l">
                是否重复提醒<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rbtnlIsRepeat" Enabled="false" req="1" RepeatDirection="Horizontal">
                    <asp:ListItem Text="是" Value="1"></asp:ListItem>
                    <asp:ListItem Text="否" Value="0"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr flag="style">
            <!--该功能还未实现，暂时隐藏-->
            <!--个人消息提醒配置-->
            <td class="td-l">
                提醒次数
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbRemindNum" regex="^\d*$" errmsg="请输入正数"
                    Style="text-align: right; width: 40px;"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                提醒间隔时间
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbDays" regex="^\d*$" errmsg="请输入正数" Style="text-align: right;
                    width: 30px;"></zhongsoft:LightTextBox>天
                <zhongsoft:LightTextBox runat="server" ID="tbHours" regex="^\d*$" errmsg="请输入正数"
                    Style="text-align: right; width: 30px;"></zhongsoft:LightTextBox>小时
                <input runat="server" id="hiIntervalHours" type="hidden" />
            </td>
        </tr>
    </table>
    <script>
        function initCustomerPlugin() {
            //样式设置未启用，则隐藏相关设置功能
            if (!parseBool('<%=EDPortal.BLL.Sys.SysConfig.Instance.CanSetSysStyle %>')) {
                $('[flag="style"]').hide();
            }
        }

    </script>
</asp:Content>
