<%@ Page Title="个人查询" Language="C#" AutoEventWireup="true" CodeBehind="PersonalSearch.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.PersonalSearch" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<style type="text/css">
    .container
    {
        max-width: 98%;
        margin: 0 auto;
        margin-top: 10px;
    }
    .row
    {
        margin: 0 auto;
    }
    a
    {
        font-weight: bold;
    }
    
    a:hover
    {
    }
    
    a:hover, a:active, a:focus
    {
        outline: 0;
    }
    
    :focus
    {
        outline: none;
    }
    
    ::-moz-focus-inner
    {
        border: 0;
    }
    .team
    {
        margin-top: 25px;
        text-align: center;
    }
    .col-td-3
    {
        position: relative;
        min-height: 1px;
        padding-right: 15px;
        padding-left: 15px;
        width: 20%;
        float: left;
    }
    .teamlist
    {
        display: inline-block;
        display: block;
        height: auto;
        max-width: 100%;
        padding: 4px;
        line-height: 1;
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 4px;
        -webkit-transition: all .2s ease-in-out;
        transition: all .2s ease-in-out;
    }
    .teamlist > img
    {
        display: block;
        height: auto;
        max-width: 100%;
    }
    a.teamlist:hover, a.teamlist:focus
    {
        border-color: #428bca;
    }
    .teamlist > img
    {
        margin-right: auto;
        margin-left: auto;
    }
    
    .team .teamlist
    {
        max-width: 200px;
        margin: 0 auto;
        margin-bottom: 25px;
        padding: 10px 5px 5px 5px;
        border: 3px solid #f3f5f9;
        box-shadow: 0 0 3px #888;
    }
    
    .team .teamlist img
    {
        display: block;
        margin: 0 auto;
        width: 100%;
        width: 80px; /*border: 3px solid #fff;
	box-shadow: 0 0 2px #666;*/
    }
    .img-circle
    {
        border-radius: 50%;
    }
    
    .team .col-td-3 h4
    {
        padding: 0px 0 7px 0;
        font-size: 16px;
        display: inline-block;
        border-bottom: 1px dashed #ccc;
    }
    
    .team .col-td-3 h4 a
    {
        color: #666;
        text-decoration: none;
    }
    
    .team .col-td-3 h4 a:hover
    {
        text-decoration: none;
        color: #004ea1;
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
    
    <div class="container">        
        <div class="team">          
            <div class="row">
                <div class="col-td-3">
                    <div class="teamlist">
                        <img src="../../../themes/images/list-load.png" alt="" class="img-circle" />
                        <h4>
                            <a href="/Portal/Custom/List/Dashboard.aspx?secid=AD2E2530-2701-457C-9DBF-8EEFA6D2189A&IsShowHeader=1" target="_blank">我的工作负荷</a></h4>
                    </div>
                </div>
                <div class="col-td-3">
                    <div class="teamlist">
                        <img src="../../../themes/images/list-database.png" alt="" class="img-circle" />
                        <h4>
                            <a href="../../List/sys/DesignLibrary.aspx?secid=1A0D01F3-8874-44BB-81A0-B8999CFD0E16&IsShowHeader=1" target="_blank">我的设计资料库</a></h4>
                    </div>
                </div>
                <div class="col-td-3">
                    <div class="teamlist">
                        <img src="../../../themes/images/list-rush.png" alt="" class="img-circle" />
                        <h4>
                            <a href="../../../sys/workflow/RecycleBin.aspx" target="_blank">我的垃圾箱</a></h4>
                    </div>
                </div>
                <div class="col-td-3"  style="display:none">
                    <div class="teamlist">
                        <img src="../../../themes/images/list-user.png" alt="" class="img-circle" />
                        <h4>
                            <a href="../../../sys/roleuser/UserGroupMgr.aspx" target="_blank">自定义人员分组</a></h4>
                    </div>
                </div>
                <div class="col-td-3"  style="display:none">
                    <div class="teamlist">
                        <img src="../../../themes/images/list-salary.png" alt="" class="img-circle" />
                        <h4>
                            <a href="javascript:void(0)">我的薪资</a></h4>
                    </div>
                </div>
                <div class="col-td-3"  style="display:none">
                    <div class="teamlist">
                        <img src="../../../themes/images/list-salary.png" alt="" class="img-circle" />
                        <h4>
                            <a href="javascript:void(0)">我的薪资</a></h4>
                    </div>
                </div>                
                                
            </div>            
        </div>
        <div class="team" style="display:none">          
            <div class="row">
                <div class="col-td-3">
                    <div class="teamlist">
                        <img src="../../../themes/images/list-rush.png" alt="" class="img-circle" />
                        <h4>
                            <a href="../../../sys/workflow/RecycleBin.aspx" target="_blank">我的垃圾箱</a></h4>
                    </div>
                </div>
                <div class="col-td-3">
                    <div class="teamlist">
                        <img src="../../../themes/images/list-user.png" alt="" class="img-circle" />
                        <h4>
                            <a href="../../../sys/roleuser/UserGroupMgr.aspx">自定义人员分组</a></h4>
                    </div>
                </div>
            </div>            
        </div>
    </div>
    </form>
</body>
</html>
