<%@ Page Title="仪表板视图" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="DashboardViewEditor.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.DashboardViewEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton ID="btnSave" runat="server" EnableTheming="false" OnClientClick="btnSave(0);return false;"
            DisplayStatus="(23.*)" CssClass="subtoolbarlink">
    <img src="../../Themes/Images/btn_save.gif" height="16" width="16" /><span>保存</span></asp:LinkButton>
    </div>
    <div class="subtoolbarbg" id="divView">
        <asp:LinkButton ID="btnView" runat="server" EnableTheming="false" OnClientClick="btnSave(1);return false;"
            OnClick="btnView_Click" CssClass="subtoolbarlink">
                    <span><img src="../../Themes/Images//btn_finish.gif" height="16" width="16" />完成</span></asp:LinkButton>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <link href="../UI/xform.css" rel="Stylesheet" type="text/css" />
    <link href="../UI/dashboard.css" rel="Stylesheet" type="text/css" />
    <style>
        .containDiv .webPartDiv
        {
            display: none;
        }
        
        .containDiv .ctrlDiv
        {
            width: 190px !important;
        }
        
        .connectTd .ctrlDiv
        {
            margin-bottom: 10px;
        }
        
        .closeWebPart
        {
            float: right;
            margin-top: 3px;
            margin-right: 10px;
        }
        
        .containDiv .closeWebPart
        {
            display: none;
        }
    </style>
    <table class="tz-table">
        <tr>
            <td class="td-l">
                名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbName" field="ViewName" tablename="BD_View"
                    MaxLength="50" req="1" Width="250px"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                公用<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:RadioButtonList ID="rblIsPublic" runat="server" ActiveStatus="(23.*)" RepeatDirection="Horizontal"
                    field="IsPublic" tablename="BD_View">
                    <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
                    <asp:ListItem Value="1">是</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="td-l">
                默认视图<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:RadioButtonList ID="rblIsDefault" runat="server" RepeatDirection="Horizontal"
                    field="IsDefaultView" tablename="BD_View">
                    <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
                    <asp:ListItem Value="1">是</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
    <table width="100%">
        <tr>
            <td valign="top" align="center">
                显示部件
            </td>
            <td valign="top" align="center" style="width: 200px;">
                备选部件
            </td>
        </tr>
        <tr>
            <td valign="top">
                <div runat="server" id="divContent" style="width: 100%; float: left;">
                </div>
            </td>
            <td valign="top" style="width: 200px; height: 100%">
                <div id="divContain" class="containDiv" runat="server" style="min-height: 500px;
                    border: #bfc2c9 1px solid; margin: 2px; width: 200px; float: right; height: 100%">
                </div>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiBaseXml" />
    <div id="formSuccess" style="display: none" class="form-save">
        <span>保存成功！</span>
    </div>
    <script>

        $(".tdDiv,.containDiv").sortable({
            start: function (event, ui) { ui.item.css("width", "190px"); ui.item.css("height", "23px"); ui.item.find("iframe").hide(); },
            items: ".ctrlDiv",
            connectWith: ".tdDiv,.containDiv",
            cursorAt: { left: 10 },
            placeholder: "placeholder",
            stop: function (event, ui) { ui.item.find("iframe").show(); }

        })

        //关闭部件，从模板中移除到部件库
        $(".closeWebPart").live("click", function (e) {
            $(this).closest('.ctrlDiv').appendTo('.containDiv');
        })

        function btnSave(transfer) {
            if (!checkReqField()) {
                return false;
            }
            saveDashboard(transfer);
            return false;
        }

        //transfer为true则跳转页面到预览页面
        function saveDashboard(transfer) {
            var viewXml = buildXml();
            var name = $("#<%=tbName.ClientID%>").val();
            $.post("DashboardViewEditor.aspx",
                    { asyfunc: "SaveDashboard", listId: "<%=ListId%>", viewid: "<%=BusinessObjectId %>", listname: name, xml: viewXml,
                        ispublic: $("#<%=rblIsPublic.ClientID %>").find(":checked").val(),
                        isdefaultview: $("#<%=rblIsDefault.ClientID %>").find(":checked").val()
                    },
                    function (res) {
                        if (res != "") {
                            showSaveMsg(res, "1");
                        }
                        else {
                            $("#<%=btnView.ClientID %>").show();
                            window.returnValue = "isSave";
                            if (transfer == 1) {
                                <%=Page.GetPostBackEventReference(this.btnView,"") %>;
                            }
                            else {
                                showSaveMsg("保存成功", "0");
                            }
                        }
                    })


            return false;
        }

        //生成当前视图xml，在基础视图xml的基础上
        function buildXml() {
            var baseXml = $("#<%=hiBaseXml.ClientID %>").val();
            var view = new KPMSXml(); ;
            view.loadXML(baseXml);
            var name = $("#<%=tbName.ClientID%>").val();
            $(view.selectSingleNode("//ViewId")).text("<%=BusinessObjectId %>");
            $(view.selectSingleNode("//ViewName")).text(name);

           var ctrlsNode = view.selectSingleNode("//WebParts");
           var parts=   view.selectNodes("//WebPart");
            for (var i = 0; i < parts.length; i++) {
              ctrlsNode.removeChild(parts[i]);
            }

       
            var ctrls = $("#<%=divContent.ClientID %>").find(".ctrlDiv");
            //只记录部件在模板中的位置索引
            for (var i = 0; i < ctrls.length; i++) {
                var node = view.xmlDoc.createElement("WebPart");
                var ctrl = ctrls.eq(i);

                var webpartid = view.xmlDoc.createElement("WebPartId");
                $(webpartid).text(ctrl.attr("webpartid"));
                node.appendChild(webpartid);

                var isIntemplate = view.xmlDoc.createElement("InTemplate");
                $(isIntemplate).text("1");
                node.appendChild(isIntemplate);

                var trpos = view.xmlDoc.createElement("Trpos");
                var tdpos = view.xmlDoc.createElement("Tdpos");

                $(trpos).text(ctrl.closest("tr").index());
                $(tdpos).text(ctrl.closest("td").index());

                node.appendChild(trpos);
                node.appendChild(tdpos);
                ctrlsNode.appendChild(node);
            }

            return view.xml();
        }

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
             
    </script>
</asp:Content>
