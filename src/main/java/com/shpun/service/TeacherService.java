package com.shpun.service;

import com.shpun.pojo.Student;
import com.shpun.pojo.Teacher;

import java.util.List;

public interface TeacherService {

    int insertTeacher(Teacher teacher);

    int deleteTeacher(int teacherId);

    int updateTeacher(Teacher teacher);

    List<Teacher> searchFromTeacher(String s);

    Teacher selectTeacherById(int teacherId);

    List<Teacher> selectAllTeachers();

}
