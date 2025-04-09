<%@ Page Title="数据选择器" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="ObjectRefEditor.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.ObjectRefEditor" %>

<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton runat="server" ID="btnView" CssClass="subtoolbarlink" OnClientClick="return viewForm()"
            DisplayStatus="(3.*)" EnableTheming="false"><span>预览</span></asp:LinkButton></div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <style>
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
    <asp:ScriptManager runat="server" ID="ScriptManager1">
    </asp:ScriptManager>
    <div id="templateTabs">
        <ul>
            <li index="0"><a href='#base'>基本信息</a></li>
            <li index="1"><a href='#list'>功能设置</a></li>
            <li index="2"><a href='#sort'>筛选条件</a></li>
            <li index="3"><a href='#app'>移动端配置</a></li>
        </ul>
        <div id="base">
            <input type="hidden" runat="server" id="hiListName" field="ListName" tablename="BD_List" />
            <input type="hidden" runat="server" id="hiListId" field="ListId" tablename="BD_List" />
            <input type="hidden" runat="server" id="hiModuleId" field="ModuleId" tablename="BD_List" />
            <input type="hidden" runat="server" id="hiType" field="Type" tablename="BD_List" />
            <input type="hidden" runat="server" id="hiIsCustom" field="IsCustom" tablename="BD_List"
                value="1" />
            <input type="hidden" runat="server" id="hiViewListId" field="ListId" tablename="BD_View" />
            <input type="hidden" runat="server" id="hiViewId" field="ViewId" tablename="BD_View" />
            <input type="hidden" runat="server" id="hiExpression" field="Expression" tablename="BD_View" />
            <input type="hidden" runat="server" id="hiIsBaseView" field="IsBaseView" tablename="BD_View"
                value="1" />
            <input type="hidden" runat="server" id="hiIsPublic" field="IsPublic" tablename="BD_View"
                value="1" />
            <input type="hidden" runat="server" id="hiIsDefaultView" field="IsDefaultView" tablename="BD_View"
                value="1" />
            <input type="hidden" runat="server" id="hiListCode" field="ListCode" tablename="BD_List" />
            <input type="hidden" runat="server" id="hiViewName" field="ViewName" tablename="BD_View" />
            <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Always">
                <ContentTemplate>
                    <table width="100%" class="tz-table">
                        <tr>
                            <td colspan="4" class="tz-title">
                                基本信息
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                所属模块<span class="req-star">*</span>
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightDropDownList runat="server" ID="ddlModule" req="1" Width="200px">
                                </zhongsoft:LightDropDownList>
                            </td>
                            <td class="td-l">
                            </td>
                            <td class="td-r">
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                名称<span class="req-star">*</span>
                            </td>
                            <td class="td-r">
                                <input type="text" runat="server" id="txtName" style="width: 200px" maxlength="50"
                                    req="1" class="kpms-textbox" />
                            </td>
                            <td class="td-l">
                                编号<span class="req-star">*</span>
                            </td>
                            <td class="td-r">
                                <zhongsoft:LightTextBox runat="server" ID="tbCodePrefix" Width="95px" ReadOnly="true"
                                    req="1"></zhongsoft:LightTextBox>
                                <zhongsoft:LightTextBox runat="server" ID="tbCode" Width="95px" DataType="EnNumStr"
                                    MaxLength="20" req="1"></zhongsoft:LightTextBox>
                            </td>
                        </tr>
                        <tr flag="hide">
                            <td>
                                ID字段<span class="req-star">*</span>
                            </td>
                            <td>
                                <zhongsoft:LightDropDownList runat="server" ID="ddlIdCode" Width="200px" ActiveStatus="(23.*)"
                                    req="1">
                                </zhongsoft:LightDropDownList>
                            </td>
                            <td>
                                名称字段<span class="req-star">*</span>
                            </td>
                            <td>
                                <zhongsoft:LightDropDownList runat="server" ID="ddlNameCode" Width="200px" ActiveStatus="(23.*)"
                                    req="1">
                                </zhongsoft:LightDropDownList>
                            </td>
                        </tr>
                        <tr flag="hide">
                            <td>
                                显示标示
                            </td>
                            <td>
                                <zhongsoft:LightDropDownList runat="server" ID="ddlLabelCode" Width="200px" ActiveStatus="(23.*)">
                                </zhongsoft:LightDropDownList>
                            </td>
                            <td class="td-l">
                                默认排序字段<span class="req-star">*</span>
                            </td>
                            <td class="td-m">
                                <zhongsoft:LightDropDownList runat="server" ID="ddlSort" Width="145px" ActiveStatus="(23.*)"
                                    req="1">
                                </zhongsoft:LightDropDownList>
                                <zhongsoft:LightDropDownList runat="server" ID="ddlSortDirection" ActiveStatus="(23.*)"
                                    Width="50px">
                                    <asp:ListItem Value="ASC">升序</asp:ListItem>
                                    <asp:ListItem Value="DESC">降序</asp:ListItem>
                                </zhongsoft:LightDropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                            </td>
                            <td colspan="2">
                                <asp:LinkButton runat="server" ID="btnDataSet" OnClientClick="return setDataSet();"
                                    OnClick="btnDataSet_Click"><span>配置数据集</span></asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                    <table class="tz-table">
                        <tr>
                            <td colspan="2" class="tz-title">
                                数据列
                                <asp:LinkButton runat="server" ID="lbtnSort" OnClientClick="return showSort();" ActiveStatus="(3.*)"><span>列排序</span></asp:LinkButton>
                                <asp:Button ID="btnSortHide" runat="server" Text="Button" OnClick="btnSortHide_Click"
                                    Visible="false" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:LinkButton runat="server" ID="btnSelect" OnClick="btnSelect_Click" Style="display: none"></asp:LinkButton>
                                <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="False"
                                    FrozenWidth="1035" Width="1015" AllowFrozing="true" UseDefaultDataSource="true"
                                    OnRowCommand="gvList_RowCommand" OnRowDataBound="gvList_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderText="显示名称" HeaderStyle-Width="150px">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="tbName" Text='<%#Eval("HeaderText") %>' sortmark='<%#Eval("DispCode") %>'
                                                    req="1" MaxLength="32"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="字段编号" HeaderStyle-Width="200px">
                                            <ItemTemplate>
                                                <asp:CheckBox runat="server" ID="cbIsFromDataSet" Visible="false" />
                                                <input type="text" runat="server" id="tbDispCode" class="kpms-textbox" />
                                                <input type="hidden" runat="server" id="hiDataField" value='<%#Eval("DataField") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="数据类型" HeaderStyle-Width="50px">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lblType" Text='<%#Eval("Type") %>' Style="display: none"></asp:Label>
                                                <asp:Label runat="server" ID="lblTypeName"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="列宽" HeaderStyle-Width="50px">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="tbWidth" Width="40px" regex="^\d*$" errmsg="列宽只能填写非负整数"
                                                    MaxLength="4" ActiveStatus="(23.*)" Style="text-align: right"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="对齐方式" HeaderStyle-Width="50px">
                                            <ItemTemplate>
                                                <asp:DropDownList runat="server" ID="ddlAlign" ActiveStatus="(23.*)" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="设置" HeaderStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <input type="hidden" runat="server" id="hiConverter" flag="color" />
                                                <asp:LinkButton runat="server" EnableTheming="false" ID="btnSetConverter" ToolTip="数据转换"
                                                    flag="convert" Text="转换">
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </zhongsoft:LightPowerGridView>
                                <div id="sortDialog" style="display: none;">
                                    <ul id="sortContainer">
                                    </ul>
                                </div>
                                <input runat="server" type="hidden" id="hiSort" />
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
            <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Always">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr>
                            <td class="td-l">
                                默认过滤
                            </td>
                            <td class="td-m" colspan="3">
                                <table cellpadding='0' cellspacing='0' width="80%">
                                    <tr>
                                        <td>
                                            <asp:TextBox runat="server" ID="tbDefaultFilter" Height="16px" ReadOnly="true" Width="100%"
                                                CssClass="kpms-textbox"></asp:TextBox>
                                        </td>
                                        <td valign='middle' style='width: 19px; padding-left: 2px'>
                                            <asp:LinkButton runat="server" ID="btnSetFilter" OnClientClick="return setDefaultFilter();"
                                                Style="height: 18px; width: 20px; padding: 0px" CssClass="btn-look-up" EnableTheming="false"
                                                OnClick="btnSetFilter_Click"><img  src="../../Themes/Images/btn_fx.png"  style="padding:0px"/>
                                            </asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
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
                        <tr>
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
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="app">
            <asp:UpdatePanel ID="UpdatePanel4" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr>
                            <td class="td-l">
                                数据项标题
                            </td>
                            <td class="td-m" colspan="3">
                                <table cellpadding='0' cellspacing='0' width="80%">
                                    <tr>
                                        <td>
                                            <input type="hidden"  runat="server" id="hiTitleFormat" />
                                            <input type="hidden"  runat="server" id="hiTitleFields" />
                                            <asp:TextBox runat="server" ID="tbTitleFormat" Height="16px" ReadOnly="true" Width="100%"
                                                CssClass="kpms-textbox"></asp:TextBox>
                                        </td>
                                        <td valign='middle' style='width: 19px; padding-left: 2px'>
                                            <asp:LinkButton runat="server" ID="btnTitleFormat" OnClientClick="return seTitleFormat();"
                                                Style="height: 18px; width: 20px; padding: 0px" CssClass="btn-look-up" EnableTheming="false"
                                                OnClick="btnTitleFormat_Click"><img  src="../../Themes/Images/btn_fx.png"  style="padding:0px"/>
                                            </asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                数据项内容
                            </td>
                            <td class="td-m" colspan="3">
                                <table cellpadding='0' cellspacing='0' width="80%">
                                    <tr>
                                        <td>
                                          <input type="hidden"  runat="server" id="hiContentFormat" />
                                          <input type="hidden"  runat="server" id="hiContentFields" />
                                            <asp:TextBox runat="server" ID="tbContentFormat" Height="16px" ReadOnly="true" Width="100%"
                                                CssClass="kpms-textbox"></asp:TextBox>
                                        </td>
                                        <td valign='middle' style='width: 19px; padding-left: 2px'>
                                            <asp:LinkButton runat="server" ID="btnContentFormat" OnClick="btnContentFormat_Click" OnClientClick="return setContentFormat();"
                                                Style="height: 18px; width: 20px; padding: 0px" CssClass="btn-look-up" EnableTheming="false"><img  src="../../Themes/Images/btn_fx.png"  style="padding:0px"/>
                                            </asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                筛选列
                            </td>
                            <td class="td-m" colspan="3">
                                <table cellpadding='0' cellspacing='0' width="80%">
                                    <tr>
                                        <td>
                                             <input type="hidden" runat="server" id="hiAppFilterFields" />
                                             <asp:TextBox runat="server" ID="tbFilterFields" Height="16px" ReadOnly="true" Width="100%"
                                                CssClass="kpms-textbox"></asp:TextBox>
                                        </td>
                                        <td valign='middle' style='width: 19px; padding-left: 2px'>
                                            <asp:LinkButton runat="server" ID="btnFilterFields" OnClientClick="return setFilterFields();"
                                               OnClick="btnFilterFields_Click"  Style="height: 18px; width: 20px; padding: 0px" CssClass="btn-look-up" EnableTheming="false"><img  src="../../Themes/Images/btn_fx.png"  style="padding:0px"/>
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
    </div>
    <input type="hidden" runat="server" id="hiOpenPage" />
    <input type="hidden" runat="server" id="hiDefaultFilter" />
    <input type="hidden" runat="server" id="hiParamFilter" />
    <div id="preview" title="查看选择结果" style="display: none">
    </div>
    <script type="text/javascript">

        function showSort() {
            var container = $("#sortContainer");
            container.html("");
            $("#<%=gvList.ClientID %> [sortmark]").each(function (i) {
                container.append("<li sortmark=" + $(this).attr("sortmark") + " class='ui-state-default'><span class='ui-icon ui-icon-arrowthick-2-n-s'></span>" + $(this).val() + "</li>");
            });
            container.sortable({
                items: "li:not(.ui-state-disabled)",
                placeholder: "ui-state-highlight"
            });
            $("#sortDialog").dialog({
                title: "列排序",
                height: 400,
                width: 600,
                modal: true,
                buttons: {
                    "确定": function () {
                        $(this).dialog("close");
                        var sortMark = "";
                        $("#sortContainer li").each(function () {
                            sortMark += $($(this)).attr("sortmark") + "|";
                        });
                        $("#<%=hiSort.ClientID %>").val(sortMark);
                        <%=Page.GetPostBackEventReference(this.btnSortHide,"") %>;
                    },
                    "取消": function () {
                        $(this).dialog("close");
                    }
                }
            });
            return false;
        }

        function setDataSet() {
            if ("<%=ActionType %>" != "Update") {
                alert("请先保存页面基本信息，再配置数据集。");
                return false;
            }
            var listId = $("#<%=hiListId.ClientID %>").val();
            var url = buildBizUrl(3, listId, "bdm/list/BDDataSetEditor.aspx", { IsBdRef: "1" });
            return checkReturn(showModal(url, null, 1000, 580));
        }

        function setParam() {
            var ps = $("#<%=hiParam.ClientID %>").val();
            var url =buildQueryUrl("Custom/List/ParamEditor.aspx",null);
            var re = showModal(encodeURI(url), ps, 500, 250);
            if (re != undefined) {
                $("#<%=hiParam.ClientID %>").val(re);
                return true;
            }
            return false
        }


        function initCustomerPlugin() {
            $("#preview").dialog({ autoOpen: false });
             var $tab1 = $('#templateTabs').tabs({ activate: function (event, ui) { return checkTabs(ui); },
                                                  beforeActivate: function( event, ui ) { return checkReqField();} 
                                                  });
            var index = $('#<%=hiOpenPage.ClientID %>').val();
            if (index != "") {
                $tab1.tabs("option", "active", index);
            }

            if ($("#<%=ddlIdCode.ClientID %>").find('option').length == 0) {
                $("tr[flag='hide']").hide();
            }
            else {
                $("tr[flag='hide']").show();

            }

          $("#<%=gvList.ClientID%> input[flag='color']").each(function () {
                if ($(this).val() == "") {
                    $(this).next().css("color", "");
                }
                else {
                    $(this).next().css("color", "blue");
                }
            })

            $("#<%=filterable1.ClientID %>, #<%=filterable2.ClientID %>").sortable({
                items: "li:not(.ui-state-disabled)",
                connectWith: ".connectedFilterable",
                placeholder: "ui-state-highlight",
                stop: function (ev, ui) {
                    if ($(ui.item).parent().attr('id') == "<%=filterable2.ClientID %>"
                     && $(ui.item).find('.ui-icon-circle-close').length == 0) {
                        var removeButton = $("<div class='ui-icon ui-icon-circle-close' title='删除'></div>").click(function () {
                            deleteSelectLi(this, "<%=filterable1.ClientID %>");
                        });
                        $(ui.item).append(removeButton);
                    }
                    else if ($(ui.item).parent().attr('id') == "<%=filterable1.ClientID %>") {
                        $(ui.item).find('.ui-icon-circle-close').remove();
                    };
                    getFilterFields()
                }
            }).disableSelection();
            getFilterFields();
        }

        function checkTabs(ui) {
            $('#<%=hiOpenPage.ClientID %>').val($(ui.newTab).attr("index"));
            if ($(ui.newTab).attr("index") == "0") {
              getFilterFields();
                <%=Page.GetPostBackEventReference(this.btnSelect,"") %>;
            }
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

       function setFieldParam(hijson) {

            var url = buildQueryUrl("Custom/List/DataConverterEditor.aspx", null);
            var re = showModal(url, $(hijson).attr('json'), 600, 300);
            if (checkReturn(re)) {
                $(hijson).attr("json", re);
                if (re != "") {
                    $(hijson).css("color", "blue");
                }
                else {
                    $(hijson).css("color", "");
                }

            }
            return false;
        }

        $("[flag='deleteFilter']").live("click", function ()
        { deleteSelectLi(this, "<%=filterable1.ClientID %>"); })

                //删除选中的排序或筛选字段
        function deleteSelectLi(self, toId) {
            var parentLi = $(self).parent();
            $(self).remove();
            parentLi.remove().appendTo($('#' + toId))
        }

        
        function setDataConverter(hiid, selfid) {
            var json = $("#" + hiid).val();
            var url = buildQueryUrl("Custom/List/DataConverterEditor.aspx", { Convert: "1", ListId: "<%=this.BusinessObjectId %>" });
            var re = showModal(encodeURI(url), json, 600, 300);
            if (checkReturn(re)) {
                $("#" + hiid).val(re);
                if (re != "") {
                    $("#" + selfid).css("color", "blue");
                }
                else {
                    $("#" + selfid).css("color", "");
                }
            }
            return false

        }

     function checkForm() {
            getFilterFields();
            return true;
        }

        function setParamFilter() {
            var xml = $("#<%=hiParamFilter.ClientID %>").val();
            var url = buildQueryUrl("Sys/ConditionEditor.aspx", { ViewType: "XSelector", ExpType: "ParamFilter", "DataSetId": "<%=BusinessObjectId%>", ViewId: "<%=BusinessObjectId%>" });
            var re = showModal(encodeURI(url), xml, 900, 400);
            if (re != undefined) {
                $("#<%=hiParamFilter.ClientID %>").val(re);
                return true;
            }
            return false
        }

        function setDefaultFilter() {
            var xml = $("#<%=hiDefaultFilter.ClientID %>").val();
            var url = buildQueryUrl("Sys/ConditionEditor.aspx", { ExpType: "DefaultFilter", "DataSetId": "<%=BusinessObjectId%>" });
            var re = showModal(encodeURI(url), xml, 900, 400);
            if (re != undefined) {
                $("#<%=hiDefaultFilter.ClientID %>").val(re);
                return true;
            }
            return false
        }

        
        function setFilterFields(){       
          var ps = $("#<%=hiAppFilterFields.ClientID %>").val();
            var url =buildQueryUrl("Custom/List/FilterFieldsEditor.aspx",{ "DataSetId": "<%=BusinessObjectId%>" });
            var re = showModal(encodeURI(url), ps, 600, 400);
            if (re != undefined) {
           
                $("#<%=hiAppFilterFields.ClientID %>").val(re); 
           
                return true;     
            }
            return false;
        
        }

        function seTitleFormat(){       
          var ps = $("#<%=hiTitleFormat.ClientID %>").val()+"@|@"+$("#<%=hiTitleFields.ClientID %>").val();
            var url =buildQueryUrl("Custom/List/FormatEditor.aspx",{ "DataSetId": "<%=BusinessObjectId%>" });
            var re = showModal(encodeURI(url), ps, 600, 400);
            if (re != undefined) {
           
                $("#<%=hiTitleFormat.ClientID %>").val(re.split('@|@')[0]);
                $("#<%=hiTitleFields.ClientID %>").val(re.split('@|@')[1]); 
           
                return true;     
            }
            return false;
        
        }

         function setContentFormat(){       
          var ps = $("#<%=hiContentFormat.ClientID %>").val()+"@|@"+$("#<%=hiContentFields.ClientID %>").val();
            var url =buildQueryUrl("Custom/List/FormatEditor.aspx",{ "DataSetId": "<%=BusinessObjectId%>" });
            var re = showModal(encodeURI(url), ps, 600, 400);
            if (re != undefined) {
           
                $("#<%=hiContentFormat.ClientID %>").val(re.split('@|@')[0]);
                $("#<%=hiContentFields.ClientID %>").val(re.split('@|@')[1]); 
           
                return true;     
            }
            return false;
        
        }


        function viewForm() {

            var param = new InputParamObject("m");
            var r = buildSelector("", param, "", buildQueryUrl("Custom/List/ObjectSelector.aspx", { "BdRefId": "<%=BusinessObjectId%>", "IsView": "1" }), 650, 600);
            if (r != null) {
                var str = "";
                var o = r.selectNodes("//o/@name");
                for (var i = 0; i < o.length; i++) {
                    str += o[i].value + " ";
                }
                $("#preview").html(str);
                $("#preview").dialog('open');
            }
            return false;
        }       
    </script>
</asp:Content>
