<%@ Page Title="自定义图表编辑" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="XChartEditor.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.XChartEditor" %>

<%@ Import Namespace="Zhongsoft.Portal.Custom" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton runat="server" ID="btnView" CssClass="subtoolbarlink" OnClientClick="return viewForm()"
            DisplayStatus="(3.*)" EnableTheming="false"><span><img  src="../../Themes/Images/btn-preview.png" width="16" height="16" />预览</span></asp:LinkButton></div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <style>
        html{ overflow-x:hidden; overflow-y:auto;}
        .connectedSortable, .connectedGroupable
        {
            list-style-type: none;
            margin: 0;
            padding: 0;
            float: left;
            margin-right: 10px;
            background: #eee;
            padding: 5px;
            width: 400px;
            min-height: 60px;
            height: auto;
        }
        
        .connectedSortable li, .connectedGroupable li
        {
            margin: 5px;
            padding: 5px;
            font-size: 1.2em;
            min-height: 20px;
            width: 300px;
            line-height: 20px;
        }
        
        
        .connectedFilterable
        {
            list-style-type: none;
            margin: 0;
            padding: 0;
            float: left;
            margin-right: 10px;
            background: #eee;
            padding: 5px;
            width: 400px;
            min-height: 60px;
            height: auto;
        }
        .connectedFilterable li
        {
            margin: 5px;
            padding: 5px;
            font-size: 1.2em;
            min-height: 18px;
            width: 300px;
            line-height: 20px;
        }
        #sortContainer li
        {
            display: block;
            margin: 0 3px 3px 3px;
            padding: 2px;
            padding-left: 2px;
            font-size: 14px;
            height: 18px;
            width: 340px;
            text-indent: 20px;
        }
        #sortContainer li span
        {
            position: absolute;
        }
    </style>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="templateTabs">
        <ul>
            <li index="0"><a href='#base'>基本信息</a></li>
            <li index="1"><a href='#list'>功能设置</a></li>
            <li index="2"><a href='#sort'>排序筛选</a></li>
            <li index="3"><a href='#series'>数据内容</a></li>
        </ul>
        <div id="base">
            <input type="hidden" runat="server" id="hiExpression" field="Expression" tablename="BD_View" />
            <input type="hidden" runat="server" id="hiViewName" field="ViewName" tablename="BD_View" />
            <input type="hidden" runat="server" id="hiViewId" field="ViewId" tablename="BD_View" />
            <input type="hidden" runat="server" id="hiIsPublic" field="IsPublic" tablename="BD_View" />
            <input type="hidden" runat="server" id="hiListCode" />
            <input type="hidden" runat="server" id="hiListId" field="ListId" tablename="BD_View" />
            <input type="hidden" runat="server" id="hiIsBaseView" field="IsBaseView" value="1"
                tablename="BD_View" />
            <input type="hidden" runat="server" id="hiIsDefaultView" field="IsDefaultView" value="1"
                tablename="BD_View" />
            <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr>
                            <td class="tz-title" colspan="4">
                                <div style="white-spacing: nowrap; line-height: 23px; height: 23px; vertical-align: middle">
                                    基本信息</div>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                名称<span class="req-star">*</span>
                            </td>
                            <td class="td-m">
                                <input type="text" runat="server" id="txtViewName" class="kpms-textbox" req="1" activestatus="(23.*)"
                                    maxlength="50" style=" width:98%" />
                                <asp:Button ID="btnBindDataset" runat="server" Text="选择" OnClick="btnBindDataset_Click"
                                    Style="display: none" />
                            </td>
                            <td class="td-l">
                                编号<span class="req-star">*</span>
                            </td>
                            <td class="td-m">
                                <zhongsoft:LightTextBox runat="server" ID="tbCodePrefix" Width="95px" ReadOnly="true"
                                    req="1"></zhongsoft:LightTextBox>
                                <zhongsoft:LightTextBox runat="server" ID="tbCode" Width="95px" DataType="EnNumStr"
                                    MaxLength="20" req="1"></zhongsoft:LightTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                主标题<span class="req-star">*</span>
                            </td>
                            <td class="td-m">
                                <zhongsoft:LightTextBox runat="server" ID="tbMainTitle" req="1" Width="98%"></zhongsoft:LightTextBox>
                            </td>
                            <td class="td-l">
                                副标题
                            </td>
                            <td class="td-m">
                                <zhongsoft:LightTextBox runat="server" ID="tbSubText"></zhongsoft:LightTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                公用
                            </td>
                            <td class="td-m">
                                <asp:RadioButtonList ID="rblIsPublic" runat="server" ActiveStatus="(23.*)" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
                                    <asp:ListItem Value="1">是</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td class="td-l">
                                数据集<span class="req-star">*</span>
                            </td>
                            <td class="td-m">
                                <asp:LinkButton runat="server" ID="btnDataSet" OnClientClick="return setDataSet();"
                                    OnClick="btnDataSet_Click" ActiveStatus="(3.*)"><span>配置</span></asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                    <table class="tz-table">
                        <tr>
                            <td>
                                <zhongsoft:LightPowerGridView ID="gvField" runat="server" AutoGenerateColumns="False"
                                    FrozenWidth="1035" FrozenHeight="280px" Width="1015" AllowFrozing="true" UseDefaultDataSource="true">
                                    <Columns>
                                        <asp:BoundField HeaderText="编号" DataField="Code" />
                                        <asp:BoundField HeaderText="类型" DataField="Type" />
                                    </Columns>
                                </zhongsoft:LightPowerGridView>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnDataSet" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
        <div id="list">
            <asp:UpdatePanel ID="UpdatePanel5" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr>
                            <td class="td-l">
                                宽度(px) <span class="req-star">*</span>
                            </td>
                            <td class="td-m">
                                <zhongsoft:LightTextBox runat="server" ID="tbWidth" DataType="Decimal2" MaxLength="7"
                                    req="1" Text="800"></zhongsoft:LightTextBox>
                            </td>
                            <td class="td-l">
                                高度(px) <span class="req-star">*</span>
                            </td>
                            <td class="td-m">
                                <zhongsoft:LightTextBox runat="server" ID="tbHeight" DataType="Decimal2" MaxLength="7"
                                    req="1" Text="400"></zhongsoft:LightTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                主题<span class="req-star">*</span>
                            </td>
                            <td class="td-m">
                                <zhongsoft:LightDropDownList runat="server" ID="ddlTheme">
                                </zhongsoft:LightDropDownList>
                            </td>
                            <td class="td-l">
                                显示工具栏
                            </td>
                            <td class="td-m">
                                <asp:CheckBox runat="server" ID="chbShowToolBox" Checked="true" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                工具栏横向对齐
                            </td>
                            <td class="td-m">
                                <asp:RadioButtonList runat="server" ID="radlToolboxXAlign" RepeatDirection="Horizontal">
                                </asp:RadioButtonList>
                            </td>
                            <td class="td-l">
                                工具栏纵向对齐
                            </td>
                            <td class="td-m">
                                <asp:RadioButtonList runat="server" ID="radlToolboxYAlign" RepeatDirection="Horizontal">
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                标题横向对齐
                            </td>
                            <td class="td-m">
                                <asp:RadioButtonList runat="server" ID="radlTitleXAlign" RepeatDirection="Horizontal">
                                </asp:RadioButtonList>
                            </td>
                            <td class="td-l">
                                标题纵向对齐
                            </td>
                            <td class="td-m">
                                <asp:RadioButtonList runat="server" ID="radlTitleYAlign" RepeatDirection="Horizontal">
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                图例布局
                            </td>
                            <td class="td-m" colspan="3">
                                <asp:RadioButtonList runat="server" ID="radlLegendOrient" RepeatDirection="Horizontal">
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                图例横向对齐
                            </td>
                            <td class="td-m">
                                <asp:RadioButtonList runat="server" ID="radlLegendXAlign" RepeatDirection="Horizontal">
                                </asp:RadioButtonList>
                            </td>
                            <td class="td-l">
                                图例纵向对齐
                            </td>
                            <td class="td-m">
                                <asp:RadioButtonList runat="server" ID="radlLegendYAlign" RepeatDirection="Horizontal">
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr flag="hide">
                            <td class="td-l">
                                参数设置
                            </td>
                            <td class="td-m" colspan="3">
                                <table cellpadding='0' cellspacing='0' width="80%">
                                    <tr>
                                        <td>
                                            <input type="hidden" runat="server" id="hiParam" />
                                            <asp:TextBox runat="server" ID="tbParam" Height="16px" ReadOnly="true" Width="100%"
                                                CssClass="kpms-textbox"></asp:TextBox>
                                        </td>
                                        <td valign='middle' style='width: 19px; padding-left: 2px'>
                                            <asp:LinkButton runat="server" ID="btnParam" OnClick="btnParam_Click" OnClientClick="return setParam();"
                                                Style="height: 18px; width: 20px; padding: 0px" CssClass="btn-look-up" EnableTheming="false"><img  src="../../Themes/Images/btn_fx.png"  style="padding:0px"/>
                                            </asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr flag="hide">
                            <td class="td-l">
                                参数过滤
                            </td>
                            <td class="td-m" colspan="3">
                                <table cellpadding='0' cellspacing='0' width="80%">
                                    <tr>
                                        <td>
                                            <asp:TextBox runat="server" ID="tbParamFilter" Height="16px" ReadOnly="true" Width="100%"
                                                CssClass="kpms-textbox"></asp:TextBox>
                                        </td>
                                        <td valign='middle' style='width: 19px; padding-left: 2px'>
                                            <asp:LinkButton runat="server" ID="btnParamFilter" OnClientClick="return setParamFilter();"
                                                Style="height: 18px; width: 20px; padding: 0px" CssClass="btn-look-up" EnableTheming="false"
                                                OnClick="btnParamFilter_Click"><img  src="../../Themes/Images/btn_fx.png"  style="padding:0px"/>
                                            </asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                页面链接
                            </td>
                            <td class="td-r" colspan="3">
                                <table cellpadding='0' cellspacing='0' width="80%">
                                    <tr>
                                        <td>
                                            <input runat="server" id="hiDialog" type="hidden" /><input type="hidden" runat="server"
                                                id="hiDialogPage" />
                                            <zhongsoft:XHtmlInputText type="text" ID="txtDialogPage" runat="server" readonly="readonly"
                                                style="width: 100%" MaxLength="250" class="kpms-textbox">
                                            </zhongsoft:XHtmlInputText>
                                        </td>
                                        <td valign='middle' style='width: 19px; padding-left: 2px'>
                                            <asp:LinkButton runat="server" ID="btnDialogPage" OnClientClick="return setDialogPage();"
                                                OnClick="btnDialogPage_Click" Style="height: 18px; width: 20px; padding: 0px"
                                                CssClass="btn-look-up" EnableTheming="false">
                                <img  src="../../Themes/Images/btn_fx.png"  style="padding:0px"/>
                                            </asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="sort">
            <asp:UpdatePanel ID="UpdatePanel3" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr>
                            <td colspan="2" class="tz-title">
                                排序字段
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 40%; vertical-align: top">
                                <input type="hidden" runat="server" id="hiSortFields" />
                                <div style="width: 400px; max-height: 230px; overflow-y: auto; overflow-x: hidden">
                                    <ul runat="server" id="sortable1" class="connectedSortable">
                                    </ul>
                                </div>
                            </td>
                            <td style="width: 60%; vertical-align: top">
                                <div style="width: 400px; max-height: 230px; overflow-y: auto; overflow-x: hidden">
                                    <ul runat="server" id="sortable2" class="connectedSortable">
                                    </ul>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tz-title">
                                筛选字段
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 40%; vertical-align: top">
                                <input type="hidden" runat="server" id="hiFilterFields" />
                                <input type="hidden" runat="server" id="hiFilterJsons" />
                                <input type="hidden" runat="server" id="hiNoFilterFields" />
                                <input type="hidden" runat="server" id="hiNoFilterJsons" />
                                <div style="width: 400px; max-height: 230px; overflow-y: auto; overflow-x: hidden">
                                    <ul runat="server" id="filterable1" class="connectedFilterable">
                                    </ul>
                                </div>
                            </td>
                            <td style="width: 60%; vertical-align: top">
                                <div style="width: 400px; max-height: 230px; overflow-y: auto; overflow-x: hidden">
                                    <ul runat="server" id="filterable2" class="connectedFilterable">
                                    </ul>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tz-title">
                                分组排序
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 80%; vertical-align: top" colspan="2">
                                <input type="hidden" runat="server" id="hiGroupFields" />
                                <div style="width: 400px; max-height: 230px; overflow-y: auto; overflow-x: hidden">
                                    <ul runat="server" id="groupable2" class="connectedGroupable">
                                    </ul>
                                </div>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="series">
            <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table>
                        <tr>
                            <td colspan="4">
                                <zhongsoft:LightPowerGridView ID="gvSeries" runat="server" AutoGenerateColumns="False"
                                    ShowAddData="true" DataKeyNames="Name" FrozenWidth="1035" FrozenHeight="280px"
                                    Width="1015" AllowFrozing="true" OnAddData="lbtnAddSery_Click" UseDefaultDataSource="true"
                                    OnRowCommand="gvSeries_RowCommand" OnRowDataBound="gvSeries_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderText="名称" HeaderStyle-Width="200px">
                                            <ItemTemplate>
                                                <zhongsoft:LightTextBox runat="server" ID="tbName" req="1" MaxLength="200"></zhongsoft:LightTextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="图表类型" HeaderStyle-Width="200px">
                                            <ItemTemplate>
                                                <zhongsoft:LightDropDownList runat="server" ID="ddlType" req="1">
                                                </zhongsoft:LightDropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="值字段" HeaderStyle-Width="200px">
                                            <ItemTemplate>
                                                <zhongsoft:LightDropDownList runat="server" ID="ddlValueField" req="1">
                                                </zhongsoft:LightDropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="名称字段" HeaderStyle-Width="200px">
                                            <ItemTemplate>
                                                <zhongsoft:LightDropDownList runat="server" ID="ddlNameField">
                                                </zhongsoft:LightDropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="其他设置JSON" HeaderStyle-Width="200px">
                                            <ItemTemplate>
                                                <zhongsoft:LightTextBox runat="server" optionedit="1" ID="tbOptions"></zhongsoft:LightTextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <zhongsoft:LightButtonField HeaderText="删除" CommandName="DeleteSery" ImageUrl="~/Themes/Images/btn_dg_delete.gif">
                                        </zhongsoft:LightButtonField>
                                    </Columns>
                                </zhongsoft:LightPowerGridView>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                轴设置
                            </td>
                            <td colspan="3">
                                <asp:CheckBox ID="chbYAxisAsValue" runat="server" Checked="true" Text="纵轴为值轴" />
                                <asp:Button ID="btnBindSeries" runat="server" Text="选择" OnClick="btnBindSeries_Click"
                                    Style="display: none" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                值轴格式化字符串
                            </td>
                            <td>
                                <zhongsoft:LightTextBox runat="server" ID="tbValueFormat" Width="150px"></zhongsoft:LightTextBox>
                            </td>
                            <td>
                                类别轴字段
                            </td>
                            <td>
                                <zhongsoft:LightDropDownList ID="ddlTypeField" runat="server" Width="150px">
                                </zhongsoft:LightDropDownList>
                            </td>
                        </tr>
                        <td colspan="4">
                            <div>
                                <p>
                                    说明</p>
                                <p>
                                    1.直角系图表(如：折线图和柱状图)需要在列表中指定值字段，并在列表下方指定类别轴字段</p>
                                <p>
                                    2.值和名称成对的图表（如：饼图、漏斗图和仪表盘）需要指定值字段和名称字段，不需要指定类别轴字段</p>
                                <p>
                                    3.其他设置JSON，请填写数据内容选择json字符串。json标准格式为{"propText":"test1","propNumber":20}，所有键必须用加英文双引号</p>
                            </div>
                        </td>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <input type="hidden" runat="server" id="hiOpenPage" />
        <input type="hidden" runat="server" id="hiParamFilter" />
    </div>
    <div id="jsonEditor" style="display: none">
        <textarea style="width: 470px; height: 180px; overflow: auto" id="txtJson"></textarea>
        <input type="hidden" id="hiInputId" />
    </div>
    <script>
        function editSeriesJson() {
            var id = $(this).attr("id");
            var value = $(this).val();
            $("#txtJson").val(value);
            $("#hiInputId").val(id);
            $("#jsonEditor").dialog({
                title: "其他设置JSON编辑",
                height: 300,
                width: 500,
                modal: true,
                buttons: {
                    "确定": function () {
                        $("#" + id).val($("#txtJson").val());
                        $(this).dialog("close");
                    },
                    "取消": function () {
                        $(this).dialog("close");
                    }
                }
            });
        }

        function setDataSet() {
            if ("<%=ActionType %>" != "Update") {
                alert("请先保存图表基本信息，再配置数据集。");
                return false;
            }
            var listId = $("#<%=hiListId.ClientID %>").val();
            var url = buildBizUrl(3, listId, "bdm/list/BDDataSetEditor.aspx", null);
            return checkReturn(showModal(url, null, 1000, 580));
        }

        function setParam() {
            var ps = $("#<%=hiParam.ClientID %>").val();
            var url =buildQueryUrl("Custom/List/ParamEditor.aspx",null);
            var re = showModal(encodeURI(url), ps, 500, 250);
            if (checkReturn(re)) {
                $("#<%=hiParam.ClientID %>").val(re);
                return true;
            }
            return false
        }

        function setParamFilter() {
            var xml = $("#<%=hiParamFilter.ClientID %>").val();
            var url = buildQueryUrl("Sys/ConditionEditor.aspx", { "ExpType": "ParamFilter","DataSetId": "<%=ListId%>", "ViewId": "<%=BusinessObjectId%>", "ViewType": "<%=CustomEnum.ViewType.XChart.ToString() %>" });
            var re = showModal(encodeURI(url), xml, 900, 400);
            if (checkReturn(re)) {
                $("#<%=hiParamFilter.ClientID %>").val(re);
                return true;
            }
            return false
        }

        function checkForm() {
            getSortFields();
            getFilterFields();
            getGroupFields();
            return true;
        }

        function checkTabs(ui) {
            $('#<%=hiOpenPage.ClientID %>').val($(ui.newTab).attr("index"));
            if ($(ui.newTab).attr("index") == "0") {
                getSortFields();
                getFilterFields();
                getGroupFields();
                //冻结grid在updatepannel中，其他updatepannel回发会有问题，调用隐藏按钮重新绑定
                <%=Page.GetPostBackEventReference(this.btnBindDataset,"") %>;
            }
            else if($(ui.newTab).attr("index") == "3")
            {
                //冻结grid在updatepannel中，其他updatepannel回发会有问题，调用隐藏按钮重新绑定
                <%=Page.GetPostBackEventReference(this.btnBindSeries,"") %>;
            }
        }

        function initCustomerPlugin() {

              var $tab1 = $('#templateTabs').tabs({ activate: function (event, ui) { return checkTabs(ui); },
                                                  beforeActivate: function( event, ui ) { return checkReqField();} 
                                                  });
            var index = $('#<%=hiOpenPage.ClientID %>').val();

            if (index != "") {
                $tab1.tabs("option", "active", index);
            }

            $("[optionedit]").bind("click", editSeriesJson);

            $("#<%=sortable1.ClientID %>,#<%=sortable2.ClientID %>").sortable({
                items: "li:not(.ui-state-disabled)",
                connectWith: ".connectedSortable",
                placeholder: "ui-state-highlight",
                stop: function (eb, ui) {
                    if ($(ui.item).parent().attr('id') == "<%=sortable2.ClientID %>"
                     && $(ui.item).find('.ui-icon-circle-close').length == 0) {
                        var removeButton = $("<div class='ui-icon ui-icon-circle-close' title='删除'></div>").click(function () {
                            deleteSlectLi(this, "<%=sortable1.ClientID %>");
                        });
                        $(ui.item).append(removeButton);
                    }
                    else if ($(ui.item).parent().attr('id') == "<%=sortable1.ClientID %>") {
                        $(ui.item).find('.ui-icon-circle-close').remove();
                    };
                    getSortFields();
                }
            }).disableSelection();

            $("#<%=groupable2.ClientID %>").sortable({
                items: "li:not(.ui-state-disabled)",
                connectWith: ".connectedGroupable",
                placeholder: "ui-state-highlight",
                stop: function (eb, ui) {
                    getGroupFields();
                }
            }).disableSelection();

            $("#<%=filterable1.ClientID %>, #<%=filterable2.ClientID %>").sortable({
                items: "li:not(.ui-state-disabled)",
                connectWith: ".connectedFilterable",
                placeholder: "ui-state-highlight",
                stop: function (ev, ui) {
                    if ($(ui.item).parent().attr('id') == "<%=filterable2.ClientID %>"
                     && $(ui.item).find('.ui-icon-circle-close').length == 0) {
                        var removeButton = $("<div class='ui-icon ui-icon-circle-close' title='删除'></div>").click(function () {
                            deleteSlectLi(this, "<%=filterable1.ClientID %>");
                        });
                        $(ui.item).append(removeButton);
                    }
                    else if ($(ui.item).parent().attr('id') == "<%=filterable1.ClientID %>") {
                        $(ui.item).find('.ui-icon-circle-close').remove();
                    };
                    getFilterFields()
                }
            }).disableSelection();

            $("#<%=sortable2.ClientID %>").find("input[type='radio']").live("click", function () {
                getSortFields();
            })
            checkRegex();
        }


        function getSortFields() {
            var sordfileds = '';
            $("#<%=sortable2.ClientID %>").find('li:not(.ui-state-disabled)').each(function () {
                sordfileds += $(this).find("input[type='hidden']").val() + "|";
                sordfileds += $(this).find("select").val() + ";";

            })
            $("#<%=hiSortFields.ClientID %>").val(sordfileds.substr(0, sordfileds.length - 1));
        }

        function getGroupFields() {
            var groupfileds = '';
            $("#<%=groupable2.ClientID %>").find('li:not(.ui-state-disabled)').each(function () {
                groupfileds += $(this).find("input[type='hidden']").val() + ";";
            });
            $("#<%=hiGroupFields.ClientID %>").val(groupfileds.substr(0, groupfileds.length - 1));
        }

        function getFilterFields() {
            var sordfileds = '';
            var arry = new Array();
            $("#<%=filterable2.ClientID %>").find('li:not(.ui-state-disabled)').each(function () {
                sordfileds += $(this).find("input[type='hidden']").val() + ";";
                arry.push($(this).find("[flag='json']").attr("json"));
            })

            $("#<%=hiFilterFields.ClientID %>").val(sordfileds.substr(0, sordfileds.length - 1));
            $("#<%=hiFilterJsons.ClientID %>").val(JSON.stringify(arry));

            sordfileds = '';
            arry = new Array();
            $("#<%=filterable1.ClientID %>").find('li:not(.ui-state-disabled)').each(function () {
                sordfileds += $(this).find("input[type='hidden']").val() + ";";
                arry.push($(this).find("[flag='json']").attr("json"));
            })

            $("#<%=hiNoFilterFields.ClientID %>").val(sordfileds.substr(0, sordfileds.length - 1));
            $("#<%=hiNoFilterJsons.ClientID %>").val(JSON.stringify(arry));
        }

        function deleteSlectLi(self, toId) {
            var parentLi = $(self).parent();
            $(self).remove();
            parentLi.remove().appendTo($('#' + toId))
        }

        function viewForm() {
            var listId = $("#<%=hiListId.ClientID %>").val();
            var page = "/custom/List/XChartPage.aspx";
            var url = buildQueryUrl(page, { ViewId: $bizCtx.bizId, IsView: 1, ListId: listId, secid: listId })
            if (showModal(encodeURI(url), null, 1000, 550) == undefined) {
                return false;
            }
        }

        function setFieldParam(hijson) {

            var url = buildQueryUrl("Custom/List/DataConverterEditor.aspx", null);
            var re = showModal(url, $(hijson).attr('json'), 800, 300);
            if (checkReturn(re)) {
                $(hijson).attr("json", re);
            }
            return false;
        }

        function setDialogPage() {
            var viewId=$("#<%=hiViewId.ClientID %>").val(); 
            var json = {  DialogType: "DataDrilling",ChartDialog:"1",ViewId:viewId};
            var url = buildQueryUrl("Custom/List/ActionDialogEditor.aspx", json);
          
            var re = showModal(encodeURI(url), $("#<%=hiDialogPage.ClientID%>").val(), 600, 300);
            if (checkReturn(re)) {
                $("#<%=hiDialogPage.ClientID%>").val(re);
                return true;
            }
            return false;
        }
    </script>
</asp:Content>
