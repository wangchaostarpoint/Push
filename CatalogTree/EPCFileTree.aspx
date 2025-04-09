<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EPCFileTree.aspx.cs"
    Inherits="Zhongsoft.Portal.DCMS.List.EPCFileTree" %>
    
<%@ Register Src="../Metro/Controls/MetroHeader.ascx" TagName="MetroHeader" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>总包项目管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
    <link rel="stylesheet" href="../Themes/Styles/zTreeStyle.css" type="text/css">
    <link href="../Themes/custom/styles/global.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .ztreeloading
        {
            border: #c1a20f 1px solid;
            position: absolute;
            height: 25px;
            line-height: 25px;
            padding-left: 15px;
            text-align: center;
            background: url(/Portal/Themes/images/zTree/loading.gif) no-repeat left 5px #ffe155;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="metroheader" style="height: 40px;">
    </div>

    <div>
        <script type="text/javascript" src="/Portal/UI/Script/jquery.ztree.core-3.5.js"></script>
        <input type="hidden" runat="server" id="hiPageSize" value="1000" />
        <div id="divSearch" style="display: none" class="ztreeloading">
        </div>
        <div>
            <table width="100%">
                <tr>
                    <td width="20%" valign="top" style="border: 1px #6699FF solid;" id="tdTree">
                        <div id="prolefttree" style="padding: 0px; margin: 0px; width: 270px; overflow: auto; vertical-align:top;
                            border: #a6c9e2 1px solid; background: #fff; height:100%;">
                            <table>
                                <tr style="display:none">
                                    <td>
                                        <asp:DropDownList runat="server" ID="ddltype" Style="background-color: White;width:70px">
                                        </asp:DropDownList>
                                        <input type="text" id="txtKeyWord" style="width: 90px" />
                                        <a onclick="searchTree()" id="btnSearch" class="searchbtn bluecolor"><span>查找</span></a><a
                                            onclick="resetTree()" id="btnReset" class="searchbtn"><span>重置</span></a>
                                        <input type="hidden" runat="server" id="hikeyword" />
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        <ul id="treeDemo" class="ztree">
                                        </ul>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                    <td valign="top" style="width: 100%; overflow:hidden;">
                        <div style="width: 100%;" id="scroller">
                            <iframe name="workspace" frameborder="0" id="workspace" width="100%" height="100%"
                                allowtransparency="true"></iframe>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <script type="text/javascript">

        function setSize() {
            var headerH = 50;
            $('#treeDemo').height(($(window).height() - 85) + 'px');
            $('#workspace').height(($(window).height() - headerH) + 'px');
        }

        var secid = '<%=ObjectId %>';
        var $hikeyword = $("#<%=hikeyword.ClientID %>");
        var typeValue;
        var setting = {
            view: {
                //                showIcon: false
            },
            async: {
                enable: true,
                dataType: "json",
                url: getUrl,
                autoParam: ["page", "pageSize", "id", "value"],
                otherParam: { asyfunc: "GetData" }
            },
            callback: {
                beforeAsync: zTreeBeforeAsync,
                beforeExpand: zTreeBeforeExpand,
                beforeCollapse: zTreeBeforeCollapse,
                onAsyncError: onAsyncError,
                onExpand: zTreeOnExpand,
                onCollapse: zTreeOnCollapse
            }

        };


        function getUrl(treeId, treeNode) {
            if (treeNode.maxPage != undefined) {
                aObj = $("#" + treeNode.tId + "_a");
                aObj.attr("title", "当前第 " + treeNode.page + " 页 / 共 " + treeNode.maxPage + " 页")
            }
            return "EPMSFileTree.aspx?keyword=" + encodeURI($hikeyword.val()) + "&secid=" + secid + "&type=" + typeValue + "&projectPhaseEntityID=" + '<%=OrganizationID %>';
        }

        function goPage(treeNode, page) {
            var curPage = treeNode.page;
            treeNode.page = page;
            if (treeNode.page < 1) treeNode.page = 1;
            if (treeNode.page > treeNode.maxPage) treeNode.page = treeNode.maxPage;
            if (curPage == treeNode.page) return;
            curPage = treeNode.page;
            var zTree = $.fn.zTree.getZTreeObj("treeDemo");
            zTree.reAsyncChildNodes(treeNode, "refresh", false);
        }

        function zTreeBeforeAsync(treeId, treeNode) {
            return true;
        };
        function onAsyncError(event, treeId, treeNode, XMLHttpRequest, textStatus, errorThrown) {
            var zTree = $.fn.zTree.getZTreeObj("treeDemo");
            alert("异步获取数据出现异常。");
            treeNode.icon = "";
            zTree.updateNode(treeNode);
        }

        function addDiyDom(treeId, treeNode) {
            if (treeNode.count <= treeNode.pageSize) return;
            var aObj = $("#" + treeNode.tId + "_a");
            if ($("#addBtn_" + treeNode.id).length > 0) return;
            var addStr = $("<a id='a_" + treeNode.tId + "'><span class='button lastPage' id='lastBtn_" + treeNode.tId
				+ "' title='末页' onfocus='this.blur();'></span><span class='button nextPage' id='nextBtn_" + treeNode.tId
				+ "' title='下一页' onfocus='this.blur();'></span><span class='button prevPage' id='prevBtn_" + treeNode.tId
				+ "' title='上一页' onfocus='this.blur();'></span><span class='button firstPage' id='firstBtn_" + treeNode.tId
				+ "' title='首页' onfocus='this.blur();'></span></a>");
            aObj.after(addStr);
            var first = $("#firstBtn_" + treeNode.tId);
            var prev = $("#prevBtn_" + treeNode.tId);
            var next = $("#nextBtn_" + treeNode.tId);
            var last = $("#lastBtn_" + treeNode.tId);
            treeNode.maxPage = Math.round(treeNode.count / treeNode.pageSize - .5) + (treeNode.count % treeNode.pageSize == 0 ? 0 : 1);
            first.bind("click", function () {
                if (!treeNode.isAjaxing) {
                    goPage(treeNode, 1);
                }
            });
            last.bind("click", function () {
                if (!treeNode.isAjaxing) {
                    goPage(treeNode, treeNode.maxPage);
                }
            });
            prev.bind("click", function () {
                if (!treeNode.isAjaxing) {
                    goPage(treeNode, treeNode.page - 1);
                }
            });
            next.bind("click", function () {
                if (!treeNode.isAjaxing) {
                    goPage(treeNode, treeNode.page + 1);
                }
            });
            $("#firstBtn_" + treeNode.tId + ",#prevBtn_" + treeNode.tId + ",#nextBtn_" + treeNode.tId + ",#lastBtn_" + treeNode.tId).hover(function () {
                $(this).css('background-color', 'Blue');
            }, function () {
                $(this).css('background-color', "White");
            })
        };

        $(document).ready(function () {

            setSize();

            $("#divSearch").ajaxStart(function () {
                //            showMsg("正在加载数据");
            }).ajaxStop(function () {
                $(this).hide();
            });
            $.post("EPCFileTree.aspx?organizationID=" + '<%=OrganizationID %>',
                       { asyfunc: "GetProject" },
                           function (res) {
                               $.fn.zTree.init($("#treeDemo"), setting, res);
                               var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
                               var node;
                               if ('<%=OrganizationID %>' != '') {
                                   node = treeObj.getNodeByParam('id', '<%=OrganizationID %>', null);
                                   treeObj.selectNode(node);
                                   treeObj.setting.callback.onClick = openUrl(node.url);
                               }
                               else if ('<%=OrganizationID %>' != '') {
                                   node = treeObj.getNodeByParam('id', '<%=OrganizationID %>', null);
                                   treeObj.selectNode(node);
                                   treeObj.setting.callback.onClick = openUrl(node.url);
                               }

                           },
                    "json")

            function openUrl(url) {
                $("#workspace").attr("src", url);
            }

            getArgs();
        });

        function getArgs() {
            var query = location.search.substring(1);
            var pairs = query.split("&");
            for (var i = 0; i < pairs.length; i++) {
                var pos = pairs[i].indexOf('=');
                if (pos == -1) continue;
                var argname = pairs[i].substring(0, pos);
                if (argname == "workType") {
                    var value = pairs[i].substring(pos + 1);
                    value = decodeURIComponent(value);
                    //                if (value == "design") {
                    //                    //设计
                    //                    $("#workspace").attr("src","/Portal/Sys/Workflow/ProductDesign.aspx");
                    //                }
                    typeValue = value;
                }
            }

        }



        function showMsg(msg) {
            $("#divSearch").html(msg + "...");
            var pos = { left: $("#tdTree").width() / 2 - $("#divSearch").width() / 2, top: $(window).scrollTop() + $(window).height() / 2 - 30 };
            $("#divSearch").css(pos).show();
        }


        function zTreeBeforeExpand(treeId, treeNode) {
            addDiyDom(treeId, treeNode);
            if (treeNode.page == 0) treeNode.page = 1;
            showMsg("正在展开节点");
            return !treeNode.isAjaxing;
        }

        function zTreeOnExpand(event, treeId, treeNode) {
            $("#divSearch").hide();
        };

        function zTreeBeforeCollapse(treeId, treeNode) {
            showMsg("正在折叠节点");
            return true;
        };
        function zTreeOnCollapse(event, treeId, treeNode) {
            $("#a_" + treeNode.tId).remove();
            $("#divSearch").hide();
        };


        function resetTree() {
            $("#<%=ddltype.ClientID %>").val('项目')
            $("#txtKeyWord").val('')
            $hikeyword.val('');
            $.fn.zTree.destroy("treeDemo");
            $.post("EPMSFileTree.aspx?organizationID=" + '<%=OrganizationID %>',
                    { asyfunc: "GetProject" },
                       function (res) {
                           $.fn.zTree.init($("#treeDemo"), setting, res);
                       }, "json")

        }

        function searchTree() {
            var word = $.trim($("#txtKeyWord").val());
            var type = $.trim($("#<%=ddltype.ClientID %>").val());
            if (word != "") {
                $hikeyword.val(word);
                $.fn.zTree.destroy("treeDemo");
                $.post("EPMSFileTree.aspx?secid=" + secid + "&type=" + typeValue + "&organizationID=" + '<%=OrganizationID %>',
                    { searchtype: type, keyword: word, asyfunc: "GetSearch" },
                       function (res) {
                           $.fn.zTree.init($("#treeDemo"), setting, res);
                           var zTreeObj = $.fn.zTree.getZTreeObj("treeDemo");
                           var root = zTreeObj.getNodeByTId("tree_1");
                           addDiyDom('', root);
                           root.page = 1;
                           getUrl('', root);

                       },
                 "json")
            }
            else {
                alert("请输入查询条件！");
            }
            return false;
        }
    
    </script>

    <uc2:MetroHeader ID="metroHeader" runat="server" EnableTheming="false" />
    </form>
</body>
</html>
