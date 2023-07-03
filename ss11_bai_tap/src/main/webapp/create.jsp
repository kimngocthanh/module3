<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Phannv_Laptop
  Date: 3/7/2023
  Time: 2:08 PM
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
<c:if test="${msg != null}">
    <c:out value="${msg}"/>
</c:if>
<form method="post" action="/ProductController?action=create">
    <label>
        Nhâp tên
    </label>
    <input type="text" name="nameProduct" id="nameProduct">
    <label>
        Nhập giá
    </label>
    <input type="text" name="priceProduct" id="priceProduct">
    <label>
        Nhập mô tả
    </label>
    <input type="text" name="describeProduct" id="describeProduct">
    <label>
        Nhập nhà sản xuất
    </label>
    <input type="text" name="producerProduct" id="producerProduct">
    <input type="submit" value="Thêm">
</form>
</body>
</html>
