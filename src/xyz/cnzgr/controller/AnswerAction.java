package xyz.cnzgr.controller;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import xyz.cnzgr.entity.Answer;
import xyz.cnzgr.entity.Paper;
import xyz.cnzgr.entity.Question;
import xyz.cnzgr.entity.Teacher;
import xyz.cnzgr.server.AnswerServer;
import xyz.cnzgr.server.QuestionServer;
import xyz.cnzgr.server.TeacherServer;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping
public class AnswerAction {
    @Resource(name = "teacherServer")
    private TeacherServer teacherServer;
    @Resource(name = "answerServer")
    private AnswerServer answerServer ;
    @Resource(name = "questionServer")
    private QuestionServer questionServer;

    @RequestMapping("/findAllAns.do")
    public String findAllAns(HttpServletRequest request){
        HttpSession session = request.getSession();
        List<Paper> papers = teacherServer.findPaperByTeacher((Teacher) session.getAttribute("user"));
        session.setAttribute("papers",papers);
        return "redirect:teacher/paperlistAns.jsp";
    }

    @RequestMapping("/toAnsDetail.do")
    public String toAnsDetail(int paper_id,HttpServletRequest request){
        request.getSession().setAttribute("paper_id",paper_id);
        Map<Integer,List<Double>> scalesNoTk=answerServer.findScalesNoTkByPaperID(paper_id);
        request.getSession().setAttribute("scalesNoTk",scalesNoTk);
        Map<Integer,List<Answer>> scalesTk=answerServer.findScalesTkByPaperID(paper_id);
        request.getSession().setAttribute("scalesTk",scalesTk);
        System.out.println(scalesTk);
        return "teacher/analyze.jsp";
    }

    @RequestMapping("/addAnswer.do")
    public String addAnswer(HttpServletRequest request){
        List<Answer> listAns = new ArrayList<>();
        HttpSession session = request.getSession();
        List<Question> questions = (List<Question>) session.getAttribute("questions");
        for (Question que : questions) {
            String str = "";
            String[] arrAns = request.getParameterValues(que.getQuestion_id()+"");
            for (String s : arrAns) {
                str = str +" "+s;
                str = str.trim();
            }
            listAns.add(new Answer(str, que.getQuestion_id()));
        }
        answerServer.addAnswer(listAns);
        return "redirect:thank.jsp";
    }

    @RequestMapping("/gainData.do")
    @ResponseBody
    public void gainData(String paper_id, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        Map<String, List<Integer>> countsNoTk = answerServer.findCountNoTkByPaperID(Integer.parseInt(paper_id));
        JSONObject countsNoTkO = JSONObject.fromObject(countsNoTk);
        out.print(countsNoTkO.toString());
        out.close();
    }

    @RequestMapping("/gainDataShan.do")
    @ResponseBody
    public void gainDataShan(String paper_id,String question_num, HttpServletResponse response) throws IOException {
        PrintWriter out = response.getWriter();
        List<Double> scaleNoTk =  answerServer.findScaleNoTkByPaperID(Integer.parseInt(paper_id),question_num);
        JSONArray scaleNoTkO = JSONArray.fromObject(scaleNoTk);
        out.print(scaleNoTkO.toString());
        out.close();
    }

    public void setTeacherServer(TeacherServer teacherServer) {
        this.teacherServer = teacherServer;
    }

    public void setAnswerServer(AnswerServer answerServer) {
        this.answerServer = answerServer;
    }
}
