<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Phannv_Laptop
  Date: 4/7/2023
  Time: 8:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/UsersController?action=search" method="post">
    <label for="country">Nhập tên địa chỉ muốn tìm</label>
    <input type="text" name="country" id="country">
    <input type="submit" value="Tìm kiếm">
    <table border="1">
        <c:forEach var="c" items="${usersList}">
            <tr>
                <th>Tên</th>
                <th>email</th>
                <th>country</th>
            </tr>
            <tr>
                <td><c:out value="${c.getName()}"/></td>
                <td><c:out value="${c.geEmail()}"/></td>
                <td><c:out value="${c.getCountry()}"/></td>
            </tr>
        </c:forEach>
    </table>
</form>
</body>
</html>
