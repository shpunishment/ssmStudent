package com.shpun.service;

import com.shpun.pojo.Course;
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
public class TestCourseService {

    @Test
    public void testInsertCourse(){

        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/spring-*.xml");
        CourseService courseService = context.getBean(CourseService.class);

        Course course = new Course();
        course.setCourseName("Java");

        Teacher teacher = new Teacher();
        teacher.setTeacherId(10003);

        course.setTeacher(teacher);
        course.setCourseCredit(5);

        courseService.insertCourse(course);
        System.out.println("id:"+course.getCourseId());

    }

    @Test
    public void testDeleteCourse(){

        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/spring-*.xml");
        CourseService courseService = context.getBean(CourseService.class);

        courseService.deleteCourse(10010);

    }

    @Test
    public void testUpdateCourse(){

        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/spring-*.xml");
        CourseService courseService = context.getBean(CourseService.class);

        Course course = new Course();
        course.setCourseId(10009);
        course.setCourseName("Java");

        Teacher teacher = new Teacher();
        teacher.setTeacherId(10003);

        course.setTeacher(teacher);
        course.setCourseCredit(5);

        courseService.updateCourse(course);

    }

    @Test
    public void testSearchFromCourse(){

        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/spring-*.xml");
        CourseService courseService = context.getBean(CourseService.class);

        List<Course> courseList = courseService.searchFromCourse("C");

        for(Course c : courseList){
            System.out.println(c);
        }

    }

    @Test
    public void testSelectCourseById(){

        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/spring-*.xml");
        CourseService courseService = context.getBean(CourseService.class);

        System.out.println(courseService.selectCourseById(10001));

    }

    @Test
    public void testSelectAllCourses(){

        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/spring-*.xml");
        CourseService courseService = context.getBean(CourseService.class);

        List<Course> courseList = courseService.selectAllCourses();

        for(Course c : courseList){
            System.out.println(c);
        }

    }

}
