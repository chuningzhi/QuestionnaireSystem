package xyz.cnzgr.entity;

import org.springframework.stereotype.Component;

import java.io.Serializable;

@Component("answer")
public class Answer implements Serializable{
	private int answer_id;
	private String answer;
	private int question_id;
	
	
	public int getAnswer_id() {
		return answer_id;
	}
	public void setAnswer_id(int answer_id) {
		this.answer_id = answer_id;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public int getQuestion_id() {
		return question_id;
	}
	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}
	@Override
	public String toString() {
		return "Answer [answer_id=" + answer_id + ", answer=" + answer + ", question_id=" + question_id + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((answer == null) ? 0 : answer.hashCode());
		result = prime * result + answer_id;
		result = prime * result + question_id;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Answer other = (Answer) obj;
		if (answer == null) {
			if (other.answer != null)
				return false;
		} else if (!answer.equals(other.answer))
			return false;
		if (answer_id != other.answer_id)
			return false;
		if (question_id != other.question_id)
			return false;
		return true;
	}
	public Answer(int answer_id, String answer, int question_id) {
		super();
		this.answer_id = answer_id;
		this.answer = answer;
		this.question_id = question_id;
	}
	public Answer() {
		super();
	}
	public Answer(String answer, int question_id) {
		super();
		this.answer = answer;
		this.question_id = question_id;
	}
	
	
	
}
