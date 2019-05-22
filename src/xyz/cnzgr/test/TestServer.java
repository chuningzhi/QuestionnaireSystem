package xyz.cnzgr.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import xyz.cnzgr.server.Impl.AnswerServerImpl;

import java.util.List;

public class TestServer {
    @Test
    public void testServer(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("spring_config.xml");
        AnswerServerImpl s = ac.getBean("answerServer", AnswerServerImpl.class);
        List<Double> list =s.findScaleNoTkByPaperID(1,"1");
        System.out.println(list);


    }
}
