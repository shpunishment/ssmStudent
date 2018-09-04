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
                <li class="nav-item"><a href="${path}/manager/course" class="nav-link text-center">课程管理</a></li>
                <li class="nav-item"><a href="${path}/manager/score" class="nav-link text-center active">成绩管理</a></li>
            </ul>
        </div>

        <div class="col-md-10">
            <!-- three tab -->
            <div>

                <h3 style="margin-top:18px">成绩管理</h3>

                <div>
                    <!-- 在学生表，课程表，成绩表 搜索 学生课程成绩 的表单 -->
                    <form class="form-inline" action="${path}/score/search" method="get">

                        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#addStuCouScoModal" style="margin-right:20px">添加</button>

                        <input type="text"  class="form-control"  name="searchStuCou">

                        <button type="submit" class="btn btn-info" style="margin-left:4px">搜索</button>

                    </form>

                </div>

                <!-- 添加学生与课程成绩的Modal -->
                <div class="modal fade" id="addStuCouScoModal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <!-- 模态框头部 -->
                            <div class="modal-header">
                                <h4>添加学生课程成绩</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- 模态框主体 -->
                            <div class="modal-body">

                                <!-- 添加学生与课程成绩的表单 -->
                                <form name="addStuCouScoForm" action="${path}/score/insert" method="post">

                                    <div class="form-group">
                                        <label>学号</label>
                                        <input type="text" name="studentId" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>名字</label>
                                        <input type="text" name="studentName" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>课程号</label>
                                        <input type="text" name="courseId" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>课程名</label>
                                        <input type="text" name="courseName" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>成绩</label>
                                        <input type="number" name="courseScore" class="form-control" min="0" max="100">
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

                <!-- 修改学生与课程成绩的Modal -->
                <div class="modal fade" id="editStuCouScoModal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <!-- 模态框头部 -->
                            <div class="modal-header">
                                <h4>修改学生课程成绩</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- 模态框主体 -->
                            <div class="modal-body">

                                <!-- 修改学生课程成绩的表单 -->
                                <form name="addStuCouScoForm" action="${path}/score/update" method="post">

                                    <div class="form-group">
                                        <label>学号</label>
                                        <input id="editStudentId3" type="text" name="studentId" class="form-control" readonly value="">
                                    </div>
                                    <div class="form-group">
                                        <label>名字</label>
                                        <input id="editStudentName3" type="text" name="studentName" class="form-control" readonly value="">
                                    </div>
                                    <div class="form-group">
                                        <label>课程号</label>
                                        <input id="editCourseId3" type="text" name="courseId" class="form-control" readonly value="">
                                    </div>
                                    <div class="form-group">
                                        <label>课程名</label>
                                        <input id="editCourseName3" type="text" name="courseName" class="form-control" readonly value="">
                                    </div>
                                    <div class="form-group">
                                        <label>成绩</label>
                                        <input id="editCourseScore3" type="number" name="courseScore" class="form-control" min="0" max="100" value="">
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

                <!-- 学生课程成绩表 -->
                <table class="table table-striped table-bordered table-hover text-center" style="margin-top:15px">
                    <thead>
                    <tr>
                        <th>学号</th>
                        <th>名字</th>
                        <th>课程号</th>
                        <th>课程名</th>
                        <th>成绩</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="score" items="${scorePageInfo.list}">
                        <tr>
                            <td>${score.student.studentId}</td>
                            <td>${score.student.studentName}</td>
                            <td>${score.course.courseId}</td>
                            <td>${score.course.courseName}</td>
                            <td>${score.stuCouScore}</td>
                            <td><button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#editStuCouScoModal" onclick="showStuCouScoInModal(this)">修改</button>
                                <a href="${path}/score/delete?studentId=${score.student.studentId}&courseId=${score.course.courseId}" class="btn btn-danger btn-sm" role="button">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <!-- 学生课程成绩表 分页-->
                <!-- 分页数据 -->
                <div class="row">

                    <!-- 分页文字信息 -->
                    <div class="col-md-4">
                        当前${scorePageInfo.pageNum}页,总${scorePageInfo.pages}页,总${scorePageInfo.total}条记录
                    </div>
                    <!-- 分页条信息 -->
                    <div class="col-md-8">
                        <ul class="pagination">
                            <li class="page-item"><a class="page-link" href="${path}/manager/score?pnSC=1">首页</a></li>

                            <c:if test="${scorePageInfo.hasPreviousPage }">
                                <li class="page-item">
                                    <a class="page-link" href="${path}/manager/score?pnSC=${scorePageInfo.pageNum-1}" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:if>

                            <c:forEach items="${scorePageInfo.navigatepageNums }" var="page_Num">
                                <c:if test="${page_Num==scorePageInfo.pageNum }">
                                    <li class="page-item active"><a class="page-link" href="#">${page_Num }</a></li>
                                </c:if>
                                <c:if test="${page_Num!=scorePageInfo.pageNum }">
                                    <li class="page-item"><a class="page-link" href="${path}/manager/score?pnSC=${page_Num }">${page_Num }</a></li>
                                </c:if>
                            </c:forEach>

                            <c:if test="${scorePageInfo.hasNextPage }">
                                <li class="page-item">
                                    <a class="page-link" href="${path}/manager/score?pnSC=${scorePageInfo.pageNum+1}" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:if>

                            <li class="page-item"><a class="page-link" href="${path}/manager/score?pnSC=${scorePageInfo.pages} ">末页</a></li>
                        </ul>
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
<script src="../js/score.js"></script>
</body>
</html>
