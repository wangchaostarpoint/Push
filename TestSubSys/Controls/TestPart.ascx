<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TestPart.ascx.cs" Inherits="Zhongsoft.Portal.TestSubSys.Controls.TestPart" %>


 <div class="wp_listleft" style="margin-top:8px;">
        <div class="wp_header1">
                <div>
                        <span>近一月车辆维修(4辆，预计费用5万)</span>
                </div>
          </div>
  </div>
   <div class="wp_listleft" style="margin-top:8px;">
        <div class="wp_header1">
                <div>
                        <span>近一月保险到期(4辆，预计费用15万)</span>
                </div>
          </div>
  </div>
   <div class="wp_listleft" style="margin-top:8px;">
        <div class="wp_header1">
                <div>
                        <span>2014年至今使用费用汇总（54234元）</span>
                </div>
          </div>
  </div>





 <div class="wp_listleft" style="margin-top:8px;">
                   			<div class="wp_header">
                            	<div>
                                	<span>数据统计</span>
                                </div>
                            </div>
                            <div class="wp_main">
                            	<div class="wp_content">
                                        <table class="wp_detailtable" style=" margin-top:10px;">
                                        <tr>
                                            <td style="cursor:pointer;">&nbsp<a onclick="conTest('1')" style="display: inline-block;">编码1</a></td>
                                    	</tr>

                                        <tr>
                                            <td style="cursor:pointer;">&nbsp;<a onclick="conTest('2')" style="display: inline-block;">编码2</a></td>
                                    	</tr>
                                        
                                        <tr>
                                            <td style="cursor:pointer;">&nbsp;<a onclick="conTest('3')" style="display: inline-block;">编码3</a></td>
                                    	</tr>
                                         <tr>
                                            <td style="cursor:pointer;">&nbsp;<a onclick="conTest('4')" style="display: inline-block;">编码4</a></td>
                                    	</tr>
                                         <tr>
                                            <td style="cursor:pointer;">&nbsp;<a onclick="conTest('5')" style="display: inline-block;">编码5</a></td>
                                    	</tr>
                                    </table>     
                                </div>
                            </div>
                            <div class="wp_footer">
                            	<div></div>
                            </div>
                   		</div>    


  <div class="wp_listleft" style="margin-top:8px;">
        <div class="wp_header1">
                <div>
                        <span>近一个月司机评价（1人较差）</span>
                </div>
          </div>
  </div>
<br />
<script>
    function conTest(val) {
        var param = { idd: val };
        //向webPart部件传参
        window.parent.setWebPartParam(self.frameElement.id, param);
    }
</script>
