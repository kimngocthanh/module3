<%--
  Created by IntelliJ IDEA.
  User: Phannv_Laptop
  Date: 4/7/2023
  Time: 3:58 PM
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
<form method="post" action="/UsersController?action=update&id=${id}">
    <label for="name">Tên: </label>
    <input type="text" name="name" id="name">
    <label for="email">email: </label>
    <input type="text" name="email" id="email">
    <label for="country">địa chỉ: </label>
    <input type="text" name="country" id="country">
    <input type="submit" value="Sửa">
</form>
</body>
</html>
