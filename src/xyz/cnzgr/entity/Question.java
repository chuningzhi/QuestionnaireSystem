package xyz.cnzgr.entity;

import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.util.List;

@Component("question")
public class Question implements Serializable,Comparable {
	private int question_id;
	private String question;
	private String A;
	private String B;
	private String C;
	private String D;
	private String question_type;
	private int que_num;
	private int paper_id;
	private List<Answer> answers;

	@Override
	public String toString() {
		return "Question{" +
				"question_id=" + question_id +
				", question='" + question + '\'' +
				", A='" + A + '\'' +
				", B='" + B + '\'' +
				", C='" + C + '\'' +
				", D='" + D + '\'' +
				", question_type='" + question_type + '\'' +
				", que_num=" + que_num +
				", paper_id=" + paper_id +
				", answers=" + answers +
				'}';
	}

	public Question() {
	}

	public List<Answer> getAnswers() {
		return answers;
	}

	public void setAnswers(List<Answer> answers) {
		this.answers = answers;
	}

	public int getQuestion_id() {
		return question_id;
	}

	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getA() {
		return A;
	}

	public void setA(String a) {
		A = a;
	}

	public String getB() {
		return B;
	}

	public void setB(String b) {
		B = b;
	}

	public String getC() {
		return C;
	}

	public void setC(String c) {
		C = c;
	}

	public String getD() {
		return D;
	}

	public void setD(String d) {
		D = d;
	}

	public String getQuestion_type() {
		return question_type;
	}

	public void setQuestion_type(String question_type) {
		this.question_type = question_type;
	}

	public int getQue_num() {
		return que_num;
	}

	public void setQue_num(int que_num) {
		this.que_num = que_num;
	}

	public int getPaper_id() {
		return paper_id;
	}

	public void setPaper_id(int paper_id) {
		this.paper_id = paper_id;
	}


	@Override
	public int compareTo(Object o) {
		if (!o.equals(null)){
			Question question = (Question) o;
			return this.que_num - question.que_num;
		}
		return 0;
	}
}
