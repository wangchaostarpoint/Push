<%@ Page Title="选择仪表板布局" Language="C#" MasterPageFile="~/UI/Master/ObjectCfg.Master"
    AutoEventWireup="true" CodeBehind="DashboardTemplate.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.DashboardTemplate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolTip" runat="server">
    为您的仪表板选择布局。可以将此布局用作初始边框，然后在其中添加或重排组件或调整组件大小。
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="topBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <link href="../UI/dashboard.css" rel="Stylesheet" type="text/css" />
    <link href="../UI/xform.css" rel="Stylesheet" type="text/css" />
    <link href="../UI/Impromptu.css" rel="Stylesheet" type="text/css" />
    <script src="../UI/Script/xform.js"></script>
    <script src="../UI/Script/jquery-impromptu.4.0.js"></script>
    <style>
        .divtemp
        {
            height: 180px;
            background-color: White;
        }
        
        .divtemp:hover
        {
            height: 180px;
            background-color: #e0ecf8;
        }
        
        .divtempselect
        {
            background-color: #a9d1f5 !important;
        }
        .tablestyle
        {
            width: 100%;
        }
        .tdstyle
        {
            border: #c0bfbf 1px solid;
            background: #fff;
        }
        
        .temp-table
        {
            border: #89acd4 1px solid;
            border-collapse: collapse;
            border-spacing: 0px;
            padding: 0px;
            margin: 0px;
        }
        
        .temp-table tr
        {
            height: 100px;
        }
        
        .temp-table td
        {
            border: #89acd4 1px solid;
            border-collapse: collapse;
            border-spacing: 0px;
            padding: 0px;
            margin: 0px;
            min-height: 100px;
            line-height: 25px;
            min-width: 100px;
        }
    </style>
    <table id="tableTemplate" class="tablestyle" cellspacing="7">
        <tr>
            <td class="tdstyle" style="width: 60%">
                <div style="height: 380px; width: 100%; background-color: White; overflow: auto">
                    <table class="tz-table">
                        <tr style="height: 190px">
                            <td style="width: 33%;">
                                <div class="divtemp divtempselect" tag="0">
                                    <img src="../../Themes/Images/dashboard_temp0.png" width="101px" height="61px" style="background-color: White;
                                        margin: 21px" />
                                    <div style="height: 60px; text-align: center">
                                        3列<br />
                                        常规仪表板
                                    </div>
                                </div>
                            </td>
                            <td style="width: 33%;">
                                <div class="divtemp" tag="1">
                                    <img src="../../Themes/Images/dashboard_temp1.png" width="101px" height="61px" style="background-color: White;
                                        margin: 21px" />
                                    <div style="height: 60px; text-align: center">
                                        3列<br />
                                        多聚焦仪表板
                                    </div>
                                </div>
                            </td>
                            <td style="width: 33%;">
                                <div class="divtemp" tag="2">
                                    <img src="../../Themes/Images/dashboard_temp2.png" width="101px" height="61px" style="background-color: White;
                                        margin: 21px" />
                                    <div style="height: 60px; text-align: center">
                                        4列<br />
                                        概述仪表板
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr style="height: 190px">
                            <td style="width: 33%;">
                                <div class="divtemp" tag="3">
                                    <img src="../../Themes/Images/dashboard_temp3.png" width="101px" height="61px" style="background-color: White;
                                        margin: 21px" />
                                    <div style="height: 60px; text-align: center">
                                        2列<br />
                                        常规仪表板
                                    </div>
                                </div>
                            </td>
                            <td style="width: 33%;">
                                <div class="divtemp" tag="4">
                                    <img src="../../Themes/Images/dashboard_temp4.png" width="101px" height="61px" style="background-color: White;
                                        margin: 21px" />
                                    <div style="height: 60px; text-align: center">
                                        3列<br />
                                        概述仪表板
                                    </div>
                                </div>
                            </td>
                            <td style="width: 33%;">
                                <div class="divtemp" tag="5">
                                    <img src="../../Themes/Images/dashboard_temp5.png" width="101px" height="61px" style="background-color: White;
                                        margin: 21px" />
                                    <div style="height: 60px; text-align: center">
                                        3列<br />
                                        聚焦仪表板
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr style="height: 190px">
                            <td style="width: 33%;">
                                <div class="divtemp" tag="6">
                                    <img src="../../Themes/Images/dashboard_temp6.png" width="101px" height="61px" style="background-color: White;
                                        margin: 21px" />
                                    <div style="height: 60px; text-align: center">
                                        2列<br />
                                        常规仪表板
                                    </div>
                                </div>
                            </td>
                            <td style="width: 33%;">
                                <div class="divtemp" tag="7">
                                    <img src="../../Themes/Images/dashboard_temp6.png" width="101px" height="61px" style="background-color: White;
                                        margin: 21px" />
                                    <div style="height: 60px; text-align: center">
                                        2列<br />
                                        右侧Tab页仪表板
                                    </div>
                                </div>
                            </td>
                            <td style="width: 33%;">
                                <div class="divtemp" tag="8">
                                    <img src="../../Themes/Images/dashboard_temp6.png" width="101px" height="61px" style="background-color: White;
                                        margin: 21px" />
                                    <div style="height: 60px; text-align: center">
                                        3列<br />
                                        仪表板(右侧两列)
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr style="height: 190px">
                            <td style="width: 99%;">
                                <div class="divtemp" tag="9">
                                    <img src="../../Themes/Images/dashboard_temp6.png" width="101px" height="61px" style="background-color: White;
                                        margin: 21px" />
                                    <div style="height: 60px; text-align: center">
                                        1列<br />
                                        Tab页仪表板
                                    </div>
                                </div>
                            </td>
                            <td style="width: 33%;">
                                <div class="divtemp" tag="10">
                                    <img src="../../Themes/Images/dashboard_temp6.png" width="101px" height="61px" style="background-color: White;
                                        margin: 21px" />
                                    <div style="height: 60px; text-align: center">
                                        2行2列<br />
                                        右侧Tab页仪表板
                                    </div>
                                </div>
                            </td>
                            <td style="width: 33%;">
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td class="tdstyle" style="width: 40%" valign="top">
                <div style="height: 380px; width: 100%; background-color: White; text-align: center;
                    vertical-align: middle">
                    <img id="imgshow" src="../../Themes/Images/dashboard_tempshow0.png" style="margin-top: 30px" />
                </div>
                <div id="divShow" style="display: none">
                </div>
            </td>
        </tr>
    </table>
    <div id="divContainer">
    </div>
    <div id="divTemplate" isdashtemp="1" style="height: 410px; overflow: auto; width: 100%;
        background-color: White; display: none; padding: 2px">
        <table id="tableCustom" width='90%' row='2' col='2' class="temp-table">
            <tr>
                <td width="50%" valign='top'>
                </td>
                <td width="50%" valign='top'>
                </td>
            </tr>
            <tr>
                <td width="50%" valign='top'>
                </td>
                <td width="50%" valign='top'>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bottomBar" runat="server">
    <asp:LinkButton runat="server" ID="btnSure" OnClick="btnSure_Click" OnClientClick="return setSure();">
                      <span>确定</span>
    </asp:LinkButton>
    <asp:LinkButton runat="server" ID="btnCancel" OnClientClick="cancelEdit();return false;">
                    <span>取消</span>
    </asp:LinkButton>
    <asp:LinkButton runat="server" ID="btnCustomer" OnClientClick="return templateChange();">
                      <span >自定义布局</span>
    </asp:LinkButton>
    <asp:LinkButton runat="server" ID="btnSys" OnClientClick="return templateChange();"
        Style="display: none;">
                      <span>系统布局</span>
    </asp:LinkButton>
    <input type="hidden" runat="server" id="hiTemplate0" />
    <input type="hidden" runat="server" id="hiTemplate1" />
    <input type="hidden" runat="server" id="hiTemplate2" />
    <input type="hidden" runat="server" id="hiTemplate3" />
    <input type="hidden" runat="server" id="hiTemplate4" />
    <input type="hidden" runat="server" id="hiTemplate5" />
    <input type="hidden" runat="server" id="hiTemplate6" />
    <input type="hidden" runat="server" id="hiTemplate7" />
    <input type="hidden" runat="server" id="hiTemplate8" />
    <input type="hidden" runat="server" id="hiTemplate9" />
    <input type="hidden" runat="server" id="hiTemplate10" />
    <input type="hidden" runat="server" id="hiSelectTemplate" />
    <input type="hidden" runat="server" id="hiCustomTemplate" />
    <input type="hidden" runat="server" id="hiFlag" value="0" />
    <script>

        $hiSelect = $("#<%=hiSelectTemplate.ClientID %>");
        $hiCustom = $("#<%=hiCustomTemplate.ClientID %>");
        $hiFlag = $("#<%=hiFlag.ClientID %>");
        function templateChange() {
            var flag = $hiFlag.val();
            if (flag == "0") {
                $("#divTemplate").show();
                $("#tableTemplate").hide();
                $("#<%=btnCustomer.ClientID %>").hide();
                $("#<%=btnSys.ClientID %>").show();
                $("#<%=hiFlag.ClientID %>").val("1");
            }
            else {

                $("#divTemplate").hide();
                $("#tableTemplate").show();
                $("#<%=btnCustomer.ClientID %>").show();
                $("#<%=btnSys.ClientID %>").hide();
                $("#<%=hiFlag.ClientID %>").val("0");
            }

            return false;
        }

        function initCustomerPlugin() {
            $.paint($("#divContainer"), $("#divTemplate"));

            $hiSelect.val($("#<%=hiTemplate0.ClientID %>").val());
        }

        $(".divtemp").live("click", function () {
            $(".divtemp").removeClass("divtempselect");
            $(this).addClass("divtempselect");
            var tag = $(this).attr("tag");
            switch (tag) {
                case "0":
                    $hiSelect.val($("#<%=hiTemplate0.ClientID %>").val());
                    $("#imgshow").attr("src", "../../Themes/Images/dashboard_tempshow0.png");
                    break;
                case "1":
                    $hiSelect.val($("#<%=hiTemplate1.ClientID %>").val());
                    $("#imgshow").attr("src", "../../Themes/Images/dashboard_tempshow1.png");
                    break;
                case "2":
                    $hiSelect.val($("#<%=hiTemplate2.ClientID %>").val());
                    $("#imgshow").attr("src", "../../Themes/Images/dashboard_tempshow2.png");
                    break;
                case "3":
                    $hiSelect.val($("#<%=hiTemplate3.ClientID %>").val());
                    $("#imgshow").attr("src", "../../Themes/Images/dashboard_tempshow3.png");
                    break;
                case "4":
                    $hiSelect.val($("#<%=hiTemplate4.ClientID %>").val());
                    $("#imgshow").attr("src", "../../Themes/Images/dashboard_tempshow4.png");
                    break;
                case "5":
                    $hiSelect.val($("#<%=hiTemplate5.ClientID %>").val());
                    $("#imgshow").attr("src", "../../Themes/Images/dashboard_tempshow5.png");
                    break;
                case "6":
                    $hiSelect.val($("#<%=hiTemplate6.ClientID %>").val());
                    $("#imgshow").attr("src", "../../Themes/Images/dashboard_tempshow6.png");
                    break;
                case "7":
                    $hiSelect.val($("#<%=hiTemplate7.ClientID %>").val());
                    $("#imgshow").attr("src", "../../Themes/Images/dashboard_tempshow6.png");
                    break;
                case "8":
                    $hiSelect.val($("#<%=hiTemplate8.ClientID %>").val());
                    $("#imgshow").attr("src", "../../Themes/Images/dashboard_tempshow5.png");
                    break;
                case "9":
                    $hiSelect.val($("#<%=hiTemplate9.ClientID %>").val());
                    $("#imgshow").attr("src", "../../Themes/Images/dashboard_tempshow5.png");
                    break;
                case "10":
                    $hiSelect.val($("#<%=hiTemplate10.ClientID %>").val());
                    $("#imgshow").attr("src", "../../Themes/Images/dashboard_tempshow6.png");
                    break;
                default:
                    $hiSelect.val($("#<%=hiTemplate0.ClientID %>").val());
                    $("#imgshow").attr("src", "../../Themes/Images/dashboard_tempshow0.png");
                    break;
            }

        })


        function setSure() {

            var select = $hiSelect.val();
            if ($hiFlag.val() == "1") {

                var table = $("#tableCustom");
                var $tds = table.find("td");
                var arry = new Array();
                for (var i = 0; i < $tds.length; i++) {
                    if (!$tds.eq(i).is(":hidden")) {
                        var div = $("<div class='connectDiv'><div class='topDiv' flag='topDiv'><a class='topA'><span>添加部件</span></a></div></div>");
                        $tds.eq(i).append(div);
                    } else {
                        arry.push($tds.eq(i));
                    }
                }

                for (var i = 0; i < arry.length; i++) {
                    arry[i].remove(); //删除隐藏的td
                }

                var $trs = table.find("tr");
                arry = new Array();

                for (var i = 0; i < $trs.length; i++) {
                    if ($trs.eq(i).find("td").length == 0) {
                        arry.push($trs.eq(i));
                    }
                }

                for (var i = 0; i < arry.length; i++) {
                    arry[i].remove(); //删除没有td的行
                }
                select = $("#divTemplate").html();

                $hiCustom.val(select);
            }

            if (parseBool("<%=IsChange %>")) {
                window.returnValue = select;
                window.close();
                return false;
            }

            //新建仪表板时，修改窗口大小
            if (self.resizeTo(1080, 650) == undefined) {//chrome
                self.dialogHeight = "600px"; //IE浏览器
                self.dialogWidth = "1080px";
            }
            return true;
        }


        function cancelEdit() {
            window.returnValue = null;
            window.close();
        }
    
    </script>
</asp:Content>
