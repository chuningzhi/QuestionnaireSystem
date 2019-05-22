package xyz.cnzgr.dao;


import xyz.cnzgr.entity.Admin;
import xyz.cnzgr.entity.Paper;
import xyz.cnzgr.entity.Teacher;

import java.util.List;

public interface TeacherDao {

	List<Teacher> findAllTeacher();
	/**
	 * 通过用户名和密码查找用户
	 * @param
	 * @return
	 * @throws Exception
	 */
	Teacher findByNameOrPassword(Teacher teacher);
	

	List<Paper> findPaperByTeacherId(int teacher_id);


    void delePaper(Paper paper);

    void updateTeacher(Teacher teacher);

    Admin loginAdmin(Admin admin);

	void deleTeacher(int id);

	void addTeacher(Teacher teacher);
}
