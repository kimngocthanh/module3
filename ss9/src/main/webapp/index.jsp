<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
</head>
<body>
<form method="post" action="/DiscountServlet">
  <label for="productDescription">productDescription</label>
  <input type="text" id="productDescription" name="productDescription">
  <label for="listPrice">listPrice</label>
  <input type="text" id="listPrice" name="listPrice">
  <label for="discountPercent">discountPercent</label>
  <input type="text" id="discountPercent" name="discountPercent">
  <input type="submit" name="calculator" value="sum">

</form>

</body>
</html>