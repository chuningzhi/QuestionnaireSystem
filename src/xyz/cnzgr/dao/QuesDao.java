package xyz.cnzgr.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import xyz.cnzgr.entity.Paper;
import xyz.cnzgr.entity.Question;

/**
 * 封装对数据库访问逻辑的api方法
 * @author Administrator
 *
 */
public interface QuesDao {




    /**
     * 增加题目
     * @param question
     */
    void addQuestion(Question question);

    /**
     * 通过试卷ID查询所有的题目
     * @param paperId   试卷ID
     * @return
     */
    public List<Question> findAllQuesByPaperId(int paperId);

    /**
     * 移动题目
     * @param question
     * @param i
     */
    void moveQuestion(@Param("question") Question question, @Param("i") int i);

    /**
     * 删除题目
     * @param question
     */
    void deleQuestion(Question question);

    /**
     * 修改题目
     * @param question
     */
    void updateQuestion(Question question);

    /**
     * 增加题目
     * @param paper
     */
    void addPaper(Paper paper);

    /**
     * 查找所有的题目
     * @param paper_id
     */
    void findAllQuestion(int paper_id);
}
