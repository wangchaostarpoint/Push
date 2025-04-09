<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FileReceiveWBSList.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.WBS.FileReceiveWBSList" %>
<%@ Import Namespace="DAL.EPMS" %>
<span style="float: right;" id="spAddWbs" runat="server">
    <asp:LinkButton runat="server" ID="ibtnAddWbs" CssClass="subtoolbarlink" EnableTheming="false"
        OnClientClick="return false">
        <span>
            <img runat="server" id="imgAdd" src="~/Themes/Images/btn_add.gif" alt="添加接受任务" width="16"
                height="16" />添加接受任务</span></asp:LinkButton></span>
<zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="false"
    PageSize="50" AutoGenerateColumns="false" ShowExport="false" AllowSorting="true"
    DataKeyNames="WBSID" UseDefaultDataSource="true" OnRowDataBound="gvList_RowDataBound"
    OnRowCommand="gvList_RowCommand" BindGridViewMethod="UserControl.BindWBSList">
    <Columns>
        <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <%# Container.DataItemIndex+1 %>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightBoundField DataField="WBSType" HeaderText="任务类别" Visible="false">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="编号">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightBoundField DataField="WBSName" HeaderText="名称" DataParamFields="WBSID"
            DialogMode="Dialog" EditItemClick="viewItem">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightBoundField DataField="WBSOwnerName" HeaderText="负责人">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightBoundField DataField="WBSWay" HeaderText="任务作业<br/>（系统）方式" HtmlEncode="false"
            Visible="false">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightBoundField DataField="BelongModule" HeaderText="所属模块<br/>（系统、区域）"
            HtmlEncode="false" Visible="false">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightBoundField DataField="BelongDeptName" HeaderText="部门">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightBoundField DataField="ExecSpecialtyName" HeaderText="专业">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightBoundField DataField="PlanCompleteTime" HeaderText="计划完成日期" DataFormatString="{0:yyyy-MM-dd}">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightTemplateField HeaderText="状态">
            <ItemTemplate>
                <asp:Label runat="server" ID="lbState"></asp:Label>
                <input type="hidden" runat="server" id="hiSpeId" value='<%#Eval("ExecSpecialtyID") %>'
                    content="speId" />
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightBoundField DataField="Memo" HeaderText="来源" Visible="false">
        </zhongsoft:LightBoundField>
        <asp:TemplateField HeaderText="查看" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center"
            Visible="false">
            <ItemTemplate>
                <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false" OnClientClick="return false">
                                    <img alt="img" src="<% =WebAppPath%>/Themes/Images/btn_dg_view.gif" 
                                    onclick="wbsItem1('1','<%# Eval("WBSID") %>');"/>
                </asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="编辑" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center"
            Visible="false">
            <ItemTemplate>
                <asp:LinkButton ID="lbtnEdit" runat="server" EnableTheming="false" OnClientClick="return false">
                                    <img  alt="img" src="<% =WebAppPath%>/Themes/Images/btn_dg_edit.gif" 
                                    onclick="wbsItem1('3','<%# Eval("WBSID") %>');"/>
                </asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del"
                    CommandArgument='<%# Eval("WBSID") %>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="<%=WebAppPath %>/Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                </asp:LinkButton>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
    </Columns>
</zhongsoft:LightPowerGridView>
<asp:Button runat="server" ID="btnAddWbs" OnClick="btnAddWbs_Click" Style="display: none" />
<input type="hidden" runat="server" id="hiWBSXML" />
<input type="hidden" runat="server" id="hiIsAddRoll" />
<input type="hidden" runat="server" id="hiMainWBSID" />
<input type="hidden" runat="server" id="hiRecSpeIDs" />
<script type="text/javascript">
    
    function initFileWbs<%=this.ClientID %>() {
        //隐藏添加任务操作
        if(!parseBool('<%=Enable %>')) {
           $('#<%=spAddWbs.ClientID %>').hide();
        }

        //将以下逻辑放到init方法调用下，否则回发后不会执行，导致有问题 tianhl 20161228
        //针对外部资料，由添加接受卷册，改为添加关联卷册
         if('<%=FlowType %>'=='1'){
            $('#<%=spAddWbs.ClientID %>').html($('#<%=spAddWbs.ClientID %>').html().replace(/接受/g,'关联'));
         }
         else if('<%=WbsType %>'=='任务'){
            $('#<%=spAddWbs.ClientID %>').html($('#<%=spAddWbs.ClientID %>').html().replace(/接受/g,''));
         }
         else if('<%=WbsType %>'=='厂家资料'){
             var html=$('#<%=spAddWbs.ClientID %>').html();
             html=html.replace('接受卷册','外部资料').replace('接受卷册','厂家资料')
             $('#<%=spAddWbs.ClientID %>').html(html);
         }
         else if('<%=WbsType %>'=='接口资料'){
             var html=$('#<%=spAddWbs.ClientID %>').html();
             html=html.replace('接受卷册','互提资料').replace('接受卷册','接口资料')
             $('#<%=spAddWbs.ClientID %>').html(html);
         }
      
        $('#<%=ibtnAddWbs.ClientID %>').bind('click', function () {
            seldWbs<%=this.ClientID %>();
        });
    }

    //批量添加接受卷/册
    function seldWbs<%=this.ClientID %>() {
        var param = new InputParamObject("m");
        var mainWBSID = $('#<%=hiMainWBSID.ClientID %>').val();
        if('<%=WbsType %>'=='任务'){
            var speInfo = $('#<%=hiRecSpeIDs.ClientID %>').val();
            
            if(speInfo == null || speInfo == ""){
                alert("请先选择接受专业！");
            }
            else{
                var filter = { OrganizationID: '<% =OrganizationID%>', Typeid: '<%=WBSType.册.GetHashCode() %>',NotEqualWBSID:mainWBSID ,ExeSpecialtyID:speInfo,Mutufile:true};
                getWBS('<%=hiWBSXML.ClientID %>', param, filter, addWbs<%=this.ClientID %>);
            }
        }
        else  if('<%=WbsType %>'=='厂家资料'){
            var filter = { OrganizationID: '<% =OrganizationID%>', Typeid: '<%=WBSType.外部接口资料接收.GetHashCode() %>',NotEqualWBSID:mainWBSID };
            getFile('<%=hiWBSXML.ClientID %>', param, filter, addWbs<%=this.ClientID %>);
        }
        else if('<%=WbsType %>'=='接口资料'){
            var filter = { OrganizationID: '<% =OrganizationID%>', Typeid: '<%=WBSType.内部专业间提资.GetHashCode() %>',NotEqualWBSID:mainWBSID };
            getFile('<%=hiWBSXML.ClientID %>', param, filter, addWbs<%=this.ClientID %>);
        }
        else{
            var speInfo;
            if ($actName == "编写资料交接表" || $actName == "校核修改"|| $actName == "审批修改"|| $actName == "批准修改"|| $actName == "主设人确认"|| $actName == "返回修改或结束") {
                speInfo=$('#<%=hiRecSpeIDs.ClientID %>').val();
            }
            //外部资料流程 不需传专业
            else if ($actName == "收集相关资料") {
                speInfo=null;
            }
            else{
                speInfo='<% =ReceSpeWbsIDs%>';
            }
            if ($actName == "收集相关资料") {
                //外部资料去掉NotEqualWBSID:mainWBSID，外部资料关联卷册可以选择到自己的卷册 tianhl 20161228
                var filter={ OrganizationID: '<% =OrganizationID%>', Typeid: '<%=WBSType.册.GetHashCode() %>'};
                getWBS('<%=hiWBSXML.ClientID %>', param, filter, addWbs<%=this.ClientID %>);
            }
            else {
                if(speInfo==null||speInfo==""){
                    alert("请先选择接受专业！");
                }
                else{
                    var filter={ OrganizationID: '<% =OrganizationID%>', Typeid: '<%=WBSType.册.GetHashCode() %>' ,ExeSpecialtyID:speInfo,NotEqualWBSID:mainWBSID,Mutufile:true};
                    getWBS('<%=hiWBSXML.ClientID %>', param, filter, addWbs<%=this.ClientID %>);
                }
            }
        }
    }

    //执行后台添加专业数据
    function addWbs<%=this.ClientID %>() {
        <%=Page.ClientScript.GetPostBackEventReference(this.btnAddWbs,"")%>;
    }

     //wbs任务详细（同一个页面脚步方法名重了有问题 tianhl 20161211）
    function wbsItem1(actionType, bizId) {
        var json = { actionType: actionType, bizId: bizId };
        var url = buildQueryUrl('/EPMS/List/WBS/WBSEditor.aspx', json);
        var callBack = null;
        if (actionType == '3') {
            callBack = addWbs<%=this.ClientID %>;
        }
        showDivDialog(url, "", 1050, 600, callBack);
        return false;
    }

    function viewItem(wbsId){
        return wbsItem1(1,wbsId);
    }

    function IsAddRoll(){
         if ($actName == "签收") {
         var isAdd=$('#<%=hiIsAddRoll.ClientID %>').val();
                if (isAdd == 'false' || isAdd == '') {
//                    return confirm("确定不选择接收卷册？")
                      alert("请选择本人负责专业的接收卷册！");
                      return false;
                }
           }

           return true;
    }

</script>
