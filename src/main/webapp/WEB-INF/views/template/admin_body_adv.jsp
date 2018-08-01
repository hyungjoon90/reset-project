<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@include file="/WEB-INF/views/template/admin_header.jsp" %>
	<!-- 생각해봐야됨. -->
	<script>
	var getNums = function() {
		var $targets = $(".getNum");
		$targets.each(function(){
			var $target = $(this)
			// rev-cnt/ mag-cnt/ eve-cnt / itm-cnt
			var cntType= $target.attr('id');
			var sendData = "resultType=int&where=${login_email}";
			$.post("${goRoot}admin/ajax/"+cntType,sendData)
			.done(function(data){
				if(data.result==200){
					$target.text(data.result_data);
				}
			}); 
		});
	};
	
	var getList = function(ele,command,start,cnt){
		var $target = $(ele);
		var sendData = "resultType=list&itemList=true";
		if(! ('${login_comName}' == 'reset'))sendData +="&where=${login_email}";
		
		$.post("${goRoot}admin/ajax/"+command,sendData)
		.done(function(data){
			var resultHTML= data;
			$(resultHTML).appendTo($target);
			setEventBtn();
		});
	}
	var setEventBtn = function(){
		$('.chartBtn').each(function(){
			var $target = $(this);
			$target.on("click",function(){
				var command = $target.attr("data-type");
				var no = $target.attr("data-id");
				var canvas = $("#chart-target");
				getChart(canvas,command,7,no);
			});
		});
	}
	
	
	var getChart = function(ele,type,day,no){
		var $target = $(ele);
		var data;
		var sendData ="log_day="+day+"&no="+no;
		var test = $.post("${goRoot}admin/chart/"+type,sendData);
		
		test.done(function(data){
			$target.html(data);
		});
	}

	// 문서 온로드시점
	$(function(){
		getNums();
		if($("#chart-itemlist").length>0){
			getList($("#chart-itemlist"),"event",0,10000); // 페이징 나중에
		}else{
			var target = $("#chart-target");
			var type = 'event';
			getChart(target,type,7,-1);
		}
		
		// 30초 watch	
		setInterval(function(){
		getNums();
		},30000);
	});
	</script>
</head>
<body>
    <div id="wrapper">
	<%@include file="/WEB-INF/views/template/admin_side_menu.jsp" %>
        <div id="page-wrapper">
            <div class="container-fluid">
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Dashboard <small>Overview</small>
                        </h1>
                    </div>
                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-9">
                                        <div class="huge">리뷰</div>
                                    </div>
                                    <div class="col-xs-3 text-right">
                                        <div class="huge getNum" id="rev-cnt"></div>
                                    </div>
                                </div>
                            </div>
                            <a href="./review">
                                <div class="panel-footer">
                                    <span class="pull-left">리스트 보기</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-green">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-8">
                                        <div class="huge">매거진</div>
                                    </div>
                                    <div class="col-xs-4 text-right">
                                        <div class="huge getNum" id="mag-cnt"></div>
                                    </div>
                                </div>
                            </div>
                            <a href="./magazine">
                                <div class="panel-footer">
                                    <span class="pull-left">리스트 보기</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-yellow">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-8">
                                        <div class="huge">이벤트</div>
                                    </div>
                                    <div class="col-xs-4 text-right">
                                        <div class="huge getNum" id="eve-cnt"></div>
                                    </div>
                                </div>
                            </div>
                            <a href="./event">
                                <div class="panel-footer">
                                    <span class="pull-left">리스트 보기</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-red">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-8">
                                        <div class="huge">화장품</div>
                                    </div>
                                    <div class="col-xs-4 text-right">
                                        <div class="huge getNum" id="itm-cnt"></div>
                                    </div>
                                </div>
                            </div>
                            <a href="./item">
                                <div class="panel-footer">
                                    <span class="pull-left">리스트보기</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
		        <div class="row">    
				        <div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">
                    	            <h3 class="panel-title">이벤트 리스트</h3>
                        	    </div>
                       		<div id="chart-itemlist" class="panel-body"></div>
                       	</div>
			        </div>
				</div><!-- end row -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">이벤트 차트</h3>
                            </div>
                            <div id="chart-target" class="panel-body"></div>
                        </div>
                    </div>
				</div><!-- end row -->
            </div><!-- /.container-fluid -->

        </div><!-- /#page-wrapper -->
    </div><!-- /#wrapper -->
</body>
