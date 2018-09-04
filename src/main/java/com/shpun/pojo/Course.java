package com.shpun.pojo;

public class Course {

    private int courseId;
    private String courseName;
    private Teacher teacher;
    private int courseCredit;

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public int getCourseCredit() {
        return courseCredit;
    }

    public void setCourseCredit(int courseCredit) {
        this.courseCredit = courseCredit;
    }

    @Override
    public String toString() {
        return "course : id:"+this.getCourseId()+" name:"+this.getCourseName()+" teacherId:"+this.getTeacher().getTeacherId()+" credit:"+this.getCourseCredit()
                + "\n teacher : "+this.getTeacher();
    }
}
