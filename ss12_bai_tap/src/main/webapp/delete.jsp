<%--
  Created by IntelliJ IDEA.
  User: Phannv_Laptop
  Date: 4/7/2023
  Time: 4:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p>
  <a href="list.jsp">Quay lại trang chính</a>
</p>
<form method="post" action="/UsersController?action=delete&id=${id}">
  <label>bạn có chắc xoá ko</label>
  <input type="submit" value="xoá">
</form>
</body>
</html>
