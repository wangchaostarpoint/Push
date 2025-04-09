<%@ Page Language="C#" AutoEventWireup="true" Title="设总任命" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="ProjMgrAppointList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.OBS.ProjMgrAppointList" %>

<%@ Import Namespace="Zhongsoft.Portal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block">
        <span>
            <a style="color: blue" onclick="startStateWF()">
                <h4>发起《项目设总任命》</h4>
            </a></span> 
    </span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <%--GridVIew列表控件--%>
    <zhongsoft:LightPowerGridView runat="server" ID="gvProjMgrAppList" AllowPaging="True" PageSize="100"
        AutoGenerateColumns="false" ShowExport="true" AllowSorting="true" DataKeyNames="ProjectResourceID"
        UseDefaultDataSource="false" BindGridViewMethod="BindProjMgrAppList">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="项目设总" HeaderStyle-Width="90px">
                <ItemTemplate>
                    <%#Convert.ToString(Eval("UserName")).Replace("【破格】","") %>
                    <a class="aStyle" href="javascript:void(0)" onclick='<%# String.Format("return ViewFormInfo(\"{0}\")",Eval("ProjectUserExceptionID")) %>' target="_blank">
                        <%#Convert.ToString(Eval("IsException"))=="True"?"【破格】":"" %>
                    </a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="AppointDate" SortExpression="AppointDate" DataFormatString="{0:yyyy-MM-dd}" HeaderText="任命时间">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="设总任命书">
                <ItemTemplate>
                    <a class="aStyle" href="<%=this.WebAppPath %>/EPMS/List/OBS/ProjMgrAppointPrint.aspx?ProjectID=<%#Eval("OrganizationID") %>&ProjectResouceID=<%#Eval("ProjectResourceID") %>" target="_blank">
                        下载设总任命书
                    </a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="查看流程" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="60px">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnViewRele" EnableTheming="false"
                        OnClientClick='<%# String.Format("return ViewFormInfo(\"{0}\")",Eval("ProjectResourceID")) %>'>
                        <img src="../../../Themes/Images/btn_chakan.gif" />
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>

    <%--JS区域--%>
    <script type="text/javascript">
        //页面加载执行
        function initCustomerPlugin() {
        }
        //查看
        function ViewFormInfo(businessID) {
            var urlStr = buildQueryUrl("/Custom/List/C_FormDetailLoading.aspx", { bizid: businessID });
            window.open(urlStr);
            return false;
        }

        //发起《设计变更通知单》  
        function startStateWF() {
            var url = buildQueryUrl("/Sys/Workflow/FormDetail.aspx", {
                actionType: 2, packageName: 'EPMSProjManagerAppoint.xpdl', xpdlId: 'ProjManagerAppoint_wp1', formId: '<%=FormHelper.GetFormIdByPackage("EPMSProjManagerAppoint.xpdl")%>', ver: '|', OrganizationID: '<%=OrganizationID%>'
            });
            window.open(url);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
