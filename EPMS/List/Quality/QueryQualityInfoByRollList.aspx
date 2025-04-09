<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QueryQualityInfoByRollList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Quality.QueryQualityInfoByRollList" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">分院</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlDept">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">专业</span> <span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlSpecialty">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">项目名称/编号</span>
        <span>
            <zhongsoft:LightTextBox ID="tbProjectInfo" search="1" runat="server" MaxLength="64"
                CssClass="kpms-textboxsearch" EnableTheming="false"></zhongsoft:LightTextBox>
        </span></span>
    <span class="filter-block"><span class="filter-block-lb">工程类型</span><span>
        <zhongsoft:LightDropDownList ID="ddlProjectType" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block"><span class="filter-block-lb">设计阶段</span><span>
        <zhongsoft:LightDropDownList ID="ddlPhase" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
    <asp:LinkButton runat="server" ID="lbtnReBindPhase" OnClick="ddlProjectType_SelectedIndexChanged"
        Style="display: none"></asp:LinkButton>
    <asp:LinkButton runat="server" ID="lbtnReBindSpe" OnClick="ddlDept_SelectedIndexChanged"
        Style="display: none"></asp:LinkButton>
    <span class="filter-block"><span class="filter-block-lb">校审完成时间</span>
        <span>
            <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtSProjectFormDate"
                runat="server" readonly="readonly" compare="1" />
            <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtFProjectFormDate"
                runat="server" readonly="readonly" compare="1" />
        </span></span>

    <!--隐藏高级查询-->
    <span class="filter-block" flag="conditionHide"><span>
        <zhongsoft:LightDropDownList ID="ddlRQualityLevel" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block" flag="conditionHide"><span>
        <zhongsoft:LightDropDownList ID="ddlYQualityLevel" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
    <span class="filter-block" flag="conditionHide"><span class="filter-block-lb">实际室交出</span>
        <span>
            <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtSFactRecheckTime1"
                runat="server" readonly="readonly" compare="1" />
            <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtFFactRecheckTime1"
                runat="server" readonly="readonly" compare="1" />
        </span></span>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
    <asp:Label runat="server" ID="lbTitle" Style="font-weight: bold"></asp:Label>&nbsp;
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvRollQuality" AutoGenerateColumns="false"
        ShowExport="true" HideFieldOnExport="全部" runat="server" BindGridViewMethod="BindDataGrid"
        UseDefaultDataSource="true" ShowPageSizeChange="true" OnRowDataBound="gvRollQuality_RowDataBound"
        PageSize="10" FooterStyle-ForeColor="Red" ShowFooter="true" OnRowCreated="gvRollQuality_RowCreated">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" ShowToolTip="true"
                Width="250">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="任务编号" DataField="WBSCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSName" HeaderText="任务名称" DataParamFields="WBSID"
                DialogMode="Dialog" EditItemClick="viewWBSDetail" ShowToolTip="true" Width="200">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="标准张<br/>合计" DataField="NewStandardMapSum"
                HtmlEncode="false" ItemStyle-HorizontalAlign="Right">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="重要技术" DataField="ImportantTechnicalMistakeSum" ItemStyle-HorizontalAlign="Right">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="一般性" DataField="CommonMistakeSum" ItemStyle-HorizontalAlign="Right"
                Width="70">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="一般性<br>差错率<br>个/标张" DataField="CommonMistakeSumRate"
                ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="室评" DataField="RQualityLevel" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="院评" DataField="YQualityLevel" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="利用质量<br/>信息条数" HtmlEncode="false" DataField="UseQualityInfoNum"
                ItemStyle-HorizontalAlign="Right" Visible="false">
                <FooterStyle HorizontalAlign="Right" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="活用图率" DataField="ReuseRate" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField HeaderText="相关<br/>流程" EditItemClick="viewVerifyForm"
                ImageUrl="../../../Themes/Images/btn_dg_detail.gif" DataParamFields="WBSID" ItemStyle-Width="40px"
                ItemStyle-HorizontalAlign="Center" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        function initCustomerPlugin() {
            setConditionHide();
            $("#<%=ddlProjectType.ClientID %>").live("change", function () { afterProjectTypeChange(); });
            $("#<%=ddlDept.ClientID %>").live("change", function () { afterDeptChange(); });
        }
        function afterProjectTypeChange() {
            <%=this.Page.ClientScript.GetPostBackEventReference(this.lbtnReBindPhase, "")%>;
        }
        function afterDeptChange() {
            <%=this.Page.ClientScript.GetPostBackEventReference(this.lbtnReBindSpe, "")%>;
        }
        function viewWBSDetail(wbsID) {
            var json = { actionType: 1, bizId: wbsID };
            var url = buildQueryUrl('/EPMS/List/WBS/WBSEditor.aspx', json);
            showDivDialog(url, "", 1050, 600, null);
            return false;
        }

        function viewForm(bizId, extendedAttribute) {
            var url = '/Custom/List/C_FormDetailLoading.aspx';
            var json = { bizId: bizId, IsOld: 2, ExtendedAttribute: extendedAttribute };
            url = buildQueryUrl(url, json);
            window.open(url);
            return false;
        }

        function viewVerifyForm(bizId) {
            var bizID = "";
            var extendedAttribute = "";
            $.ajax({
                type: "POST",
                async: false,
                url: "<%=this.WebAppPath %>/EPMS/List/Quality/QueryQualityInfoByRollList.aspx",
                data: { asyfunc: "GetRollVerifyInfo", wbsID: bizId },
                success: function (res) {
                    if (res == "") { }
                    else {
                        var $l = eval('(' + res + ')');
                        bizID = $l[0][0];
                        extendedAttribute = $l[0][1];
                    }
                },
                error: function (err) {
                    alert(err);
                }
            });
            if (bizID != "") {
                viewForm(bizID, extendedAttribute);
            }
            else {
                alert("没有相关的校审流程");
            }
            return false;
        }
        // 隐藏筛选条件
        function setConditionHide() {
            $('[flag="conditionHide"]').hide();
        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
