<%@ Page Title="我的动态" Language="C#" MasterPageFile="~/UI/Master/ObjectWhList.Master" AutoEventWireup="true" CodeBehind="WorkInfoLeaderList.aspx.cs" Inherits="Zhongsoft.Portal.WHHelper.LIst.WorkInfo.WorkInfoLeaderList" %>

<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>
<%@ Register Src="~/UI/Controls/OrgTree.ascx" TagName="OrgTree" TagPrefix="uc" %>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block">
        <span class="filter-block-lb">搜索</span>
        <span>
            <zhongsoft:LightTextBox ID="txtKey" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span>
    </span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <%--操作权限--%>
    <input type="hidden" id="hiIsPower" runat="server" />
    <%--是否是查看--%>
    <input type="hidden" id="hiIsView" runat="server" />
    <link href="<%=WebAppPath %>/Themes/DayPilot/DayPilotLayout.css" rel="stylesheet" type="text/css" />
    <link href="<%=WebAppPath %>/Themes/DayPilot/themes.css" rel="stylesheet" type="text/css" />
    <script src="../../../UI/Script/dayploit.handling.js" type="text/javascript"></script>
    <script src="../../../UI/Script/jquery-1.4.3.min.js" type="text/javascript"></script>
    <div class="daypilot-main">
        <div class="daypilot-left">
            <DayPilot:DayPilotNavigator ID="DayPilotNavigator1" runat="server" BoundDayPilotID="DayPilotScheduler1"
                SelectMode="Week" CssClassPrefix="navigator_silver_" ShowMonths="1" ClientObjectName="dpn" />
            <div style="margin-top: 10px; width: 140px; overflow-x: scroll; border: 1px solid #A0A0A0;">
                <uc:OrgTree ID="orgTree" Flag="1" runat="server" />
            </div>
        </div>
        <div class="daypilot-right">
            <div class="pilot-tab">
            </div>
            <DayPilot:DayPilotScheduler ID="DayPilotScheduler1" runat="server" ClientObjectName="dp" RowMinHeight="35"
                Days="7" ShowEventStartEnd="true" Width="96%" EventHeight="30" EventFontSize="12px" RowHeaderColumnWidths="105" CellWidth="24"
                CssClassPrefix="scheduler_blue" CssOnly="true" LoadingLabelBackColor="#0099ff" EventBackColor="#0066ff" EventBorderColor="#0066cc"
                Crosshair="Full" BusinessBeginsHour="8" BusinessEndsHour="18" DataStartField="WorkStartDate" EventBorderVisible="true"
                DataEndField="WorkEndDate" DataTextField="TitleText" DataValueField="UserWorkInfoId" Height="500" HeightSpec="Max"
                DataResourceField="UserId" ContextMenuID="DayPilotMenu1" EventMoveHandling="CallBack"
                OnEventMove="DayPilotCalendar1_EventMove" OnEventMenuClick="DayPilotCalendar1_EventMenuClick"
                EventResizeHandling="CallBack" OnEventResize="DayPilotCalendar1_EventResize"
                OnCommand="DayPilotCalendar1_Command" EventClickHandling="JavaScript" EventClickJavaScript="LDDT_eventClick(e);"
                TimeRangeSelectedHandling="JavaScript" TimeRangeSelectedJavaScript="LDDT_timeRangeSelected(start, end, resource);"
                OnBeforeEventRender="DayPilotCalendar1_BeforeEventRender" AfterRenderJavaScript="afterRender();"
                OnBeforeTimeHeaderRender="DayPilotScheduler1_BeforeTimeHeaderRender" OnBeforeResHeaderRender="BeforeResHeaderRender">
            </DayPilot:DayPilotScheduler>
            <DayPilot:DayPilotMenu ID="DayPilotMenu2" runat="server" CssClassPrefix="menu_">
                <DayPilot:MenuItem Text="浏览" Action="JavaScript" JavaScript="LDDT_eventClick(e);" />
            </DayPilot:DayPilotMenu>
        </div>
        <div id="msgtop" style="color: red; font-size: 25px; text-align: center;">
            填写员工动态请前往【我的信息】->【<a style="color: blue; font-size: 25px; text-decoration: underline;" onclick="opengztx('4B788771-EB42-492F-98EA-3F6FE77F593B','工作动态','/Portal/WHHelper/LIst/WorkInfo/WorkInfoList.aspx?type=0&secid=4B788771-EB42-492F-98EA-3F6FE77F593B')">工作动态</a>】界面填写动态 
        </div>
    </div>
    <input type="hidden" id="hiType" runat="server" />
    <script type="text/javascript">
        $isFlow = "0";
        $("#ctl00_divConfigBar").hide();

        function LDDT_timeRangeSelected(start, end, location) {
            dp.message('请前往【我的信息】->【<a style="text-decoration: underline; color:white;" onclick="opengztx(\'4B788771-EB42-492F-98EA-3F6FE77F593B\',\'工作动态\',\'/Portal/WHHelper/LIst/WorkInfo/WorkInfoList.aspx?type=0&secid=4B788771-EB42-492F-98EA-3F6FE77F593B\')">工作动态</a>】界面填写动态！');

        }

        function LDDT_eventClick(e) {
            var strStart = e.data.start.replace("T", " ").replace("-", "/");
            var start = Date.parse(strStart);
            var today = new Date();
            var url = buildQueryUrl("/WHHelper/LIst/WorkInfo/WorkInfoEditor.aspx?actionType=1&bizId=" + e.value());
            if (showDivDialog(url, "", 750, 300, refeshCallBack) != undefined) {
                dp.commandCallBack('refresh');
            }
            dp.clearSelection();
        }

        function refeshCallBack() {
            dp.commandCallBack('refresh');
        }
        function opengztx(id, text, url) {
            //点击闪动的图标打开工作提醒台账页
            //id:菜单id
            //text:菜单名称
            //url:页面url
            window.parent.parent.$("#tab-container").opentabitem({ id: id, text: text, url: url, isactive: true, closeable: true }, true);
            return false;
        }
        $(function () {
            var hgt = $(".daypilot-main").height();
            var hgtL = $(".daypilot-left").height();
            var Chgt = hgtL > hgt ? hgtL : hgt;
            var clientHeight = ((document.body.clientHeight < document.documentElement.clientHeight) ? document.body.clientHeight : document.documentElement.clientHeight) - 50;
            if (Chgt > clientHeight) {
                $(".daypilot-main").attr("style", "max-height:" + clientHeight + "px;overflow-y: scroll;");
            }
        });
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
