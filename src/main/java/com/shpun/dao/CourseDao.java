package com.shpun.dao;

import com.shpun.pojo.Course;
import com.shpun.pojo.Student;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CourseDao {

    int insertCourse(Course course);

    int deleteCourse(int courseId);

    int updateCourse(Course course);

    List<Course> searchFromCourse(String s);

    Course selectCourseById(int courseId);

    List<Course> selectAllCourses();

}
