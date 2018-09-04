package com.shpun.service;

import com.shpun.pojo.Course;

import java.util.List;

public interface CourseService {

    int insertCourse(Course course);

    int deleteCourse(int courseId);

    int updateCourse(Course course);

    List<Course> searchFromCourse(String s);

    Course selectCourseById(int courseId);

    List<Course> selectAllCourses();

}
