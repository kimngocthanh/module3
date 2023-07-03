<%--
  Created by IntelliJ IDEA.
  User: Phannv_Laptop
  Date: 3/7/2023
  Time: 2:04 PM
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
<form action="/ProductController?action=edit&id=${id}" method="post">
    <label>Tên sản phẩm </label>
    <input type="text" value="${productList.getNameProduct()}" name="nameProduct" id="name">
    <label>Giá sản phẩm</label>
    <input type="text" value="${productList.getPriceProduct()}" name="priceProduct" id="price">
    <label>Mô tả sản phẩm</label>
    <input type="text" value="${productList.describeProduct()}" name="describeProduct" id="describe">
    <label>Nhà sản xuất</label>
    <input type="text" value="${productList.producerProduct()}" name="producerProduct" id="producer">
    <input type="submit" value="Sửa sản phẩm">
</form>
</body>
</html>
