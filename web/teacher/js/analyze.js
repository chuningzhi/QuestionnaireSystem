$(function() {
    var paper_id = $("#paperIdInput").val();
    $.get(
        "../gainData.do?paper_id="+paper_id,
        function (data) {
            var countsNoTk = data;
            var arrayCount = new Array();
            var arrayCountA = new Array();
            var arrayCountB = new Array();
            var arrayCountC = new Array();
            var arrayCountD = new Array();
            $.each(countsNoTk,function (i,item) {
                arrayCount.push("第"+i+"题");
                arrayCountA.push(item[0]);
                arrayCountB.push(item[1]);
                arrayCountC.push(item[2]);
                arrayCountD.push(item[3]);
                $("#selectQustion").append("<option value='"+i+"'>第"+i+"题</option>");
            })
            "use strict";
            // ==============================================================
            // Sales overview
            // ==============================================================
            var arrQue = new Array();
            var chart2 = new Chartist.Bar('.amp-pxl', {
                labels: arrayCount,
                series: [
                    arrayCountA,
                    arrayCountB,
                    arrayCountC,
                    arrayCountD,
                ]
            }, {
                axisX: {

                    position: 'end',
                    showGrid: false,
                    scaleMinSpace: 100
                },
                axisY: {
                    position: 'start'
                },
                high: '10',
                low: '0',
                plugins: [
                    Chartist.plugins.tooltip()
                ]
            });

            var chart = [chart2];

            // ==============================================================
            // This is for the animation
            // ==============================================================

            for (var i = 0; i < chart.length; i++) {
                chart[i].on('draw', function(data) {
                    if (data.type === 'line' || data.type === 'area') {
                        data.element.animate({
                            d: {
                                begin: 500 * data.index,
                                dur: 500,
                                from: data.path.clone().scale(1, 0).translate(0, data.chartRect.height()).stringify(),
                                to: data.path.clone().stringify(),
                                easing: Chartist.Svg.Easing.easeInOutElastic
                            }
                        });
                    }
                    if (data.type === 'bar') {
                        data.element.animate({
                            y2: {
                                dur: 500,
                                from: data.y1,
                                to: data.y2,
                                easing: Chartist.Svg.Easing.easeInOutElastic
                            },
                            opacity: {
                                dur: 500,
                                from: 0,
                                to: 1,
                                easing: Chartist.Svg.Easing.easeInOutElastic
                            }
                        });
                    }
                });
            }
        },
        "json"
    )


    $.get(
        "../gainDataShan.do?paper_id="+paper_id+"&question_num=1",
        function (data) {
            console.log(data);
            console.log(typeof data);
            var scaleA = data[0];
            var scaleB = data[1];
            var scaleC = data[2];
            var scaleD = data[3];
            console.log(scaleA,scaleB,scaleC,scaleD);
            var chart = c3.generate({
                bindto: '#visitor',
                data: {
                    columns: [
                        ['C', scaleC],
                        ['B', scaleB],
                        ['D', scaleD],
                        ['A', scaleA],
                    ],

                    type: 'donut',
                    onclick: function(d, i) { console.log("onclick", d, i); },
                    onmouseover: function(d, i) { console.log("onmouseover", d, i); },
                    onmouseout: function(d, i) { console.log("onmouseout", d, i); }
                },
                donut: {
                    label: {
                        show: false
                    },
                    title: "Our visitor",
                    width: 20,

                },

                legend: {
                    hide: true
                    //or hide: 'data1'
                    //or hide: ['data1', 'data2']
                },
                color: {
                    pattern: ['#F4C63D', '#26C6DA', '#D17905', '#1e88e5']
                }
            });
        },
        "json"
    )
    
    
    $("#selectQustion").change(function () {
        var question_num = $(this).val();
        $.get(
            "../gainDataShan.do?paper_id="+paper_id+"&question_num="+question_num,
            function (data) {
                console.log(data);
                console.log(typeof data);
                var scaleA = data[0];
                var scaleB = data[1];
                var scaleC = data[2];
                var scaleD = data[3];
                var chart = c3.generate({
                    bindto: '#visitor',
                    data: {
                        columns: [
                            ['C', scaleA],
                            ['B', scaleB],
                            ['D', scaleC],
                            ['A', scaleD],
                        ],

                        type: 'donut',
                        onclick: function(d, i) { console.log("onclick", d, i); },
                        onmouseover: function(d, i) { console.log("onmouseover", d, i); },
                        onmouseout: function(d, i) { console.log("onmouseout", d, i); }
                    },
                    donut: {
                        label: {
                            show: false
                        },
                        title: "Our visitor",
                        width: 20,

                    },

                    legend: {
                        hide: true
                        //or hide: 'data1'
                        //or hide: ['data1', 'data2']
                    },
                    color: {
                        pattern: ['#F4C63D', '#26C6DA', '#D17905', '#1e88e5']
                    }
                });
            },
            "json"
        )
    })

});

function viewChoose(){
    var chooseEle = document.getElementById("choose");
    var fillingEle = document.getElementById("filling");
    chooseEle.style.display="block";
    fillingEle.style.display="none";
}
function viewFilling(){
    var chooseEle = document.getElementById("choose");
    var fillingEle = document.getElementById("filling");
    chooseEle.style.display="none";
    fillingEle.style.display="block";
}

