<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Phannv_Laptop
  Date: 3/7/2023
  Time: 10:28 PM
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
<form action="/ProductController?action=search" method="post">
    <label>Nhập tên cần tìm kiếm</label>
    <input type="text" name="nameProduct" id="nameProduct">
    <input type="submit" value="tìm kiếm">
    <table border="1">
        <c:forEach items="${products}" var="p">
            <tr>
                <th>Tên sản phẩm</th>
                <th>Giá Sản Phẩm</th>
                <th>Mô Tả Sản Phẩm</th>
                <th>Nhà Sản Xuất Sản Phẩm</th>
            </tr>
            <tr>
                <td><c:out value="${p.getNameProduct()}"/></td>
                <td><c:out value="${p.getPriceProduct()}"/></td>
                <td><c:out value="${p.getDescribeProduct()}"/></td>
                <td><c:out value="${p.getProducerProduct()}"/></td>
            </tr>
        </c:forEach>
    </table>
</form>

</body>
</html>
