<%--
  Created by IntelliJ IDEA.
  User: Phannv_Laptop
  Date: 1/7/2023
  Time: 8:39 AM
  To change this template use File | Settings | File Templates.
--%>


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


<table border="1">
  <tr>
    <th>Số Thứ Tự</th>
    <th>Tên</th>
    <th>Ngày Sinh</th>
    <th>Địa Chỉ</th>
    <th>Ảnh</th>
  </tr>
  <c:forEach var="c" items="${customerList}" varStatus="loop">
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