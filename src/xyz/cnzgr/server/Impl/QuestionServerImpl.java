package xyz.cnzgr.server.Impl;

import org.springframework.stereotype.Service;
import xyz.cnzgr.dao.AnswerDao;
import xyz.cnzgr.dao.QuesDao;
import xyz.cnzgr.entity.Paper;
import xyz.cnzgr.entity.Question;
import xyz.cnzgr.server.QuestionServer;

import javax.annotation.Resource;
import java.util.Collections;
import java.util.List;

@Service("questionServer")
public class QuestionServerImpl implements QuestionServer {
    @Resource
    private QuesDao quesDao;
    @Resource
    private AnswerDao answerDao;

    @Override
    public List<Question> findQuesByPaperId(int paper_id) {
        List<Question> questions = quesDao.findAllQuesByPaperId(paper_id);
        Collections.sort(questions);
        return questions;
    }

    @Override
    public void addQuestion(Question question) {
        quesDao.addQuestion(question);
    }

    @Override
    public void moveQustion(Question question, String move) {
        if(move.equals("sy")){
            try {
                int que_num = 0;
                quesDao.moveQuestion(question,0);
                que_num=question.getQue_num();
                question.setQue_num(que_num-1);
                quesDao.moveQuestion(question,que_num);
                question.setQue_num(0);
                quesDao.moveQuestion(question,que_num-1);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else if(move.equals("xy")){
            try {
                int que_num = 0;
                quesDao.moveQuestion(question,0);
                que_num=question.getQue_num();
                question.setQue_num(que_num+1);
                quesDao.moveQuestion(question,que_num);
                question.setQue_num(0);
                quesDao.moveQuestion(question,que_num+1);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void deleQuestion(Question question) {
        quesDao.deleQuestion(question);
        List<Question> questions = quesDao.findAllQuesByPaperId(question.getPaper_id());
        answerDao.deleAnswerByQuestionId(question.getQuestion_id());
        Collections.sort(questions);
        for (Question question1 : questions){
            if (question1.getQue_num()>question.getQue_num()){
                quesDao.moveQuestion(question1,question1.getQue_num()-1);
            }
        }
    }

    @Override
    public void updateQuestion(Question question) {
        quesDao.updateQuestion(question);
    }

    @Override
    public void addPaper(Paper paper) {
        quesDao.addPaper(paper);
    }


    public void setQuesDao(QuesDao quesDao) {
        this.quesDao = quesDao;
    }

    public void setAnswerDao(AnswerDao answerDao) {
        this.answerDao = answerDao;
    }
}
