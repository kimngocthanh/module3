<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Phannv_Laptop
  Date: 4/7/2023
  Time: 9:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/UsersController?action=sort">
    <table border="1">
        <tr>
            <th>Tên</th>
            <th>email</th>
            <th>country</th>
            <th>Sửa thông tin</th>
            <th>Xoá thông tin</th>
        </tr>
        <c:forEach var ="c" items ="${usersList}">
            <tr>
                <td><c:out value="${c.name}"/></td>
                <td><c:out value="${c.email}"/></td>
                <td><c:out value="${c.country}"/></td>
                <td><a href="/UsersController?action=update&id=${c.getId()}">Sửa </a> </td>
                <td><a href="/UsersController?action=delete&id=${c.getId()}">Xoá</a> </td>
            </tr>
        </c:forEach>
    </table>
</form>
</body>
</html>
