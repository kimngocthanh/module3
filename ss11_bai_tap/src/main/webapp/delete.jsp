<%--
  Created by IntelliJ IDEA.
  User: Phannv_Laptop
  Date: 3/7/2023
  Time: 2:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p>
    <a href="/ProductController">Quay lại trang chính</a>
</p>
<form method="post" action="/ProductController?action=delete&id=${id}">
    <h3>Bạn chắc chắn xoá</h3>
    <input type="submit" value="Xoá">
    <a href="/ProductController">Quay lại trang chính</a>
</form>
</body>
</html>
