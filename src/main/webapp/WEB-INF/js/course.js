function showTeaCouInModal(obj){

    /*获取 老师课程表 的一行的数据并传值到模态框中，onclick事件先于模态框的show*/

    var prevAll = $(obj).parent().prevAll();

    var courseCredit = prevAll.eq(0).text();
    var courseName = prevAll.eq(1).text();
    var courseId = prevAll.eq(2).text();
    var teacherName = prevAll.eq(3).text();
    var teacherId = prevAll.eq(4).text();

    $("#editCourseCredit2").val(courseCredit);
    $("#editCourseName2").val(courseName);
    $("#editCourseId2").val(courseId);
    $("#editTeacherName2").val(teacherName);
    $("#editTeacherId2").val(teacherId);


}