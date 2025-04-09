<%@ Page Title="自定义字典" Language="C#" AutoEventWireup="true" CodeBehind="XTableEditor.aspx.cs"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" Inherits="Zhongsoft.Portal.BDM.List.XTableEditor" %>

<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="templateTabs" style="height: 100%">
        <ul>
            <li index="abase"><a href='#base' id="abase">基本信息</a></li>
            <li index="acheck"><a href='#check' id="acheck">约束信息</a></li>
        </ul>
        <div id="base">
            <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <asp:Button runat="server" ID="btnBind" OnClick="btnBind_Click" Style="display: none" />
                    <table class="tz-table" runat="server" id="tableBase">
                        <tr>
                            <td colspan="4" class="tz-title">
                                基本信息
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                表名<span class="req-star">*</span>
                            </td>
                            <td class="td-m">
                                <input type="text" runat="server" id="txtTableName" class="kpms-textbox" maxlength="50"
                                    req="1" field="DictName" tablename="BD_Dict" activestatus="(23.*)" />
                            </td>
                            <td class="td-l">
                                表编号<span class="req-star">*</span>
                            </td>
                            <td class="td-m">
                                <input type="text" runat="server" id="txtTableCode" class="kpms-textbox" maxlength="50"
                                    regex="^[a-zA-Z_0-9]*$" errmsg="表编号只能由字母、数字和'_'组成" req="1" activestatus="(23.*)" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                所属模块<span class="req-star">*</span>
                            </td>
                            <td class="td-m">
                                <asp:DropDownList runat="server" ID="ddlModule" req="1" field="ModuleId" tablename="BD_Dict"
                                    ActiveStatus="(23.*)">
                                </asp:DropDownList>
                            </td>
                            <td class="td-l">
                                模版
                            </td>
                            <td class="td-m">
                                <asp:DropDownList runat="server" ID="ddlTemplate" req="1" ActiveStatus="(23.*)" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlTemplate_Change">
                                </asp:DropDownList>
                                <input type="hidden" runat="server" id="hiDeleteTemFields" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="False"
                                    ShowAddData="true" OnAddData="gvList_Add" DataKeyNames="Id" Width="100%" HeaderStyle-HorizontalAlign="Center"
                                    FrozenWidth="1040px" FrozenHeight="320px" AllowFrozing="true" OnRowDataBound="gvList_RowDataBound"
                                    OnRowCommand="gvList_RowCommand">
                                    <Columns>
                                        <asp:TemplateField HeaderText="名称" HeaderStyle-Width="20%">
                                            <ItemTemplate>
                                                <input type="hidden" runat="server" id="hiId" value='<%#Eval("Id") %>' />
                                                <input type="text" runat="server" id="txtName" value='<%#Eval("Name") %>' req="1"
                                                    class="kpms-textbox" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="编号" HeaderStyle-Width="20%">
                                            <ItemTemplate>
                                                <input type="text" runat="server" id="txtCode" value='<%#Eval("Code") %>' req="1"
                                                    regex="^[a-zA-Z_0-9]*$" errmsg="编号只能由字母、数字和'_'组成" class="kpms-textbox" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="类型" HeaderStyle-Width="15%">
                                            <ItemTemplate>
                                                <asp:DropDownList runat="server" ID="ddlType" req="1">
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="长度" HeaderStyle-Width="10%">
                                            <ItemTemplate>
                                                <input type="text" runat="server" id="txtLength" value='<%#Eval("Length") %>' class="kpms-textbox"
                                                    maxlength="4" style="text-align: right;" regex="^[1-9]\d*$" errmsg="长度只能填写正整数" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="小数长度" HeaderStyle-Width="10%">
                                            <ItemTemplate>
                                                <input type="text" runat="server" id="txtDecimalLength" value='<%#Eval("DecimalLength") %>'
                                                    disabled="disabled" maxlength="2" class="kpms-textbox" style="text-align: right;"
                                                    regex="^(0|[1-9]\d*)$" errmsg="小数长度只能填写非负整数" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="允许为空" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <input type="checkbox" runat="server" id="cbCanNull" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="是否主键" HeaderStyle-Width="10%" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <input type="checkbox" runat="server" id="cbIsPk" content="ispk" />
                                                <input type="checkbox" runat="server" id="cbIsTempField" style="display: none" content="istemp" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbDelete" runat="server" CommandName="DeleteData" EnableTheming="false">
						 <img   title="删除" onclick="if(!confirm('确认要删除吗？')) return false;" src="../../Themes/Images/btn_dg_delete.gif"  />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </zhongsoft:LightPowerGridView>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="check">
            <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <asp:Button runat="server" ID="btnTab" OnClick="btnTab_Click" Style="display: none" />
                    <table class="tz-table" >
                        <tr>
                            <td colspan="2" class="tz-title">
                                外键约束&nbsp&nbsp
                                <asp:LinkButton runat="server" ID="btnAddFK" CssClass="kpms-btn" OnClick="btnAddFK_Click">
                                            <img  src="../../Themes/Images/btn_new.gif"/><span>新建</span></asp:LinkButton>
                                <asp:Button runat="server" ID="btnBindFK" OnClick="btnBindFK_Click" Style="display: none" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="td-m">
                                <asp:DataList runat="server" ID="fkList" RepeatDirection="Horizontal" RepeatColumns="5"
                                    OnItemCommand="fkList_ItemCommand" OnItemDataBound="fkList_ItemDataBound">
                                    <ItemStyle Width="155px" Height="100px" BackColor="AliceBlue" BorderColor="CadetBlue"
                                        BorderWidth="1px" Font-Size="Medium" />
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    名称：<asp:Label runat="server" ID="lblName" Text='<%#Eval("Name") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input type="hidden" runat="server" id="hiId" value='<%#Eval("Id") %>' />
                                                    <input type="hidden" runat="server" id="hiPKTableId" />
                                                    主键表：<asp:Label runat="server" ID="lblPKTable"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input type="hidden" runat="server" id="hiPKColumnIds" />
                                                    主键列：<asp:Label runat="server" ID="lblPKColumns"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input type="hidden" runat="server" id="hiFKTableId" />
                                                    外键表：<asp:Label runat="server" ID="lblFKTable"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input type="hidden" runat="server" id="hiFKColumnIds" />
                                                    外键列：<asp:Label runat="server" ID="lblFKColumns"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="EditData" fkid='<%#Eval("Id") %>'
                                                        EnableTheming="false" OnClick="btnBindLbxFK">
                                                                 <img  src="/Portal/Themes/Images/btn_dg_edit.gif" border='0'  />
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="DeleteData" CommandArgument='<%#Eval("Id") %>'
                                                        EnableTheming="false">
                                                                 <img  src="/portal/Themes/Images/btn_dg_delete.gif" onclick="if(!confirm('确认要删除吗？')) return false;" border='0' />
                                                    </asp:LinkButton>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:DataList>
                            </td>
                        </tr>
                    </table>
                    <table class="tz-table">
                        <tr>
                            <td colspan="2" class="tz-title">
                                Unique约束
                                <asp:LinkButton runat="server" ID="btnAddUnique" CssClass="kpms-btn" OnClick="btnAddUnique_Click">
                         <img  src="../../Themes/Images/btn_new.gif"/><span>新建</span></asp:LinkButton>
                                <asp:Button runat="server" ID="btnBindUnique" OnClick="btnBindUnique_Click" Style="display: none" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-m" colspan="2">
                                <asp:DataList runat="server" ID="uniqueList" RepeatDirection="Horizontal" RepeatColumns="5"
                                    OnItemCommand="uniqueList_ItemCommand" OnItemDataBound="uniqueList_ItemDataBound">
                                    <ItemStyle Width="155px" Height="60px" BackColor="AliceBlue" BorderColor="CadetBlue"
                                        BorderWidth="1px" Font-Size="Medium" />
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    名称:<asp:Label runat="server" ID="lblName" Text='<%#Eval("Name") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input type="hidden" runat="server" id="hiId" value='<%#Eval("Id") %>' />
                                                    <input type="hidden" runat="server" id="hiColumnIds" />
                                                    Unique列:<asp:Label runat="server" ID="lblColumns"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" valign="bottom">
                                                    <asp:LinkButton ID="lbtnEdit" runat="server" OnClick="btnBindLbxUnique" uniqueid='<%#Eval("Id") %>'
                                                        EnableTheming="false">
                                    <img  src="/Portal/Themes/Images/btn_dg_edit.gif" border='0' />
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="DeleteData" CommandArgument='<%#Eval("Id") %>'
                                                        EnableTheming="false">
                                      <img  src="/portal/Themes/Images/btn_dg_delete.gif" onclick="if(!confirm('确认要删除吗？')) return false;" border='0' />
                                                    </asp:LinkButton>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:DataList>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="divUnique" title="Unique约束" style="display: none">
            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr>
                            <td class="td-l">
                                名称
                            </td>
                            <td class="td-m">
                                <input type="text" runat="server" id="txtUniqueName" class="kpms-textbox" regex="^[a-zA-Z_0-9]*$"
                                    errmsg="名称只能由字母、数字和'_'组成" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                可选数据列
                            </td>
                            <td class="td-m">
                                <asp:DropDownList runat="server" ID="ddlUniqColumns" Width="100px">
                                </asp:DropDownList>
                                <asp:LinkButton runat="server" ID="btnAddUniqueCol" CssClass="kpms-btn" OnClick="btnAddUniqueCol_Click"
                                    OnClientClick="return addUniqueCol()"><span>添加</span></asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                Unique列
                            </td>
                            <td class="td-m">
                                <input type="hidden" runat="server" id="hiUniqueId" />
                                <asp:ListBox runat="server" ID="lbxUnique" Width="100px" SelectionMode="Multiple">
                                </asp:ListBox>
                                <asp:LinkButton runat="server" ID="btnDelUniqueCol" CssClass="kpms-btn" OnClick="btnDelUniqueCol_Click"><span>删除</span></asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="divFK" title="外键约束" style="display: none">
            <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr>
                            <td class="td-l">
                                名称
                            </td>
                            <td class="td-m" colspan="3">
                                <input type="text" runat="server" id="txtFKName" class="kpms-textbox" regex="^[a-zA-Z_0-9]*$"
                                    errmsg="名称只能由字母、数字和'_'组成" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                主键表：
                            </td>
                            <td class="td-m">
                                <asp:DropDownList runat="server" ID="ddlPKTable" Width="100px" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlPKTable_Change">
                                </asp:DropDownList>
                            </td>
                            <td class="td-l">
                                外键表：
                            </td>
                            <td class="td-m">
                                <asp:Label runat="server" ID="lblFKTable"></asp:Label>
                                <input type="hidden" runat="server" id="hiFKTableId" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                主键列：
                            </td>
                            <td class="td-m">
                                <asp:DropDownList runat="server" ID="ddlPKColumn" Width="100px">
                                </asp:DropDownList>
                            </td>
                            <td class="td-l">
                                外键列：
                            </td>
                            <td class="td-m">
                                <asp:DropDownList runat="server" ID="ddlFKColumn" Width="100px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-m" colspan="4">
                                <input type="hidden" runat="server" id="hiFKId" />
                                <div>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:ListBox runat="server" ID="lbxFK" Width="250px" SelectionMode="Multiple"></asp:ListBox>
                                            </td>
                                            <td>
                                                <asp:LinkButton runat="server" ID="btnAddFKCol" CssClass="kpms-btn" OnClick="btnAddFKCol_Click"
                                                    OnClientClick="return addFKCol()"><span>添加</span></asp:LinkButton><br />
                                                <br />
                                                <asp:LinkButton runat="server" ID="btnDelFKCol" CssClass="kpms-btn" OnClick="btnDelFKCol_Click"><span>删除</span></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
      <asp:Button runat="server" ID="btnUpDate" OnClick="btnUpDate_Click" Style="display: none" />
    <script>

        var gvList = "#<%=gvList.ClientID %>";
        var $pageForm = "#<%=this.Page.Form.ClientID%>";
        var $ddlTypes;
        var $txtLengths;
        var $txtDecimalLengths;
        var $cbCanNulls;
        var $cbIsPKs;
        var $cbIsTemps;

        function initCustomerPlugin() {

            checkRegex();
            checkMaxLength();
            var tabs=$('#templateTabs').tabs({ beforeActivate: function(event, ui) { return checkTabs(ui); } });
            if ($('.ui-state-active').children().attr('id') == 'abase') {
                setAttr();
            }
           if (!parseBool("<%=Page.IsPostBack %>") && "<%=ActionType %>" == "Update") {
                var isUpdated = "<%=IsUpdated.ToString() %>";
                if (parseBool(isUpdated)) {
                    if (confirm("该数据库表结构有修改，是否更新到数据字典？")) {
                     <%=ClientScript.GetPostBackEventReference(this.btnUpDate,"") %>;    
                    }
                }
            }
        
            $("#divUnique").dialog({
                resizable: false,
                autoOpen: false,
                minHeight: 100,
                minWidth: 350,
                modal: true,
                buttons: {
                    "确定": function() {
                        var unMsg = "";
                        if ($("#<%=txtUniqueName.ClientID %>").val == "") {
                            unMsg += "请填写约束名称！\r\n";
                        }
                        var size = $("#<%=lbxUnique.ClientID%> option").size();
                        if (size == 0) {
                            unMsg += "请至少选择一个数据列作为Unique列！\r\n";
                        }
                        if (unMsg != "") {
                            alert(unMsg);
                            return false;
                        }
                        <%=ClientScript.GetPostBackEventReference(this.btnBindUnique,"") %>;  
                        $(this).dialog("close");
                    },
                    "取消": function() {
                        $(this).dialog("close");
                    }
                }
            });

            $("#divFK").dialog({
                resizable: false,
                autoOpen: false,
                minHeight: 200,
                minWidth: 450,
                modal: true,
                buttons: {
                    "确定": function() {
                        var fkMsg = "";
                        if ($("#<%=txtFKName.ClientID %>").val == "") {
                            fkMsg += "请填写约束名称！\r\n";
                        }
                        var size = $("#<%=lbxFK.ClientID%> option").size();
                        if (size == 0) {
                            fkMsg += "请至少选择一对外键关系！\r\n";
                        }
                        if (fkMsg != "") {
                            alert(fkMsg);
                            return false;
                        }
                         <%=ClientScript.GetPostBackEventReference(this.btnBindFK,"") %>;  
                        $(this).dialog("close");
                    },
                    "取消": function() {
                        $(this).dialog("close");
                    }
                }
            });
            
            if (typeof (success) != "undefined") {
                success = '2';
            }
        }

        function checkTabs(ui) {
            var newid = $(ui.newTab).attr("index");
            if (newid == 'acheck') {
                if (typeof (checkReqField) == 'function') {
                    if (!checkReqField()) return false;
                }
               <%=ClientScript.GetPostBackEventReference(this.btnTab,"") %>; 
            }
            else if (newid == 'abase') {
                <%=ClientScript.GetPostBackEventReference(this.btnBind,"") %>; 
            }
            return true;
        }

        function openDialog(divId) {
            $("#" + divId).dialog("open");
            $("#" + divId).parent().appendTo($pageForm);
        }

        $("#<%=btnAddUnique.ClientID %>").live("click", function() {
            openDialog("divUnique");
            return true;
        })

        $("#<%=uniqueList.ClientID %>").find("[id$=lbtnEdit]").live("click", function() {
            openDialog("divUnique");
            return true;
        })


        $("#<%=btnAddFK.ClientID %>").live("click", function() {
            openDialog("divFK");
            return true;
        })

        $("#<%=fkList.ClientID %>").find("[id$=lbtnEdit]").live("click", function() {
            openDialog("divFK");
            return true;
        })


        function setAttr() {
            $ddlTypes = $(gvList + " [id$=ddlType]");
            $txtLengths = $(gvList + " [id$=txtLength]");
            $txtDecimalLengths = $(gvList + " [id$=txtDecimalLength]");
            $cbCanNulls = $(gvList + " [id$=cbCanNull]");
            $cbIsPKs = $(gvList + " [id$=cbIsPk]");
            $cbIsTemps = $(gvList + " [id$=cbIsTempField]");
            $ddlTypes.each(function() {
                typeChange(this, false);
            })
            $cbIsPKs.each(function() {
                isPKChange(this, false);
            })
        }

        $(gvList + " [id$=txtName]").live("blur", function() {
            var value = $(this).val();
            if (value != '') {
                var $txtNames = $(gvList + " [id$=txtName]");
                var index = $txtNames.index(this);
                for (var i = 0; i < $txtNames.length; i++) {
                    if (i != index && value == $txtNames.eq(i).val()) {
                        alert("已存在名称为“" + value + "”的列，请重新填写！");
                        $(this).val('');
                        return;
                    }
                }
            }
        })

        $(gvList + " [id$=txtCode]").live("blur", function() {
            var value = $(this).val();
            if (value != '') {
                var $txtCodes = $(gvList + " [id$=txtCode]");
                var index = $txtCodes.index(this);
                for (var i = 0; i < $txtCodes.length; i++) {
                    if (i != index && value == $txtCodes.eq(i).val()) {
                        alert("已存在编号为“" + value + "”的列，请重新填写！");
                        $(this).val('');
                        return;
                    }
                }
            }
        })

        $(gvList + " [id$=ddlType]").live("change", function() {
            $ddlTypes = $(gvList + " [id$=ddlType]");
            $txtLengths = $(gvList + " [id$=txtLength]");
            $txtDecimalLengths = $(gvList + " [id$=txtDecimalLength]");
            $cbIsTemps = $(gvList + " [id$=cbIsTempField]");
            typeChange(this, true);
        })

        $(gvList + " [id$=cbIsPk]").live("click", function() {
            $cbIsPKs = $(gvList + " [id$=cbIsPk]");
            $cbCanNulls = $(gvList + " [id$=cbCanNull]");
            $cbIsTemps = $(gvList + " [id$=cbIsTempField]");
            isPKChange(this, true);
        })

        function typeChange(self, isChange) {
            var index = $ddlTypes.index(self);
            var $length = $txtLengths.eq(index);
            var $decimalLength = $txtDecimalLengths.eq(index);
            var $isTemp=$cbIsTemps.eq(index);
             if ($isTemp.attr("checked") == "checked") {
                return;
             }
            var value = $(self).val();
            if (value == "char" || value == "nchar" || value == "nvarchar" || value == "varchar"||value=="nvarchar2"||value=="varchar2") {
                $length.removeAttr("disabled");
                $length.attr("req", "1");
                $decimalLength.attr("disabled", "disabled");
                $decimalLength.removeAttr("req")
                $decimalLength.val("");
            }
            else if (value == "decimal"||value=="float"||value=="number"||value=="numeric") {
                $length.removeAttr("disabled");
                $length.attr("req", "1");
                $decimalLength.removeAttr("disabled");
                $decimalLength.attr("req", "1");
            }
            else {
                $length.attr("disabled", "disabled");
                $length.removeAttr("req");
                $length.val("");
                $decimalLength.attr("disabled", "disabled");
                $decimalLength.removeAttr("req");
                $decimalLength.val("");
              
            }
        }

        function isPKChange(self, isChange) {
            var index = $cbIsPKs.index(self);
            var $canNull = $cbCanNulls.eq(index);
            var $isTemp=$cbIsTemps.eq(index);
             if ($isTemp.attr("checked") == "checked") {
                return;
             }
            if ($(self).attr("checked") == "checked") {
                $canNull.removeAttr("checked");
                $canNull.attr("disabled", "disabled");
            }
            else {
                    $canNull.removeAttr("disabled");
            }
        }

        function addUniqueCol() {
            if ($("#<%=ddlUniqColumns.ClientID%>").val() == "") {
                alert("请先选择一个数据列在添加！");
                return false;
            }
            return true;
        }

        function addFKCol() {

            if ($("#<%=ddlPKColumn.ClientID%>").val() == "" || $("#<%=ddlFKColumn.ClientID%>").val() == "") {
                alert("请先选择一对相关列在添加！");
                return false;
            }
            return true;
        }
        
    
    </script>
</asp:Content>
