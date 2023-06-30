<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <style>
        .td {
            width: 200px;
            height: 200px;
        }
    </style>
</head>
<body>

<a href="/CustomerController">show customer</a>
<c:forEach var="c" items="${customerList}" varStatus="loop">
<table border="1">

    <tr>
        <th>Số Thứ Tự</th>
        <th>Tên</th>
        <th>Ngày Sinh</th>
        <th>Địa Chỉ</th>
        <th>Ảnh</th>
    </tr>
    <tr>
        <td class="td">${loop.count}</td>
        <td class="td"><c:out value="${c.name}"/></td>
        <td class="td"><c:out value="${c.date}"/></td>
        <td class="td"><c:out value="${c.address}"/></td>
        <td class="td"><img src="${c.img}" style="width: 200px" height="200px"></td>
    </tr>
    </c:forEach>
</table>
</body>
</html>