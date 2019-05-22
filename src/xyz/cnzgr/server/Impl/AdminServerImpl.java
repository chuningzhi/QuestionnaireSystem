package xyz.cnzgr.server.Impl;

import org.springframework.stereotype.Service;
import xyz.cnzgr.dao.AnswerDao;
import xyz.cnzgr.dao.QuesDao;
import xyz.cnzgr.dao.TeacherDao;
import xyz.cnzgr.entity.Admin;
import xyz.cnzgr.entity.Paper;
import xyz.cnzgr.entity.Question;
import xyz.cnzgr.entity.Teacher;
import xyz.cnzgr.server.AdminServer;

import javax.annotation.Resource;
import java.util.List;

@Service("adminServer")
public class AdminServerImpl implements AdminServer {
    @Resource(name = "teacherDao")
    private TeacherDao teacherDao;
    @Resource(name = "answerDao")
    private AnswerDao answerDao;
    @Resource(name = "quesDao")
    private QuesDao quesDao;

    
    @Override
    public List<Teacher> findAllTeacher() {
        List<Teacher> teachers = teacherDao.findAllTeacher();
        return teachers;
    }

    @Override
    public Admin loginAdmin(Admin admin) {
        admin = teacherDao.loginAdmin(admin);
        return admin;
    }

    @Override
    public void deleTeacher(int id) {
        teacherDao.deleTeacher(id);
        List<Paper> papers = teacherDao.findPaperByTeacherId(id);
        for (Paper paper : papers){
            teacherDao.delePaper(paper);
            for (Question question : paper.getQuestions()) {
                quesDao.deleQuestion(question);
                answerDao.deleAnswerByQuestionId(question.getQuestion_id());
            }
        }

    }

    @Override
    public void addTeacher(Teacher teacher) {
        teacherDao.addTeacher(teacher);
    }
}
