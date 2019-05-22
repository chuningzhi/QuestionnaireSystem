package xyz.cnzgr.server.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import xyz.cnzgr.dao.AnswerDao;
import xyz.cnzgr.dao.QuesDao;
import xyz.cnzgr.dao.TeacherDao;
import xyz.cnzgr.entity.Paper;
import xyz.cnzgr.entity.Teacher;
import xyz.cnzgr.server.TeacherServer;

import javax.annotation.Resource;
import java.util.List;

@Service("teacherServer")
public class TeacherServerImpl implements TeacherServer {

    @Autowired
    private TeacherDao teacherDao;

    @Override
    public Teacher login(String username, String password) {
        Teacher teacher = new Teacher();
        teacher.setUsername(username);
        teacher.setPassword(password);
        try {
            teacher = teacherDao.findByNameOrPassword(teacher);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return teacher;
    }

    @Override
    public List<Paper> findPaperByTeacher(Teacher teacher) {
        List<Paper> papers = teacherDao.findPaperByTeacherId(teacher.getId());
        return papers;
    }

    @Override
    public void delePaper(Paper paper) {
        teacherDao.delePaper(paper);
    }

    @Override
    public void updateTeacher(Teacher teacher) {
        teacherDao.updateTeacher(teacher);
    }

    public void setTeacherDao(TeacherDao teacherDao) {
        this.teacherDao = teacherDao;
    }
}
