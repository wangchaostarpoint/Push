<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectFileExpandInfo.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.ProjectData.ProjectFileExpandInfo"
    Title="关联及属性" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <div>
        <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="False"
            AllowPaging="True" AllowSorting="true" BindGridViewMethod="BindList">
            <Columns>
                <asp:TemplateField HeaderStyle-Width="20px">
                    <HeaderTemplate>
                        <img runat="server" src="~/Themes/Images/flow_t.gif" title="流转过程" alt="流转过程">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%# FlowState(Eval("ProcessStatus").ToString(),
                      Eval("ProcessInstanceId").ToString(), 
                     Eval("packageName").ToString(), 
                     Eval("processId").ToString(), 
                      string.Empty, string.Empty)%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="主题">
                    <ItemTemplate>
                        <div style="width: 420px;" class="autoskip">
                            <a title='<%# Eval("ProcessInstanceName") %>' onclick="viewForm('<%#Eval("FormId") %>','<%#Eval("ProcessInstanceId")%>','<%#Eval("ProcessStatus")%>')">
                                <%# Eval("ProcessInstanceName") %></a>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="当前处理人" HeaderStyle-Width="180px">
                    <ItemTemplate>
                        <div class="autoskip" style="width: 180px">
                            <span prcid='<%#Eval("ProcessInstanceId") %>'></span>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ProcessName" HeaderText="表单类型" HeaderStyle-Width="150px" />
                <asp:TemplateField HeaderText="发起人[发起时间]" HeaderStyle-Width="350px">
                    <ItemTemplate>
                        <%#Eval("CreatorName")%>&nbsp;[<%#Eval("CreatorOrganizationName")%>]&nbsp;<%# GetStartDate(DateTime.Parse(Eval("StartDateTime").ToString()))%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="FinishDateTime" HeaderText="结束时间" DataFormatString="{0:yyyy-MM-dd}"
                    HeaderStyle-Width="80px" />
            </Columns>
        </zhongsoft:LightPowerGridView>

        <%--以下暂做隐藏处理--%>
        <table class="tz-table" style="width: 100%" runat="server" visible="false">
            <tr>
                <td colspan="6" class="flexible" onclick="openDetailInfo('divWorkflow')">流程信息&nbsp;<img src="../../../Themes/Images/lright.png" />
                </td>
            </tr>
            <tr>
                <td class="td-m" colspan="6" align="center">
                    <div id='div_loadingmsg' style="display: none">
                        <div id="div_loadingmsg_Content">
                            <span style="margin-left: 30px; color: red; font-size: large">加载中...</span>
                        </div>
                    </div>
                    <div id="divWorkflow">
                        <iframe width="100%" id="formView" scrolling="yes" frameborder="no" border="0" height="480px"></iframe>
                    </div>
                    <label id="lbTipWorkflow" style="display: none;">无流程信息</label>
                </td>
            </tr>
        </table>
    </div>
    <script type="text/javascript">
        function initCustomerPlugin() {
            getCurrUser();
        }
        $(document).ready(function () {
            var formUrl = '<%=WebAppPath%><%=FormUrl%>';
            if ("<%=FormUrl%>" != "") {
                $("#div_loadingmsg").show();
                $("#formView").attr('src', formUrl);
            } else {
                $("#formView").css("display", "none");
                $("#lbTipWorkflow").show();
            }
        });
        $("#formView").load(function () {
            try {
                $("#div_loadingmsg").hide();
                var child = $("#formView")[0].contentWindow;
                child.hiddenToolBar();
                child.hiddenOverflowY();
                if (child != null) {
                    $("#formView").css("height", "auto");
                    $("#formView").css("height", child.document.body.scrollHeight + 'px');
                    $("#formView").css("width", '100%');
                    $("#formView").css("position", '');
                }
            } catch (e) {

            }
        })

        function openDetailInfo(mid) {
            $("#" + mid).toggle();
            //根据显隐，切换图片
            if ($("#" + mid).css('display') == 'none') {
                //元素下有多个图片，更新第二个
                if ($(event.srcElement).find('img').length > 1) {
                    $(event.srcElement).find('img')[1].src = '../../../themes/images/rright.png';
                }
                else {
                    $(event.srcElement).find('img').attr('src', '../../../themes/images/rright.png');
                }
            }
            else {
                //元素下有多个图片，更新第二个
                if ($(event.srcElement).find('img').length > 1) {
                    $(event.srcElement).find('img')[1].src = '../../../themes/images/lright.png';
                }
                else {
                    $(event.srcElement).find('img').attr('src', '../../../themes/images/lright.png');
                }
            }
        }

        function viewForm(formId, processId, processStatus) {
            var url = '/Sys/Workflow/FormDetail.aspx?actionType=1&FormID=' + formId + '&prcinstid=' + processId;
            url = buildQueryUrl(url, null);
            window.open(encodeURI(url), "", "");
        }

        //获取当前处理人
        function getCurrUser() {
            var $ids = "";
            $("#<%=gvList.ClientID %> span[prcid]").each(function () {
                $ids += $(this).attr("prcid") + "|";
            });
            var url = buildQueryUrl('/Sys/Workflow/ProcessManager.aspx', null);
            $.post(url,
                { asyfunc: "GetCurrUser", prcIdList: $ids },
                function (res) {
                    if (res == "") { return; }
                    var $l = eval('(' + res + ')');
                    $("#<%=gvList.ClientID %> span[prcid]").each(function () {
                        var prcid = $(this).attr("prcid");
                        for (var i = 0; i < $l.length; i++) {
                            var $id = $l[i][0];
                            var $prcStatus = $l[i][1];
                            var $currName = $l[i][2];
                            if (prcid == $id) {
                                //可能有多个步骤，把之前的拼接上来
                                var currName = $currName;
                                var preName = $(this).html();
                                var t = preName + currName;
                                $(this).html(t);
                                $(this).attr("title", t);
                            }
                        }
                    });
                }
            );
        }
    </script>
</asp:Content>

