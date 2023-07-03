
<%--
  Created by IntelliJ IDEA.
  User: Phannv_Laptop
  Date: 3/7/2023
  Time: 2:04 PM
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
    <a href="/ProductController">Quay lại trang chính</a>
</p>
<form action="/ProductController?action=edit&id=${id}"  method="post">
    <label>Tên sản phẩm </label>
    <input type="text" value="${product.getNameProduct()}" name="nameProduct" id="nameProduct">
    <label>Giá sản phẩm</label>
    <input type="text" value="${product.getPriceProduct()}" name="priceProduct" id="priceProduct">
    <label>Mô tả sản phẩm</label>
    <input type="text" value="${product.getDescribeProduct()}" name="describeProduct" id="describeProduct">
    <label>Nhà sản xuất</label>
    <input type="text" value="${product.getProducerProduct()}" name="producerProduct" id="producerProduct">
    <input type="submit" value="Sửa sản phẩm">
</form>
</body>
</html>
