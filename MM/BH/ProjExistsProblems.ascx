<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjExistsProblems.ascx.cs" Inherits="Zhongsoft.Portal.MM.BH.ProjExistsProblems" %>
<div class="row" style="margin-top: 15px; margin-bottom: 15px;">
    <div class="col-lg-12 col-md-12 col-xs-12">
        <section class="box has-border-left-3">
            <header class="panel_header">
                <h2 class="title pull-left" style="margin-left: 30px;">存在问题</h2>
                <div class="actions panel_actions pull-right">
                    <a class="box_toggle fa fa-chevron-down"></a>
                    <a class="box_setting fa fa-cog" data-toggle="modal"></a>
                    <a class="box_close fa fa-times"></a>
                </div>
            </header>
            <div class="content-body" style="padding: 5px 30px 30px;">
                <div class="row">
                    <div class="col-xs-12">
                        <section class="box box-wenti">
                            <table class="table table-small-font table-bordered table-striped no-mb table-hover table-wenti">
                                <colgroup>
                                    <col style="width: 10.0%;">
                                    <col style="width: 25.0%;">
                                    <col style="width: 5.0%;">
                                    <col style="width: 25.0%;">
                                    <col style="width: 25.0%;">
                                    <col style="width: 10.0%;">
                                </colgroup>
                                <tbody id="tbodyProblem">
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

    //存在问题
    function getProblemInfo() {
        $.ajax({
            type: 'POST',
            url: '<%=WebAppPath%>' + '/MM/BH/ProjectMuti.aspx',
            dataType: 'json',
            data: { asyfunc: "GetProblemInfo", projectPackageID: "<%=ProjectPackageID%>", marketProjectID: "<%=MarketProjectID%>", organizationID: "<%=OrganizationID%>" },
            success: function (data) {
                if (data != null && data.length > 0) {
                    var ht = '<tr><td>项目编号</td><td>项目名称</td><td>设总</td><td>存在问题</td><td>解决措施</td><td>备注</td></tr>';
                    for (var i = 0; i < data.length; i++) {
                        ht += '<tr><td>' + data[i].ProjectCode + '</td>'
                            + '<td><span class="no-break table-wenti-xmmc" data-toggle="tooltip" data-placement="top" title="<p style=' + '\'' + 'text-align:justify' + '\'>' + data[i].ProjectName + '</p>">' + data[i].ProjectName + '</span></td>'
                            + '<td>' + data[i].ManagerUserName + '</td>'
                            + '<td><span class="no-break table-wenti-czwt" data-toggle="tooltip" data-placement="top" title="<p style=' + '\'' + 'text-align:justify' + '\'>' + data[i].ExistProblems + '</p>">' + data[i].ExistProblems + '</span></td>'
                            + '<td><span class="no-break table-wenti-jjcs" data-toggle="tooltip" data-placement="top" title="<p style=' + '\'' + 'text-align:justify' + '\'>' + data[i].Measures + '</p>">' + data[i].Measures + '</span></td>'
                            + '<td><span class="no-break table-wenti-bz" data-toggle="tooltip" data-placement="top" title="<p style=' + '\'' + 'text-align:justify' + '\'>' + data[i].Memo + '</p>">' + data[i].Memo + '</span></td>'
                            + '</tr>';
                    }
                    $("#tbodyProblem").html(ht);
                    $(function () { $(".table-wenti tr td span").tooltip({ html: true }); });
                }
            }
        })
    }
</script>
