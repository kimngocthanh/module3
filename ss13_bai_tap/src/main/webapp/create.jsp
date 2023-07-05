<%--
  Created by IntelliJ IDEA.
  User: Phannv_Laptop
  Date: 4/7/2023
  Time: 3:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/UsersController?action=create">
    <label for="name">Tên: </label>
    <input type="text" name="name" id="name">
    <label for="email">Email: </label>
    <input type="text" name="email" id="email">
    <label for="country">Country: </label>
    <input type="text" name="country" id="country">
    <input type="submit" value="thêm">
</form>
</body>
</html>
