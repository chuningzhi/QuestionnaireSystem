package xyz.cnzgr.server.Impl;

import org.springframework.stereotype.Service;
import xyz.cnzgr.dao.AnswerDao;
import xyz.cnzgr.dao.QuesDao;
import xyz.cnzgr.dao.TeacherDao;
import xyz.cnzgr.entity.Answer;
import xyz.cnzgr.entity.Question;
import xyz.cnzgr.server.AnswerServer;

import javax.annotation.Resource;
import java.text.DecimalFormat;
import java.util.*;

@Service("answerServer")
public class AnswerServerImpl implements AnswerServer {
    @Resource(name = "answerDao")
    private AnswerDao answerDao;
    @Resource(name = "teacherDao")
    private TeacherDao teacherDao;
    @Resource(name = "quesDao")
    private QuesDao quesDao;

    @Override
    public Map<Integer,List<Answer>> findAnsNoTkByPaperId(int paper_id) {
        List<Question> questions = quesDao.findAllQuesByPaperId(paper_id);
        Collections.sort(questions);
        Map<Integer,List<Answer>> answersNoTk = new HashMap<>();
        for (Question question :questions){
            if(!question.getQuestion_type().equals("tk")){
                answersNoTk.put(question.getQue_num(),question.getAnswers());
            }
        }
        return answersNoTk;
    }

    @Override
    public Map<String,List<Integer>> findCountNoTkByPaperID(int paper_id) {
        Map<Integer,List<Answer>> answersNoTk= this.findAnsNoTkByPaperId(paper_id);
        Map<String,List<Integer>> answersCountNotk = new HashMap<>();
        Set<Integer> keySet = answersNoTk.keySet();
        for (Integer i :keySet){
            List<Integer> integers = this.answerCount(answersNoTk,i);
            answersCountNotk.put(i+"",integers);
        }
        return answersCountNotk;
    }

    @Override
    public List<Double> findScaleNoTkByPaperID(int paper_id, String question_id) {
        Map<String, List<Integer>> answersCountNotk = this.findCountNoTkByPaperID(paper_id);
        List<Integer> answers = answersCountNotk.get(question_id);
        Set<String> keySet = answersCountNotk.keySet();
        List<Double> scaleNoTk = new ArrayList<>();
        double count = 0;
        for (Integer i : answers){
            count +=i;
        }
        DecimalFormat df = new DecimalFormat("0.00");
        if(count == 0){
            count = 1;
        }
        scaleNoTk.add(Double.parseDouble(df.format(answers.get(0)/count)));
        scaleNoTk.add(Double.parseDouble(df.format(answers.get(1)/count)));
        scaleNoTk.add(Double.parseDouble(df.format(answers.get(2)/count)));
        scaleNoTk.add(Double.parseDouble(df.format(answers.get(3)/count)));
        return scaleNoTk;
    }

    @Override
    public Map<Integer, List<Double>> findScalesNoTkByPaperID(int paper_id) {
        Map<Integer, List<Double>> scalesNoTk = new HashMap<>();
        Map<String, List<Integer>> answersCountNotk = this.findCountNoTkByPaperID(paper_id);
        Set<String> keySet = answersCountNotk.keySet();
        for (String key :keySet){
            List<Double> scaleNoTk = this.findScaleNoTkByPaperID(paper_id, key);
            scalesNoTk.put(Integer.parseInt(key),scaleNoTk);
        }
        return scalesNoTk;
    }

    @Override
    public Map<Integer, List<Answer>> findScalesTkByPaperID(int paper_id) {
        List<Question> questions = quesDao.findAllQuesByPaperId(paper_id);
        Collections.sort(questions);
        Map<Integer, List<Answer>> answersTk = new HashMap<>();
        List<String> list = new ArrayList<>();
        for (Question question :questions){
            if(question.getQuestion_type().equals("tk")){
                answersTk.put(question.getQue_num(),question.getAnswers());
            }
        }
        return answersTk;
    }

    @Override
    public void addAnswer(List<Answer> listAns) {
        for (Answer answer : listAns) {
            try {
                answerDao.addAnswer(answer);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }


    public List<Integer> answerCount(Map<Integer,List<Answer>> answersNoTk,int i){
        List<Integer> listInt = new ArrayList<Integer>();
        int countA = 0;
        int countB = 0;
        int countC = 0;
        int countD = 0;
        for (Answer answer : answersNoTk.get(i)){
            String[] ans = answer.getAnswer().split(" ");
            for (String str : ans) {
                if(str.equals("A")){
                    countA++;
                }else if(str.equals("B")){
                    countB++;
                }else if(str.equals("C")){
                    countC++;
                }else{
                    countD++;
                }
            }
        }
        listInt.add(countA);
        listInt.add(countB);
        listInt.add(countC);
        listInt.add(countD);
        return listInt;
    }












    public void setAnswerDao(AnswerDao answerDao) {
        this.answerDao = answerDao;
    }

    public void setTeacherDao(TeacherDao teacherDao) {
        this.teacherDao = teacherDao;
    }


}
