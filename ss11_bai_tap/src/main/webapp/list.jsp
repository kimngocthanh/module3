<%--
  Created by IntelliJ IDEA.
  User: Phannv_Laptop
  Date: 3/7/2023
  Time: 11:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p>
    <a href="/ProductController?action=showCreate">Thêm mới Product</a>
</p>
<table border="1">
    <tr>
        <th>Tên sản phẩm</th>
        <th>Giá Sản Phẩm</th>
        <th>Mô Tả Sản Phẩm</th>
        <th>Nhà Sản Xuất Sản Phẩm</th>
        <th>Sửa Sản Phẩm</th>
        <th>Xoá Sản Phẩm</th>
    </tr>
    <c:forEach items="${productList}" var="p">
        <tr>
            <td><c:out value="${p.getNameProduct()}"/></td>
            <td><c:out value="${p.getPriceProduct()}"/></td>
            <td><c:out value="${p.getDescribeProduct()}"/></td>
            <td><c:out value="${p.getProducerProduct()}"/></td>
            <td><a href="/ProductController?action=edit&id=${p.getIdProduct()}">sửa</a> </td>
            <td><a href="/ProductController?action=delete&id=${p.getIdProduct()}">xoá</a> </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
