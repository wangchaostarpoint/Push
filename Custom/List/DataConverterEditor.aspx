<%@ Page Title="数据转换设置" Language="C#" MasterPageFile="~/UI/Master/ObjectCfg.Master"
    AutoEventWireup="true" CodeBehind="DataConverterEditor.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.DataConverterEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManager1">
    </asp:ScriptManager>
    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:LinkButton runat="server" ID="btnBind" OnClick="btnBind_Click" Style="display: none"></asp:LinkButton>
            <table id="tableParam" class="tz-table">
                <tr content="filter">
                    <td class="td-l">
                        是否高级查询
                    </td>
                    <td class="td-r">
                        <asp:RadioButtonList runat="server" ID="rblIsAdvSearch" RepeatDirection="Horizontal">
                            <asp:ListItem Value="1">是</asp:ListItem>
                            <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        类型
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightDropDownList runat="server" ID="ddlParamType">
                        </zhongsoft:LightDropDownList>
                    </td>
                </tr>
                <tr id="trTip" runat="server">
                    <td class="td-l">
                        选项提示
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox runat="server" ID="tbSelectTip" Text="请选择"></zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr flag="System" style="display: none">
                    <td class="td-l">
                        系统参数名
                    </td>
                    <td class="td-r">
                        <input type="hidden" runat="server" id="hiSystemParamId" />
                        <zhongsoft:LightObjectSelector runat="server" ID="selSysParam" PageUrl="~/Sys/Param/ParamSelector.aspx"
                            ResultForControls="{'hiSystemParamId':'id'}" ResultAttr="name" />
                    </td>
                </tr>
                <tr flag="System" style="display: none">
                    <td class="td-l">
                        默认值
                    </td>
                    <td class="td-r">
                        <input type="hidden" runat="server" id="hiDefaultValue" />
                        <zhongsoft:LightObjectSelector runat="server" ID="selParamDefaultValue" PageUrl="~/Sys/Param/ParamDetailSelector.aspx"
                            ResultForControls="{'hiDefaultValue':'id'}" ResultAttr="name" FilterFunction="filterFuc();" />
                    </td>
                </tr>
                <tr flag="DataBase" style="display: none">
                    <td class="td-l">
                        参数表名
                    </td>
                    <td class="td-r">
                        <input type="hidden" runat="server" id="hiParamTable" />
                        <zhongsoft:LightObjectSelector runat="server" ID="selDict" PageUrl="~/BDM/List/DictSelector.aspx"
                            OnClick="selDict_Click" ResultForControls="{'hiParamTable':'att2'}" ResultAttr="name" />
                    </td>
                </tr>
                <tr flag="DataBase" style="display: none">
                    <td class="td-l">
                        显示字段
                    </td>
                    <td class="td-r">
                        <asp:DropDownList runat="server" ID="ddlParamText">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr flag="DataBase" style="display: none">
                    <td class="td-l">
                        值字段
                    </td>
                    <td class="td-r">
                        <asp:DropDownList runat="server" ID="ddlParamValue">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr flag="DataBase" style="display: none">
                    <td class="td-l">
                        排序字段
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightDropDownList runat="server" ID="ddlParamSort" Width="42%">
                        </zhongsoft:LightDropDownList>
                        <zhongsoft:LightDropDownList runat="server" ID="ddlSortDirection" Width="42%">
                            <asp:ListItem Value="ASC">升序</asp:ListItem>
                            <asp:ListItem Value="DESC">降序</asp:ListItem>
                        </zhongsoft:LightDropDownList>
                    </td>
                </tr>
                <tr flag="DataBase" style="display: none">
                    <td class="td-l">
                        过滤条件
                    </td>
                    <td class="td-r">
                        <table cellpadding='0' cellspacing='0' width="85%">
                            <tr>
                                <td>
                                    <input type="hidden" runat="server" id="hiParamFilter" />
                                    <asp:TextBox runat="server" ID="tbParamFilter" Height="16px" ReadOnly="true" Width="100%"
                                        CssClass="kpms-textbox"></asp:TextBox>
                                </td>
                                <td valign='middle' style='width: 19px; padding-left: 2px'>
                                    <asp:LinkButton runat="server" ID="btnSetFilter" OnClientClick="return setParamFilter();"
                                        Style="height: 18px; width: 20px; padding: 0px" CssClass="btn-look-up" EnableTheming="false"
                                        OnClick="btnSetFilter_Click"><img  src="../../Themes/Images/btn_fx.png"  style="padding:0px"/>
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr flag="Custom" style="display: none">
                    <td class="td-l">
                        自定义参数
                    </td>
                    <td class="td-m">
                        <asp:TextBox ID="tbOptions" CssClass="kpms-textarea" runat="server" TextMode="MultiLine"
                            Rows="3" EnableTheming="false"></asp:TextBox>
                        <span class="req-star">每个参数间用“回车符”分隔</span>
                    </td>
                </tr>
                <tr flag="Computed" style="display: none">
                    <td class="td-l">
                        计算表达式
                    </td>
                    <td class="td-m">
                        <table cellpadding='0' cellspacing='0' width="85%">
                            <tr>
                                <td>
                                    <input type="hidden" runat="server" id="hiComputed" />
                                    <asp:TextBox runat="server" ID="tbComputed" Height="16px" ReadOnly="true" Width="100%"
                                        CssClass="kpms-textbox"></asp:TextBox>
                                </td>
                                <td valign='middle' style='width: 19px; padding-left: 2px'>
                                    <asp:LinkButton runat="server" ID="btnSetComputed" OnClientClick="return setComputed();"
                                        Style="height: 18px; width: 20px; padding: 0px" CssClass="btn-look-up" EnableTheming="false"><img  src="../../Themes/Images/btn_fx.png"  style="padding:0px"/>
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr flag="Format" style="display: none">
                    <td class="td-l">
                        格式化表达式
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox runat="server" ID="tbFormat"></zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr flag="Bool" style="display: none">
                    <td class="td-l">
                        True
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox runat="server" ID="tbTrue" Text="是"></zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr flag="Bool" style="display: none">
                    <td class="td-l">
                        False
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox runat="server" ID="tbFalse" Text="否"></zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr flag="Enum" style="display: none">
                    <td class="td-l">
                        程序集
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox runat="server" ID="tbAssembly"></zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr flag="Enum" style="display: none">
                    <td class="td-l">
                        类名
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox runat="server" ID="tbClassName"></zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr flag="Enum" style="display: none" id="trIndex">
                    <td class="td-l">
                        绑定索引
                    </td>
                    <td class="td-r">
                        <asp:CheckBox runat="server" ID="cbIndex" Text="是" />
                    </td>
                </tr>
                <tr flag="Enum" style="display: none">
                    <td class="td-l">
                        默认值
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightDropDownList runat="server" ID="ddlEnumDefault" Width="42%">
                        </zhongsoft:LightDropDownList>
                        <asp:LinkButton runat="server" ID="btnEnumDefault" OnClick="btnEnumDefault_Click"
                            OnClientClick="return filterEnumFuc();">
                                  <span>读取</span>
                        </asp:LinkButton>
                    </td>
                </tr>
                <tr flag="Plugin" style="display: none">
                    <td class="td-l">
                        接口
                    </td>
                    <td class="td-r">
                        <input type="hidden" runat="server" id="hiPluginId" />
                        <zhongsoft:LightObjectSelector runat="server" ID="lbsPlugin" PageUrl="~/Sys/Plugins/PluginSelector.aspx"
                            ResultAttr="name" ResultForControls="{'hiPluginId':'id'}" />
                    </td>
                </tr>
                <tr flag="Plugin" style="display: none">
                    <td class="td-l">
                        标识
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox runat="server" ID="tbFlag" MaxLength="50"></zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr flag="Xml" style="display: none">
                    <td class="td-l">
                        Xml列
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightDropDownList runat="server" ID="ddlXmlField">
                        </zhongsoft:LightDropDownList>
                    </td>
                </tr>
                <tr flag="Xml" style="display: none">
                    <td class="td-l">
                        Xml
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightDropDownList runat="server" ID="ddlXmlCvtType">
                        </zhongsoft:LightDropDownList>
                    </td>
                </tr>
                <tr flag="Xml" style="display: none" id="trXPath">
                    <td class="td-l">
                        节点路径
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox runat="server" ID="tbXPath" MaxLength="500"></zhongsoft:LightTextBox>
                    </td>
                </tr>
                <tr flag="Xml" style="display: none" id="trXslt">
                    <td class="td-l">
                        Xslt转换表达式
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox runat="server" ID="tbXslt" TextMode="MultiLine" EnableTheming="false"
                            CssClass="kpms-textarea"></zhongsoft:LightTextBox>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bottomBar" runat="server">
    <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional">
        <ContentTemplate>
            <input type="hidden" runat="server" id="hiExpJson" />
            <asp:LinkButton runat="server" ID="btnSure" OnClick="btnSure_Click" OnClientClick="return saveData();">
                      <span>确定</span>
            </asp:LinkButton>
            <asp:LinkButton runat="server" ID="btnCancel" OnClientClick="cancelEdit();return false;">
                    <span>取消</span>
            </asp:LinkButton>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script>


        function setComputed() {
            var json = { DataSetId: "<%=ListId%>", FieldType: "BDDataSet" };
            var url = buildQueryUrl("sys/CommonExpEditor.aspx", json);
            var re = showModal(url, $("#<%=hiComputed.ClientID %>").val(), 800, 400);
            if (checkReturn(re)) {
                $("#<%=tbComputed.ClientID %>").val(re);
                $("#<%=hiComputed.ClientID %>").val(re);
            }
            return false;
        }

        function setParamFilter() {
            var tableCode = $("#<%=hiParamTable.ClientID %>").val();
            if (tableCode == "") {
                alert("请先选择参数表，再设置表达式。");
                return false;
            }
            var xml = $("#<%=hiParamFilter.ClientID %>").val();
            var url = buildQueryUrl("Sys/ConditionEditor.aspx", { "ExpType": "TableFilter", "TableCode": tableCode });
            var re = showModal(encodeURI(url), xml, 900, 400);
            if (re != undefined) {
                $("#<%=hiParamFilter.ClientID %>").val(re);
                return true;
            }
            return false
        }

        $(document).ready(function () {
            if (!parseBool("<%=IsPostBack %>")) {
                if (window.dialogArguments != undefined) {
                    $("#<%=hiExpJson.ClientID %>").val(window.dialogArguments);
                     <%=this.ClientScript.GetPostBackEventReference(this.btnBind, "")%>
                }
            }
        })

        function initCustomerPlugin() {
            setDisplay();

            //除了筛选之外的参数设置，不显示是否高级查询
            if(!parseBool("<%=IsFilterParam %>")) {
                $("[content='filter']").hide();
            }
        }

        $("#<%=ddlParamType.ClientID %>").live("change", function () { setDisplay(); })
 

        $("#<%=ddlXmlCvtType.ClientID %>").live("change", function () {
            if ($(this).val() == "Node") {
                $("#trXPath").show();
                $("#trXslt").hide();
                $("#<%=tbXPath.ClientID %>").attr("req", "1");
                $("#<%=tbXslt.ClientID %>").removeAttr("req");

            } else {
                $("#trXPath").hide();
                $("#trXslt").show();
                $("#<%=tbXPath.ClientID %>").removeAttr("req");
                $("#<%=tbXslt.ClientID %>").attr("req", "1");
            }
        })

        function setDisplay() {
            var flag = $("#<%=ddlParamType.ClientID %>").val();
            var $flags = $("#tableParam").find('[flag]');
            $flags.hide();
            $("#tableParam").find('[flag=' + flag + ']').show();
            clearAttr();
            if (flag == "System") {
                $("#<%=selSysParam.ClientID %>").attr("req", "1");
            }
            else if (flag == "DataBase") {
                $("#<%=selDict.ClientID %>").attr("req", "1");
                $("#<%=ddlParamValue.ClientID %>").attr("req", "1");
                $("#<%=ddlParamText.ClientID %>").attr("req", "1");
            }
            else if (flag == "Enum") {
                $("#<%=tbAssembly.ClientID %>").attr("req", "1");
                $("#<%=tbClassName.ClientID %>").attr("req", "1");
                if(parseBool("<%=Convert %>")){
                  $("#trIndex").hide();
                }else{
                  $("#trIndex").show();
                }
            }
            else if (flag == "Custom") {
                $("#<%=tbOptions.ClientID %>").attr("req", "1");
            }
            else if (flag == "Bool") {
                $("#<%=tbTrue.ClientID %>").attr("req", "1");
                $("#<%=tbFalse.ClientID %>").attr("req", "1");
            }
            else if (flag == "Plugin") {
                $("#<%=lbsPlugin.ClientID %>").attr("req", "1");
            }
            else if (flag == "Computed") {
                $("#<%=tbComputed.ClientID %>").attr("req", "1");
            }
            else if (flag == "Format") {
                $("#<%=tbFormat.ClientID %>").attr("req", "1");
            }
            else if (flag == "Xml") {
                $("#<%=ddlXmlField.ClientID %>").attr("req", "1");
                $("#<%=ddlXmlCvtType.ClientID %>").attr("req", "1");

                if ($("#<%=ddlXmlCvtType.ClientID %>").val() == "Node") {
                    $("#trXPath").show();
                    $("#trXslt").hide();
                    $("#<%=tbXPath.ClientID %>").attr("req", "1");
                    $("#<%=tbXslt.ClientID %>").removeAttr("req");

                } else {
                    $("#trXPath").hide();
                    $("#trXslt").show();
                    $("#<%=tbXPath.ClientID %>").removeAttr("req");
                    $("#<%=tbXslt.ClientID %>").attr("req", "1");
                }
            }
        }

        function clearAttr() {
            $("#<%=selSysParam.ClientID %>").removeAttr("req");
            $("#<%=selDict.ClientID %>").removeAttr("req");
            $("#<%=ddlParamValue.ClientID %>").removeAttr("req");
            $("#<%=ddlParamText.ClientID %>").removeAttr("req");
            $("#<%=tbAssembly.ClientID %>").removeAttr("req");
            $("#<%=tbClassName.ClientID %>").removeAttr("req");
            $("#<%=selSysParam.ClientID %>").removeAttr("req");
            $("#<%=tbOptions.ClientID %>").removeAttr("req");
            $("#<%=tbTrue.ClientID %>").removeAttr("req");
            $("#<%=tbFalse.ClientID %>").removeAttr("req");
            $("#<%=lbsPlugin.ClientID %>").removeAttr("req");
            $("#<%=tbComputed.ClientID %>").removeAttr("req");
            $("#<%=tbFormat.ClientID %>").removeAttr("req");
            $("#<%=ddlXmlField.ClientID %>").removeAttr("req");
            $("#<%=ddlXmlCvtType.ClientID %>").removeAttr("req");
            $("#<%=tbXPath.ClientID %>").removeAttr("req");
            $("#<%=tbXslt.ClientID %>").removeAttr("req");
        }

        function saveData() {
            return checkReqField();
        }


        function closeExpWindow() {
            window.returnValue = $("#<%=hiExpJson.ClientID %>").val();
            window.close();
        }

        function cancelEdit() {
            window.returnValue = null;
            window.close();
        }

        function filterFuc(){
            var paramId=$("#<%=hiSystemParamId.ClientID %>").val();
            if(paramId=="")
            {alert("请选择系统参数名");return false;}

            return "{ParamId:'"+paramId+"'}";
        }

        function filterEnumFuc(){
            var assemblyId=$("#<%=tbAssembly.ClientID %>").val();
            var className=$("#<%=tbClassName.ClientID %>").val();
            if(assemblyId==""||className=="")
            {alert("请填写程序集名或类名");return false;}
            return true;
        }
    
    </script>
</asp:Content>
