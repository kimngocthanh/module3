<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1>Simple Calculator</h1>
<form method="get" action="/calculator">
    <label>First Number</label>
    <input type="text" name="firstNumber">
    <br>
    <select name="subtend">
        <option value="total">+</option>
        <option value="sub">-</option>
        <option value="core">*</option>
        <option value="div">/</option>
    </select>
    <br>
    <label>Second Number</label>
    <input type="text" name="secondNumber">
    <br>
    <button name="submit">submit</button>
</form>
</body>
</html>