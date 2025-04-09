<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WBSDelayInfo.ascx.cs" Inherits="Zhongsoft.Portal.MM.BH.WBSDelayInfo" %>

<div class="row" style="margin-top: 15px; margin-bottom: 15px;">
    <div class="col-lg-12 col-md-12 col-xs-12">
        <section class="box has-border-left-3">
            <header class="panel_header">
                <h2 class="title pull-left" style="margin-left: 30px;">延期任务</h2>
                <div class="actions panel_actions pull-right">
                    <a class="box_toggle fa fa-chevron-down"></a>
                    <a class="box_setting fa fa-cog" data-toggle="modal"></a>
                    <a class="box_close fa fa-times"></a>
                </div>
            </header>
            <div class="content-body" style="padding: 5px 30px 15px;">
                <div class="row">
                    <div class="col-xs-12">
                        <section class="box" style="margin-bottom: 20px;">
                            <table class="table table-small-font table-bordered table-striped no-mb table-hover table-juance">
                                <colgroup>
                                    <col style="width: 10.0%;">
                                    <col style="width: 25.0%;">
                                    <col style="width: 10.0%;">
                                    <col style="width: 25.0%;">
                                    <col style="width: 10.0%;">
                                    <col style="width: 10.0%;">
                                    <col style="width: 10.0%;">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th colspan="7" class="text-black"><i class="fa fa-file-text-o fa-fw margin-r-5"></i>任务/互提资料/外部资料</th>
                                    </tr>
                                </thead>
                                <tbody id="tBodyWbs">
                                </tbody>
                            </table>
                        </section>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
<script type="text/javascript">
    //任务信息
    function getWbsInfo() {
        $.ajax({
            type: 'POST',
            url: '<%=WebAppPath%>' + '/MM/BH/ProjectMuti.aspx',
            dataType: 'json',
            data: { asyfunc: "GetWBSInfo", projectPackageID: "<%=ProjectPackageID%>", marketProjectID: "<%=MarketProjectID%>", organizationID: "<%=OrganizationID%>" },
            success: function (data) {
                if (data != null && data.length > 0) {
                    var ht = '<tr><td>项目编号</td><td>项目名称</td><td>任务编号</td><td>任务名称</td><td>设计人</td><td>计划完成时间</td><td>延期</td></tr>';
                    for (var i = 0; i < data.length; i++) {
                        ht += '<tr><td>' + data[i].ProjectCode + '</td >' + '<td>' + data[i].ProjectName + '</td >'
                            + '<td>' + data[i].WBSCode + '</td >'
                            + '<td>' + data[i].WBSName + '</td >'
                            + '<td>' + data[i].WBSOwnerName + '</td >'
                            + '<td>' + data[i].PlanCompleteTime + '</td >'
                            + '<td>' + data[i].isDelay + '</td >'
                            + '</tr>';
                    }
                    $("#tBodyWbs").html(ht);
                }
            }
        })
    }
</script>
