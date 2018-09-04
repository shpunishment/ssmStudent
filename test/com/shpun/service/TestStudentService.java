package com.shpun.service;


import com.shpun.pojo.Student;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/spring-*.xml"})
public class TestStudentService {

    @Test
    public void testInsertStudent(){

        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/spring-*.xml");
        StudentService studentService = context.getBean(StudentService.class);

        Student student = new Student();
        student.setStudentName("曾四");
        student.setStudentGender("男");
        student.setStudentClass("电气2班");
        student.setStudentMajor("电气工程及其自动化");
        student.setStudentDepartment("计算机科学系");

        studentService.insertStudent(student);
        System.out.println("insert studentId:" + student.getStudentId());

    }

    @Test
    public void testDeleteStudent(){

        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/spring-*.xml");
        StudentService studentService = context.getBean(StudentService.class);

        studentService.deleteStudent(10121);

    }

    @Test
    public void testUpdateStudent(){

        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/spring-*.xml");
        StudentService studentService = context.getBean(StudentService.class);

        Student student = new Student();
        student.setStudentId(10120);
        student.setStudentName("曾四");
        student.setStudentGender("男");
        student.setStudentClass("电气2班");
        student.setStudentMajor("电气工程及其自动化");
        student.setStudentDepartment("计算机科学系");

        studentService.updateStudent(student);

    }

    @Test
    public void testsearchFromStudent(){

        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/spring-*.xml");
        StudentService studentService = context.getBean(StudentService.class);

        List<Student> studentList = studentService.searchFromStudent("男");

        for(Student s : studentList){
            System.out.println(s);
        }

    }

    @Test
    public void testSelectStudentById(){

        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/spring-*.xml");
        StudentService studentService = context.getBean(StudentService.class);

        System.out.println(studentService.selectStudentById(10101));

    }

    @Test
    public void testSelectAllStudents(){

        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/spring-*.xml");
        StudentService studentService = context.getBean(StudentService.class);

        List<Student> studentList = studentService.selectAllStudents();

        for(Student s : studentList){
            System.out.println(s);
        }

    }

}
