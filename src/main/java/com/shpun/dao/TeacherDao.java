package com.shpun.dao;

import com.shpun.pojo.Student;
import com.shpun.pojo.Teacher;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TeacherDao {

    int insertTeacher(Teacher teacher);

    int deleteTeacher(int teacherId);

    int updateTeacher(Teacher teacher);

    List<Teacher> searchFromTeacher(String s);

    Teacher selectTeacherById(int teacherId);

    List<Teacher> selectAllTeachers();

}
