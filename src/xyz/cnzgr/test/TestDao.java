package xyz.cnzgr.test;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import xyz.cnzgr.dao.QuesDao;
import xyz.cnzgr.dao.TeacherDao;
import xyz.cnzgr.entity.Paper;
import xyz.cnzgr.entity.Question;
import xyz.cnzgr.entity.Teacher;

import java.util.List;

public class TestDao {

    private Logger logger = LogManager.getLogger(TestDao.class.getName());
    @Test
    public void testUserDao() throws Exception {
        ApplicationContext ac = new ClassPathXmlApplicationContext("spring_config.xml");
        /*TeacherDao td = ac.getBean(TeacherDao.class);
        Teacher teacher = new Teacher();
        teacher.setUsername("admin");
        teacher.setPassword("admin");
        teacher =td.findByNameOrPassword(teacher);
        System.out.println(teacher);*/
        QuesDao quesDao = ac.getBean(QuesDao.class);
        Question question = new Question();
        /*question.setQuestion("您所在年级？");
        question.setPaper_id(1);
        question.setQuestion_type("tk");
        question.setQue_num(10);*/
        question.setQue_num(3);
        question.setPaper_id(2);
        quesDao.moveQuestion(question,-1);
       /* List<Paper> papers = td.findPaperByTeacherId(2);
        for (Paper p : papers){
            System.out.println(p);
        }*/
    }


    @Test
    public void testTeacherDao() throws Exception {
        ApplicationContext ac = new ClassPathXmlApplicationContext("spring_config.xml");
        TeacherDao td = ac.getBean(TeacherDao.class);
        List<Paper> papers = td.findPaperByTeacherId(2);
        logger.info(papers.get(0).getQuestions().get(0).getA());
        logger.info(papers.get(0).getQuestions().get(0).getAnswers());
//        System.out.println(papers.get(0).getId());
//        System.out.println(papers);
    }
}
