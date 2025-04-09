<%@ Page Title="投标报价软件" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="StatisticalAnalysis.aspx.cs" Inherits="Zhongsoft.Portal.GM.List.GM.StatisticalAnalysis" %>


<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <table>
        <tr>
            <td>
                <span class="filter-block-lb" style="float: left; margin-left: 10px; display: inline; line-height: 22px">投标限价：</span>
                <span class="filter-block-lb" style="float: left;">
                    <asp:TextBox ID="tbPriceLimit" CssClass="kpms-textboxsearch" runat="server" Width="70px" onblur="CheckRegex(this.value,this,0.5);" Style="text-align: right;"></asp:TextBox>
                    <input type="hidden" id="hiPriceLimit" runat="server" />
                </span>
                <span class="filter-block-lb" style="float: left; margin-left: 10px; display: inline; line-height: 22px">步差：</span>
                <span class="filter-block-lb" style="float: left;">
                    <asp:TextBox ID="tbPrecession" CssClass="kpms-textboxsearch" runat="server" Width="70px" Text="0.01" onblur="CheckRegex(this.value,this,'');" Style="text-align: right;"></asp:TextBox>
                    <input type="hidden" id="hiPrecession" runat="server" />
                </span>
                <span class="filter-block-lb" style="float: left; margin-left: 10px; display: inline; line-height: 22px">分差值：</span>
                <span class="filter-block-lb" style="float: left;">
                    <asp:TextBox ID="tbDifferenceValue" CssClass="kpms-textboxsearch" runat="server" Width="70px" Style="text-align: right;"></asp:TextBox>
                    <input type="hidden" id="hiDifferenceValue" runat="server" />
                </span>
                <span class="filter-block-lb" style="float: left; margin-left: 10px; display: inline; line-height: 22px">n值：</span>
                <span class="filter-block-lb" style="float: left;">
                    <asp:DropDownList ID="ddlNValue" runat="server">
                        <asp:ListItem Value="0">1、2</asp:ListItem>
                        <asp:ListItem Value="1">0.8、1</asp:ListItem>
                    </asp:DropDownList>
                </span>
            </td>
        </tr>
        <tr>
            <td>
                <div class="subtoolbarbg">
                    <asp:LinkButton ID="btnBatchAdd" runat="server" EnableTheming="false" CssClass="subtoolbarlink" OnClientClick="return batchAdd();" OnClick="btnBatchAdd_Click"><span>批量添加</span></asp:LinkButton>
                </div>
                <div class="subtoolbarbg" id="second" runat="server">
                    <asp:LinkButton runat="server" ID="btnExport" EnableTheming="false" CssClass="subtoolbarlink" OnClick="btnExport_Click"><span>添加竞标成员</span></asp:LinkButton>
                </div>
                <span class="filter-block">
                    <span class="filter-block-lb" style="float: left;">浮点值（%）：</span>
                    <span class="filter-block-lb" style="float: left;">
                        <asp:CheckBoxList ID="cbFloat" runat="server" RepeatColumns="13" Style="cursor: pointer;">
                            <asp:ListItem Value="-1" Selected="True" onclick="changeFloat(1);">小球</asp:ListItem>
                            <asp:ListItem Value="-2" Selected="True" onclick="changeFloat(2);">大球</asp:ListItem>
                            <asp:ListItem Value="0" Selected="True">0</asp:ListItem>
                            <asp:ListItem Value="1" Selected="True">1</asp:ListItem>
                            <asp:ListItem Value="2" Selected="True">2</asp:ListItem>
                            <asp:ListItem Value="3" Selected="True">3</asp:ListItem>
                            <asp:ListItem Value="4" Selected="True">4</asp:ListItem>
                            <asp:ListItem Value="5" Selected="True">5</asp:ListItem>
                            <asp:ListItem Value="6" Selected="True">6</asp:ListItem>
                            <asp:ListItem Value="7" Selected="True">7</asp:ListItem>
                            <asp:ListItem Value="8" Selected="True">8</asp:ListItem>
                            <asp:ListItem Value="9" Selected="True">9</asp:ListItem>
                            <asp:ListItem Value="10" Selected="True">10</asp:ListItem>
                        </asp:CheckBoxList>
                    </span>
                </span>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <div style="display: inline; float: left; width: 40%;">
        <zhongsoft:LightPowerGridView ID="gvList" runat="server" AllowPaging="false" BindGridViewMethod="BindDataGrid" OnRowCommand="gvList_RowCommand" OnRowDataBound="gvList_RowDataBound"
            PageSize="20" DataKeyNames="BD_BiddingAnalysisInfoID" AutoGenerateColumns="false" ShowFooter="false" ShowEmptyDataHeader="true">
            <Columns>
                <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%">
                    <ItemTemplate>
                        <%#Container.DataItemIndex + 1%>
                        <input type="hidden" runat="server" id="hiBiddingAnalysisInfoID" value='<%#Eval("BD_BiddingAnalysisInfoID") %>' />
                        <input type="hidden" runat="server" id="hiBiddingInformationID" value='<%#Eval("BD_BiddingInformationID") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <zhongsoft:LightTemplateField HeaderText="竞标成员名称" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px">
                    <ItemTemplate>
                        <zhongsoft:LightObjectSelector runat="server" name="sel" ID="BidderName" IsMutiple="false" SourceMode="SelectorPage"
                            Writeable="true" ShowJsonRowColName="true" DoCancel="false" ResultAttr="name" EnableTheming="false" ResultForControls="{'hiBiddingInformationID':'id'}"
                            ShowAttrs="name" PageUrl="~/MM/List/MBM/StatisticalAnalysisSelector.aspx" OnClick="BidderName_Click"></zhongsoft:LightObjectSelector>
                        <zhongsoft:XHtmlInputText type="text" flag="inp" runat="server" ID="txtBidderName" Value='<%# (Eval("BidderName")) %>' class="kpms-textbox" Visible="false" />
                    </ItemTemplate>
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightTemplateField HeaderText="标价谷值" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="20px">
                    <ItemTemplate>
                        <zhongsoft:LightObjectSelector runat="server" name="sel" ID="AnalysisLow" IsMutiple="false" SourceMode="SelectorPage" Value='<%#Eval("AnalysisLow") %>'
                            Writeable="true" ShowJsonRowColName="true" DoCancel="false" ResultAttr="name" EnableTheming="false" ResultForControls="{'txtAnalysisLow':'id'}"
                            ShowAttrs="name" PageUrl="~/MM/List/MBM/StatisticalAnalysisSelector.aspx?Analysis=low" ShowSelectBtn="false"></zhongsoft:LightObjectSelector>
                        <zhongsoft:XHtmlInputText type="text" flag="inp" runat="server" ID="txtAnalysisLow" Value='<%# (Eval("AnalysisLow")) %>' class="kpms-textbox" Visible="false" />

                    </ItemTemplate>
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightTemplateField HeaderText="标价峰值" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="20px">
                    <ItemTemplate>
                        <zhongsoft:LightObjectSelector runat="server" name="sel" ID="AnalysisHigh" IsMutiple="false" SourceMode="SelectorPage" Value='<%#Eval("AnalysisHigh") %>'
                            Writeable="true" ShowJsonRowColName="true" DoCancel="false" ResultAttr="name" EnableTheming="false" ResultForControls="{'txtAnalysisHigh':'id'}"
                            ShowAttrs="name" PageUrl="~/MM/List/MBM/StatisticalAnalysisSelector.aspx?Analysis=low" ShowSelectBtn="false"></zhongsoft:LightObjectSelector>
                        <zhongsoft:XHtmlInputText type="text" flag="inp" runat="server" ID="txtAnalysisHigh" Value='<%# (Eval("AnalysisHigh")) %>' class="kpms-textbox" Visible="false" />
                        <%--<zhongsoft:XHtmlInputText type="text" runat="server" Value='<%#Eval("AnalysisHigh") %>' ID="AnalysisHigh" Style="text-align: right;" name="high" req="1"
                            class="kpms-textbox" onblur="CheckAnalysis(this.value,this);" />--%>
                    </ItemTemplate>
                </zhongsoft:LightTemplateField>
                <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                    <ItemTemplate>
                        <asp:LinkButton runat="server" ID="lbtnDelete" EnableTheming="false" CommandName="DeleteData"
                            OnClientClick='return confirm("确定要删除该竞标成员的数据吗？");' CommandArgument='<%#Eval("BD_BiddingInformationID") %>'>
                                <img alt="删除" title="删除" src="../../../Themes/Images/btn_dg_delete.gif"/>
                        </asp:LinkButton>
                    </ItemTemplate>
                </zhongsoft:LightTemplateField>
            </Columns>
        </zhongsoft:LightPowerGridView>
        <%--手动填写并且库中不存在的竞争成员ID--%>
        <asp:HiddenField ID="hiBiddingInformationIDEditor" runat="server" />
        <%--本次模拟全部的竞争成员ID--%>
        <asp:HiddenField ID="hiBiddingInformationIDs" runat="server" />
        <asp:HiddenField ID="hiXML" runat="server" />
        <table style="margin-top: 20px;" cellpadding="5">
            <tr>
                <td colspan="2">
                    <asp:Button runat="server" ID="btnInSure" Text="开始计算" OnClientClick="return CheckGridAnalysis()" OnClick="btnInSure_Click" />
                </td>
            </tr>
            <tr id="trResult" runat="server" style="padding-top: 20px">
                <td style="font-weight: bold; color: red; margin-top: 20px;" colspan="2">计算说明：<br />
                    <span style="color: black; font-weight: normal; font-size: 13px; line-height: 22px">1.根据填写的各个竞标成员的标价谷值、标价峰值、步差生成竞标成员数据集合。<br />
                        2.将各个竞标成员的数据集合根据排列组合方式生成样例集合。<br />
                        3.遍历样例集合，取样例中最小值至最大值区间为本单位模拟报价区间，组合后生成新的样例集合。<br />
                        4.遍历计算样例集合中各单位报价得分，并记录本单位报价得分、分差、排名。<br />
                        5.筛选本单位报价中符合条件的数据。<br />
                        6.汇总数据生成右侧报表。<br />
                    </span>
                    报表说明：<br />
                    <span style="color: black; font-weight: normal; font-size: 13px; line-height: 22px">1.推荐报价：计算后筛选出的符合条件的报价信息。<br />
                        2.报价占比：该报价在推荐报价中出现的次数占比。<br />
                        3.名次：该报价获得的得分排名。<br />
                        4.名次占比：该报价中相应名次占据的比例。<br />
                        5.分差范围：该报价获得当前名词时与最高得分的差值区间。<br />
                        6.浮点：该报价在获得当前名次的浮点值集合。<br />
                    </span>
                </td>
            </tr>
        </table>
    </div>
    <div style="display: inline; float: left; margin-left: 20px; width: 55%;">
        <zhongsoft:LightPowerGridView ID="gvResultList" runat="server" AllowPaging="false" BindGridViewMethod="BindResultGrid"
            AutoGenerateColumns="false" ShowFooter="false" ShowEmptyDataHeader="true" ShowExportExcel="true">
            <Columns>
                <zhongsoft:LightBoundField DataField="RecommendedPrice" HeaderText="推荐报价" ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center">
                </zhongsoft:LightBoundField>
                <asp:TemplateField HeaderText="报价占比" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate><%#Convert.ToString(Eval("BidProbability"))+"%" %></ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="第一占比" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate><%#string.IsNullOrEmpty(Convert.ToString(Eval("BidProbabilityFirst")))?"":Convert.ToString(Eval("BidProbabilityFirst"))+"%" %></ItemTemplate>
                </asp:TemplateField>
                <zhongsoft:LightBoundField DataField="Ranking" HeaderText="名次" ItemStyle-Width="20%">
                </zhongsoft:LightBoundField>
                <asp:TemplateField HeaderText="名次占比" ItemStyle-HorizontalAlign="Left">
                    <ItemTemplate><%#Convert.ToString(Eval("BidProbabilityChild"))+"%" %></ItemTemplate>
                </asp:TemplateField>
                <zhongsoft:LightBoundField DataField="DifferenceValue" HeaderText="分差范围" ItemStyle-Width="20%">
                </zhongsoft:LightBoundField>
                <zhongsoft:LightBoundField DataField="Float" HeaderText="浮点" ItemStyle-Width="20%">
                </zhongsoft:LightBoundField>
            </Columns>
        </zhongsoft:LightPowerGridView>
    </div>
    <div id="zcdiv" style="position: absolute; top: 0; left: 0; z-index: 10000; width: 100%; height: 100%; background-color: #000; filter: alpha(opacity=50); opacity: 0.5; display: none;">
        <div style="position: relative; width: 100%; height: 100%;">
            <div id="loading" style="position: absolute; top: 37%; left: 50%; margin-left: -60px; height: 55px; width: 150px; border: 0px solid red; padding: 0; color: white;">
                <img src="../../../Themes/Images/loading.gif" width="50" />
            </div>
        </div>
    </div>


    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
        function getNowHave() {
            alert($("#<%=hiBiddingInformationIDs.ClientID%>").val());
            return $("#<%=hiBiddingInformationIDs.ClientID%>").val();
        }
        function CheckAnalysis(val, col) {
            var regex = /^[0]\.\d{0,2}$/;
            if (val.length > 0 && !regex.test(val)) {
                alert("标价必须在【0-1】之间，且最多保留两位小数！");
                col.value = "";
                col.focus();
                return false;
            }
            if (val > $("#<%=tbPriceLimit.ClientID%>").val()) {
                alert("填写数据超出投标限价" + $("#<%=tbPriceLimit.ClientID%>").val() + "，请重新输入！");
                col.value = "";
                col.focus();
                return false;
            }
            if (val.length > 0 && val < 0.5) {
                alert("填写数据超出最小下线0.50，请重新输入！");
                col.value = "";
                col.focus();
                return false;
            }
        }
        function CheckRegex(val, col, number) {
            var regex = /^[0]\.\d{0,2}$/;
            if (val.length > 0 && !regex.test(val)) {
                alert("标价必须在【0-1】之间，且最多保留两位小数！");
                col.value = "";
                col.focus();
                return false;
            }
            if (val.length > 0 && val < number) {
                alert("填写数据超出最小下线" + number + "，请重新输入！");
                col.value = "";
                col.focus();
                return false;
            }
        }
        //全选，反选
        function changeFloat(number) {
            if (number == "1") {
                if (document.getElementById("<%=cbFloat.ClientID%>_0").checked) {
                    for (var i = 2; i < document.getElementById("<%=cbFloat.ClientID%>").getElementsByTagName("input").length - 5; i++) {
                        document.getElementById("<%=cbFloat.ClientID%>_" + i).checked = true;
                    }
                } else {
                    for (var i = 2; i < document.getElementById("<%=cbFloat.ClientID%>").getElementsByTagName("input").length - 5; i++) {
                        document.getElementById("<%=cbFloat.ClientID%>_" + i).checked = false;
                    }
                }
            }
            if (number == "2") {
                if (document.getElementById("<%=cbFloat.ClientID%>_1").checked) {
                    for (var i = document.getElementById("<%=cbFloat.ClientID%>").getElementsByTagName("input").length - 5; i < document.getElementById("<%=cbFloat.ClientID%>").getElementsByTagName("input").length; i++) {
                        document.getElementById("<%=cbFloat.ClientID%>_" + i).checked = true;
                    }
                } else {
                    for (var i = document.getElementById("<%=cbFloat.ClientID%>").getElementsByTagName("input").length - 5; i < document.getElementById("<%=cbFloat.ClientID%>").getElementsByTagName("input").length; i++) {
                        document.getElementById("<%=cbFloat.ClientID%>_" + i).checked = false;
                    }
                }
            }
        }
        function CheckGridAnalysis() {
            $("#zcdiv").show();
            if ($("#<%=tbPriceLimit.ClientID%>").val().length == 0) {
                alert("请填写投标限价！");
                $("#zcdiv").hide();
                return false;
            }
            if ($("#<%=tbPrecession.ClientID%>").val().length == 0) {
                alert("请填写步差！");
                $("#zcdiv").hide();
                return false;
            }
            if ($("#<%=tbDifferenceValue.ClientID%>").val().length == 0) {
                alert("请填写分差值！");
                $("#zcdiv").hide();
                return false;
            }
            var chkObject = document.getElementById("<%=cbFloat.ClientID%>");
            var chkInput = chkObject.getElementsByTagName("input");
            var item = "";
            for (var i = 0; i < chkInput.length; i++) {
                if (chkInput[i].checked) {
                    item += chkInput[i].parentNode.valueCode + ",";
                }
            }
            if (item == "") {
                alert("请选择浮点值！");
                $("#zcdiv").hide();
                return false;
            }
            var gdview = document.getElementById("<%=gvList.ClientID %>");
            if (gdview.rows.length == 2) {
                $("#zcdiv").hide();
                return false;
            }
            return true;
        }
        //系统属性配置
        function btnDicParamSet() {
            var path = "<%=WebAppPath%>" + "/MM/List/MBM/StatisticalAnalysisSelector.aspx";
            var url = buildQueryUrl(path, { actionType: 2 });
            showDivDialog(url, null, 850, 600, null);
            return false;
        }

        function batchAdd() {
            var param = new InputParamObject("m");
            var url = "<%=WebAppPath%>" + "/MM/List/MBM/StatisticalAnalysisSelector.aspx";
            var re = buildSelector("BiddingInformationIDs", param, null, url, 730, 600);
            $("#<%=hiXML.ClientID%>").val(re.xmlDoc.xml);
            return true;
        }

    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
