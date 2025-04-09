<%@ Page Language="C#" Title="设置工作状态" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="WorkInfoEditor.aspx.cs" Inherits="Zhongsoft.Portal.WHHelper.LIst.WorkInfo.WorkInfoEditor" %>
<asp:Content ID="toolBtn1" ContentPlaceHolderID="toolBtn" runat="server">
     <div class="subtoolbarbg">
      <asp:LinkButton runat="server" ID="btnReuse" CssClass="subtoolbarlink"   displaystatus="(23.*)"  AccessLevel="3"
            OnClientClick="return saveData();" EnableTheming="false" OnClick="btnReuse_Click">
            <img width="16" height="16" id="ctl00_toolBar_dlButtons_ctl00_img" alt="保存" src="/Portal/Themes/Images/btn_save.gif"><span>保存</span></asp:LinkButton>
            <asp:LinkButton runat="server" ID="btnDelete" CssClass="subtoolbarlink"    displaystatus="(3.*)"    AccessLevel="3"
            OnClientClick="return deleteData();" EnableTheming="false" OnClick="btnDelete_Click">
            <img width="16" height="16" id="ctl00_toolBar_dlButtons_delete_img" alt="删除" src="/Portal/Themes/Images/btn_delete.gif"><span>删除</span></asp:LinkButton>
        <asp:LinkButton runat="server" ID="btnClose" CssClass="subtoolbarlink"  
            OnClientClick="return   closeWindow();" EnableTheming="false"><img width="16" height="16" id="ctl00_toolBar_dlButtons_ctl02_img" alt="关闭" src="/Portal/Themes/Images/btn_close.gif"><span>关闭</span></asp:LinkButton>
    </div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table runat="server" class="kpms-table" width="100%">
        <tr runat="server" id="trSelectUser">
            <td class="td-l">姓名</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="txtUserName" TableName="KMS_UserInfo_UserWorkInfo" Field="UserName" ActiveStatus="(23.*)" runat="server"  Width="90px" ReadOnly="true" />
                   <input type="hidden" runat="server" id="hiUserId" tablename="KMS_UserInfo_UserWorkInfo" field="UserId" />
            </td>
        </tr>
        <tr>
            <td class="td-l">时间<span class="req-star">*</span></td>
            <td class="td-m" nowrap="nowrap">
                <div id="editTime"  >
                <!-- 时间几个控件不要换行-->
                <zhongsoft:XHtmlInputText type="text" runat="server" activestatus="(23.*)" req="1" onchange="UpdateDateTime('1');"
                    readonly="readonly" class="kpms-textbox-date" ID="txtWorkStartDate" />
                <zhongsoft:LightDropDownList ID="ddlStartHour" activestatus="(23.*)" runat="server" req="1"
                    onchange="UpdateDateTime('1');" Width="45px">
                </zhongsoft:LightDropDownList>
                :
                <zhongsoft:LightTextBox runat="server" ID="tbStartMini" activestatus="(23.*)" Text="00" onblur="UpdateDateTime('1');"
                    Width="20px" MaxLength="2" regex="^\d+$" errmsg="请正确填写分钟">
                </zhongsoft:LightTextBox>
                至
                <zhongsoft:XHtmlInputText type="text" runat="server" activestatus="(23.*)" req="1" onchange="UpdateDateTime('1');"
                    readonly="readonly" class="kpms-textbox-date" ID="txtWorkEndDate" />
                <zhongsoft:LightDropDownList ID="ddlEndHour" activestatus="(23.*)" runat="server" req="1" Width="45px" onchange="UpdateDateTime('1');">
                </zhongsoft:LightDropDownList>
                :
                <zhongsoft:LightTextBox runat="server" ID="tbEndMini" activestatus="(23.*)" Text="00" Width="20px"
                    onblur="UpdateDateTime('1');" MaxLength="2" regex="^\d+$" errmsg="请正确填写分钟">
                </zhongsoft:LightTextBox>
                  </div>
                   <div id="showTime" >
                       <input  id="txtnewWorkStartDate" runat="server" style="background: rgb(255, 255, 255); border: currentColor; border-image: none; width: 120px;"  type="text" readonly="readonly"   isdisabled="true"  />至
                        <input  id="txtnewWorkEndDate" runat="server" style="background: rgb(255, 255, 255); border: currentColor; border-image: none; width: 120px;"  type="text" readonly="readonly"   isdisabled="true"  />
                   </div>
            </td>
        </tr>
        <tr>
            <td class="td-l">状态<span class="req-star">*</span></td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlTitle" runat="server" Activestatus="(23.*)" TableName="KMS_UserInfo_UserWorkInfo" Field="Title" Width="120px" req="1">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiTitleText" tablename="KMS_UserInfo_UserWorkInfo" field="TitleText" />
            </td>
        </tr>
        <tr>
            <td class="td-l">内容</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="txtContent" ActiveStatus="(23.*)" CssClass="kpms-textarea"
                    runat="server" TextMode="MultiLine" EnableTheming="false" TableName="KMS_UserInfo_UserWorkInfo" Field="Content" />
            </td>
        </tr>
    </table>

    <input id="hiStartDate" type="hidden" tablename="KMS_UserInfo_UserWorkInfo" activestatus="(*.*)"
        field="WorkStartDate" runat="server" />
    <input id="hiEndDate" type="hidden" tablename="KMS_UserInfo_UserWorkInfo" activestatus="(*.*)"
        field="WorkEndDate" runat="server" />
    <input type="hidden" runat="server" id="hiUserWorkInfoId" tablename="KMS_UserInfo_UserWorkInfo"
        field="UserWorkInfoId" />
    <input type="hidden" runat="server" id="hiStartTime" value="8" />
    <input type="hidden" runat="server" id="hiEndTime" value="23" />
    <input type="hidden" runat="server" id="hiFlag" tablename="KMS_UserInfo_UserWorkInfo" field="Flag" />

    <script type="text/javascript">
        function initCustomerPlugin() {
            var actName = "<%=ActionType%>";
            if (actName == "Read") {
                $("#editTime").hide();
                $("#showTime").show();
            } else {
                 $("#editTime").show();
                $("#showTime").hide();
            }
        
    }
     
        function UpdateDateTime(type) {
            if (type = "1") {
                var startdate = document.all("<%=txtWorkStartDate.ClientID%>").value;
                var enddate = document.all("<%=txtWorkEndDate.ClientID%>").value;
                var starthour = document.all("<%=ddlStartHour.ClientID%>").value;
                var endhour = document.all("<%=ddlEndHour.ClientID%>").value;
                var startmini = document.all("<%=tbStartMini.ClientID%>").value;
                var endmini = document.all("<%=tbEndMini.ClientID%>").value;

                if (startmini > 59) {
                    alert("请正确填写分钟");
                    $("#<%=tbStartMini.ClientID%>").val("00");
                    return false;
                }
                if (endmini > 59) {
                    alert("请正确填写分钟");
                    $("#<%=tbEndMini.ClientID%>").val("00");
                    return false;
                }

                var histartdate = document.all("<%=hiStartDate.ClientID%>");
                var hienddate = document.all("<%=hiEndDate.ClientID%>");
                histartdate.value = startdate + " " + starthour + ":" + startmini;
                hienddate.value = enddate + " " + endhour + ":" + endmini;
            }
        }


        //判断会议计划时间
        function CheckDate1(ischeck) {

            var beginDate = $('#<%=txtWorkStartDate.ClientID %>').val();
            var endDate = $('#<%=txtWorkEndDate.ClientID %>').val();
            var beginHour = $('#<%=ddlStartHour.ClientID %>').val();
            var beginMinute = $('#<%=tbStartMini.ClientID %>').val();

            if (ischeck) {
                var day, now, hour, min, year, month, nowTime;
                now = new Date();
                year = now.getFullYear();
                month = now.getMonth() + 1;
                day = now.getDate();
                hour = now.getHours();
                min = now.getMinutes();
                if (month < 10) {
                    month = "0" + month;
                }
                if (day < 10) {
                    day = "0" + day;
                }

                nowTime = year + "-" + month + "-" + day;



                var result = CompareDate(nowTime, beginDate);
                if (result == "-1") {
                    alert('开始时间不能小于当前时间！');
                    return false;
                }
                else if (result == "0") {
                    if (parseInt(hour) > parseInt(beginHour)) {
                        alert('开始时间不能小于当前时间！');
                        return false;
                    }
                    else if (parseInt(hour) == parseInt(beginHour)) {
                        if (parseInt(min) > parseInt(beginMinute)) {
                            alert('开始时间不能小于当前时间！');
                            return false;
                        }
                    }
                }
            }

            var resultPlan = CompareDate(beginDate, endDate);
            if (resultPlan == "-1") {
                alert('开始日期不能大于结束日期！');
                return false;
            }
            else if (resultPlan == "0") {

                var endHour = $('#<%=ddlEndHour.ClientID %>').val();
                if (parseInt(beginHour) > parseInt(endHour)) {
                    alert('开始日期等于结束日期的时，开始小时不能大于结束小时！');
                    return false;
                }
                else if (parseInt(beginHour) == parseInt(endHour)) {

                    var endMinute = $('#<%=tbEndMini.ClientID %>').val();
                    if (parseInt(beginMinute) > parseInt(endMinute)) {
                        alert('开始日期等于结束日期、开始小时等于结束小时的时候，开始分钟不能大于结束分钟');
                        return false;
                    }
                }
            }
            return true;
        }

        function CompareDate(beginDate, endDate) {
            if (beginDate != '' && endDate != '') {
                var begin = beginDate.replace('-', '/');
                var end = endDate.replace('-', '/');
                if (Date.parse(begin) > Date.parse(end)) {
                    return "-1";
                }
                else if (Date.parse(begin) == Date.parse(end)) {
                    return "0";
                }
                else {
                    return "1";
                }
            }
            return false;
        }


          function saveData() {

            if (!checkReqField()) {

                return false;
            }
            if (typeof (checkForm) == 'function') {
                if (!checkForm()) return false;
            }

            if ("<%=ActionType %>" == "Create"
            || "<%=ActionType %>" == "Update"
            || "<%=ActionType %>" == "Control"
            || "<%=ActionType %>" == "Delete") {
                if (parent.returnValue == undefined || parent.returnValue == null) {
                    parent.returnValue = "Saved";
                }
                return true;
            }
            return false;
        }

         function deleteData() {
                return window.confirm("您确定删除吗？");
            }
    </script>


  
</asp:Content>


