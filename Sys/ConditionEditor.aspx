<%@ Page Title="表达式设置" Language="C#" AutoEventWireup="true" CodeBehind="ConditionEditor.aspx.cs"
    MasterPageFile="~/UI/Master/ObjectCfg.Master" Inherits="Zhongsoft.Portal.Sys.ConditionEditor" %>

<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.Controls" TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="topBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManager1">
    </asp:ScriptManager>
    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
        <ContentTemplate>
            <table class="tz-table">
                <tr>
                    <td colspan="2">
                        <asp:LinkButton runat="server" ID="btnBind" OnClick="btnBind_Click" Style="display: none"></asp:LinkButton>
                        <zhongsoft:LightPowerGridView runat="server" ID="gvList" AutoGenerateColumns="false"
                            ShowAddData="true" OnAddData="btnAddItem_Click" OnRowCommand="gvList_RowCommand"
                            OnRowDataBound="gvList_RowDataBound">
                            <Columns>
                                <asp:TemplateField HeaderText="关系" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:DropDownList runat="server" ID="ddlRelation" req="1" Width="100px" flag="relation">
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="左括号" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <table width="100%">
                                            <tr>
                                                <td style="border: none; text-align: center">
                                                    <input type="text" runat="server" id="tbLeftBracket" class="kpms-textbox" value='<%#Eval("LeftBracket") %>'
                                                        readonly="readonly" style="text-align: center; width: 60px" flag="left" />
                                                </td>
                                                <td style="border: none; text-align: center">
                                                    <span class="ui-icon ui-icon-circle-plus" onclick="addLeftBracket(this)" title="添加">
                                                    </span>
                                                </td>
                                                <td style="border: none; text-align: center">
                                                    <span class="ui-icon ui-icon-circle-minus" onclick="deleteBracket(this)" title="删除">
                                                    </span>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="属性" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:DropDownList runat="server" ID="ddlDispCode" req="1" Width="100px" flag="code">
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="运算符" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:DropDownList runat="server" ID="ddlOperator" req="1" Width="100px" flag="operator">
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="值" ItemStyle-Width="250px">
                                    <ItemTemplate>
                                        <input type="hidden" runat="server" id="hiXml" />
                                        <table cellpadding='0' cellspacing='0'>
                                            <tr>
                                                <td style="padding: 0px;">
                                                    <zhongsoft:InherentParamSelctor runat="server" ID="tbFilterValue" CssClass="kpms-textbox"
                                                        Width="200px" flag="value"></zhongsoft:InherentParamSelctor>
                                                    <asp:TextBox runat="server" ID="tbBeginValue" CssClass="kpms-textbox" Text='<%#Eval("BeginValue") %>'
                                                        Width="95px" flag="start"></asp:TextBox>
                                                    <asp:TextBox runat="server" ID="tbEndValue" CssClass="kpms-textbox" Text='<%#Eval("EndValue") %>'
                                                        Width="95px" flag="end"></asp:TextBox>
                                                    <zhongsoft:LightDropDownList runat="server" ID="ddlParam" Width="200px" Visible="false"
                                                        flag="param">
                                                    </zhongsoft:LightDropDownList>
                                                </td>
                                                <td style="padding: 0px;">
                                                    <asp:LinkButton runat="server" ID="btnSelect" CssClass="btn-look-up" EnableTheming="false"
                                                        Visible="false"><img  src="../Themes/Images/look-up.gif"/></asp:LinkButton>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="右括号" ItemStyle-Width="120px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <table width="100%">
                                            <tr>
                                                <td style="border: none; text-align: center">
                                                    <input type="text" runat="server" id="tbRightBracket" class="kpms-textbox" value='<%#Eval("RightBracket") %>'
                                                        readonly="readonly" style="text-align: center; width: 60px" flag="right" />
                                                </td>
                                                <td style="border: none; text-align: center">
                                                    <span id="btnAddRight" class="ui-icon ui-icon-circle-plus" onclick="addRightBracket(this)"
                                                        title="添加"></span>
                                                </td>
                                                <td style="border: none; text-align: center">
                                                    <span class="ui-icon ui-icon-circle-minus" onclick="deleteBracket(this)" title="删除">
                                                    </span>
                                                </td>
                                            </tr>
                                        </table>
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
						             <img onclick="if(!confirm('确认要删除吗？')) return false;" src="../themes/images/btn_dg_delete.gif"  />
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
            <table width="100%">
                <tr>
                    <td width="50px">
                        语意模型
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="tbHeaderTextQuery" TextMode="MultiLine" Rows="3"
                            Width="99%" CssClass="kpms-textarea" ReadOnly="true" EnableTheming="false"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td width="50px">
                        编码模型
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="tbFilterQuery" TextMode="MultiLine" Rows="3" CssClass="kpms-textarea"
                            Width="99%" ReadOnly="true" EnableTheming="false"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript">

        function selOperator(ddlCode, hixml, tbValue) {
            var code = $("#" + ddlCode).val();
            var param = new InputParamObject("m");
            var reObj = null;
            if (code == "") {
                alert("请选择属性类型。");
                return;
            }
            else if (code == "@User") {
                reObj = getUsers(hixml, param, "");
                if (reObj != null) {
                    $("#" + tbValue).val(reObj.buildAttrJson("o", "name"));
                }
            }
            else if (code == "@Role") {
                reObj = getDeptRoles(hixml, param, "");
                if (reObj != null)
                    $("#" + tbValue).val(reObj.buildAttrJson("o", "name"));
            }
            else if (code == "@Unit") {
                reObj = getOrgs(hixml, param, "");
                if (reObj != null)
                    $("#" + tbValue).val(reObj.buildAttrJson("o", "name"));
            }
            return false;
        }

        function saveData() {
            if (!checkReqField()) {
                return false;
            }
            return true;
        }

        $(document).ready(function () {
            if (!parseBool("<%=IsPostBack %>")) {
                if ("<%=DIALOG_MODE%>" == "Dialog") {
                    if (window.parent.document.getElementById("<%=PARAM_HI_ID%>") != null) {
                        var str = window.parent.document.getElementById("<%=PARAM_HI_ID%>").value;
                        $("#<%=hiExpXml.ClientID %>").val(str);
                    }
                }
                else {
                    $("#<%=hiExpXml.ClientID %>").val(window.dialogArguments);
                }
                 <%=this.ClientScript.GetPostBackEventReference(this.btnBind, "")%>
            }
        })

        function initCustomerPlugin() {
            getFilterText();
//             $("[flag='value']").autocomplete({
//                source: function (request, response) {
//                    $.getJSON("JsonSelectorHandler.ashx", {
//                        term: request.term + ',userattr'
//                    }, response);
//                },
//                minLength: 1,
//                select: function (event, ui) {
//                    if (ui.item) {
//                        $(this).val(ui.item.value);
//                    }
//                }
//            });
        }

        var $expType = "<%=ExpType %>";
        function getFilterText() {
            var $gvFilter = $("#<%=gvList.ClientID %>");
            var $relation = $gvFilter.find("[flag='relation']");
            var $left = $gvFilter.find("[flag='left']");
            var $code = $gvFilter.find("[flag='code']");
            var $operator = $gvFilter.find("[flag='operator']");
            var $value = $gvFilter.find("[flag='value']");
            if ($expType == "ParamFilter") {
                $value = $gvFilter.find("[flag='param']");
            }
            var $right = $gvFilter.find("[flag='right']");
            var $start = $gvFilter.find("[flag='start']");
            var $end = $gvFilter.find("[flag='end']");
            var nameFilter = "";
            var codeFilter = "";
            for (var i = 0; i < $code.length; i++) {
                var left = $left.eq(i).val();
                var dispcode = $code.eq(i).val().split('|')[0].replace(/\[/gm,"").replace(/]/gm,"");
                var disptext = $code.eq(i).find(":selected").text();
                if (dispcode == "") {
                    dispcode = "' '";
                    disptext = "' '";
                }

                var operator = $operator.eq(i).val();
                var val = $value.eq(i).val();
                var right = $right.eq(i).val();
                if (i != 0) {
                    var raltion = $relation.eq(i - 1).val();
                    if (raltion == "") {
                        raltion = "AND";
                    }
                    nameFilter += raltion + " ";
                    codeFilter += raltion + " ";
                }
                nameFilter += left;
                codeFilter += left;
                if (operator == "Between") {
                    var start = $start.eq(i).val() == "" ? "' '" : $start.eq(i).val();
                    var end = $end.eq(i).val() == "" ? "' '" : $end.eq(i).val();
                    nameFilter += "(" + disptext + ">=" + start + " AND " + disptext + "<=" + end + ") ";
                    codeFilter += "(" + dispcode + ">=" + start + " AND " + dispcode + "<=" + end + ") ";
                }
                else if (operator == "IsNull") {
                    nameFilter += disptext + " IS NULL";
                    codeFilter += dispcode + " IS NULL";
                }
                else if (operator == "IsNotNull") {
                    nameFilter += disptext + " IS NOT NULL";
                    codeFilter += dispcode + " IS NOT NULL";
                }
                else {
                    nameFilter += disptext;
                    codeFilter += dispcode;
                    var op = "=";
                    if (operator == "Equal" || operator == "") {
                        op = "=";
                    } else if (operator == "NotEqual") {
                        op = "<>";
                    } else if (operator == "Like") {
                        op = " LIKE ";
                        val = "%" + val + "%";
                    }
                    else if (operator == "NotLike") {
                        op = " NOT LIKE ";
                        val = "%" + val + "%";
                    }
                    else if (operator == "GreaterThan") {
                        op = ">";
                    }
                    else if (operator == "GreaterThanOrEqual") {
                        op = ">=";
                    } else if (operator == "LessThan") {
                        op = "<";
                    }
                    else if (operator == "LessThanOrEqual") {
                        op = "<=";
                    }
                    else if (operator == "In") {
                        op = " IN ";
                    }
                    else if (operator == "NotIn") {
                        op = " NOT IN ";
                    }

                    if (operator == "In" || operator == "NotIn") {
                        val = "(" + val + ")";
                    }
                    else {
                        if (val == "") {
                            val = "' '";
                        } else {
                            val = "'" + val + "'";
                        }
                    }

                    nameFilter += op + val;
                    codeFilter += op + val;
                }

                nameFilter += right + " ";
                codeFilter += right + " ";

            }
            $("#<%=tbHeaderTextQuery.ClientID %>").val(nameFilter);
            $("#<%=tbFilterQuery.ClientID %>").val(codeFilter);
        }

        function addLeftBracket(e) {
            var $input = $(e).parent().parent().find('input');
            $input.val($input.val() + "(");
            getFilterText();
            return false;
        }
        function addRightBracket(e) {
            var $input = $(e).parent().parent().find('input');
            $input.val($input.val() + ")");
            getFilterText();
            return false;
        }

        function deleteBracket(e) {
            var $input = $(e).parent().parent().find('input');
            var val = $input.val();
            if (val.length > 0) {
                $input.val(val.substring(0, val.length - 1));
            }
            getFilterText();
            return false;
        }

        function setValueDisplay(id, filid, bid, eid) {

            if ($expType != "ParamFilter") {
                if ($("#" + id).val() == "Between") {
                    $("#" + filid).hide().removeAttr("req");
                    $("#" + bid).show().attr("req", "1");
                    $("#" + eid).show().attr("req", "1");
                }
                else if ($("#" + id).val() == "IsNull" || $("#" + id).val() == "IsNotNull") {
                    $("#" + bid).hide().removeAttr("req");
                    $("#" + eid).hide().removeAttr("req");
                    $("#" + filid).hide().removeAttr("req"); ;
                }
                else {
                    $("#" + bid).hide().removeAttr("req");
                    $("#" + eid).hide().removeAttr("req");
                    $("#" + filid).show().attr("req", "1"); ;
                }
            }

            getFilterText();
        }

        function setValueRegex(id, filid, bid, bid, hixml) {

            if ($expType != "ParamFilter") {
                var disp = $("#" + id).val();
                if ($expType == "AclOperator") {
                    $("#" + filid).val("");
                    $("#" + hixml).val("");
                }
                else {
                    if (disp == '') {
                        $("#" + filid).attr("class", "kpms-textbox").removeAttr("regex").removeAttr("errmsg");
                        $("#" + bid).attr("class", "kpms-textbox").removeAttr("regex").removeAttr("errmsg");
                        $("#" + bid).attr("class", "kpms-textbox").removeAttr("regex").removeAttr("errmsg");
                    } else {
                        var disps = disp.split('|');
                        var type = "";
                        if (disps.length > 1) {
                            type = disps[1].toLowerCase();
                        }

                        if (type == "datetime"||type=="date"||type=="datetime2") {
                            $("#" + filid).attr("class", "kpms-textbox-date").removeAttr("regex").removeAttr("errmsg");
                            $("#" + bid).attr("class", "kpms-textbox-date").removeAttr("regex").removeAttr("errmsg");
                            $("#" + bid).attr("class", "kpms-textbox-date").removeAttr("regex").removeAttr("errmsg");
                            initDate();
                        }
                        else if (type == "bigint" || type == "int" || type == "smallint" ||
                type == "tinyint" || type == "numeric" || type == "decimal" 
                || type == "float"|| type == "number"|| type == "integer") {
                            var regex = "^-?([0-9]+\\.{0,1}[0-9]{0,})$";
                            var errmsg = "此字段为数字类型，请填写数字。";
                            $("#" + filid).attr("class", "kpms-textbox").attr("regex", regex).attr("errmsg", errmsg);
                            $("#" + bid).attr("class", "kpms-textbox").attr("regex", regex).attr("errmsg", errmsg);
                            $("#" + bid).attr("class", "kpms-textbox").attr("regex", regex).attr("errmsg", errmsg);

                        }
                        else {
                            $("#" + filid).attr("class", "kpms-textbox").removeAttr("regex").removeAttr("errmsg").removeAttr("ReadOnly");
                            $("#" + bid).attr("class", "kpms-textbox").removeAttr("regex").removeAttr("errmsg").removeAttr("ReadOnly");
                            $("#" + bid).attr("class", "kpms-textbox").removeAttr("regex").removeAttr("errmsg").removeAttr("ReadOnly");
                        }
                    }
                }
            }
            getFilterText();
        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bottomBar" runat="server">
    <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional">
        <ContentTemplate>
            <input type="hidden" runat="server" id="hiExpXml" />
            <asp:LinkButton runat="server" ID="btnSure" OnClick="btnSure_Click" OnClientClick="return saveData();">
                      <span>确定</span>
            </asp:LinkButton>
            <asp:LinkButton runat="server" ID="btnCancel" OnClientClick="cancelEdit();return false;">
                    <span>取消</span>
            </asp:LinkButton>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script>

        function closeExpWindow() {
            parent.returnValue = $("#<%=hiExpXml.ClientID %>").val();
            closeWindow();
            return false;
        }

        function cancelEdit() {
            parent.returnValue = null;
            closeWindow();
        }
    
    </script>
</asp:Content>
