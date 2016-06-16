<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="SEPJ.Helper.File"%>
<%@ page import="SEPJ.UserInterface.ULogic" %>
<%@ page import="java.util.ArrayList" %>
<%
    ULogic uLogic = (ULogic) session.getAttribute("ulogic");
    ArrayList<File> filelist;
    if(request.getParameter("keyword") == null || request.getParameter("keyword").equals("")) {
        filelist = uLogic.getDefaultFileList();
    }
    else if(request.getParameter("mode").equals("1")) {
        filelist = uLogic.getFileListByKeys(request.getParameter("keyword"), "");
    }
    else {
        filelist = uLogic.getFileListByKeys("", request.getParameter("keyword"));
    }
%>
<script>
    function Download(fid) {
        $.getJSON("download.jsp?fid=" + fid, function(data) {
            window.open("http://" + data.url);
        });
    }
</script>
<table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp"  style="margin: auto;width: 90%">
    <thead>
    <tr>
        <th class="mdl-data-table__cell--non-numeric">文件名</th>
        <th>文件描述</th>
        <th>文件大小</th>
        <th>修改日期</th>
    </tr>
    </thead>
    <tbody>
    <%
        for(File f: filelist) {%>
           <tr>
               <td class="file-type-file file-item-text mdl-data-table__cell--non-numeric">
                    <svg fill="#757575" height="18" viewBox="0 0 24 24" width="18" xmlns="http://www.w3.org/2000/svg">
                        <path d="M6 2c-1.1 0-1.99.9-1.99 2L4 20c0 1.1.89 2 1.99 2H18c1.1 0 2-.9 2-2V8l-6-6H6zm7 7V3.5L18.5 9H13z"/>
                        <path d="M0 0h24v24H0z" fill="none"/>
                    </svg>
                    <a  href="#" onclick="Download(<%=f.fid%>)" ><%=f.fileName +'.' + f.extentionName %></a>
                </td>
                <td><%=f.introduction%></td>
                <td><%=f.fileSize%>KB</td>
                <td><%=f.time%></td>
           </tr>
    <%}%>
    </tbody>
</table>
<script>
    componentHandler.upgradeElement($(".mdl-data-table")[0]);
</script>