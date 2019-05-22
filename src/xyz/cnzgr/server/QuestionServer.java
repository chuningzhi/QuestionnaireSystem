package xyz.cnzgr.server;

import xyz.cnzgr.entity.Paper;
import xyz.cnzgr.entity.Question;

import java.util.List;

public interface QuestionServer {

    public List<Question> findQuesByPaperId(int paper_id);

    public void addQuestion(Question question);

    void moveQustion(Question question, String move);

    void deleQuestion(Question question);

    void updateQuestion(Question question);

    void addPaper(Paper paper);
}
