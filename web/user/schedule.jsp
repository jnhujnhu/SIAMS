<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 5/12/16
  Time: 3:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="../mdl/material.min.js"></script>
    <script src="../js/jquery-2.2.3.min-2.js"></script>
    <link href="../css/schedule_style.css" rel="stylesheet">
    <link href="../mdl/material.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<script>
    function GenerateRandomColor()
    {

        var Color = new Array("#4fc3f7","#7e57c2","#FF9292", "#57C2B3","#57C264","#C29C57","#C25757");

        var Rand = Math.random();
        return Color[Math.round(Rand * 7)];
    }
    $(document).ready(function(){
        $(".schedule-table-entry").each(function() {
            $(this).css("background-color", GenerateRandomColor());
        });
    });

</script>
<body>
    <div class="search-field" style="text-align: right; margin-right: 20px; margin-top: 10px">
        <div class="course-add" style="display: inline; margin-right: 10px">
            <form action="#" style="display: inline">
                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="width: 200px">
                    <input class="course-code mdl-textfield__input" type="text" id="course">
                    <label class="mdl-textfield__label" for="course">添加课程...</label>
                </div>
            </form>
            <button id="add-course-btn" class="mdl-button mdl-js-button mdl-button--icon" type="button">
                <svg fill="#000000" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg" style="position: absolute;top: 50%;left: 50%;transform: translate(-12px, -12px);">
                    <path d="M19 13h-6v6h-2v-6H5v-2h6V5h2v6h6v2z"/>
                    <path d="M0 0h24v24H0z" fill="none"/>
                </svg>
            </button>
        </div>
        <div class="news-add" style="display: inline">
            <form action="#" style="display: inline">
                <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label" style="width: 200px">
                    <input class="news-keywords mdl-textfield__input" type="text" id="news">
                    <label class="mdl-textfield__label" for="news">搜索订阅信息...</label>
                </div>
            </form>
            <button id="add-news-btn" class="mdl-button mdl-js-button mdl-button--icon" type="button">
                <svg fill="#757575" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg" style="position: absolute;top: 50%;left: 50%;transform: translate(-12px, -12px);">
                    <path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"/>
                    <path d="M0 0h24v24H0z" fill="none"/>
                </svg>
            </button>
        </div>
    </div>
    <div class="table-field">
        <table class="mdl-data-table mdl-js-data-table mdl-data-table mdl-shadow--2dp" style="margin: auto; width: 90%;table-layout:fixed;">
            <thead>
            <tr>
                <th></th>
                <th>星期日</th>
                <th>星期一</th>
                <th>星期二</th>
                <th>星期三</th>
                <th>星期四</th>
                <th>星期五</th>
                <th>星期六</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td class="mdl-data-table__cell--non-numeric" style="background-color: white" rowspan="5">上午</td>
                <td id="TD84_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD0_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD14_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD28_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD42_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD56_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD70_0" style="backGround-Color:#ffffff;font-size:12px"></td>
            </tr>
            <tr>

                <td id="TD85_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD1_0" class="schedule-table-entry"  rowspan="3"  title="软件工程(COMP130015.03) (沈立炜);(1-16,Z2208A)">软件工程(COMP130015.03) (沈立炜)<br>(1-16,Z2208A)</td>
                <td id="TD15_0" class="schedule-table-entry" rowspan="3"  title="计算机体系结构实验(COMP130013.01) (孙晓光);(1-3 10-11,Z2212);计算机体系结构实验(COMP130013.01) (孙晓光);(4-9 12-16,Z计算机学院机房(2))">计算机体系结构实验(COMP130013.01) (孙晓光)<br>(1-3 10-11,Z2212)<br>计算机体系结构实验(COMP130013.01) (孙晓光)<br>(4-9 12-16,Z计算机学院机房(2))</td>
                <td id="TD29_0" class="schedule-table-entry" rowspan="3"  title="数据库系统实现技术(COMP130026.01) (王鹏);(1-16,Z2211)">数据库系统实现技术(COMP130026.01) (王鹏)<br>(1-16,Z2211)</td>
                <td id="TD43_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD57_0" class="schedule-table-entry" rowspan="3"  title="计算机体系结构(COMP130012.02) (陈伟男);(1-16,Z2103)">计算机体系结构(COMP130012.02) (陈伟男)<br>(1-16,Z2103)</td>
                <td id="TD71_0" style="backGround-Color:#ffffff;font-size:12px"></td>
            </tr>
            <tr>

                <td id="TD86_0" style="backGround-Color:#ffffff;font-size:12px"></td>



                <td id="TD44_0" style="backGround-Color:#ffffff;font-size:12px"></td>

                <td id="TD72_0" style="backGround-Color:#ffffff;font-size:12px"></td>
            </tr>
            <tr>

                <td id="TD87_0" style="backGround-Color:#ffffff;font-size:12px"></td>



                <td id="TD45_0" style="backGround-Color:#ffffff;font-size:12px"></td>

                <td id="TD73_0" style="backGround-Color:#ffffff;font-size:12px"></td>
            </tr>
            <tr>

                <td id="TD88_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD4_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD18_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD32_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD46_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD60_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD74_0" style="backGround-Color:#ffffff;font-size:12px"></td>
            </tr>
            <tr>
                <td class="mdl-data-table__cell--non-numeric" style="background-color: white" rowspan="5">下午</td>
                <td id="TD89_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD5_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD19_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD33_0" class="schedule-table-entry" rowspan="3"  title="JAVA语言(COMP130048.01) (周扬帆);(1-16,Z2301)">JAVA语言(COMP130048.01) (周扬帆)<br>(1-16,Z2301)</td>
                <td id="TD47_0" class="schedule-table-entry" rowspan="3"  title="算法设计与分析(COMP130011.01) (沙朝锋);(1-16,Z2209A)">算法设计与分析(COMP130011.01) (沙朝锋)<br>(1-16,Z2209A)</td>
                <td id="TD61_0" class="schedule-table-entry" rowspan="2"  title="网络创新实验(COMP130107.01) (王新,周扬帆);(1-16,Z2212)">网络创新实验(COMP130107.01) (王新,周扬帆)<br>(1-16,Z2212)</td>
                <td id="TD75_0" style="backGround-Color:#ffffff;font-size:12px"></td>
            </tr>
            <tr>

                <td id="TD90_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD6_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD20_0" style="backGround-Color:#ffffff;font-size:12px"></td>



                <td id="TD76_0" style="backGround-Color:#ffffff;font-size:12px"></td>
            </tr>
            <tr>

                <td id="TD91_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD7_0" class="schedule-table-entry" rowspan="2"  title="算法设计与分析(COMP130011.01) (沙朝锋);(单1-15,Z2209A)">算法设计与分析(COMP130011.01) (沙朝锋)<br>(单1-15,Z2209A)</td>
                <td id="TD21_0" style="backGround-Color:#ffffff;font-size:12px"></td>


                <td id="TD63_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD77_0" style="backGround-Color:#ffffff;font-size:12px"></td>
            </tr>
            <tr>

                <td id="TD92_0" style="backGround-Color:#ffffff;font-size:12px"></td>

                <td id="TD22_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD36_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD50_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD64_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD78_0" style="backGround-Color:#ffffff;font-size:12px"></td>
            </tr>
            <tr>

                <td id="TD93_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD9_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD23_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD37_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD51_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD65_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD79_0" style="backGround-Color:#ffffff;font-size:12px"></td>
            </tr>
            <tr>
                <td class="mdl-data-table__cell--non-numeric" style="background-color: white" rowspan="4">晚上</td>
                <td id="TD94_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD10_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD24_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD38_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD52_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD66_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD80_0" style="backGround-Color:#ffffff;font-size:12px"></td>
            </tr>
            <tr>
                <td id="TD95_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD11_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD25_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD39_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD53_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD67_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD81_0" style="backGround-Color:#ffffff;font-size:12px"></td>
            </tr>
            <tr>
                <td id="TD96_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD12_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD26_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD40_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD54_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD68_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD82_0" style="backGround-Color:#ffffff;font-size:12px"></td>
            </tr>
            <tr>
                <td id="TD97_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD13_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD27_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD41_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD55_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD69_0" style="backGround-Color:#ffffff;font-size:12px"></td>
                <td id="TD83_0" style="backGround-Color:#ffffff;font-size:12px"></td>
            </tr>
            </tbody>
        </table>
    </div>
    <script>
        (function() {
            'use strict';
            var AddCoursesnackbarContainer = parent.document.querySelector('#add-course-toast');
            var showAddCourseToastButton = document.querySelector('#add-course-btn');
            var AddNewssnackbarContainer = parent.document.querySelector('#add-news-toast');
            var showAddNewsToastButton = document.querySelector('#add-news-btn');
            showAddCourseToastButton.addEventListener('click', function() {
                'use strict';
                var data = {message: '成功的添加了课程: ' + $('.course-code').val()};
                AddCoursesnackbarContainer.MaterialSnackbar.showSnackbar(data);
            });
            showAddNewsToastButton.addEventListener('click', function() {
             'use strict';
             var data = {message: '成功的查询到了新闻: ' + $('.news-keywords').val()};
             AddNewssnackbarContainer.MaterialSnackbar.showSnackbar(data);
             });
        }());
        componentHandler.upgradeElement($(".mdl-textfield")[0]);
        componentHandler.upgradeElement($(".mdl-textfield")[1]);
    </script>
</body>
</html>
