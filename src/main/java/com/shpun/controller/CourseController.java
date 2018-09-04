package com.shpun.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.shpun.pojo.Course;
import com.shpun.pojo.RequestCourse;
import com.shpun.pojo.Student;
import com.shpun.pojo.Teacher;
import com.shpun.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/course")
public class CourseController {

    public static final int PAGE_SIZE = 5;

    @Autowired
    private CourseService courseService;

    @RequestMapping(value = "/insert",method = RequestMethod.POST)
    public String insertStudent(RequestCourse requestCourse){

        Course course = new Course();
        course.setCourseName(requestCourse.getCourseName());

        Teacher teacher = new Teacher();
        teacher.setTeacherId(requestCourse.getTeacherId());
        course.setTeacher(teacher);

        course.setCourseCredit(requestCourse.getCourseCredit());

        courseService.insertCourse(course);

        return "redirect:/manager/course";
    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    public String deleteStudent(int courseId){

        courseService.deleteCourse(courseId);

        return "redirect:/manager/course";
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public String updateStudent(RequestCourse requestCourse){

        Course course = new Course();
        course.setCourseId(requestCourse.getCourseId());
        course.setCourseName(requestCourse.getCourseName());

        Teacher teacher = new Teacher();
        teacher.setTeacherId(requestCourse.getTeacherId());
        course.setTeacher(teacher);

        course.setCourseCredit(requestCourse.getCourseCredit());

        courseService.updateCourse(course);

        return "redirect:/manager/course";
    }


    @RequestMapping(value = "/search",method = RequestMethod.GET)
    public ModelAndView searchStudent(@RequestParam(value = "pnC",defaultValue = "1")Integer pnC,String searchCourse){

        PageHelper.startPage(pnC,PAGE_SIZE);

        List<Course> courseList = courseService.searchFromCourse(searchCourse);

        PageInfo<Course> coursePageInfo = new PageInfo<>(courseList);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("courseResult");
        mv.addObject("coursePageInfo",coursePageInfo);

        return mv;
    }
}
