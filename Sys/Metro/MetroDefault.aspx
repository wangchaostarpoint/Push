<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MetroDefault.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Metro.MetroDefault" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>��ҵһ�廯��Ӫ����ƽ̨-�쵼</title>
    <link href="../../themes/custom/styles/fashionfoucs_lrtk1.css" rel="stylesheet" />
    <link href="../../themes/custom/styles/style.css" rel="stylesheet" type="text/css" />
    <link href="../../themes/styles/jquery-ui-1.10.4.custom.css" rel="stylesheet" type="text/css" />

</head>

<body>
    <form id="form1" runat="server">
    <script type="text/javascript">
        $(function () {
            $('#left_table').height(($(window).height() - 10) + 'px');
            $('#workSpace').height(($('#left_table').height() - 0) + 'px');
        })
   </script>
    <table cellpadding="0" cellspacing="0" id="left_table">
        <tr>
            <td valign="top" width="50%" style="background: url(../../themes/custom/images/tdbg.png) repeat;">
                <div class="left_table_first">
                    <asp:Repeater runat="server" ID="metroRepeater" OnItemDataBound="metroRepeater_ItemDataBound">
                        <ItemTemplate>
                            <a class="sbtn" id="anchor" runat="server" title='<%#Eval("FormName").ToString()%>'>
                                <span>
                                    <img src="../../themes/custom/images/pb1.png" width="50" height="50" /><br />
                                    <%#Eval("FormName").ToString().Length > 5 ? Eval("FormName").ToString().Substring(0, 5) +"��": Eval("FormName").ToString()%></span></a>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <div style="padding-bottom: 2px; border-top: #8e868d 1px solid;">
                    <a id="aMyDone" class="sbtn"><span>
                        <img src="../../themes/custom/images/myworked.png" width="50" height="50" /><br />
                        �Ѱ칤��</span></a><a class="sbtn" id="aUserSelf"><span>
                            <img src="../../themes/custom/images/self-service.png" width="50" height="50" /><br />
                            Ա������</span></a><a class="sbtn" id="aConsignerSet"><span>
                                <img src="../../themes/custom/images/wtsq.png" width="50" height="50" /><br />
                                ί����Ȩ</span></a> <a class="sbtn" id="aPersonalEvent"><span>
                                    <img src="../../themes/custom/images/mywork.png" width="50" height="50" /><br />
                                    ��������</span></a><a id="aPersonalSet" class="sbtn"><span>
                                        <img src="../../themes/custom/images/wtsq3.png" width="50" height="50" /><br />
                                        ���˶���</span></a> <a id="aWorkFlow" class="sbtn"><span>
                                            <img src="../../themes/custom/images/flow.png" width="50" height="50" /><br />
                                            ��������</span></a> <a id="aSysHelp" class="sbtn" style="display: none"><span>
                                                <img src="../../themes/custom/images/systemhelp.png" width="50" height="50" /><br />
                                                ϵͳ����</span></a>
                </div>
            </td>
            <td valign="top" style="background: url(../../themes/custom/images/tdbg2.png)  repeat;
                padding-left: 10px; padding-right: 10px;">
                <iframe src="MetroWorkToDoNew.aspx" frameborder="0" id="workSpace" width="100%"
                    name="workSpace" allowtransparency="true"></iframe>
            </td>
        </tr>
    </table>
    <div id="divFontSize" style="display: none" title="����ϵͳ�����С">
        <table class="bb">
        </table>
    </div>
    <div id="divSysStyle" style="display: none" title="����ϵͳ��ʽ">
        <table class="bb">
            <tr>
                <td>
                    ϵͳ���
                </td>
                <td colspan="3">
                    <zhongsoft:LightDropDownList runat="server" ID="ddlSysStyle">
                        <asp:ListItem Value="">Ĭ��</asp:ListItem>
                        <asp:ListItem Value="blue">��ɫ</asp:ListItem>
                        <asp:ListItem Value="red">��ɫ</asp:ListItem>
                    </zhongsoft:LightDropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    ϵͳ����
                </td>
                <td colspan="3">
                    <zhongsoft:LightDropDownList runat="server" ID="ddlFontSize">
                        <asp:ListItem Value="">����</asp:ListItem>
                        <asp:ListItem Value="big">��</asp:ListItem>
                        <asp:ListItem Value="large">�ش�</asp:ListItem>
                    </zhongsoft:LightDropDownList>
                </td>
            </tr>
        </table>
    </div>
    <div id="divSysHome" style="display: none" title="����ϵͳ��ҳ">
        <table class="bb">
            <tr>
                <td>
                    Ĭ���°�����Ż�
                </td>
                <td colspan="3">
                    <asp:CheckBox runat="server" ID="cbNewPortal" />
                </td>
            </tr>
            <tr>
                <td>
                    Ĭ��ϵͳ��ҳ
                </td>
                <td colspan="3">
                    <zhongsoft:LightObjectSelector runat="server" ID="txtSysHome" PageUrl="~/Sys/Menu/PageSelector.aspx"
                        ResultAttr="att3" Width="210px" />
                    <!--todo Ĭ��ҳ����ת�������������Ч������-->
                </td>
            </tr>
        </table>
    </div> 
    <input type="hidden" id="hiCheck" /> 
    <input type="hidden" id="hiBCPWorkFlows" value="104,105,106,107,108," />
    <script type="text/javascript" src="../../UI/script/metro/jquery-impromptu.4.0.js"></script>
    <script type="text/javascript">

        $(function () {
            initEvent('divFontSize', 'SavePerConfigInfo');
            initEvent('divSysStyle', 'SavePerConfigInfo');
            initEvent('divSysHome', 'SavePerConfigInfo');

            $("#aFontSet").click(function () {
                showSetInfo('divFontSize')

            })
            $("#aUserSelf").click(function () {
                showUserSelf()
            })
            $("#aSysHelp").click(function () {
                showSysHelp()
            })
            $("#aPersonalSet").click(function () {
                showPersonalSet()
            })
            $("#aPersonalEvent").click(function () {
                showPersonalEvent();
            })
            $("#aConsignerSet").click(function () {
                setConsigner();
            })
            $("#aMyDone").click(function () {
                openMyDone();
            })
            $("#aWorkFlow").click(function () {
                openWorkFlow();
            })

            $('#<%=ddlFontSize.ClientID %>').live('change', function () {
                //                var href;
                //                if ($('.font').length > 0) {

                //                    href = $('.font').attr("href").split('t');
                //                    var hrefs = href[0];
                //                }
                //                $('.font').attr("href", hrefs + "themes/custom/styles/big/font.css");
                var styleVal = $(this).val();
                initStyle2IframePage('workSpace', 'font', styleVal);
            })

            $('#<%=ddlSysStyle.ClientID %>').live('change', function () {
                var styleVal = $(this).val();
                initStyle2IframePage('workSpace', 'sys', styleVal);
            })
        });

        //���ض�Ӧiframeҳ�桢��Ӧ����ʽ
        function initStyle2IframePage(iframe, style, styleVal) {

            var styleName = "font.css";
            if (style == "sys") {
                styleName = "sys.css";
            }

            var test = $("#" + iframe).contents().find("head");
            $("<link>").attr({ rel: "stylesheet",
                type: "text/css",
                href: "../../themes/custom/styles/" + styleVal + styleName
            }).appendTo(test);

            $("<link>").attr({ rel: "stylesheet",
                type: "text/css",
                href: "../../themes/custom/styles/" + styleVal + styleName
            }).appendTo("head");

            updateConfig(style, "SavePerConfigInfo", false)
        }

        //����divĬ���¼�
        function initEvent(div, funcName) {
            $("#" + div + ":ui-dialog").dialog("destroy");
            $("#" + div).dialog({
                resizable: false,
                autoOpen: false,
                minHeight: 150,
                minWidth: 370,
                modal: true,
                buttons: {
                    "ȷ��": function () {
                        updateConfig(div, funcName, true)
                        $(this).dialog("close");
                    },
                    "ȡ��": function () {
                        $(this).dialog("close");
                    }
                }
            });
        }

        //������Ӧ��
        function showSetInfo(div) {
            $("#" + div).dialog('open');
            $("#" + div).parent().appendTo("#<%=this.Page.Form.ClientID%>");
            return false;
        }

        //������Ϣ����
        function updateConfig(div, funcName, isLoad) {
            var size = null;
            var style = null;
            var home = null;
            var newPortal = null;
            if (div == 'divFontSize' || div == 'font') {
                size = $('#<%=ddlFontSize.ClientID %>').val();
            }
            if (div == 'divSysStyle' || div == 'sys') {
                style = $('#<%=ddlSysStyle.ClientID %>').val();
            }
            if (div == 'divSysHome') {
                newPortal = $('#<%=cbNewPortal.ClientID %>').attr('checked') == 'checked';
                home = $('#<%=txtSysHome.ClientID %>').val();
            }
            //�첽��������
            $.post("MetroDefault.aspx", { asyfunc: funcName, size: size, style: style, newPortal: newPortal, home: home },
                        function (res) {
                            //�Ƿ�ˢ�¿�Ч��
                            if (isLoad) {
                                window.parent.location.reload(window.parent.location.href);
                            }
                        });
        }

        function setConsigner() {
            var url = "/Sys/workflow/ConsignerList.aspx";
            var json = { IsShowHeader: 1 };
            url = buildQueryUrl(url, json);
            window.open(url);
        }
        function openMyDone() {
            var url = "/Custom/List/DashBoard.aspx";
            var json = { listId: "AB2C8060-6884-49BD-B381-4455E4D66868", IsShowHeader: 1 };
            url = buildQueryUrl(url, json);
            window.open(url);
        }
        function openWorkFlow() {
            var url = "/Sys/Workflow/FormTemplateList.aspx";
            var json = { DefaultWFType: encodeURI("��������"), IsShowHeader: 1 };
            url = buildQueryUrl(url, json);
            window.open(url);
        }
        function showPersonalSet() {
            var url = "/Custom/List/DashBoard.aspx";
            var json = { listId: "12CFBB7E-56C0-4D70-BC2D-951A4D064A5C", IsShowHeader: 1 };
            url = buildQueryUrl(url, json);
            window.open(url);
        }
        function showUserSelf() {
            var url = "/Sys/Workflow/FormTemplateList.aspx";
            var json = { secid: "6E5DF2C4-F498-4EE3-8AFD-DF36B48C9885", IsShowHeader: 1 };
            url = buildQueryUrl(url, json);
            window.open(url);
        }
        //��Ա�������������̺󣬹ر�Ա������ҳ��ˢ�´���
        function reloadPage() {
            //            window.location.reload();
            $('#workSpace').attr('src', $('#workSpace').attr('src'));
        }
        function showPersonalEvent() {
            var url = "/Custom/List/DashBoard.aspx";
            var json = { listId: "0E28DE8A-25F6-414A-85F2-DDBD7C0D347C", IsShowHeader: 1 };
            url = buildQueryUrl(url, json);
            window.open(url);
        }
        function showSysHelp() {
            alert("��");
            return true;
        }
        function openFlow(url) {
            window.open(url);
        }


        //����dicp����
        function CreateDoc(AppCode, AppType, workflowID) {
            var x = window.screen.availWidth - 10;
            var y = window.screen.availHeight - 145;
            var arg;
            var mFeature;
            var url = "<%=DICPWebPath %>/Modules/WebForm/ProcessEventPath.aspx?AppCode=" + AppCode + "&AppType=" + AppType + "&ActionType=0&WorkflowID=" + workflowID;
            var winFeature = "top=0,left=0,width=" + x + ",height=" + y + ",directories=no,fullscreen=no,toolbar=yes,menubar=yes,status=yes,titlebar=yes,location=yes,resizable=yes";

            if (AppCode == "45") {
                window.open("<%=DICPWebPath %>/mis/htsq.htm");
                return;
            }

            if (AppCode == "2" || AppCode == "64") {
                mFeature = "dialogHeight: 200px; dialogWidth: 300px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; status: no;";
                arg = showModalDialog("<%=DICPWebPath %>/Modules/WebForm/SelectFile.aspx", "", mFeature);
                if (arg != null) {
                    url = url + "&FileUrl=" + arg;
                    open(url, AppCode, winFeature);
                }
            }
            else if (checkFlow($('#hiBCPWorkFlows').val(), AppCode)) {
                mFeature = "dialogHeight: 120px; dialogWidth: 300px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; status: no;";
                arg = showModalDialog("<%=DICPWebPath %>/modules/webform/bcp/SelectBCPBaseProject.aspx", "", mFeature);
                if (arg) {
                    open(url, AppCode, winFeature)
                }
            }
            else
                open(url, AppCode, winFeature);

        }
        function checkFlow(bCPFlows, currentFlow) {
            var bCPFlowsArray = bCPFlows.split(",");
            for (var i = 0; i < bCPFlowsArray.length; i++) {
                if (bCPFlowsArray[i] == currentFlow) {
                    return true;
                }
            }
            return false;
        }
    </script>
    </form>
</body>
</html>
<%--���½ű����ڷֱ������� 12/23--%>
<script>
    var screenWidth = window.screen.width; //���ķ�ʽwindow.screen.width
    if (screenWidth < 1100) {
        $('.sbtn').css('width', '80px');
        $('.sbtn').css('margin-left', '-4px');
        $('.sbtn').css('margin-right', '-3px');
    }
    else if (screenWidth < 1540) {
        $('.sbtn').css('width', '90px');
        $('.sbtn').css('margin-left', '5px');
        $('.sbtn').css('margin-right', '2px');
    }
    else if (screenWidth < 1610) {
        $('.sbtn').css('width', '100px');
        $('.sbtn').css('margin-left', '8px');
        $('.sbtn').css('margin-right', '5px');
    }
    else {
        $('.sbtn').css('width', '104px');
        $('.sbtn').css('margin-left', '8px');
        $('.sbtn').css('margin-right', '5px');
    }
</script>
<script>
    var screenWidth = window.screen.width;
    if (screenWidth <= 1366) {
        //360px��Ϊ365px
        $('.left_table_first').css('min-height', '365px');
    }
    else if (screenWidth <= 1450) {//0108����1440�����·ֱ���
        $('.left_table_first').css('min-height', '475px');
    }
    else if (screenWidth <= 1680) {//0108����1680�����·ֱ��ʣ�1680*1050��1600*900��
        $('.left_table_first').css('min-height', '505px');
    }
    else {//�磺1920*1080
        $('.left_table_first').css('min-height', '585px');
    }
</script>
