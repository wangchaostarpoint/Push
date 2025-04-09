<%@ Page Title="选择流程步骤" Language="C#" MasterPageFile="~/UI/Master/ObjectCfg.Master"
    AutoEventWireup="true" CodeBehind="ActivitySelector.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Workflow.ActivitySelector" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolTip" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:TreeView ID="treeActivitys" runat="server">
    </asp:TreeView>
    <script>
        var $selectMode = "s";
        var $selectValues = [];
        function initCustomerPlugin() {
            setDisabled();
            var args = window.dialogArguments;
            $selectMode = args.selectMode;
            if (args) {
                $("#<%=treeActivitys.ClientID %> :checkbox").each(function () {
                    var span = $(this).next("span");
                    var thisId = span.attr("value");
                    var thisName = span.text();
                    var act = { id: thisId, name: thisName };
                    var checkBox = $(this)[0];
                    $.each(args.selectedActs, function () {
                        if ($(this)[0].id == thisId) {
                            checkBox.checked = true;
                        }
                    })

                    $selectValues = args.selectedActs;
                })
            }
            $("#<%=treeActivitys.ClientID %> :checkbox").click(function () {

                if ($(this)[0].checked == true) {
                    var thisId = $(this)[0].id;
                    if ($selectMode == "s") {
                        $("#<%=treeActivitys.ClientID %> :checkbox").each(function (i, chk) {
                            if (chk.id != thisId && chk.checked) {
                                chk.checked = false;
                            }
                        })
                    }
                    var span = $(this).next("span");
                    var actId = span.attr("value");
                    var actName = span.text();
                    var act = { id: actId, name: actName };
                    if ($selectMode == "s") {
                        $selectValues = [act];
                    }
                    else {
                        var index = $.inArray(act, $selectValues);
                        if (index == -1) {
                            $selectValues.push(act);
                        }
                    }
                }
                else {
                    if ($selectMode == "s") {
                        $selectValues = [];
                    }
                    else {
                        var index = -1;
                        $.each($selectValues, function (i, obj) {
                            if (obj.id == actId) {
                                index = i;
                                return false;
                            }
                        })

                        if (index == -1) {
                            $selectValues.splice(index, 1);
                        }
                    }
                }
            });

        }

        function spanClick(span) {
            span.parentElement.children[0].click();
        }

        function okClick() {
            window.returnValue = JSON.stringify($selectValues);
            window.close();
            return false;
        }

        function cancelClick() {
            window.returnValue = null;
            window.close();
            return false;
        }

        function setDisabled() {
            $("#<%=treeActivitys.ClientID %> span[disabled]").prev(":checkbox").attr("disabled", "disabled");
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bottomBar" runat="server">
    <asp:LinkButton runat="server" ID="btnOK" CssClass="kpms-btn" OnClientClick="okClick();"><span>确定</span></asp:LinkButton>
    <asp:LinkButton runat="server" ID="btnCancel" CssClass="kpms-btn" OnClientClick="cancelClick();"><span>取消</span></asp:LinkButton>
</asp:Content>
