function showStudentInModal(obj){

    /*获取 学生表 的一行的数据并传值到模态框中，onclick事件先于模态框的show*/

    var prevAll = $(obj).parent().prevAll();

    var studentRewOrPun = prevAll.eq(0).text();
    var studentDepartment = prevAll.eq(1).text();
    var studentMajor = prevAll.eq(2).text();
    var studentClasses = prevAll.eq(3).text();
    var studentGender = prevAll.eq(4).text();
    var studentName = prevAll.eq(5).text();
    var studentId = prevAll.eq(6).text();

    $("#editStudentRewOrPun1").text(studentRewOrPun);
    $("#editStudentDepartment1").val(studentDepartment);
    $("#editStudentMajor1").val(studentMajor);
    $("#editStudentClass1").val(studentClasses);

    if(studentGender == '男'){
        $("input[name='studentGender'][value='女']").attr("checked",false);
        $("input[name='studentGender'][value='男']").attr("checked",true);
    }else if(studentGender == '女'){
        $("input[name='studentGender'][value='男']").attr("checked",false);
        $("input[name='studentGender'][value='女']").attr("checked",true);
    }

    $("#editStudentName1").val(studentName);
    $("#editStudentId1").val(studentId);

}