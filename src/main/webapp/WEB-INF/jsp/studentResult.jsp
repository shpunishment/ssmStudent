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
                <li class="nav-item"><a href="${path}/manager/student" class="nav-link text-center active">学生管理</a></li>
                <li class="nav-item"><a href="${path}/manager/course" class="nav-link text-center">课程管理</a></li>
                <li class="nav-item"><a href="${path}/manager/score" class="nav-link text-center">成绩管理</a></li>
            </ul>
        </div>

        <div class="col-md-10">

            <!-- one tab -->
            <div >

                <h3 style="margin-top:18px">学生列表</h3>

                <div>
                    <!-- 在学生表搜索学生的表单 -->
                    <form class="form-inline" action="${path}/student/search" method="get">

                        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#addStudentModal" style="margin-right:20px">添加</button>

                        <input type="text"  class="form-control"  name="searchStudent">

                        <button type="submit" class="btn btn-info" style="margin-left:4px">搜索</button>

                    </form>

                </div>

                <!-- 添加新学生的Modal -->
                <div class="modal fade" id="addStudentModal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <!-- 模态框头部 -->
                            <div class="modal-header">
                                <h4>添加新学生</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- 模态框主体 -->
                            <div class="modal-body">

                                <!-- 添加新学生的表单 -->
                                <form id="addStudentForm" name="addStudentForm" action="${path}/student/insert" method="post">

                                    <div class="form-group">
                                        <label>名字</label>
                                        <input type="text" name="studentName" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>性别</label>
                                        <input type="radio" name="studentGender" style="margin-left:10px" value="男" checked="true">&nbsp;&nbsp;男
                                        <input type="radio" name="studentGender" style="margin-left:10px" value="女">&nbsp;&nbsp;女
                                    </div>
                                    <div class="form-group">
                                        <label>班级</label>
                                        <input type="text" name="studentClass" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>专业</label>
                                        <input type="text" name="studentMajor" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>院系</label>
                                        <input type="text" name="studentDepartment" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>奖惩信息</label>
                                        <textarea form="addStudentForm" name="studentRewOrPun" class="form-control" ></textarea>
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

                <!-- 修改学生信息的Modal -->
                <div class="modal fade" id="editStudentModal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <!-- 模态框头部 -->
                            <div class="modal-header">
                                <h4>修改学生信息</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- 模态框主体 -->
                            <div class="modal-body">

                                <!-- 修改学生信息的表单 -->
                                <form id="editStudentForm" name="editStudentForm" action="${path}/student/update" method="post">
                                    <div class="form-group">
                                        <label>学号</label>
                                        <input id="editStudentId1" type="text" name="studentId" class="form-control" readOnly value="">
                                    </div>
                                    <div class="form-group">
                                        <label>名字</label>
                                        <input id="editStudentName1" type="text" name="studentName" class="form-control" value="">
                                    </div>
                                    <div class="form-group">
                                        <label>性别</label>
                                        <input type="radio" name="studentGender" style="margin-left:10px" value="男" >&nbsp;&nbsp;男
                                        <input type="radio" name="studentGender" style="margin-left:10px" value="女">&nbsp;&nbsp;女
                                    </div>
                                    <div class="form-group">
                                        <label>班级</label>
                                        <input id="editStudentClass1" type="text" name="studentClass" class="form-control" value="">
                                    </div>
                                    <div class="form-group">
                                        <label>专业</label>
                                        <input id="editStudentMajor1" type="text" name="studentMajor" class="form-control" value="">
                                    </div>
                                    <div class="form-group">
                                        <label>院系</label>
                                        <input id="editStudentDepartment1" type="text" name="studentDepartment" class="form-control" value="">
                                    </div>
                                    <div class="form-group">
                                        <label>奖惩信息</label>
                                        <textarea id="editStudentRewOrPun1" form="editStudentForm" name="studentRewOrPun" class="form-control" ></textarea>
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

                <script>
                </script>

                <!-- 学生表 -->
                <table class="table table-striped table-bordered table-hover text-center" style="margin-top:15px" >
                    <thead>
                    <tr >
                        <th>学号</th>
                        <th>名字</th>
                        <th>性别</th>
                        <th>班级</th>
                        <th>专业</th>
                        <th>院系</th>
                        <th>奖惩信息</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="student" items="${studentPageInfo.list}">
                        <tr>
                            <td>${student.studentId}</td>
                            <td>${student.studentName}</td>
                            <td>${student.studentGender}</td>
                            <td>${student.studentClass}</td>
                            <td>${student.studentMajor}</td>
                            <td>${student.studentDepartment}</td>
                            <td>${student.studentRewOrPun}</td>
                            <td><button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#editStudentModal" onclick="showStudentInModal(this)" >修改</button>
                                <a href="${path}/student/delete?studentId=${student.studentId}" class="btn btn-danger btn-sm" role="button">删除</a>
                            </td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>

                <!-- 学生表 分页-->
                <!-- 分页数据 -->
                <div class="row">

                    <!-- 分页文字信息 -->
                    <div class="col-md-4">
                        当前${studentPageInfo.pageNum}页,总${studentPageInfo.pages}页,总${studentPageInfo.total}条记录
                    </div>
                    <!-- 分页条信息 -->
                    <div class="col-md-8">
                        <ul class="pagination">
                            <li class="page-item"><a class="page-link" href="${path}/student/search?pnS=1">首页</a></li>

                            <c:if test="${studentPageInfo.hasPreviousPage }">
                                <li class="page-item">
                                    <a class="page-link" href="${path}/student/search?pnS=${studentPageInfo.pageNum-1}&searchStudent=${searchStudent}>" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:if>

                            <c:forEach items="${studentPageInfo.navigatepageNums }" var="page_Num">
                                <c:if test="${page_Num==studentPageInfo.pageNum }">
                                    <li class="page-item active"><a class="page-link" href="#">${page_Num }</a></li>
                                </c:if>
                                <c:if test="${page_Num!=studentPageInfo.pageNum }">
                                    <li class="page-item"><a class="page-link" href="${path}/student/search?pnS=${page_Num }&searchStudent=${searchStudent}">${page_Num }</a></li>
                                </c:if>
                            </c:forEach>

                            <c:if test="${studentPageInfo.hasNextPage }">
                                <li class="page-item">
                                    <a class="page-link" href="${path}/student/search?pnS=${studentPageInfo.pageNum+1}&searchStudent=${searchStudent}" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:if>

                            <li class="page-item"><a class="page-link" href="${path}/student/search?pnS=${studentPageInfo.pages}&searchStudent=${searchStudent} ">末页</a></li>
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
<script src="../js/student.js"></script>
</body>
</html>
