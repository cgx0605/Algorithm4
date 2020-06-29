<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- Sidebar user panel -->
		<div class="user-panel">
			<div class="pull-left image">
				<img src="${pageContext.request.contextPath}/img/user2-160x160.jpg"
					class="img-circle" alt="User Image">
			</div>
			<div class="pull-left info">
				<p>
					<security:authentication property="principal.username"></security:authentication>
				</p>
				<a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
			</div>
		</div>

		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu">
			<li class="header">菜单</li>
			<li id="admin-index"><a
					href="${pageContext.request.contextPath}/pages/main.jsp"><i
					class="fa fa-dashboard"></i> <span>首页</span></a></li>

			<li class="treeview"><a href="#"> <i class="fa fa-cogs"></i>
				<span>课程管理</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">

					<security:authorize access="hasRole('ADMIN')">
					<li id="system-setting"><a
							href="${pageContext.request.contextPath}/course/findAll.do"> <i
							class="fa fa-circle-o"></i> 课程编辑
						</a></li>

					<li id="system-setting"><a
							href="${pageContext.request.contextPath}/select/findAll.do"> <i
							class="fa fa-circle-o"></i> 选课情况
					</a></li>

					</security:authorize>
					<security:authorize access="hasRole('STUDENT')">
					<li id="system-setting"><a
							href="${pageContext.request.contextPath}/select/findNoSelect.do"> <i
							class="fa fa-circle-o"></i> 选课情况
						</a></li>

					<li id="system-setting"><a
							href="${pageContext.request.contextPath}/select/findCourseGrade.do"> <i
							class="fa fa-circle-o"></i>成绩查询
					</a></li>
					</security:authorize>
				</ul></li>


			<li class="treeview"><a href="#"> <i class="fa fa-cube"></i>
				<span>人员管理</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<security:authorize access="hasRole('STUDENT')">
						<li id="system-setting"><a
								href="${pageContext.request.contextPath}/student/findshow.do?">
							<i class="fa fa-circle-o"></i>个人中心
						</a></li>
					</security:authorize>
					<security:authorize access="hasRole('ADMIN')">

					<li id="system-setting"><a
							href="${pageContext.request.contextPath}/student/findAll.do">
						<i class="fa fa-circle-o"></i>学生管理
					</a></li>

					<li id="system-setting"><a
							href="${pageContext.request.contextPath}/userInfo/findAll.do">
						<i class="fa fa-circle-o"></i>管理员管理
					</a></li>

					</security:authorize>
				</ul></li>



		</ul>
	</section>
	<!-- /.sidebar -->
</aside>