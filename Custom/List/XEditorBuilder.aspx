<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="XEditorBuilder.aspx.cs"
    Title="自定义编辑页面" MasterPageFile="~/UI/Master/ObjectEditor.Master" Inherits="Zhongsoft.Portal.Custom.List.XEditorBuilder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton ID="btnSave" runat="server" EnableTheming="false" OnClientClick="Save();return false;"
            CssClass="subtoolbarlink">
    <img src="../../Themes/Images/btn_save.gif" height="16" width="16" /><span>保存</span></asp:LinkButton>
        <asp:LinkButton ID="btnClose" runat="server" EnableTheming="false" OnClientClick="window.close();return false;"
            CssClass="subtoolbarlink">
    <img src="../../Themes/Images/btn_close.gif" height="16" width="16" /><span>关闭</span></asp:LinkButton></div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table width="100%">
        <link href="../UI/xform.css" rel="Stylesheet" type="text/css" />
        <link href="../UI/Impromptu.css" rel="Stylesheet" type="text/css" />
        <script src="../UI/Script/xform.js"></script>
        <script src="../UI/Script/jquery-impromptu.4.0.js"></script>
        <tr>
            <td valign="top">
                <div id="templateTabs" style="height: 100%">
                    <ul>
                        <li index='adata'><a href='#data' id='adata'>元数据<img src="../ui/images/next.gif" /></a></li>
                        <li index='aconfig'><a disabled='true' href='#config' id='aconfig'>相关配置<img src="../ui/images/next.gif" /></a></li>
                        <li index='aform'><a disabled='true' href='#form' id='aform'>表单设计<img src="../ui/images/next.gif" /></a></li>
                        <li index='aview'><a disabled='true' href='#view' id='aview'>表单预览
                            <img src="/Portal/Themes/Images/btn_finish.gif" /></a></li>
                    </ul>
                    <div id="data" style="height: 90%; width: 600px">
                        <div style="width: 100%; height: 100%;">
                            <iframe name="sourceFrame" frameborder="0" id="sourceFrame" width="100%" height="100%"
                                src="" scrolling="auto"></iframe>
                        </div>
                    </div>
                    <div id="config" style="height: 90%">
                    </div>
                    <div id="form" style="height: 90%">
                        <table class="tz-table">
                            <tr class="xform-btnbg">
                                <td align='left' colspan="2">
                                    <div class="btnContainer">
                                        <a title="table" type='table' class="drag"><span class="table"></span></a><a type='label'
                                            title="label" class="drag"><span class="label"></span></a><a type='textbox' title="textbox"
                                                class="drag"><span class="textbox"></span></a><a title="checkbox" type='checkbox'
                                                    class="drag"><span class="checkbox"></span></a><a type='radiobutton' title="radiobutton"
                                                        class="drag"><span class="radiobutton"></span></a><a type='dropdownlist' title="dropdownlist"
                                                            class="drag"><span class="dropdownlist"></span></a><a type='hidden' title="hidden"
                                                                class="drag"><span class="hidden"></span></a><a type='selector' title="selector"
                                                                    class="drag"><span class="selector"></span></a><a type='gridview' title="gridview"
                                                                        class="drag"><span class="gridview"></span></a>
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <div id="canvas" style="background: #fff; width: 100%; border: #b9cbf1 1px solid;
                            height: 300px; z-index: 1">
                        </div>
                    </div>
                    <div id="view" style="height: 90%">
                        <iframe src="" frameborder="0" id="viewForm" name="viewForm" width="100%" height="100%"
                            scrolling="auto"></iframe>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td class="f-footer" align="right" valign="top" style="padding-right: 10px">
                <asp:LinkButton runat="server" ID="btnLast" OnClientClick="return false;" Style="display: none"><img src="../ui/images/pre.gif" /><span>上一步</span></asp:LinkButton>
                <asp:LinkButton runat="server" ID="btnNext" OnClientClick="return false;"><span>下一步<img src="../ui/images/next.gif" /></span></asp:LinkButton>
                <a id="btnFinish" class="btn-link" onclick="window.close()" style="display: none"><span>
                   <img src="/Portal/Themes/Images/btn_finish.gif" />完成</span></a>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiXml" field="Expression" tablename="BD_View" />
    <input type="hidden" runat="server" id="hiEmptyXml" />
    <input type="hidden" runat="server" id="hiActionType" />
    <input type="hidden" runat="server" id="hihrefid" value="adata" />
    <input type="hidden" runat="server" id="hiobjectId" field="ViewId" tablename="BD_View" />
    <div id="formSuccess" style="display: none" class="form-save">
        <span>保存成功！</span>
    </div>
    <script>

        var $hrefid = $("#<%=hihrefid.ClientID %>");
        var $hiXml = $("#<%=hiXml.ClientID %>");
        var formType = "<%=FormType %>";
        var bizId = "<%=BusinessObjectId %>";
        var url = buildQueryUrl("/BDM/List/XDataSourceList.aspx", { "FormType": formType, "ObjectId": bizId });
        document.getElementById('sourceFrame').src = url;

        function showSaveMsg(message, i) {
            if (i == "0") {
                $('#formSuccess').css('background', '#ffe156');
            }
            else {
                $('#formSuccess').css({ background: '#e94545', color: '#fff' });
            }
            $('#formSuccess').css({ left: ($(window).width() - $('#formSuccess').width()) / 2 });
            $('#formSuccess span').html(message);
            $('#formSuccess').animate({ opacity: 'show' }, 500).animate({ opacity: 1 }, 700).animate({ opacity: 'hide' }, 500);
        }

        function setHeight() {
            var divh = $(".editor-right").height() - 70;
            var h = $(".editor-right").height() - 150;
            $('#canvas').height(h);
            $('#templateTabs').height(divh);
        }

        function initCustomerPlugin() {

            window.onbeforeunload = function () {
                return "窗口即将关闭，请确认数据已经保存！"; //这里可以放置你想做的操作代码 
            }
            setEnabled();
            //  调整页面的高度使其自适应
            var h = $(".editor-right").height() - 150;
            $('#canvas').height(h);
            var divh = $(".editor-right").height() - 70;

            $('#templateTabs').height(divh);
            setInterval("setHeight()", 500);

            $('.btnContainer').painting($('#canvas'));
            $('#<%=btnNext.ClientID %>').click(function () {
                var ahref = $('#templateTabs').find('div:visible').next().attr('id');
                $('#templateTabs').find('a').each(function () {
                    if ($(this).attr('href') == ('#' + ahref)) {
                        $(this).trigger('click');
                        $(this).removeAttr('disabled');
                    }
                })
            })

            $('#<%=btnLast.ClientID %>').click(function () {
                var ahref = $('#templateTabs').find('div:visible').prev().attr('id');
                $('#templateTabs').find('a').each(function () {
                    if ($(this).attr('href') == ('#' + ahref)) {
                        $(this).trigger('click');
                        $(this).removeAttr('disabled');
                    }
                })
            })
            $('#templateTabs').tabs({ activate: function (event, ui) { return checkTabs(ui); } });
            checkRegex();

            if ($hiXml.val() == "") {
                view.loadXML($("#<%=hiEmptyXml.ClientID %>").val());
            }
            else {
                view.loadXML($hiXml.val());

            }
            $("#canvas").html($(view.selectSingleNode("//CtrlHtml")).text());

        }


        function setEnabled() {
            if ("<%=ActionType%>" == "Update") {
                $('#aconfig').removeAttr("disabled");
                $('#aform').removeAttr("disabled");
                $('#aview').removeAttr("disabled");
            }
        }

        function checkTabs(ui) {
            if (!Save()) {
                return false;
            }
            var newid = $(ui.newTab).attr("index");
            $hrefid.val(newid);
            var btnNext = $('#<%=btnNext.ClientID %>');
            var btnLast = $('#<%=btnLast.ClientID %>');
            var btnFinish = $('#btnFinish');
            if (newid == "adata") {
                btnLast.hide();
                btnNext.show();
                btnFinish.hide();
            }
            else if (newid == "aform" || newid == "aconfig") {
                btnLast.show();
                btnNext.show();
                btnFinish.hide();
            }
            else if (newid = "aview") {
                btnLast.show();
                btnNext.hide();
                btnFinish.show();
                document.getElementById('viewForm').src = "XEditor.aspx?actionType=2&IsFormView=1&EditorId=" + bizId;
            }
            return true;
        }


        function Save() {

            if (typeof (checkReqField) == 'function') {
                if (!checkReqField()) return false;
            }
            if (typeof (KPMSCheckSubmit) == 'function') {
                if (!KPMSCheckSubmit()) return false;
            }
            if (parent.returnValue == undefined || parent.returnValue == null) {
                parent.returnValue = "isSave";
            }
            return true;
        }

        function KPMSCheckSubmit() {
            var ahref = $hrefid.val();
            if (ahref == "adata") {
                return saveDivSource();
            }
            else if (ahref == "aform") {

                return saveDivForm();
            }
            else if (ahref == "aconfig") {

            }
            return true;
        }



        function getViewXml() {
            var xmlstr = $("#<%=hiEmptyXml.ClientID %>").val();
            view.loadXML(xmlstr);
            var objectlists = $('#canvas [CtrlType]');
            $('#canvas span').css('border', '');
            view.createCtrlHtml($('#canvas').html());
            view.createModifyTime();
            for (var i = 0; i < objectlists.length; i++) {
                view.createCtrl(objectlists.eq(i));
            }
            $hiXml.val(view.xml());
        }

        function saveDivSource() {

            return window.frames["sourceFrame"].window.saveDivSource();
            return true;
        }

        function saveDivForm() {
            if (hasChange) {
                getViewXml();
                var xFormAttribute = $hiXml.val();
                $.post("XEditorBuilder.aspx",
                    { asyfunc: "SaveDivForm", Expression: xFormAttribute, objectId: bizId },
                    function (res) {
                        if (res != "<%=SaveFail %>") {
                            hasChange = false;
                            showSaveMsg("表单设计保存成功", 0);
                        }
                        else {
                            saveForm = false;
                            showSaveMsg("表单设计保存失败", 1);
                        }
                    })
            } return true;
        }
      
    </script>
</asp:Content>
