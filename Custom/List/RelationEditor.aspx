<%@ Page Title="数据字典关联编辑" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="RelationEditor.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.RelationEditor" %>

<%@ Import Namespace="Zhongsoft.Configuration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                关联类型<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:DropDownList ID="ddlType" runat="server" tablename="BD_Relation" field="RelationObjectType"
                    req="1" Width="85%" activeStatus="(23.*)">
                </asp:DropDownList>
            </td>
        </tr>
        <tr class="relDict">
            <td class="td-l">
                关联实体<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsDict" PageUrl="/Portal/BDM/List/DictSelector.aspx"
                    ResultAttr="name" ResultForControls="{'hiRelationObjectId':'id'}" dictreq="1"
                    activeStatus="(23.*)" />
            </td>
        </tr>
        <tr class="relPage">
            <td class="td-l">
                关联页面<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsPage" PageUrl="~/Sys/Menu/PageSelector.aspx"
                    ResultAttr="name" ResultForControls="{'hiRelationObjectId':'id'}" pagereq="1"
                    activeStatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                排序<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbSort" tablename="BD_Relation" field="Sort"
                    req="1" DataType="PositiveInteger" MaxLength="4" activeStatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                参数
            </td>
            <td class="td-r">
                <table cellpadding='0' cellspacing='0' width="85%">
                    <tr>
                        <td>
                            <zhongsoft:XHtmlInputText runat="server" ID="txtParam" tablename="BD_Relation" field="Param"
                                DataType="PositiveInteger" MaxLength="250" class="kpms-textbox" readonly="readonly"
                                style="height: 16px; width: 100%;" activeStatus="(23.*)">
                            </zhongsoft:XHtmlInputText>
                            <%--       <asp:TextBox ID="tbParam" runat="server" tablename="BD_Relation" field="Param" DataType="PositiveInteger"
                                MaxLength="250" Height="16px" ReadOnly="true" Width="100%" activeStatus="(23.*)"></asp:TextBox>--%>
                        </td>
                        <td valign='middle' style='width: 19px; padding-left: 2px'>
                            <asp:LinkButton runat="server" ID="btnSetParam" OnClientClick="return setParam();"
                                Style="height: 18px; width: 20px; padding: 0px" CssClass="btn-look-up" EnableTheming="false"><img  src="../../Themes/Images/btn_fx.png"  style="padding:0px"/>
                            </asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiRelationId" tablename="BD_Relation" field="RelationId" />
    <input type="hidden" runat="server" id="hiObjectId" tablename="BD_Relation" field="ObjectId" />
    <input type="hidden" runat="server" id="hiRelationObjectId" tablename="BD_Relation"
        field="RelationObjectId" />
    <script>
        var $relationDict = "<%=(int)FeatureObjectType.BusinessEntity %>";
        var $relationPage = "<%=(int)FeatureObjectType.Page %>";
        function initCustomerPlugin() {
            typeChange(true);
            $("#<%=ddlType.ClientID %>").change(function () {
                typeChange(false);
            });
        }
        function typeChange(isLoad) {
            var type = $("#<%=ddlType.ClientID %>").val();

            var hiRelationObjectId = $("#<%=hiRelationObjectId.ClientID %>");
            var trDict = $(".relDict");
            var trPage = $(".relPage");
            var ctrlDict = $("[dictreq]");
            var ctrlPage = $("[pagereq]");

            if (!isLoad) {
                hiRelationObjectId.val("");
                ctrlDict.val("");
                ctrlPage.val("");
            }

            switch (type) {
                case $relationDict:
                    trDict.show();
                    trPage.hide();
                    ctrlDict.attr("req", "1");
                    ctrlPage.removeAttr("req");
                    break;
                case $relationPage:
                    trPage.show();
                    trDict.hide();
                    ctrlPage.attr("req", "1");
                    ctrlDict.removeAttr("req");
                    break;
                default:
                    trPage.hide();
                    trDict.hide();
                    break;
            }
        }

        function setParam() {
            var json;
            var type = $("#<%=ddlType.ClientID %>").val();
            if (type == $relationDict) {
                json = { FieldType: "BDDict" };
            }
            else if (type == $relationPage) {
                json = { FieldType: "BDDataSet" };
                var pageId = $("#<%=hiRelationObjectId.ClientID %>");
                json = $.extend(json, { PageId: pageId });
            }

            var url = buildQueryUrl("sys/CommonExpEditor.aspx", json);
            var re = showModal(url, $("#<%=txtParam.ClientID %>").val(), 800, 400);
            if (checkReturn(re)) {
                $("#<%=txtParam.ClientID %>").val(re);
            }
            return false;
        }
    </script>
</asp:Content>
