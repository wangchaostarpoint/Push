<%@ Page Title="数据集配置" Language="C#" MasterPageFile="~/UI/Master/ObjectCfg.Master"
    AutoEventWireup="true" CodeBehind="BDDataSetEditor.aspx.cs" Inherits="Zhongsoft.Portal.BDM.List.BDDataSetEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolTip" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="topBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManager1">
    </asp:ScriptManager>
    <div id="templateTabs">
        <ul>
            <li index="0"><a href='#field' id='afield'>字段</a></li>
            <li index="1"><a href='#relation' id='arelation'>表间关联</a></li>
        </ul>
        <div id="field">
            <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Always">
                <ContentTemplate>
                    <asp:Button ID="btnSelect" runat="server" Text="选择" OnClick="btnSelect_Click" ActiveStatus="(23.*)"
                        Style="display: none" />
                    <asp:LinkButton runat="server" ID="btnReBuild" OnClick="btnReBuild_Click" Visible="false"></asp:LinkButton>
                    <table class="tz-table">
                        <tr>
                            <td style="width: 150px; border: 1px #C0C3C8 solid;" valign="top">
                                <div style="max-height: 325px; overflow: auto">
                                    <asp:DataList runat="server" ID="listTable" OnItemCommand="listTable_ItemCommand"
                                        OnItemDataBound="listTable_ItemDataBound">
                                        <ItemTemplate>
                                            <div style="border: 1px #C0C3C8 solid; margin: 2px 1px 2px 1px; height: 20px; vertical-align: middle;
                                                width: 146px; text-indent: 10px">
                                                <asp:Label runat="server" ID="lbTable"></asp:Label>
                                                <input type="hidden" runat="server" id="hiTableCode" />
                                                <asp:LinkButton runat="server" ID="lbtnDelete" CommandName="DeleteTable" EnableTheming="false">
                                                <img alt="删除" onclick="if(!confirm('确认要删除吗？')) return false;" src="<%=WebAppPath %>/Themes/Images/btn_dg_delete.gif" />
                                                </asp:LinkButton>
                                            </div>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </div>
                            </td>
                            <td>
                                <zhongsoft:LightPowerGridView runat="server" ID="gvField" OnRowCommand="gvField_RowCommand"
                                    DataKeyNames="Id" AllowFrozing="true" FrozenWidth="805" Width="785" FrozenHeight="325"
                                    OnRowDataBound="gvField_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderText="启用" HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:CheckBox runat="server" ID="cbEnabled" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="字段名" HeaderStyle-Width="200px">
                                            <ItemTemplate>
                                                <zhongsoft:LightTextBox ID="tbName" runat="server" Text='<%#Eval("Name") %>' Width="200px"></zhongsoft:LightTextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="字段编号" HeaderStyle-Width="350px">
                                            <ItemTemplate>
                                                <zhongsoft:LightTextBox ID="tbCode" runat="server" ReadOnly="true"></zhongsoft:LightTextBox>
                                                <input id="hiType" type="hidden" runat="server" value='<%#Eval("Type") %>' />
                                                <input id="hiId" type="hidden" runat="server" value='<%#Eval("Id") %>' />
                                                <input id="hiCode" type="hidden" runat="server" value='<%#Eval("Code") %>' />
                                                <input id="hiDictCode" type="hidden" runat="server" value='<%#Eval("DictCode") %>' />
                                                <input id="hiDictName" type="hidden" runat="server" value='<%#Eval("DictName") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="显示" HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:CheckBox runat="server" ID="cbVisible" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="汇总" HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:CheckBox runat="server" ID="cbAsSum" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="筛选" HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:CheckBox runat="server" ID="cbAsFilter" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="排序" HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:CheckBox runat="server" ID="cbAsSort" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="分组">
                                            <ItemTemplate>
                                                <asp:DropDownList runat="server" ID="ddlAggregate">
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </zhongsoft:LightPowerGridView>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <table>
                                    <tr>
                                        <td>
                                            数据连接
                                            <asp:DropDownList runat="server" ID="ddlDataCon" Width="120px" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlDataCon_Change">
                                            </asp:DropDownList>
                                        </td>
                                        <td nowrap="nowrap">
                                            <zhongsoft:LightObjectSelector runat="server" ID="lselDict" OnlyShowButton="true"
                                                SelectPageMode="Dialog" Text=" 添加表" ImageUrl="~/Themes/Images/btn_add.gif" PageUrl="~/BDM/List/DictSelector.aspx"
                                                Filter="||ctrl@ddlDataCon" IsMutiple="true" Width="65px" OnClick="lselDict_Click"
                                                ResultForControls="{'hiDictId':'id'}" />
                                            <asp:LinkButton runat="server" ID="btnUpdate" Text="更新数据集" OnClick="btnUpdate_Click"></asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                                <input type="hidden" runat="server" id="hiDictId" />
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="relation">
            <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Always">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr>
                            <td colspan="2">
                                <zhongsoft:LightPowerGridView runat="server" ID="gvRelation" AutoGenerateColumns="false"
                                    OnAddData="btnAddRelation_Click" ShowAddData="true" OnRowDataBound="gvRelation_RowDataBound"
                                    OnRowCommand="gvRelation_RowCommand">
                                    <Columns>
                                        <asp:TemplateField HeaderText="左表" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="160px">
                                            <ItemTemplate>
                                                <asp:DropDownList runat="server" ID="ddlLeftTable" req="1" Width="140px">
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="联接类型" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="160px">
                                            <ItemTemplate>
                                                <asp:DropDownList runat="server" ID="ddlJoinType" req="1" Width="140px">
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="右表" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="160px">
                                            <ItemTemplate>
                                                <asp:DropDownList runat="server" ID="ddlRightTable" req="1" Width="140px">
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="联接字段" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <input type="text" runat="server" id="txtFields" req="1" class="kpms-textbox" readonly="readonly"
                                                    title="点击编辑联接字段" />
                                                <input type="hidden" runat="server" id="hiFileds" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="移动">
                                            <ItemStyle HorizontalAlign="Center" Width="40px"></ItemStyle>
                                            <ItemTemplate>
                                                <table>
                                                    <tr>
                                                        <td style="width: 50%; border: none">
                                                            <asp:LinkButton ID="lbUp" runat="server" CommandName="Up" EnableTheming="false">
						   <span class="ui-icon ui-icon-circle-arrow-n" title="上移"></span>
                                                            </asp:LinkButton>
                                                        </td>
                                                        <td style="width: 50%; border: none">
                                                            <asp:LinkButton ID="lbDown" runat="server" CommandName="Down" EnableTheming="false">
						   <span class="ui-icon ui-icon-circle-arrow-s" title="下移"></span>
                                                            </asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="删除" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbDelete" runat="server" CommandName="DeleteData" EnableTheming="false">
						             <img onclick="if(!confirm('确认要删除吗？')) return false;" src="../../themes/images/btn_dg_delete.gif"  />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </zhongsoft:LightPowerGridView>
                            </td>
                        </tr>
                    </table>
                    <div id='iframediv' style='display: none'>
                        <iframe id='editiframe' name="editiframe" src='' frameborder='0' width='100%' height='100%'
                            scrolling='no' allowtransparency='true'></iframe>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <input type="hidden" runat="server" id="hiOpenPage" />
    </div>
    <script>
       

        function initCustomerPlugin() {

            var $tab1 = $('#templateTabs').tabs({ activate: function (event, ui) {  return checkTabs(ui); } });
            var index = $('#<%=hiOpenPage.ClientID %>').val();
            if (index != "") {
                $tab1.tabs('activate', parseInt(index));
            }
            if("<%=IsCustom %>"=="0"){
               $("#arelation").hide();
            }

            if (!parseBool("<%=Page.IsPostBack %>") && "<%=ActionType %>" == "Update") {
                var isUpdated = "<%=IsUpdated.ToString() %>";
                if (parseBool(isUpdated)) {
                    if (confirm("数据字典有修改，是否更新到数据集？")) {
                     <%=ClientScript.GetPostBackEventReference(this.btnReBuild,"") %>;    
                    }
                }
            }
        }

        function checkTabs(ui) {
      
            if ($(ui.newTab).attr("index") == "0" && $('#<%=hiOpenPage.ClientID %>').val() == "1") {
                  <%=Page.GetPostBackEventReference(this.btnSelect,"") %>;
            }
            $('#<%=hiOpenPage.ClientID %>').val($(ui.newTab).attr("index"));
        }



        function clearJoinFields(textId, hiId) {
            $("#" + textId).val("");
            $("#" + hiId).val("");
        }

        function editJoinFields(lid, rid, hiid, tid) {
            var leftTable = $("#" + lid).val();
            var rightTable = $("#" + rid).val();
            var fields = $("#" + hiid).val();
            if (leftTable == "" || rightTable == "")
            { alert("请先选择关联表，再编辑关联字段。"); return false; };

            var url=buildQueryUrl("/bdm/list/JoinFieldsEditor.aspx",{"LeftTable":leftTable,"RightTable":rightTable,"Fields":escape(fields)});
            document.getElementById('editiframe').src =url;

            $("#iframediv").dialog({
                title: "关联字段编辑",
                height: 300,
                width: 500,
                modal: true,
                buttons: {
                    "确定": function () {
                        var check =  editiframe.window.check();
                        if (!check) {
                            return false;
                        }
                        var fields = editiframe.window.getFields();
                        var texts = editiframe.window.getTexts();
                        $("#" + hiid).val(fields)
                        $("#" + tid).val(texts)
                        $(this).dialog("close");
                        document.getElementById('editiframe').src = "";
                    },
                    "取消": function () {
                        $(this).dialog("close");
                        document.getElementById('editiframe').src = "";
                    }
                }
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bottomBar" runat="server">
    <asp:UpdatePanel runat="server" ID="UpdatePanel3" UpdateMode="Always">
        <ContentTemplate>
            <asp:LinkButton runat="server" ID="btnSure" OnClick="btnSure_Click" OnClientClick="return saveData();">
                      <span>确定</span>
            </asp:LinkButton>
            <asp:LinkButton runat="server" ID="btnCancel" OnClientClick="cancelEdit();return false;">
                    <span>取消</span>
            </asp:LinkButton>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script>
        //检查字段分组处理
        function checkAggregate() {
            var controls = $("#<%=gvField.ClientID %> [id$=ddlAggregate]");
            var noneLength = 0;
            var enabledLength = 0;
            $.each(controls, function (index, obj) {
                if (!obj.disabled) {
                    enabledLength++;
                    if ($(obj).val() == "None") {
                        noneLength++;
                    }
                }
            });
            //全部字段启用分组或全部字段不启用分组情况下验证通过。
            if (enabledLength == noneLength || noneLength == 0) {
                return true;
            }
            else {
                alert("如果任意字段启用了分组，则所有字段都必须启用分组。");
                return false;
            }
        }

        function saveData() {
            if (!checkReqField()) {
                return false;
            }

            return checkAggregate();
        }

        function closeCfgWindow() {
            parent.returnValue = "isSave";
            closeWindow();
        }

        function cancelEdit() {
            parent.returnValue = null;
            closeWindow();
        }

        function setEnabled(enable, visible, sum, sort, aggregate) {
            if ($("#" + enable).is(":checked")) {
                $("#" + visible).removeAttr("disabled");
                $("#" + visible).parent('span').removeAttr("disabled");
                $("#" + sum).removeAttr("disabled");
                $("#" + sum).parent('span').removeAttr("disabled");
                $("#" + aggregate).removeAttr("disabled");
            }
            else {
                $("#" + visible).attr("disabled", "disabled");
                $("#" + sum).attr("disabled", "disabled");
                $("#" + visible).removeAttr("checked");
                $("#" + sum).removeAttr("checked");
                if (!$("#" + sort).attr("checked")) {
                    $("#" + aggregate).attr("disabled", "disabled");
                    $("#" + aggregate).val("None");
                }
            }
        }
        function setSort(sort, enabled, aggregate) {
            if (!$("#" + sort).attr("checked") && !$("#" + enabled).attr("checked")) {
                $("#" + aggregate).attr("disabled", "disabled");
                $("#" + aggregate).val("None");
            }
            else {
                $("#" + aggregate).removeAttr("disabled");
            }
        }
    </script>
</asp:Content>
