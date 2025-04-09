<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormSend.ascx.cs" Inherits="Zhongsoft.Portal.Sys.Workflow.Controls.FormSend" %>
<link rel='stylesheet' type='text/css' href='<%=WebAppPath%>/Themes/Styles/zTreeStyle.css' />
<link rel="stylesheet" type="text/css" href="<%=WebAppPath%>/Themes/Styles/form.css" />
<link rel="stylesheet" type="text/css" href="<%=WebAppPath%>/Themes/Styles/formsender.css" />
<script type="text/javascript" src="<%=WebAppPath%>/UI/script/portal.cookie.js"></script>
<script type="text/javascript" src="<%=WebAppPath%>/UI/script/form.fullscr.js"></script>
<script type="text/javascript" src="<%=WebAppPath%>/UI/script/xpdl.json.js"></script>
<script type="text/javascript" src="<%=WebAppPath%>/UI/script/form.detail.js"></script>
<script type="text/javascript" src="<%=WebAppPath%>/UI/script/jquery.bgiframe.js"></script>
<div runat="server" id="xpdlWrapper" enableviewstate="false" visible="false">
    <div class="xpdl-sendwindow" id="xpdlSender">
        <div class="xpdl-sendtitle">
            工作处理</div>
        <table class="xpdl-sendcontent">
            <tr>
                <td>
                    选择后续工作步骤
                </td>
                <td style="height: 30px">
                    <a class="subtoolbarlink" href="#" id="btnSelAllParts" style="display: none" onclick="selAllParts()">
                        <img src="<%=WebAppPath%>/Themes/Images/selectall.gif" /><span>全选</span></a>
                    <a class="subtoolbarlink" id="btnMoreParts" style="display: none" href="#">
                        <img src="<%=WebAppPath%>/Themes/Images/selectmore.gif" /><span>更多人员</span></a>
                    <%--   <a class="xpdl-selectparta"
                                        id="btnMoreParts" onclick="getMoreParts();" style="display: none" href="#">
                                        <img src="../../Themes/Images/selectmore.gif" />更多人员</a> --%>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="actWidget" class="ui-widget-content xpdl-widget-acts">
                    </div>
                </td>
                <td>
                    <div id="partWidget" class="ui-widget-content xpdl-widget-parts">
                    </div>
                </td>
            </tr>
            <tr>
                <td class="xpdl-actseltitle" colspan="2">
                    选定步骤&nbsp;&nbsp;&nbsp;&nbsp;<%--<a href="javascript:void(0)" onclick="javascript:ShowVisualForm();">[可视化流程]</a>--%>
                    <span id="spNoPart" style="color: Red; display: none">该步骤的处理角色没有配置人员，请确认处理人员，并联系管理员配置！</span>&nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div id="selectedWidget" class="ui-widget-content xpdl-widget-sels">
                    </div>
                </td>
            </tr>
            <tr onclick="javascript:$('#formSelectp').hide();">
                <td colspan="2" class="xpdl-sendbtntd" style="padding-right: 2px!important">
                    <asp:Button ID="btnSend" runat="server" Width="100px" OnClientClick="return checkXpdlSel()"
                        Text="确定" OnClick="btnSend_Click" />
                    <asp:Button ID="btnCancel" runat="server" Width="100px" Text="取消" OnClick="btnCancel_Click" />
                    <br />
                </td>
            </tr>
        </table>
    </div>
    <div class="form-alphaBox" id="backActivity" style="z-index: 0">
    </div>
</div>
<div class="form-selectpeople" runat="server" id="formSelectp" style="display: none">
    <div class="selectp-header">
        <span style="float: left;">选择人员</span><span id='closePartMore' class="closethis ui-icon ui-icon-close"></span></div>
    <table class="selectp-content">
        <tr>
            <td id="part" style="width: 196px;">
                <ul id="selectp-part" class="ztree selectp-part">
                </ul>
            </td>
            <td id="close-part" class="close-part">
                <span>
                    <img src="<%=WebAppPath%>/Themes/Images/close-part.gif" /></span>
            </td>
            <td class="selectp-list">
                <input class="selectp-key" id="txtPartFilter" type="text" value="请输入关键字" />
                <div class="person-list" style="height: 223px" id="morePartsList">
                </div>
                <div class="person-list-page">
                    <%-- <img src="../../Themes/Images/btn_prei.gif" /><img src="../../Themes/Images/btn_next.gif" />--%></div>
            </td>
        </tr>
    </table>
</div>
<div id="form-loading" style="display: none">
    <span><strong>数据处理中</strong></span>
    <br />
    <span style="text-align: center;">
        <img src="/portal/themes/Images/loading.gif" alt="数据处理中" /></span>
    <br />
    <span>技术支持：北京众城比泰科技有限责任公司</span>
    <br />
</div>
<input type="hidden" id="hiXpdlXml" name="hiXpdlXml" />
