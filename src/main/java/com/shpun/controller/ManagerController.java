package com.shpun.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.shpun.pojo.Course;
import com.shpun.pojo.Score;
import com.shpun.pojo.Student;
import com.shpun.service.CourseService;
import com.shpun.service.ScoreService;
import com.shpun.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/manager")
public class ManagerController {

    public static final int PAGE_SIZE = 5;

    @Autowired
    private StudentService studentService;

    @Autowired
    private CourseService courseService;

    @Autowired
    private ScoreService scoreService;

    /**
     * 返回student.jsp
     * @param pnS
     * @return
     */
    @RequestMapping("/student")
    public ModelAndView getStudent(@RequestParam(value = "pnS",defaultValue = "1")Integer pnS){

        PageHelper.startPage(pnS,PAGE_SIZE);

        List<Student> studentList = studentService.selectAllStudents();

        PageInfo<Student> studentPageInfo = new PageInfo<>(studentList);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("student");
        mv.addObject("studentPageInfo",studentPageInfo);

        return mv;

    }

    /**
     * 返回course.jsp
     * @param pnC
     * @return
     */
    @RequestMapping("/course")
    public ModelAndView getCourse(@RequestParam(value = "pnC",defaultValue = "1")Integer pnC){

        PageHelper.startPage(pnC,PAGE_SIZE);

        List<Course> courseList = courseService.selectAllCourses();

        PageInfo<Course> coursePageInfo = new PageInfo<>(courseList);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("course");
        mv.addObject("coursePageInfo",coursePageInfo);

        return mv;

    }

    /**
     * 返回score.jsp
     * @param pnSC
     * @return
     */
    @RequestMapping("/score")
    public ModelAndView getScore(@RequestParam(value = "pnSC",defaultValue = "1")Integer pnSC){

        PageHelper.startPage(pnSC,PAGE_SIZE);

        List<Score> scoreList = scoreService.selectAllScores();

        PageInfo<Score> scorePageInfo = new PageInfo<>(scoreList);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("score");
        mv.addObject("scorePageInfo",scorePageInfo);

        return mv;

    }

}
