<%--
  Created by IntelliJ IDEA.
  User: shpun
  Date: 2018/8/28
  Time: 18:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    pageContext.setAttribute("path", request.getContextPath());
    pageContext.setAttribute("basePath",request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort());
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="../css/bootstrap.min.css">

    <style>
        body{
            padding-right: 0!important;
        }
    </style>

    <title>学籍管理系统</title>
</head>

<body>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <div class="container-fluid">
        <a class="nav navbar-brand navbar-nav" href="${path}/manager/student">学籍管理系统</a>

        <ul class="navbar-nav navbar-right">
            <li class="nav-item active"><a class="nav-link" href="#">管理员</a></li>
        </ul>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">

        <div class="col-md-2" style="margin-top:20px">
            <ul class="nav nav-pills flex-column">
                <li class="nav-item"><a href="${path}/manager/student" class="nav-link text-center">学生管理</a></li>
                <li class="nav-item"><a href="${path}/manager/course" class="nav-link text-center active">课程管理</a></li>
                <li class="nav-item"><a href="${path}/manager/score" class="nav-link text-center">成绩管理</a></li>
            </ul>
        </div>

        <div class="col-md-10">
            <div class="tab-content">

                <!-- two tab -->
                <div>

                    <h3 style="margin-top:18px">课程管理</h3>

                    <div>
                        <!-- 课程表，老师表 搜索 老师课程 的表单 -->
                        <form class="form-inline" action="${path}/course/search" method="get">

                            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#addTeaCouModal" style="margin-right:20px">添加</button>

                            <input type="text"  class="form-control"  name="searchCourse">

                            <button type="submit" class="btn btn-info" style="margin-left:4px">搜索</button>

                        </form>

                    </div>

                    <!-- 添加老师课程的Modal -->
                    <div class="modal fade" id="addTeaCouModal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <!-- 模态框头部 -->
                                <div class="modal-header">
                                    <h4>添加老师与课程</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- 模态框主体 -->
                                <div class="modal-body">

                                    <!-- 添加老师与课程的表单 -->
                                    <form name="addTeaCouForm" action="${path}/course/insert" method="post">

                                        <div class="form-group">
                                            <label>老师号</label>
                                            <input type="text" name="teacherId" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>名字</label>
                                            <input type="text" name="teacherName" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>课程名</label>
                                            <input type="text" name="courseName" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>学分</label>
                                            <input type="text" name="courseCredit" class="form-control">
                                        </div>
                                </div>

                                <!-- 模态框底部 -->

                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-success">添加</button>
                                    </form>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>

                                </div>

                            </div>
                        </div>
                    </div>

                    <!-- 修改老师课程的Modal -->
                    <div class="modal fade" id="editTeaCouModal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <!-- 模态框头部 -->
                                <div class="modal-header">
                                    <h4>修改老师与课程</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- 模态框主体 -->
                                <div class="modal-body">

                                    <!-- 修改老师课程的表单 -->
                                    <form name="editTeaCouuForm" action="${path}/course/update" method="post">
                                        <div class="form-group">
                                            <label>老师号</label>
                                            <input id="editTeacherId2" type="text" name="teacherId" class="form-control" readonly value="">
                                        </div>
                                        <div class="form-group">
                                            <label>名字</label>
                                            <input id="editTeacherName2" type="text" name="teacherName" class="form-control" readonly value="">
                                        </div>
                                        <div class="form-group">
                                            <label>课程号</label>
                                            <input id="editCourseId2" type="text" name="courseId" class="form-control" readonly value="">
                                        </div>
                                        <div class="form-group">
                                            <label>课程名</label>
                                            <input id="editCourseName2" type="text" name="courseName" class="form-control" value="">
                                        </div>
                                        <div class="form-group">
                                            <label>学分</label>
                                            <input id="editCourseCredit2" type="text" name="courseCredit" class="form-control" value="">
                                        </div>
                                </div>

                                <!-- 模态框底部 -->

                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-success">修改</button>
                                    </form>
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>

                                </div>

                            </div>
                        </div>
                    </div>

                    <!-- 老师课程表 -->
                    <table class="table table-striped table-bordered table-hover text-center" style="margin-top:15px">
                        <thead>
                        <tr>
                            <th>老师号</th>
                            <th>名字</th>
                            <th>课程号</th>
                            <th>课程名</th>
                            <th>学分</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="course" items="${coursePageInfo.list}">
                            <tr>
                                <td>${course.teacher.teacherId}</td>
                                <td>${course.teacher.teacherName}</td>
                                <td>${course.courseId}</td>
                                <td>${course.courseName}</td>
                                <td>${course.courseCredit}</td>
                                <td><button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#editTeaCouModal" onclick="showTeaCouInModal(this)">修改</button>
                                    <a href="${path}/course/delete?courseId=${course.courseId}" class="btn btn-danger btn-sm" role="button">删除</a>
                                </td>
                            </tr>

                        </c:forEach>
                        </tbody>
                    </table>

                    <!-- 老师课程表 分页-->
                    <!-- 分页数据 -->
                    <div class="row">

                        <!-- 分页文字信息 -->
                        <div class="col-md-4">
                            当前${coursePageInfo.pageNum}页,总${coursePageInfo.pages}页,总${coursePageInfo.total}条记录
                        </div>
                        <!-- 分页条信息 -->
                        <div class="col-md-8">
                            <ul class="pagination">
                                <li class="page-item"><a class="page-link" href="${path}/course/search?pnC=1">首页</a></li>

                                <c:if test="${coursePageInfo.hasPreviousPage }">
                                    <li class="page-item">
                                        <a class="page-link" href="${path}/course/search?pnC=${coursePageInfo.pageNum-1}&searchCourse=${searchCourse}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>

                                <c:forEach items="${coursePageInfo.navigatepageNums }" var="page_Num">
                                    <c:if test="${page_Num==coursePageInfo.pageNum }">
                                        <li class="page-item active"><a class="page-link" href="#">${page_Num }</a></li>
                                    </c:if>
                                    <c:if test="${page_Num!=coursePageInfo.pageNum }">
                                        <li class="page-item"><a class="page-link" href="${path}/course/search?pnC=${page_Num }&searchCourse=${searchCourse}">${page_Num }</a></li>
                                    </c:if>
                                </c:forEach>

                                <c:if test="${coursePageInfo.hasNextPage }">
                                    <li class="page-item">
                                        <a class="page-link" href="${path}/course/search?pnC=${coursePageInfo.pageNum+1}&searchCourse=${searchCourse}" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </c:if>

                                <li class="page-item"><a class="page-link" href="${path}/course/search?pnC=${coursePageInfo.pages}&searchCourse=${searchCourse} ">末页</a></li>
                            </ul>
                        </div>

                    </div>

                </div>



            </div>
        </div>


    </div>
</div>



<!-- JavaScript -->
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/popper.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/course.js"></script>
</body>
</html>
