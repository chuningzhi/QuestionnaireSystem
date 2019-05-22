package xyz.cnzgr.dao;

import java.util.List;

import org.springframework.stereotype.Component;
import xyz.cnzgr.entity.Answer;

@Component("answerDao")
public interface AnswerDao {

	/**
	 * 根据题号查询所有的答案
	 * @return
	 */
	List<Answer> findAnswerByQuestion_id(int question_id);


	void deleAnswerByQuestionId(int question_id);

    void addAnswer(Answer answer);
}
