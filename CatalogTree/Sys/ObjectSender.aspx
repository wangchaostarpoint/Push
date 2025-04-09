<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ObjectSender.aspx.cs" Inherits="Zhongsoft.Portal.CatalogTree.Sys.ObjectSender" Title="工作提交" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
    <title>工作提交</title>
    <link rel='stylesheet' type='text/css' href='../../Themes/Styles/zTreeStyle.css' />
    <link rel="stylesheet" type="text/css" href="../../Themes/Styles/form.css" />
    <link rel="stylesheet" type="text/css" href="../../Themes/Styles/formsender.css" />
    <link rel="stylesheet" type="text/css" href="../../Themes/Styles/common2.css" />
    <script>
        function closeThisWin() {            
            parent.returnValue = true;
            closeWindow();
        }
    </script>
</head>
<body id="formBody" >
    <form id="form1" runat="server">
    <div class="xpdl-sendwindow" id="xpdlSender">
        <table class="xpdl-sendcontent">
            <tr>
                <td>
                    <asp:Label ID="lbCurrActTip" runat="server" Font-Bold="true"></asp:Label>&nbsp;&nbsp;请选择后续工作步骤
                </td>
                <td style="height: 30px">
                    <a class="subtoolbarlink" id="btnSelAllParts" style="display: none" onclick="selAllParts()">
                        <img src="../../Themes/Images/selectall.gif" /><span>全选</span></a> <a class="subtoolbarlink"
                            id="btnMoreParts" title="在全院人员中搜索" >
                            <img src="../../Themes/Images/selectmore.gif" /><span>更多人员</span></a>&nbsp;&nbsp;
                    <div class="form-selectpeople" runat="server" id="formSelectp1">
                        <div class="selectp-header">
                            <span style="float: left;">选择人员</span><span id='closePartMore' class="closethis ui-icon ui-icon-close"></span></div>
                        <table class="selectp-content">
                            <tr>
                                <td id="part" style="width: 196px;">
                                    <ul id="selectp-part" class="ztree selectp-part">
                                    </ul>
                                </td>
                                <td id="close-part" class="close-part">
                                    <span>
                                        <img src="../../Themes/Images/close-part.gif" /></span>
                                </td>
                                <td class="selectp-list">
                                    <input class="selectp-key" id="txtPartFilter" type="text" value="请输入关键字" />
                                    <div class="person-list" style="height: 223px; text-align: left" id="morePartsList">
                                    </div>
                                    <div class="person-list-page">
                                        <%-- <img src="../../Themes/Images/btn_prei.gif" /><img src="../../Themes/Images/btn_next.gif" />--%></div>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <span title="在下方人员列表中搜索">搜索
                        <input id="txtActPartFilter" type="text" style="color: #ccc; width: 100px;
                            height: 18px; border: #bcc7d8 1px solid;" /></span>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:ListBox ID="lbAct" runat="server" Rows="8" SelectionMode="Single" Width="300px" Height="200px"
                        EnableTheming="false" OnSelectedIndexChanged="lbAct_SelectedIndexChanged" AutoPostBack="true"></asp:ListBox>
                    <input type="hidden" id="hiActIndex" name="hiActIndex" runat="server" />
                </td>
                <td >
                    <asp:ScriptManager ID="FormScriptManager" runat="server">
                    </asp:ScriptManager>
                    <asp:UpdatePanel runat="server" ID="FormUpdatePanel" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="xpdl-sendtitle">
                                主送</div>
                            <div style="background: #ffffff; width: 300px; height: 74px">
                                <asp:CheckBoxList runat="server" ID="cblUsers" RepeatColumns="2" RepeatDirection="Horizontal">
                                </asp:CheckBoxList>
                            </div>
                            <div class="xpdl-sendtitle">
                                抄送</div>
                            <div style="background: #ffffff; width: 300px; height: 74px">
                                <asp:CheckBoxList runat="server" ID="cblOtherUsers" RepeatColumns="2" RepeatDirection="Horizontal">
                                </asp:CheckBoxList>
                            </div>
                            <div style="display: none">
                                <asp:Button ID="btnAddUser" runat="server" Text="Button" OnClick="btnAddUser_Click" />
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel><input type="hidden" id="hiUserID" name="hiUserID" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <table class="tz-table" width="100%">
                        <tr>
                            <td class="td-l">
                                提醒级别
                            </td>
                            <td class="td-r">
                                <asp:RadioButtonList ID="rdblLevel" runat="server" ActiveStatus="(23.*)"  RepeatColumns="3" >
                                </asp:RadioButtonList>
                            </td>
                            <td class="td-l">
                                要求完成时间
                            </td>
                            <td class="td-r">
                                <zhongsoft:XHtmlInputText ID="txtRequireDate" runat="server" type="text" class="kpms-textbox-date"
                                     readonly="readonly" activestatus="(23.*)" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="xpdl-actseltitle" colspan="2">
                    填写意见&nbsp;&nbsp;&nbsp;&nbsp;<%--<a href="javascript:void(0)" onclick="javascript:ShowVisualForm();">[可视化流程]</a>--%><span
                        id="spNoPart" style="color: Red; display: none">该步骤的处理角色没有配置人员，请确认处理人员，并联系管理员配置！</span>&nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <zhongsoft:LightTextBox ID="tbRequirement" runat="server" CssClass="kpms-textarea"
                        req="1" Height="50px" TextMode="MultiLine" maxtext="1024" Rows="3"
                        Width="98%"></zhongsoft:LightTextBox>
                </td>
            </tr>
            <tr onclick="javascript:$('#formSelectp').hide();">
                <td colspan="2" class="xpdl-sendbtntd" style="padding-right: 2px!important">
                    <asp:Button ID="btnSend" runat="server" Width="100px" OnClientClick="return checkSend()"
                        Text="确定" OnClick="btnSend_Click" />
                    <asp:Button ID="btnCancel" runat="server" Width="100px" OnClientClick="return closeWin()" 
                        Text="取消" />
                    <br />
                </td>
            </tr>
        </table>
    </div>
    <script type="text/javascript">
        var $partsMoreLoaded;
        function initCustomerPlugin() {
            $partsMoreLoaded = false;
            initPartsMore();            
            $('#close-part').toggle(function () {
                $('#part').css('display', 'none');
                $('[id$=formSelectp1]').css("width", "165px");
                $(this).find('img').attr('src', '../../Themes/Images/open-part.gif');
            }, function () {
                $('#part').css('display', '');
                $('[id$=formSelectp1]').css('width', '361px');
                $(this).find('img').attr('src', '../../Themes/Images/close-part.gif');
            })

            $('.selectp-key').focus(function () {
                if ($(this).val() == '请输入关键字') {
                    $(this).val('');
                    $(this).css('color', '#000');
                }
            }).blur(function () {
                if ($(this).val() == '') {
                    $(this).val('请输入关键字');
                    $(this).css('color', '#ccc');
                }
            })
            //关闭更多人员框
            $('#closePartMore').click(function () {
                $('[id$=formSelectp1]').hide();

            })
        }
        function initPartsMore() {
            $('#btnMoreParts').click(function () {
                if (!$partsMoreLoaded) {
                    $partsMoreLoaded = true;
                    $('head').append("<script src='" + $appCtx.appPath + "/UI/script/jquery.ztree.core-3.5.js'><\/script>");
                    buildUnitTree(); buildSelectorUserList("", "userforselector");
                    $("#txtPartFilter").keyup(function () {
                        buildSelectorUserList($(this).val(), "userforselector");
                    });
                }
                //控制更多人员框显示的位置
                $('[id$=formSelectp1]').css({ top: $(this).offset().top + 28, left: $(this).offset().left - 140 }).toggle('slide');
            });
        }
        //创建左侧部门树结构
        var $treeUnitItems;
        function buildUnitTree() {
            $.post("JsonSelectorHandler.ashx",
             { term: "|" + "<%=KPMSUser.UserId %>" + ",groupandunit_tree," },
                function (res) {
                    $treeUnitItems = res;
                    $('[id$=formSelectp1]').css('width', '361px');
                    $('[id$=formSelectp1]').draggable({ handle: ".selectp-header" });
                    $.fn.zTree.init($("#selectp-part"), { view: { showIcon: false }, callback: { onClick: unitTreeClick} }, $treeUnitItems);
                }, "json"
            );
        }
        function unitTreeClick(event, treeId, treeNode) {
            var key = treeNode.id.split('|');
            //第一位是部门ID或者分组ID
            var grouporUnitId = key[0];
            if (key[1] != undefined && key[1] != "") {
                //第二位是人员ID
                buildSelectorUserList(treeNode.id, "group_userforselector");
            }
            else
                buildSelectorUserList(treeNode.id, "unit_userforselector");
        }
        //拼凑右侧人员信息
        function buildSelectorUserList(f, type) {
            $("#morePartsList").html("");
            $.post("JsonSelectorHandler.ashx",
                { term: f + "," + type },
                    function (res) {
                        for (var i = 0; i < res.length; i++) {
                            var split = res[i].value.split(',');
                            var userJson = res[i].id;
                            var pUserName = split[0];
                            var pLoginId = split[1];
                            var p = $("<div class='xpdl-widget-part'  userJson=" + userJson + " pname=" + pUserName + " >" + pUserName + "<font style='font-weight: normal'>[" + pLoginId + "]</font></div>");
                            p.appendTo("#morePartsList");
                            p.click(function () {
                                //点击将人员加入选定信息框
                                $('#hiUserID').val($(this).attr("userJson"));
                                <%=this.ClientScript.GetPostBackEventReference(this.btnAddUser, "")%>;
                                //addObject(JSON.parse($(this).attr("userJson")));
                            }).hover(function () {
                                $(this).addClass('ui-state-default');
                            }, function () {
                                $(this).removeClass('ui-state-default');
                            });
                        }

                    }, "json"
                );
        }
        
        function checkSend() {
            //判断选择非“结束”步骤时，主送人员必须选择
            var sIndex=$('#hiActIndex').val();
            if(sIndex!="<%=MaxActIndex %>"){            
                var flg = false;
                $("input[id^=cblUsers]").each(function () { 
                    if ($(this).attr("checked")) {
                        flg=true;
                    }
                });
                if(flg==false){
                    alert("请至少选择一个主送人员!");
                    return false;
                }
            }
        }
        
        function closeWin() {
            closeWindow();
            return false;
        }
    
    </script>
    </form>
</body>
</html>