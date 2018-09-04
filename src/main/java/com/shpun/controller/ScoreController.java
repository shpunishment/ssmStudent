package com.shpun.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.shpun.pojo.*;
import com.shpun.service.ScoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/score")
public class ScoreController {

    public static final int PAGE_SIZE = 5;

    @Autowired
    private ScoreService scoreService;

    @RequestMapping(value = "/insert",method = RequestMethod.POST)
    public String insertStudent(RequestScore requestScore){

        Score score = new Score();

        Course course = new Course();
        course.setCourseId(requestScore.getCourseId());
        Student student = new Student();
        student.setStudentId(requestScore.getStudentId());

        score.setCourse(course);
        score.setStudent(student);
        score.setStuCouScore(requestScore.getCourseScore());

        scoreService.insertScore(score);

        return "redirect:/manager/score";
    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    public String deleteStudent(@RequestParam("studentId") int studentId,@RequestParam("courseId") int courseId){

        Score score = new Score();

        Student student = new Student();
        student.setStudentId(studentId);
        Course course = new Course();
        course.setCourseId(courseId);

        score.setCourse(course);
        score.setStudent(student);

        scoreService.deleteScore(score);

        return "redirect:/manager/score";
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public String updateStudent(RequestScore requestScore){

        Score score = new Score();

        Course course = new Course();
        course.setCourseId(requestScore.getCourseId());
        Student student = new Student();
        student.setStudentId(requestScore.getStudentId());

        score.setCourse(course);
        score.setStudent(student);
        score.setStuCouScore(requestScore.getCourseScore());

        scoreService.updateScore(score);

        return "redirect:/manager/score";
    }


    @RequestMapping(value = "/search",method = RequestMethod.GET)
    public ModelAndView searchStudent(@RequestParam(value = "pnSC",defaultValue = "1")Integer pnSC,String searchStuCou){

        PageHelper.startPage(pnSC,PAGE_SIZE);

        List<Score> scoreList = scoreService.searchFromScore(searchStuCou);

        PageInfo<Score> scorePageInfo = new PageInfo<>(scoreList);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("scoreResult");
        mv.addObject("scorePageInfo",scorePageInfo);

        return mv;

    }

}
