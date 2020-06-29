<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
	<jsp:include page="link.jsp"></jsp:include>
</head>

<body class="hold-transition skin-purple sidebar-mini">

<div class="wrapper">

	<!-- 页面头部 -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- 页面头部 /-->
	<!-- 导航侧栏 -->
	<jsp:include page="aside.jsp"></jsp:include>
	<!-- 导航侧栏 /-->

	<!-- 内容区域 -->
	<!-- @@master = admin-layout.html-->
	<!-- @@block = content -->

	<div class="content-wrapper">

		<!-- 内容头部 -->
		<section class="content-header">
			<h1>
				成绩打分 <small>成绩列表</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="main.jsp"><i class="fa fa-dashboard"></i> 首页</a></li>
				<li><a href="${pageContext.request.contextPath}/select/findStudent.do?${courseId}">选课学生列表</a></li>
				<li class="active">成绩列表</li>
			</ol>
		</section>
		<!-- 内容头部 /-->

		<!-- 正文区域 -->
		<section class="content">

			<!-- .box-body -->
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">成绩列表</h3>
				</div>

				<div class="box-body">

					<!-- 数据表格 -->
					<div class="table-box">

						<!--工具栏-->
						<div class="pull-left">
							<div class="form-group form-inline">
								<div class="btn-group">
									<button type="button" class="btn btn-default" title="刷新"
											onclick="location.href='${pageContext.request.contextPath}/grade/grade.do?${studentId}&${courseId}'">
										<i class="fa fa-refresh"></i> 刷新
									</button>
								</div>
							</div>
						</div>
						<!--工具栏/-->

						<!--数据列表-->
						<form id="form01" action="${pageContext.request.contextPath}/grade/save.do?studentId=${studentId}"  method="post" onsubmit="getValue()">
							<table id="orderTable"
								   class="table table-bordered table-striped table-hover dataTable">
								<thead>
								<tr>
									<th class="sorting_asc_disabled">课程ID</th>
									<th class="sorting_asc_disabled">考点ID</th>
									<th class="sorting_asc_disabled">考点名称</th>
									<th class="sorting_asc_disabled">考点详情</th>
									<th class="sorting_desc_disabled">考点占比</th>
									<th class="sorting_desc_disabled">打分</th>
								</tr>
								</thead>
								<tbody>
								<c:forEach items="${points}" var="point">
									<tr id="row${point.pointId-1}">
										<td><input type="text" id="courseId${point.pointId-1}" readonly="readonly" class="form-control" name="grades[${point.pointId-1}].courseId"
												   placeholder="考点ID" value="${point.courseId}"></td></td>
										<td><input type="text" id="pointId${point.pointId-1}" readonly="readonly" class="form-control" name="grades[${point.pointId-1}].pointId"
												   placeholder="考点ID" value="${point.pointId}"></td>
										<td><input type="text" id="pointName${point.pointId-1}" readonly="readonly" class="form-control" name="grades[${point.pointId-1}].pointName"
												   placeholder="考点名称" value="${point.pointName}"></td>
										<td><input type="text" id="pointDesc${point.pointId-1}" readonly="readonly" class="form-control" name="grades[${point.pointId-1}].pointDesc"
												   placeholder="考点详情" value="${point.pointDesc}"></td>
										<td><input type="text" id="pointPer${point.pointId-1}"  readonly="readonly"   class="form-control" name="grades[${point.pointId-1}].pointPer"
												   placeholder="考点占比" value="${point.pointPer}"></td>
										<td><input type="text" id="pointGrade${point.pointId-1}"   onchange="if(!/(^0$)|(^100$)|(^\d{1,2}$)/.test(value)){value='';alert('请输入0-100的整数!');}"  class="form-control" name="grades[${point.pointId-1}].pointGrade"
												   placeholder="考点得分" value=""></td>
									</tr>
								</c:forEach>

								<tr>
									<td align="center" colspan="5">
										<br />
										<input type="submit"  value=" 保    存 "   />
									</td>
								</tr>


								</tbody>


							</table>
						</form>
						<!--数据列表/-->

					</div>
					<!-- 数据表格 /-->


				</div>
				<!-- /.box-body -->




			</div>

		</section>
		<!-- 正文区域 /-->

	</div>
	<!-- @@close -->
	<!-- 内容区域 /-->

	<!-- 底部导航 -->
	<footer class="main-footer">
		<div class="pull-right hidden-xs">
			<b>Version</b> 1.0.8
		</div>
		<strong>Copyright &copy; 2020 <a
				href="http://www.itcast.cn">研究院研发部</a>.
		</strong> All rights reserved.
	</footer>
	<!-- 底部导航 /-->

</div>
<jsp:include page="script.jsp"></jsp:include>
<script>
	$(document).ready(function() {
		// 选择框
		$(".select2").select2();

		// WYSIHTML5编辑器
		$(".textarea").wysihtml5({
			locale : 'zh-CN'
		});
	});

	// 设置激活菜单
	function setSidebarActive(tagUri) {
		var liObj = $("#" + tagUri);
		if (liObj.length > 0) {
			liObj.parent().parent().addClass("active");
			liObj.addClass("active");
		}

	}

	$(document).ready(function() {

		// 激活导航位置
		setSidebarActive("admin-datalist");

		// 列表按钮
		$("#dataList td input[type='checkbox']").iCheck({
			checkboxClass : 'icheckbox_square-blue',
			increaseArea : '20%'
		});
		// 全选操作
		$("#selall").click(function() {
			var clicks = $(this).is(':checked');
			if (!clicks) {
				$("#dataList td input[type='checkbox']").iCheck("uncheck");
			} else {
				$("#dataList td input[type='checkbox']").iCheck("check");
			}
			$(this).data("clicks", !clicks);
		});
	});
</script>

<script>
	function getValue() {
		var value = "" ;
		$("#orderTable tr").each(function(i) {
			if (i >=1) {
				$(this).children().each(function(j) {
					if ($("#orderTable tr").eq(i).children().length  != j) {
						value += $(this).children().eq(0).val() + "," //获取每个单元格里的第一个控件的值

					}
				});
				value = value.substr(0, value.length - 1) + "#"; //每个单元格的数据以“，”分割，每行数据以“#”号分割
			}
		});
		value = value.substr(0, value.length);
		var courseGrade=ReceiveValue(value);

	}

	function ReceiveValue(str) {
		var Str = str.split('#');
		var arr =[];

		if (Str[0] != "") {
			for (var i = 0; i < Str.length - 1; i++) {
				var value = Str[i].split(',');
				var pointPer =parseFloat(value[4]);
				var pointGrade=parseFloat(value[5]);
				arr[i]=parseFloat(pointPer*pointGrade/100);
			}

			var courseGrade = sum(arr);
			$.post("${pageContext.request.contextPath}/select/updateCourseGrade.do?studentId=${studentId}&courseId=${courseId}&courseGrade="+courseGrade+"");
		}

		function sum(arr) {
			var s = 0;
			for (var i = arr.length - 2; i >= 0; i--) {
				s += arr[i];
			}
			return s;
		}
	}
</script>
</body>

</html>