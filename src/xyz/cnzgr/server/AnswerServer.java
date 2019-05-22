package xyz.cnzgr.server;

import xyz.cnzgr.entity.Answer;

import java.util.List;
import java.util.Map;

public interface AnswerServer {

    Map<Integer,List<Answer>> findAnsNoTkByPaperId(int paper_id);

    Map<String,List<Integer>> findCountNoTkByPaperID(int paper_id);

    List<Double> findScaleNoTkByPaperID(int paper_id,String question_id);

    Map<Integer, List<Double>> findScalesNoTkByPaperID(int paper_id);

    Map<Integer, List<Answer>> findScalesTkByPaperID(int paper_id);

    void addAnswer(List<Answer> listAns);
}
