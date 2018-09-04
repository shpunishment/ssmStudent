package com.shpun.pojo;

public class Teacher {

    private int teacherId;
    private String teacherName;
    private String teacherJobTitle;

    public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public String getTeacherJobTitle() {
        return teacherJobTitle;
    }

    public void setTeacherJobTitle(String teacherJobTitle) {
        this.teacherJobTitle = teacherJobTitle;
    }

    @Override
    public String toString() {
        return "teacher : id:"+this.getTeacherId()+" name:"+this.getTeacherName()+" jobTitle:"+this.getTeacherJobTitle();
    }
}
