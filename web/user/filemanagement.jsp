<%--
  Created by IntelliJ IDEA.
  User: Kevin
  Date: 5/13/16
  Time: 12:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="SEPJ.Helper.File"%>
<%@ page import="SEPJ.UserInterface.ULogic" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
    <title>Title</title>
    <script src="../mdl/material.min.js"></script>
    <script src="../js/jquery-2.2.3.min-2.js"></script>
    <link href="../mdl/material.min.css" rel="stylesheet">
    <link href="../css/filesystem_style.css" rel="stylesheet">
</head>
<script>
    function search() {
        $(".file-system").load("filesystem.jsp?keyword=" + $(".search-keyword").val() + "&mode=" + $(".selector").val());
    }
    function showDialog() {
        var dialog = parent.document.querySelector('dialog');
        dialog.show();
    }
    $(document).ready(function() {
        $(".file-system").load("filesystem.jsp");
        document.getElementById("file-input").value = "";
        var dialog = parent.document.querySelector('dialog');
        var old_cancelbtn = parent.document.querySelector('#cancel-upload');
        var old_confirmbtn = parent.document.querySelector('#confirm-upload');
        var descfield = parent.document.querySelector('#file-description');

        var cancelbtn = old_cancelbtn.cloneNode(true);
        old_cancelbtn.parentNode.replaceChild(cancelbtn, old_cancelbtn);

        var confirmbtn = old_confirmbtn.cloneNode(true);
        old_confirmbtn.parentNode.replaceChild(confirmbtn, old_confirmbtn);

        var cancelhandler = function() {
            document.getElementById("file-input").value = "";
            if(dialog.hasAttribute('open')) {
                dialog.close();
            }
        };
        var confirmhandler = function() {
            var filepath = $(".file-input").val();
            var file = document.getElementById("file-input").files;
            $.getJSON("upload.jsp?filepath=" + filepath + "&size=" + file[0].size + "&desc=" + descfield.value, function(data) {
                $(".file-system").load("filesystem.jsp");
                document.getElementById("file-input").value = "";
            });
            if(dialog.hasAttribute('open')) {
                dialog.close();
            }
        };
        cancelbtn.addEventListener('click', cancelhandler);
        confirmbtn.addEventListener('click', confirmhandler);
    });
</script>
<body>
    <div class="file-operations" style="height:64px">
        <div id="tt3" class="upload-icon common-icon" type="file">
            <svg fill="#757575" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg" style="transform: translate(0px, 8px);">
                <path d="M0 0h24v24H0z" fill="none"/>
                <path d="M9 16h6v-6h4l-7-7-7 7h4zm-4 2h14v2H5z"/>
            </svg>
            <input type="file" class="file-input" id="file-input" onchange="showDialog()">
        </div>
        <div class="mdl-tooltip" for="tt3">
            上传 <strong>文件</strong>
        </div>

        <div class="search-icon" style="display: inline-flex">

            <svg fill="#757575" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg" style="margin-top: 24px;margin-right: 8px;">
                <path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"/>
                <path d="M0 0h24v24H0z" fill="none"/>
            </svg>
            <select  class="selector form-control" style="width: 52px;height: 30px;border: 0px;margin-top: 20px;margin-right: 10px;">
                <option value="1">标题</option>
                <option value="2">描述</option>
            </select>
            <div class="mdl-textfield mdl-js-textfield">
                <input class="search-keyword mdl-textfield__input" type="text" id="sample1" oninput="search()">
                <label class="mdl-textfield__label" for="sample1">搜索...</label>
            </div>
        </div>

    </div>

    <div class="file-system" style="margin-top: 20px"></div>

    <script>
        $(".mdl-tooltip").each(function() {
            componentHandler.upgradeElement($(this)[0]);
        });
        componentHandler.upgradeElement($(".mdl-textfield")[0]);
    </script>

</body>
</html>
