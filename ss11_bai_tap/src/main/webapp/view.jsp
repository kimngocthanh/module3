<%--
  Created by IntelliJ IDEA.
  User: Phannv_Laptop
  Date: 3/7/2023
  Time: 9:26 PM
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
<table>
    <tr>
        <td>Tên sản phẩm: </td>
        <td>${product.getNameProduct()}</td>
    </tr>
    <tr>
        <td>Giá sản phẩm: </td>
        <td>${product.getPriceProduct()}</td>
    </tr>
    <tr>
        <td>Mô tả sản phẩm: </td>
        <td>${product.getDescribeProduct()}</td>
    </tr>
    <tr>
        <td>Nhà cung cấp: </td>
        <td>${product.getProducerProduct()}</td>
    </tr>
</table>
</body>
</html>
