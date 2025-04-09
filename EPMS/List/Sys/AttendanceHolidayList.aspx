<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AttendanceHolidayList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Sys.AttendanceHolidayList" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">年&nbsp;份</span> <span>
        <zhongsoft:LightDropDownList ID="ddlYear" runat="server" class="kpms-ddlsearch" EnableTheming="false"
            Style="width: 110px; margin: 3px 0px;">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">月&nbsp;份</span>
        <span>
            <zhongsoft:LightDropDownList ID="ddlMonth" runat="server" class="kpms-ddlsearch"
                EnableTheming="false" Style="width: 110px; margin: 3px 0px;">
            </zhongsoft:LightDropDownList>
        </span></span><span class="filter-block"><span class="filter-block-lb"></span><span>
            <img src="<%=WebAppPath %>/Themes/custom/images/today.jpg" alt="今天" border="0" />今天
            <img src="<%=WebAppPath %>/Themes/custom/images/workday.jpg" alt="工作日" border="0" />工作日
            <img src="<%=WebAppPath %>/Themes/custom/images/restday.jpg" alt="休息日" border="0" />休息日
            <img src="<%=WebAppPath %>/Themes/custom/images/specialday.jpg" alt="法定节假日" border="0" />法定节假日
        </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <asp:LinkButton runat="server" ID="btnInit" CssClass="btn-query" OnClick="btnInit_Click"
        OnClientClick='return confirm("确定重置本月数据？");' EnableTheming="false"><span>初始化本月数据</span>
    </asp:LinkButton>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <style type="text/css">
        .restday-color
        {
            background-color: #CEDFF3;
        }
        .today
        {
            background-color: #0099D9;
        }
        .specialday-color
        {
            background-color: #0066CC;
        }
        .timesize a:hover
        {
            color: #C3C3C3;
        }
    </style>
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="15" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        UseDefaultDataSource="true" EmptyDataText="没有要查找的数据" Visible="false">
        <PagerStyle HorizontalAlign="Right"></PagerStyle>
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <asp:DataList EnableViewState="true" DataKeyField="Date" ItemStyle-VerticalAlign="Middle"
        Width="100%" BorderWidth="0px" ItemStyle-HorizontalAlign="Center" GridLines="Both"
        ID="daysList" runat="server" RepeatDirection="Horizontal" RepeatColumns="31"
        OnSelectedIndexChanged="daysList_SelectedIndexChanged">
        <ItemTemplate>
            <div class="timesize <%#Eval("Color")%>">
                <asp:LinkButton Font-Bold="true" Date='<%#Eval("Date") %>' ToolTip='<%#Eval("DateWeek") %>'
                    Width="30px" CommandName="Select" CssClass="btn-query" EnableTheming="false"
                    ID="linkDay" runat="server" Text='<%#Eval("Week")+"</br>"+Eval("Day") %>'></asp:LinkButton>
            </div>
        </ItemTemplate>
    </asp:DataList>
    <input type="hidden" runat="server" id="hiSelDay" />
    <table width="100%" class="tz-table">
        <tr>
            <td colspan="2" class="td-m">
                设置
            </td>
        </tr>
        <tr>
            <td class="td-l">
                日期
            </td>
            <td class="td-r">
                <asp:Label runat="server" ID="lbDate"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                名称
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbDateName"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                设置类型
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rbtnDateType" RepeatDirection="Horizontal">
                    <asp:ListItem Text="工作日" Value="工作日"></asp:ListItem>
                    <asp:ListItem Text="休息日" Value="休息日"></asp:ListItem>
                    <asp:ListItem Text="法定节假日" Value="法定节假日"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
            </td>
            <td class="td-r">
                <asp:LinkButton runat="server" ID="lbtnSaveDate" class="kpms-btn" OnClick="lbtnSaveDate_Click">
                            <span> <img src="<%=WebAppPath %>/Themes/Images/btn_tb_save.gif" alt="保存" border="0"/>保存</span>
                </asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
<asp:Content ID="Content6" runat="server" ContentPlaceHolderID="treeView">
</asp:Content>
