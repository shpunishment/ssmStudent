package com.shpun.service;

import com.shpun.pojo.Course;
import com.shpun.pojo.Score;
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
public class TestScoreService {

    @Test
    public void testInsertScore(){

        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/spring-*.xml");
        ScoreService scoreService = context.getBean(ScoreService.class);

        Score score = new Score();

        Student student = new Student();
        student.setStudentId(10103);
        Course course = new Course();
        course.setCourseId(10004);

        score.setStudent(student);
        score.setCourse(course);
        score.setStuCouScore(68);

        scoreService.insertScore(score);

    }

    @Test
    public void testDeleteScore(){

        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/spring-*.xml");
        ScoreService scoreService = context.getBean(ScoreService.class);

        Score score = new Score();

        Student student = new Student();
        student.setStudentId(10103);
        Course course = new Course();
        course.setCourseId(10003);

        score.setStudent(student);
        score.setCourse(course);

        scoreService.deleteScore(score);

    }

    @Test
    public void testUpdateScore(){

        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/spring-*.xml");
        ScoreService scoreService = context.getBean(ScoreService.class);

        Score score = new Score();

        Student student = new Student();
        student.setStudentId(10105);
        Course course = new Course();
        course.setCourseId(10004);

        score.setStudent(student);
        score.setCourse(course);
        score.setStuCouScore(77);

        scoreService.updateScore(score);

    }

    @Test
    public void testSearchFromScore(){

        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/spring-*.xml");
        ScoreService scoreService = context.getBean(ScoreService.class);

        List<Score> scoreList = scoreService.searchFromScore("94");

        for(Score s : scoreList){
            System.out.println(s);
        }

    }

    @Test
    public void testSelectScoreById(){

        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/spring-*.xml");
        ScoreService scoreService = context.getBean(ScoreService.class);

        Score score = new Score();

        Student student = new Student();
        student.setStudentId(10102);
        Course course = new Course();
        course.setCourseId(10002);

        score.setStudent(student);
        score.setCourse(course);

        System.out.println(scoreService.selectScoreById(score));

    }

    @Test
    public void testSelectAllScores(){

        ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/spring-*.xml");
        ScoreService scoreService = context.getBean(ScoreService.class);

        List<Score> scoreList = scoreService.selectAllScores();

        for(Score s : scoreList){
            System.out.println(s);
        }

    }

}
