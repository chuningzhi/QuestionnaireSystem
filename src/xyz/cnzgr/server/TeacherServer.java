package xyz.cnzgr.server;

import xyz.cnzgr.entity.Paper;
import xyz.cnzgr.entity.Teacher;

import java.util.List;

public interface TeacherServer {

    /**
     * 老师登陆
     * @param username
     * @param password
     * @return
     */
    Teacher login(String username, String password);


    List<Paper> findPaperByTeacher(Teacher teacher);

    void delePaper(Paper paper);

    void updateTeacher(Teacher teacher);
}
