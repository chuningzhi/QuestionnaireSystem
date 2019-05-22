package xyz.cnzgr.entity;

import org.springframework.stereotype.Component;

import java.io.Serializable;
import java.util.List;

@Component("paper")
public class Paper implements Serializable {
    private int id;
    private int teacher_id;
    private String paper_name;
    private List<Question> questions;

    public Paper() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTeacher_id() {
        return teacher_id;
    }

    public void setTeacher_id(int teacher_id) {
        this.teacher_id = teacher_id;
    }

    public String getPaper_name() {
        return paper_name;
    }

    public void setPaper_name(String paper_name) {
        this.paper_name = paper_name;
    }

    public List<Question> getQuestions() {
        return questions;
    }

    public void setQuestions(List<Question> questions) {
        this.questions = questions;
    }

    @Override
    public String toString() {
        return "Paper{" +
                "id=" + id +
                ", teacher_id=" + teacher_id +
                ", paper_name='" + paper_name + '\'' +
                ", questions=" + questions +
                '}';
    }
}
