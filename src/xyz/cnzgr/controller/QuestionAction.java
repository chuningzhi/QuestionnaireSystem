package xyz.cnzgr.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import xyz.cnzgr.entity.Paper;
import xyz.cnzgr.entity.Question;
import xyz.cnzgr.server.Impl.QuestionServerImpl;
import xyz.cnzgr.server.QuestionServer;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@RequestMapping
@Controller
public class QuestionAction {
    @Resource(name = "questionServer")
    private QuestionServer questionServer;

    private Logger logger = Logger.getLogger(QuestionAction.class);


    @RequestMapping("/addQuestion.do")
    public String addQuestion(Question question, HttpServletRequest request){
        questionServer.addQuestion(question);
        return "toDetail.do?paper_id="+(question.getPaper_id());
    }

    @RequestMapping("/moveQuestion.do")
    public String moveQuestion(Question question,String move){
        questionServer.moveQustion(question,move);
        return "toDetail.do?paper_id="+(question.getPaper_id());
    }


    @RequestMapping("/deleQuestion.do")
    public String deleQuestion(Question question){
        questionServer.deleQuestion(question);
        return "toDetail.do?paper_id="+(question.getPaper_id());
    }

    @RequestMapping("/updateQuestion.do")
    public String updateQuestion(Question question){
        questionServer.updateQuestion(question);
        return "toDetail.do?paper_id="+(question.getPaper_id());
    }

    @RequestMapping("/addPaper.do")
    public String addPaper(Paper paper){
        questionServer.addPaper(paper);
        return "goQuestion.do";
    }

    @RequestMapping("/goQuestionnaire.do")
    public String goQuestionnaire(int paper_id,HttpServletRequest request){
        List<Question> questions = questionServer.findQuesByPaperId(paper_id);
        HttpSession session = request.getSession();
        session.setAttribute("paper_id",paper_id);
        session.setAttribute("questions",questions);
        return "question.jsp";
    }

    public void setQuestionServer(QuestionServer questionServer) {
        this.questionServer = questionServer;
    }
}
