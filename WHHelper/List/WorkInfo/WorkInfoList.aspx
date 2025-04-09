<%@ Page Language="C#" MasterPageFile="~/UI/Master/ObjectWhList.Master" Title="领导动向" AutoEventWireup="true" CodeBehind="WorkInfoList.aspx.cs" Inherits="Zhongsoft.Portal.WHHelper.LIst.WorkInfo.WorkInfoList" %>

<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>
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
        </div>
        <div class="daypilot-right">
             <div class="pilot-tab"  >
                 </div>
            <div class="pilot-tab" style="display: none;">
                <a href="javascript:SelectRoomDay();" style="display: none;">天视图</a> <a class="pilot-tablink" href="javascript:SelectRoomWeek();">周视图</a> <a href="javascript:SelectRoomMouth();" style="display: none;">月视图</a>
            </div>  
            <DayPilot:DayPilotScheduler ID="DayPilotScheduler1" runat="server" ClientObjectName="dp"  RowMinHeight="35"  
                Days="7" ShowEventStartEnd="true" Width="96%" EventHeight="30" EventFontSize="12px"  RowHeaderColumnWidths="105" CellWidth="24" 
                CssClassPrefix="scheduler_blue" CssOnly="true" LoadingLabelBackColor="#0099ff" EventBackColor="#0066ff" EventBorderColor="#0066cc"
                Crosshair="Full" BusinessBeginsHour="8" BusinessEndsHour="18" DataStartField="WorkStartDate" EventBorderVisible="true"
                DataEndField="WorkEndDate" DataTextField="TitleText" DataValueField="UserWorkInfoId" Height="600" HeightSpec="Max"
                DataResourceField="UserId" ContextMenuID="DayPilotMenu1" EventMoveHandling="CallBack"
                OnEventMove="DayPilotCalendar1_EventMove" OnEventMenuClick="DayPilotCalendar1_EventMenuClick"
                EventResizeHandling="CallBack" OnEventResize="DayPilotCalendar1_EventResize"
                OnCommand="DayPilotCalendar1_Command" EventClickHandling="JavaScript" EventClickJavaScript="LDDT_eventClick(e);"
                TimeRangeSelectedHandling="JavaScript" TimeRangeSelectedJavaScript="LDDT_timeRangeSelected(start, end, resource);"
                OnBeforeEventRender="DayPilotCalendar1_BeforeEventRender" AfterRenderJavaScript="afterRender();"
                OnBeforeTimeHeaderRender="DayPilotScheduler1_BeforeTimeHeaderRender" OnBeforeResHeaderRender="BeforeResHeaderRender" >
            </DayPilot:DayPilotScheduler>
            <DayPilot:DayPilotMenu ID="DayPilotMenu1" runat="server" CssClassPrefix="menu_">
                <DayPilot:MenuItem Text="编辑" Action="JavaScript" JavaScript="LDDT_eventClick(e);" />
                <DayPilot:MenuItem Text="-" Action="NavigateUrl" />
                <DayPilot:MenuItem Text="删除" Action="JavaScript" JavaScript=" if (confirm('你确定要删除这个安排')) dp.eventMenuClickCallBack(e,'Delete');" />
            </DayPilot:DayPilotMenu>
            <DayPilot:DayPilotMenu ID="DayPilotMenu2" runat="server" CssClassPrefix="menu_">
                <DayPilot:MenuItem Text="浏览" Action="JavaScript" JavaScript="LDDT_eventClick(e);" />
            </DayPilot:DayPilotMenu>
        </div>
        <div  id="msgtop" style="color:red;font-size:25px; text-align:center; ">
            请在自己对应行单击鼠标左键拖动时间格填写日程 
        </div>
    </div>
    <input type="hidden" id="hiType" runat="server" />
    <script type="text/javascript">
        $isFlow = "0";
        $("#ctl00_divConfigBar").hide();
        $("#Fieldset1").hide();
        afterRender(); 
        function SelectRoomWeek() {
            var hiTypeValue = $('#<%=hiType.ClientID %>').val();
            var url = "<%=WebAppPath %>/WHHelper/LIst/WorkInfo/WorkInfoList.aspx?" + hiTypeValue;
            window.location.href = url;
            return false;
        }

        function LDDT_timeRangeSelected(start, end, location) {
            //判断当前人是否是所选人或者当前人的角色属于leaderpost
            if (('<%=KPMSUser.UserId%>' == location.toLocaleUpperCase() || $('#<%=hiIsPower.ClientID %>').val() == "0") && $('#<%=hiIsView.ClientID %>').val() == "0") {
                var url = buildQueryUrl("/WHHelper/LIst/WorkInfo/WorkInfoEditor.aspx?actionType=2&start=" + start.toStringSortable() + "&end=" + end.toStringSortable() + "&uid=" + location.toLocaleUpperCase());
                if (location) {
                    url += "&location=" + location;
                }
                if (showDivDialog(url, "", 750, 300, refeshCallBack) != undefined) {
                    dp.commandCallBack('refresh');
                }
                dp.clearSelection();

            }
            else {
                dp.message("对不起，您没有权限操作他人的数据！");
            }


        }

        function LDDT_eventClick(e) {
            var strStart = e.data.start.replace("T", " ").replace("-", "/");
            var start = Date.parse(strStart);
            var today = new Date();
            var url=""; 
                url = buildQueryUrl("/WHHelper/LIst/WorkInfo/WorkInfoEditor.aspx?actionType=3&bizId=" + e.value());
            //判断当前人是否是所选人或者当前人的角色属于leaderpost
            if (('<%=KPMSUser.UserId%>' == e.data.resource.toLocaleUpperCase() || $('#<%=hiIsPower.ClientID %>').val() == "0") && $('#<%=hiIsView.ClientID %>').val() == "0") {

                if (e.data.backColor == undefined && start > today) {
                    url = buildQueryUrl("/WHHelper/LIst/WorkInfo/WorkInfoEditor.aspx?actionType=3&bizId=" + e.value());
                }
                if (showDivDialog(url, "", 750, 300, refeshCallBack) != undefined) {
                    dp.commandCallBack('refresh');
                }
                dp.clearSelection();

            }
            else if ($('#<%=hiIsView.ClientID %>').val() == "1") {
                url = buildQueryUrl("/WHHelper/LIst/WorkInfo/WorkInfoEditor.aspx?actionType=1&bizId=" + e.value());
                if (showDivDialog(url, "", 750, 300, refeshCallBack) != undefined) {
                    dp.commandCallBack('refresh');
                }
                dp.clearSelection();
            }
            else {
                dp.message("对不起，您没有权限操作他人的数据！");

            }


        }

        function refeshCallBack() {
            dp.commandCallBack('refresh');
        }
        function afterRender() {
            var type2 =  '<%=DayPilotNBackgroundColor%>';
              var type = '<%=ShowType%>';
            if (type == '1') {
                $("#msgtop").hide();
            }  
        }

        
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>


