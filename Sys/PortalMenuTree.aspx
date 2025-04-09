<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PortalMenuTree.aspx.cs"
    Inherits="Zhongsoft.Portal.Sys.PortalMenuTree" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>工作菜单页面</title>
</head>
<body class="kpms-treebody">
    <form id="form1" runat="server">
    <table>
        <tr>
            <td>
                <asp:TreeView ID="MenuTree" runat="server" ShowLines="true">
                </asp:TreeView>
            </td>
        </tr>
    </table>

    <script>
        //获取传阅
        function GetInfo() {
            $.post("Workflow/WorkForwardList.aspx",
                    { asyfunc: "GetForwardItemsCount" },
                    function(res) {
                        if (res == "0")
                            info.innerHTML = flagInfo;
                        else
                            info.innerHTML = flagInfo + '(<font color="red">' + res + '</font>)';
                    }
            );
        }
        //获取待办
        function GetTodo() {
            $.post("Workflow/WorkToDoList.aspx",
                    { asyfunc: "GetToDoItemsCount" },
                    function(res) {
                        if (res == "0")
                            todo.innerHTML = flagTodo;
                        else
                            todo.innerHTML = flagTodo + '(<font color="red">' + res + '</font>)';
                    }
            );
        }

        //获取任务
        function GetTask() {
            $.post("/Portal/MBO/List/TaskEntityList.aspx",
                    { asyfunc: "GetTaskItemsCount" },
                    function(res) {
                        if (res == "0")
                            task.innerHTML = flagTask;
                        else
                            task.innerHTML = flagTask + '(<font color="red">' + res + '</font>)';
                    }
            );
        }

        //获取日程
        function GetSchedule() {
            $.post("/Portal/MBO/List/ScheduleEntityList.aspx",
                    { asyfunc: "GetScheduleItemsCount" },
                    function(res) {
                        if (res == "0")
                            schedule.innerHTML = flagSchedule;
                        else
                            schedule.innerHTML = flagSchedule + '(<font color="red">' + res + '</font>)';
                    }
            );
        }

        var flagTodo = "待办工作";
        var flagInfo = "信息传阅";
        var flagTask = "我的任务";
        var flagSchedule = "我的日程";

        var todo; var info; var task; var schedule;
        var todoResult = $("#MenuTree a:contains('" + flagTodo + "')");
        var infoResult = $("#MenuTree a:contains('" + flagInfo + "')");
        var taskResult = $("#MenuTree a:contains('" + flagTask + "')");
        var scheduleResult = $("#MenuTree a:contains('" + flagSchedule + "')");


        function initCustomerPlugin() {
            if (infoResult.length > 0) {
                info = infoResult[0];
                GetInfo();
                window.setInterval(GetInfo, 120000);
            }

            if (todoResult.length > 0) {
                todo = todoResult[0];
                GetTodo();
                window.setInterval(GetTodo, 120000);
            }

            if (taskResult.length > 0) {
                task = taskResult[0];
                GetTask();
                window.setInterval(GetTask, 120000);
            }

            if (scheduleResult.length > 0) {
                schedule = scheduleResult[0];
                GetSchedule();
                window.setInterval(GetSchedule, 120000);
            }
        }
    </script>

    </form>
</body>
</html>
