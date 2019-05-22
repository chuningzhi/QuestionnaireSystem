package xyz.cnzgr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import xyz.cnzgr.entity.Paper;
import xyz.cnzgr.entity.Question;
import xyz.cnzgr.entity.Teacher;
import xyz.cnzgr.server.QuestionServer;
import xyz.cnzgr.server.TeacherServer;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping
public class TeacherAction {
    @Resource(name = "teacherServer")
    private TeacherServer teacherServer;
    @Resource(name = "questionServer")
    private QuestionServer questionServer;

    @RequestMapping("/goLogin.do")
    public String goLogin(){
        return "login.jsp";
    }

    @RequestMapping("/login.do")
    public String loginAdmin(String username, String password, HttpServletRequest request){
        Teacher teacher = teacherServer.login(username,password);
        if(teacher==null){
            request.setAttribute("login_msg","您输入的账号密码有误！");
            return "login.jsp";
        }
        request.getSession().setAttribute("user",teacher);
        return "redirect:teacher/index.jsp";
    }

    @ResponseBody
    @RequestMapping("/logout.do")
    public String logoutAdmin(HttpServletRequest request){
        request.getSession().invalidate();
        return "";
    }


    @RequestMapping("/delePaper.do")
    public String delePaper(Paper paper){
        teacherServer.delePaper(paper);
        return "goQuestion.do";
    }

    @RequestMapping("/goQuestion.do")
    public String goQuestion(HttpServletRequest request){
        HttpSession session = request.getSession();
        List<Paper> papers = teacherServer.findPaperByTeacher((Teacher) session.getAttribute("user"));
        session.setAttribute("papers",papers);
        return "redirect:teacher/paperlist.jsp";
    }

    @RequestMapping("/toDetail.do")
    public String findQuestion(int paper_id,HttpServletRequest request){
        HttpSession session = request.getSession();
        List<Question> questions = questionServer.findQuesByPaperId(paper_id);
        session.setAttribute("paper_id",paper_id);
        session.setAttribute("questions",questions);
        return "teacher/question.jsp";
    }


    @RequestMapping("/updateTeacher.do")
    public String updateTeacher(Teacher teacher,HttpServletRequest request){
        teacherServer.updateTeacher(teacher);
        request.getSession().setAttribute("user",teacher);
        return "redirect:teacher/information.jsp";
    }

    public void setTeacherServer(TeacherServer teacherServer) {
        this.teacherServer = teacherServer;
    }

    public void setQuestionServer(QuestionServer questionServer) {
        this.questionServer = questionServer;
    }
}
