package com.shpun.service;

import com.shpun.pojo.Student;
import com.shpun.pojo.Teacher;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/spring-*.xml"})
public class TestTeacherService {

    @Test
    public void testInsertTeacher(){

        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/spring-*.xml");
        TeacherService teacherService = context.getBean(TeacherService.class);

        Teacher teacher = new Teacher();
        teacher.setTeacherName("黄一");
        teacher.setTeacherJobTitle("讲师");

        teacherService.insertTeacher(teacher);
        System.out.println("insert teacherId:" + teacher.getTeacherId());

    }

    @Test
    public void testDeleteTeacher(){

        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/spring-*.xml");
        TeacherService teacherService = context.getBean(TeacherService.class);

        teacherService.deleteTeacher(10008);

    }

    @Test
    public void testUpdateTeacher(){

        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/spring-*.xml");
        TeacherService teacherService = context.getBean(TeacherService.class);

        Teacher teacher = new Teacher();
        teacher.setTeacherId(10007);
        teacher.setTeacherName("更改");
        teacher.setTeacherJobTitle("副教授");

        teacherService.updateTeacher(teacher);

    }

    @Test
    public void testSearchFromTeacher(){

        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/spring-*.xml");
        TeacherService teacherService = context.getBean(TeacherService.class);

        List<Teacher> teacherList = teacherService.searchFromTeacher("教授");

        for(Teacher t : teacherList){
            System.out.println(t);
        }

    }

    @Test
    public void testSelectTeacherById(){

        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/spring-*.xml");
        TeacherService teacherService = context.getBean(TeacherService.class);

        System.out.println(teacherService.selectTeacherById(10001));

    }

    @Test
    public void testSelectAllTeachers(){

        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/spring-*.xml");
        TeacherService teacherService = context.getBean(TeacherService.class);

        List<Teacher> teacherList = teacherService.selectAllTeachers();

        for(Teacher t : teacherList){
            System.out.println(t);
        }

    }

}
