package com.shpun.dao;

import com.shpun.pojo.Student;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StudentDao {

    int insertStudent(Student student);

    int deleteStudent(int studentId);

    int updateStudent(Student student);

    List<Student> searchFromStudent(String s);

    Student selectStudentById(int studentId);

    List<Student> selectAllStudents();

}
