
        var $midw = 1;
        var $w = 1;
        var $i = 1;
        var $len = 1;
        var $pagecount = 1;
        var $cur = 1; //初始化显示的版面
		function ChangeNav() {
            var $showbox = $('#nav');
            $midw = $(window).width();
            //$('#banner_ctr').width($midw - 788);
            $w = $('#banner_ctr').width();
            $len = $('#nav>ul>li').length * 83; //计算列表总长度
            $pagecount = Math.ceil($len / $w);    <!-- 计算展示版面数量-->
            if ($pagecount>1) {//modify by wenwen 日志过于庞大
                $('#nav_left').css('display', '');
                $('#nav_right').css('display', '');
            } else {
                $('#nav_left').css('display', 'none');
                $('#nav_right').css('display', 'none');
			      $showbox.css({
                   left: 0
                  });
            }
        }
        //向前滚动
        function PreClick() {
            if($cur==1){return false;}//Add by xiedx 无内容后不进行翻页
            var $showbox = $('#nav');
            if (!$showbox.is(':animated')) { //判断展示区是否动画
                if (Math.abs($showbox.offset().left) < $len / $pagecount || ($showbox.offset().left == 374)) {
                    $showbox.animate({
                        left: +0
                    }, 500);
                    $cur = 1;
                }
                else {
                    $cur--;
                    $showbox.animate({
                        left: '+=' + $len / $pagecount
                    }, 500);
					 $("#drag_ctr").animate({
                        left: '+=' + $len / $pagecount
                    }, 500);
					
					
                }
            }
        }
        //向后滚动
        function NextClick() {
            if($cur>=$pagecount){return false;}//Add by xiedx 后面无内容后不进行翻页
            var $showbox = $('#nav');
            if (!$showbox.is(':animated')) {
                if ($w > $len) {
                }
                else {
                    $cur++;
                    $showbox.animate({
                        left: '-=' + $len / $pagecount
						
						
                    }, 500);
				
					
                }
            }
        }



	
	//导航条滚动
$(function(){
	          ChangeNav();
             window.onload = window.onresize = function() {
                ChangeNav(); 
            }
            $('#nav_left').bind("mouseover", PreClick);
            $('#nav_right').bind("mouseover", NextClick);
            $('#nav_left').bind("click", PreClick);
            $('#nav_right').bind("click", NextClick);

	
	})