$(document).ready(function(e) {
    paper_id = $("#paper_id").val();
    $(".xxk_title li").click(function(){
        var xxkjs = $(this).index();
        $(this).addClass("on").siblings().removeClass("on");
        $(".xxk_conn").children(".xxk_xzqh_box").eq(xxkjs).show().siblings().hide();

    });
    //鼠标移上去显示按钮
    $(".movie_box").hover(function(){

        var quenum = $(this).find("ul").find("a").text();
        var	html_cz = "<div class='kzqy_czbut'><a href='../moveQuestion.do?move=sy&que_num="+quenum+"&paper_id="+paper_id +"' class='sy'>上移</a><a href='../moveQuestion.do?move=xy&que_num="+quenum+"&paper_id="+paper_id +"' class='xy'>下移</a><a href='#'  class='bianji'>编辑</a><a href='../deleQuestion.do?que_num="+quenum+"&paper_id="+paper_id +"'class='del' >删除</a></div>"
        $(this).css({"border":"1px solid #0099ff"});
        $(this).children(".wjdc_list").after(html_cz);
    },function(){
        $(this).css({"border":"1px solid #fff"});
        $(this).children(".kzqy_czbut").remove();
    });

    //下移
    $(".xy").live("click", function() {
        //文字的长度
        var leng = $(".yd_box").children(".movie_box").length;
        var dqgs = $(this).parent(".kzqy_czbut").parent(".movie_box").index();
        if(dqgs < leng-1){
            var czxx = $(this).parent(".kzqy_czbut").parent(".movie_box");
            var xyghtml = czxx.next().html();
            var syghtml = czxx.html();
            czxx.next().html(syghtml);
            czxx.html(xyghtml);
            //序号
            czxx.children(".wjdc_list").find(".nmb").text(dqgs+1);
            czxx.next().children(".wjdc_list").find(".nmb").text(dqgs+2);
        }else{
            alert("到底了");
        }
    });
    //上移
    $(".sy").live("click", function() {
        //文字的长度
        var leng = $(".yd_box").children(".movie_box").length;
        var dqgs = $(this).parent(".kzqy_czbut").parent(".movie_box").index();
        if(dqgs > 0){
            var czxx = $(this).parent(".kzqy_czbut").parent(".movie_box");
            var xyghtml = czxx.prev().html();
            var syghtml = czxx.html();
            czxx.prev().html(syghtml);
            czxx.html(xyghtml);
            //序号
            czxx.children(".wjdc_list").find(".nmb").text(dqgs+1);
            czxx.prev().children(".wjdc_list").find(".nmb").text(dqgs);

        }else{
            alert("到头了");
        }
    });
    //删除
    $(".del").live("click", function() {
        var czxx = $(this).parent(".kzqy_czbut").parent(".movie_box");
        var zgtitle_gs = czxx.parent(".yd_box").find(".movie_box").length;
        var xh_num = 0;
        //重新编号
        if(confirm("确定删除该题目？")){
            czxx.parent(".yd_box").find(".movie_box").each(function() {
                czxx.remove();
                var quenum = $(this).parent().parent().find("ul").find("a").text();
                $(".yd_box").children(".movie_box").eq(xh_num).find(".nmb").text(++xh_num);
            });
            return true;
        }
        return false;
    });

    //编辑
    $(".bianji").live("click", function() {
        //编辑的时候禁止其他操作
        $(this).siblings().hide();
        //获取当前题目的题号
        var quenum = $(this).parent().parent().find("ul").find("a").text();
        var dxtm = $("#xx_box").html();
        var duoxtm = $("#dx_box").html();
        var tktm = $("#tk_box").html();
        //接受编辑内容的容器
        var dx_rq = $(this).parent(".kzqy_czbut").parent(".movie_box").find(".dx_box");
        var title = dx_rq.attr("data-t");
        //题目选项的个数
        var timlrxm = $(this).parent(".kzqy_czbut").parent(".movie_box").children(".wjdc_list").children("li").length;

        //单选题目
        if(title==0){
            dx_rq.show().html(dxtm);
            $(this).parent(".kzqy_czbut").parent(".movie_box").find(".dx_box").find("form").attr("action","../updateQuestion.do?question_type=xx&que_num="+quenum+"&paper_id="+paper_id);
            //赋值文本框
            //题目标题
            var texte_bt_val = $(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".tm_btitlt").children(".btwenzi").text();
            dx_rq.find(".btwen_text").val(texte_bt_val);
            //遍历题目项目的文字
            var  bjjs=0;
            $(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").each(function() {
                //题目选项
                var texte_val = $(this).find("span").text();
                dx_rq.find(".title_itram").children(".kzjxx_iteam").eq(bjjs-1).find(".input_wenbk").val(texte_val);
                bjjs++;
            });
        }
        //多选题目
        if(title==1){
            dx_rq.show().html(duoxtm);
            //赋值文本框
            //题目标题
            $(this).parent(".kzqy_czbut").parent(".movie_box").find(".dx_box").find("form").attr("action","../updateQuestion.do?question_type=xx&que_num="+quenum+"&paper_id="+paper_id);
            var texte_bt_val = $(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".tm_btitlt").children(".btwenzi").text();
            dx_rq.find(".btwen_text").val(texte_bt_val);
            //遍历题目项目的文字
            var  bjjs=0;
            $(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").each(function() {
                //题目选项
                var texte_val = $(this).find("span").text();
                dx_rq.find(".title_itram").children(".kzjxx_iteam").eq(bjjs-1).find(".input_wenbk").val(texte_val);
                bjjs++;
            });
        }
        //填空题目
        if(title==2){
            dx_rq.show().html(tktm);
            $(this).parent(".kzqy_czbut").parent(".movie_box").find(".dx_box").find("form").attr("action","../updateQuestion.do?question_type=xx&que_num="+quenum+"&paper_id="+paper_id);
            //赋值文本框
            //题目标题
            var texte_bt_val = $(this).parent(".kzqy_czbut").parent(".movie_box").find(".wjdc_list").children("li").eq(0).find(".tm_btitlt").children(".btwenzi").text();
            dx_rq.find(".btwen_text").val(texte_bt_val);
        }
    });


    $("#dxwc_but").live("click",function () {

    })

    /* //取消编辑
    $("#xx_delete").live("click", function() {
         $("#xx_box").find("#xx_form").find(".title_itram").find("input").attr("value","");
         $("#xx_box").find("#xx_form").find("textarea").attr("value","");
    });

    $("#dx_delete").live("click", function() {
         $("#dx_box").find("#dx_form").find(".title_itram").find("input").attr("value","");
         $("#dx_box").find("#dx_form").find("textarea").attr("value","");
    });

    $("#tk_delete").live("click", function() {
         $("#tk_box").find("#tk_form").find("textarea").attr("value","");
    }); */


    //取消编辑，题目上的编辑
    /* $("#tk_delete").parent(".bjqxwc_box").parent("#tk_form").parent(".dx_box").live("click", function() {
        //$(this).parent(".bjqxwc_box").parent("#tk_form").hide();
    }); */

})