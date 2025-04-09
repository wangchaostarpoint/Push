<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormTemplateList.aspx.cs"
    Inherits="Zhongsoft.Portal.Sys.Workflow.FormTemplateList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>自助模板</title>
    <link href="../../Themes/custom/styles/global.css" rel="stylesheet" type="text/css" />
    <style>
        #kpms-tabtable {
            border-collapse: collapse;
            border-spacing: 0px; /*width: 1100px;
            min-width: 1100px;*/
            _width: 1100px;
        }

        .kpms-tabstabtitle {
            background: url(../Images/step.jpg) no-repeat center;
            height: 30px;
            text-align: center;
            color: #2e6e9e;
            font-weight: bold;
            border-left: #a6c9e2 1px solid;
            border-right: #a6c9e2 1px solid;
        }

        .kpms-tabstabcontent {
            vertical-align: top;
            text-align: center;
            border-left: #a6c9e2 1px solid;
            border-right: #a6c9e2 1px solid;
            padding-top: 10px;
        }

            .kpms-tabstabcontent table {
                margin: 0 auto;
            }

        .kpms-tabstabtitlefirst {
            background: url(../Images/step.jpg) no-repeat center;
            height: 30px;
            text-align: center;
            color: #2e6e9e;
            font-weight: bold;
            border-right: #a6c9e2 1px solid;
        }

        .kpms-tabstabcontentfirst {
            vertical-align: top;
            text-align: center;
            border-right: #a6c9e2 1px solid;
            padding-top: 10px;
        }

            .kpms-tabstabcontentfirst table {
                margin: 0 auto;
            }

        .kpms-tabstabtitlelast {
            cursor: pointer;
            width: 187px;
            background: url(../Images/step.jpg) no-repeat center;
            height: 30px;
            text-align: center;
            color: #2e6e9e;
            font-weight: bold;
            border-left: #a6c9e2 1.5px dashed;
        }

        .kpms-tabstabtitlelasthover {
            background: url(../Images/stephover.jpg) no-repeat center;
            color: #e17009;
        }

        .kpms-tabstabcontentlast {
            vertical-align: top;
            text-align: center;
            border-left: #a6c9e2 1.5px dashed;
            padding-top: 10px;
        }

            .kpms-tabstabcontentlast table {
                margin: 0 auto;
            }

        .kpms-lefttabtd {
            vertical-align: top;
            width: 140px;
        }

        .kpms-tablebordernone td {
            border: solid 0px #ffffff;
        }

        #KPMSTemplate0 {
            overflow: auto;
        }

        /*** tab页再分的样式 ***/
        .kpms-tabdisplaylefttd {
            padding-left: 6px;
            border-bottom: #f0f4fd 1px solid;
            border-top: #f0f4fd 1px solid;
            color: #00156e;
            height: 25px;
            vertical-align: middle;
            text-align: left;
            background: #f0f4fd;
            width: 130px;
            cursor: pointer;
            white-space: nowrap;
            word-break: keep-all;
        }

            .kpms-tabdisplaylefttd a {
                color: #00156e !important;
            }

        .kpms-tabdisplayrighttd {
            border-left: #dcdcdc 0px solid;
            text-align: left;
            vertical-align: top;
        }

        .kpms-tabdisplaylefttdclick {
            background: #66fbff url(../Images/kpms-flowleftbglink.jpg) left no-repeat;
        }

            .kpms-tabdisplaylefttdclick a {
                color: #e17009 !important;
                font-weight: bold;
            }
            
        .kpms-tabdisplaylefttdhover {
            background: #f0f4fd url(../Images/kpms-flowleftbghover.jpg) left no-repeat;
        }

            .kpms-tabdisplaylefttdhover a {
                color: #e17009 !important;
            }

        /*** <!--- table通用样式 ---> ***/
        .kpms-formpic {
            text-align: center;
            vertical-align: top;
            height: 71px;
            background: url(/portal/Themes/Images/form-picbg.jpg) no-repeat center 100%;
        }

            .kpms-formpic img {
                float: none;
                text-align: center;
                vertical-align: top;
            }

            .kpms-formpic table {
                height: 100%;
                margin: 0 auto;
                text-align: center;
            }

                .kpms-formpic table .kpms-formpictd {
                    width: 50px;
                    text-align: center;
                    line-height: 1.2em;
                }

        .kpms-formpictd a:link {
            color: #00156e;
        }

        .kpms-formpictd a:visited {
            color: #00156e;
        }

        .kpms-formpictd a:hover {
            color: #e17009;
        }

        /*将页面字体调大点*/
        body a {
            font-size: 15px !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <%--添加功能区--%>
        <div id="divHeader" runat="server" class="detail-header" visible="false">
            <div class="tabs-title2">
                <%=this.Page.Title %>
                <%--—
            <%=AppConfig.Instance.BaseOrgUnitName %>--%>
            </div>
            <div class="tabs-title" style="display: inline;">
                <ul>
                    <li style="margin-left: 16px;"><a class="tabs-tlink">功能区</a></li>
                </ul>
            </div>
        </div>
        <%--功能区结束--%>
        <div id="templateTabs" style="margin-top: 5px;">
            <ul>
                <%=BuildTemplateType()%>
                <input type="text" id="searchText" value="" placeholder="请输入流程名称" class="kpms-textboxsearch" style="float: right;height: 24px;background:#F2F5A9 url(../../Themes/Images/todosearch.png) no-repeat right 50%; width:200px;" />
            </ul>
            <%=BuildFormList()%>
        </div>
        <asp:LinkButton runat="server" ID="btnNew" OnClientClick='return mangeForm();'><span>收藏</span></asp:LinkButton>
        <asp:Button ID="btnAddForm" runat="server" OnClick="btnNew_Click" Visible="false" />
        <asp:Button ID="btnBindForm" runat="server" OnClick="btnBindForm_Click" Visible="false" />
        <input type="hidden" runat="server" id="hiXML" />
        <input type="hidden" id="hiBCPWorkFlows" value="104,105,106,107,108," />
        <%--常用流程数量 用于显示多少个常用流程(非手动收藏的流程)--%>
        <input type="hidden" runat="server" id="hidCommonWFCount" value="10" />
        <input type="hidden" id="hdnTemp" value="KPMSTemplate0" />
    </form>
    <script>
        $(function () {
            var index = 0;
            var defaultType = '<%=DefaultWFType %>';
            if (defaultType != '') {
                $('#templateTabs li a').each(function (i) {
                    var type = $(this).text();
                    if (type == defaultType) {
                        index = i;
                    }
                });
            }
            $('#templateTabs').tabs({ active: index });

            //需要在$('#templateTabs').tabs();后才可以$('#templateTabs').tabs('option', 'active', 1);

            //返回值，发起流程后刷新待办列表
            $('[flag="flow"]').click(function () {
                parent.returnValue = 'reloadTodo';
            });


            $("#searchText").on("input", function () { SearchTemp(); });

        });

        $(function () {
            $('#templateTabs li a').each(function () {
                var type = $(this).text();
                if (type == "常用流程") {
                    $(this).click(function () {
                        $("#<%=btnNew.ClientID %>").show();
                    });
                } else {
                    $(this).click(function () {
                        $("#<%=btnNew.ClientID %>").hide();
                    });
                }
            });
        });

        function dispTab(pdiv, mtd, mdiv) {
            //点击分类，只是对当前页签进行修改，增加pdiv进行标识 tianhl 20141124
            $(document).find('#' + pdiv + ' td.kpms-tabdisplaylefttd').removeClass('kpms-tabdisplaylefttdclick');
            $(mtd).addClass('kpms-tabdisplaylefttdclick');
            $('#' + pdiv + ' .kpms-tabstabcontentlast div').hide();
            $('div[name=' + mdiv + ']').show();
            $("#" + mdiv).show();
        }
    </script>
    <script>

        function checkFlow(bCPFlows, currentFlow) {
            var bCPFlowsArray = bCPFlows.split(",");
            for (var i = 0; i < bCPFlowsArray.length; i++) {
                if (bCPFlowsArray[i] == currentFlow) {
                    return true;
                }
            }
            return false;
        }

        function chooseForm() {
            var param = new InputParamObject("m");
            var re = getUserForm("<%=hiXML.ClientID %>", param, "", chooseFormCallBack);
            return false;
        }

        function mangeForm() {
            var url = buildQueryUrl("/Sys/UserComFunction/UserComFunctList.aspx", 550, 800);
            showDivDialog(url, null, 850, 550, mangeFormCallBack);
            return false;
        }

        function mangeFormCallBack() {
            <%=ClientScript.GetPostBackEventReference(this.btnBindForm,"") %>;
        }

        function chooseFormCallBack() {
            <%=ClientScript.GetPostBackEventReference(this.btnAddForm,"") %>;
        }

        function bodyScale() {
            var devicewidth = document.documentElement.clientWidth;
            var scale = devicewidth / 1024;  // 分母——设计稿的尺寸
            document.body.style.zoom = 1;
            //alert(devicewidth + ',' + scale)
        }
        window.onload = window.onresize = function () {
            bodyScale();
        };

        function getCurTemp(txt) {
            var oldTemp = $("#hdnTemp").val();
            $("#" + oldTemp).find(".kpms-formpic").each(function () {
                $(this).show();
            });
            $("#searchText").val('');
            $("#hdnTemp").val(txt);
        }

        function SearchTemp() {
            var temp = $("#hdnTemp").val();
            var searchText = $("#searchText").val().trim();
            $("#" + temp).find(".kpms-formpic").each(function () {
                if ($(this).text().indexOf(searchText) > -1) {
                    $(this).show();
                }
                else {
                    $(this).hide();
                }

            });
        }


    </script>
</body>
</html>
