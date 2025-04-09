<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjContainer.ascx.cs"
    Inherits="Zhongsoft.Portal.Metro.Controls.ProjContainer" %>
<%@ Register Namespace="Zhongsoft.Portal.Metro.Controls" TagPrefix="zs" Assembly="Zhongsoft.Portal" %>
<style>
    *
    {
        margin: 0;
        padding: 0;
        list-style: none;
    }
    body
    {
        /* background:#fff;*/
        font: normal 12px/22px 宋体;
        color: #fffffa;
    }
    img
    {
        border: 0;
    }
    
    .b1
    {
        background: #0e7ac3/*da542f*/;
        border-collapse: collapse;
        border-spacing: 0px;
    }
    
    .b2
    {
        background: #3eaaef/*008da1*/;
        border-collapse: collapse;
        border-spacing: 0px;
    }
    .b3
    {
        background: #f9a944/*5a38b48*/;
        border-collapse: collapse;
        border-spacing: 0px;
    }
    .b4
    {
        background: #f47099/*8b1d8c*/;
        border-collapse: collapse;
        border-spacing: 0px;
    }
    .b5
    {
        background: #03bfe4/*b11b41*/;
        border-collapse: collapse;
        border-spacing: 0px;
    }
    .b6
    {
        background: #5cd899/*d44b27*/;
        border-collapse: collapse;
        border-spacing: 0px;
    }
    
    td
    {
        white-space: nowrap;
        word-break: keep-all;
        height: 22px;
        line-height: 22px;
        background: none;
        font-size: 12px;
    }
    .word
    {
        font-weight: normal;
        color: #fff;
    }
    
    .tdtitle
    {
        overflow: hidden;
        zoom: 1;
        font-weight: bold;
        color: #fff;
        padding-left: 9px;
    }
    .td1title
    {
        overflow: hidden;
        zoom: 1;
        font-weight: bold;
        color: #fff/*ffffcc*/;
        padding-left: 9px;
        padding-top: 5px;
    }
    .word1
    {
        font-weight: normal;
        color: #fff;
        padding-top: 5px;
    }
    .word1 div
    {
        text-overflow: ellipsis;
        white-space: nowrap;
        overflow: hidden;
        width: 100px;
    }
    .word2
    {
        font-weight: normal;
        color: #fff;
        border-top: 1px dotted rgba( 255,255,238, 0.4);
        padding-top: 3px;
    }
    
    .tdtitle2
    {
        width: 35px;
        overflow: hidden;
        zoom: 1;
        font-weight: bold;
        color: #fff;
        padding-left: 9px;
        border-top: 1px dotted rgba( 255,255,238, 0.4);
        padding-top: 3px;
    }
    .tdpic
    {
        padding: 2px 0px 4px 6px;
    }
    .td1pic
    {
        padding: 5px 0px 4px 6px;
    }
    .kpms-process1
    {
        width: 100px;
        height: 13px;
        float: left;
        background: url(../../themes/custom/images/jdbj.png) top;
        white-space: nowrap;
        color: #fffffd;
    }
    .kpms-processcolor1
    {
        background: #fcbd4f;
        height: 9px;
        margin-top: 3px;
        float: left;
        color: #fff;
    }
    
    
    .kpms-process2
    {
        width: 100px;
        height: 13px;
        float: left;
        background: url(../../themes/custom/images/jdbj.png) top;
        white-space: nowrap;
        color: #fffffd;
    }
    .kpms-processcolor2
    {
        background: #5ec148;
        height: 9px;
        margin-top: 3px;
        float: left;
        color: #fff;
    }
</style>
<table runat="server" id="thisTable" width="100%" border="0" cellspacing="0" cellpadding="0" class="b1">
  <tr>
    <td colspan="2" rowspan="4" class="td1pic"><img src="../../themes/custom/images/2.jpg" width="100" height="80" /></td>
    <td class="td1title">项目名称：</td>
    <td class="word1" title="国电怀安热电有限公司加装凝汽器项目"><div>国电怀安热电有限公司加装凝汽器项目</div></td>
  </tr>
  <tr>
    <td class="tdtitle">项目编号：</td>
    <td class="word">F01351E39K</td>
  </tr>
  <tr>
    <td class="tdtitle">项目经理：</td>
    <td class="word">余斯北</td>
  </tr>
  <tr>
    <td class="tdtitle">项目规模：</td>
    <td class="word">&nbsp;</td>
  </tr>
  <tr>
    <td class="tdtitle2" >业主单位</td>
    <td colspan="3" class="word2">国电怀安热电有限公司</td>
  </tr>
  <tr >
    <td class="tdtitle" >立项日期：</td>
    <td colspan="3" class="word" >2014-08-25</td>
  </tr>
  <tr>
    <td class="tdtitle">项目状态：</td>
    <td class="word">已启动</td>
    <td class="tdtitle" >项目进度：</td>
    <td >&nbsp;<div class="kpms-process2">
                            <div class="kpms-processcolor2" style="width:78px"></div>
                          &nbsp;78%</div></td>
  </tr>
  <tr>
    <td class="tdtitle">合同状态：</td>
    <td class="word">&nbsp;</td>
    <td class="tdtitle">收费进度：</td>
    <td>&nbsp;<div class="kpms-process1">
                            <div class="kpms-processcolor1" style="width:50px"></div>
                          &nbsp;50%</div></td>
  </tr>
</table>
<asp:Image runat="server" ID="imgIcon" Visible="false"/>
<input type="hidden" runat="server" id="hiGroupId" />