package com.shpun.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.shpun.pojo.Student;
import com.shpun.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {

    public static final int PAGE_SIZE = 5;

    @Autowired
    private StudentService studentService;

    @RequestMapping(value = "/insert",method = RequestMethod.POST)
    public String insertStudent(Student student){

        studentService.insertStudent(student);

        return "redirect:/manager/student";
    }

    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    public String deleteStudent(int studentId){

        studentService.deleteStudent(studentId);

        return "redirect:/manager/student";
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public String updateStudent(Student student){

        studentService.updateStudent(student);

        return "redirect:/manager/student";
    }

    @RequestMapping(value = "/search",method = RequestMethod.GET)
    public ModelAndView searchStudent(@RequestParam(value = "pnS",defaultValue = "1")Integer pnS,String searchStudent){

        PageHelper.startPage(pnS,PAGE_SIZE);

        List<Student> studentList = studentService.searchFromStudent(searchStudent);

        PageInfo<Student> studentPageInfo = new PageInfo<>(studentList);

        ModelAndView mv = new ModelAndView();
        mv.setViewName("studentResult");
        mv.addObject("studentPageInfo",studentPageInfo);

        return mv;

    }

}
