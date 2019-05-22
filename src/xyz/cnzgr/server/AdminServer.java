package xyz.cnzgr.server;

import xyz.cnzgr.entity.Admin;
import xyz.cnzgr.entity.Teacher;

import java.util.List;

public interface AdminServer {
    List<Teacher> findAllTeacher();

    Admin loginAdmin(Admin admin);

    void deleTeacher(int id);

    void addTeacher(Teacher teacher);
}
