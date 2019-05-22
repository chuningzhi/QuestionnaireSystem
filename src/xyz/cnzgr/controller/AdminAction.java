package xyz.cnzgr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import xyz.cnzgr.dao.AnswerDao;
import xyz.cnzgr.entity.Admin;
import xyz.cnzgr.entity.Teacher;
import xyz.cnzgr.server.AdminServer;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping
public class AdminAction {
    @Resource(name = "adminServer")
    private AdminServer adminServer;

    @RequestMapping("/loginAdmin.do")
    public String login(Admin admin,HttpServletRequest request){
        admin = adminServer.loginAdmin(admin);
        if(admin == null){
            request.setAttribute("login_msg","您输入的账号密码有误，请重新输入！");
            return "loginAdmin.jsp";
        }
        request.getSession().setAttribute("admin",admin);
        return "teacherList.do";
    }

    @RequestMapping("/teacherList.do")
    public String teacherList(HttpServletRequest request){
        List<Teacher> teachers = adminServer.findAllTeacher();
        request.getSession().setAttribute("teacherList",teachers);
        return "redirect:admin/teacherList.jsp";
    }

    @RequestMapping("/deleTeacher.do")
    public String deleTeacher(int id){
        adminServer.deleTeacher(id);
        return "teacherList.do";
    }

    @RequestMapping("/addTeacher.do")
    public String addTeacher(Teacher teacher){
        adminServer.addTeacher(teacher);
        return "teacherList.do";
    }

    @RequestMapping("/logoutAdmin.do")
    public String logoutAdmin(HttpServletRequest request){
        request.getSession().removeAttribute("admin");
        return "loginAdmin.jsp";
    }


    public void setAdminServer(AdminServer adminServer) {
        this.adminServer = adminServer;
    }
}
