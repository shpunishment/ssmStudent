function showStuCouScoInModal(obj){

    /*获取 学生课程成绩表 的一行的数据并传值到模态框中，onclick事件先于模态框的show*/

    var prevAll = $(obj).parent().prevAll();

    var score = prevAll.eq(0).text();
    var courseName = prevAll.eq(1).text();
    var courseId = prevAll.eq(2).text();
    var studentName = prevAll.eq(3).text();
    var studentId = prevAll.eq(4).text();

    $("#editCourseScore3").val(score);
    $("#editCourseName3").val(courseName);
    $("#editCourseId3").val(courseId);
    $("#editStudentName3").val(studentName);
    $("#editStudentId3").val(studentId);

}
