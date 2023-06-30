<%--
  Created by IntelliJ IDEA.
  User: Phannv_Laptop
  Date: 30/6/2023
  Time: 8:46 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    float rate = Float.parseFloat(request.getParameter("rate"));
    float usd = Float.parseFloat(request.getParameter("usd"));
    float vnd = rate * usd;
%>
<h3>Rate: <%=rate%></h3>
<h3>Rate: <%=usd%></h3>
<h3>Rate: <%=vnd%></h3>
</body>
</html>
