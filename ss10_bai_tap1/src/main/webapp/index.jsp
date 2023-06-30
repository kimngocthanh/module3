<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
<form method="get" action="/CustomerController" >
    <c:forEach var="c" items="${customerList}" varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <td><c:out value="c.name"/></td>
            <td><c:out value="c.date"/></td>
            <td><c:out value="c.address"/></td>
            <td><c:out value="c.img"/></td>
        </tr>
    </c:forEach>
</form>
<script>
    alert("Hello")
</script>
</body>
</html>