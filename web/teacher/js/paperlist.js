$(function () {
    $("#addQuestionBut").click(function () {
        var teacher_id = $("#teacherIdEle").val();
        console.log(teacher_id);
        var	html_cz = "<form action='../addPaper.do?teacher_id="+teacher_id+"' method='post'>" +
            "<input type='text' placeholder='请输入试卷名' name='paper_name' style='width: 100px'>" +
            "<input type='submit' value='确定'>" +
            "</form>";
        $(this).after(html_cz);

    });


});