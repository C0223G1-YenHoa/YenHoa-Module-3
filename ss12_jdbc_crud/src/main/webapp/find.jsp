<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 01-06-2023
  Time: 8:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>findByID</title>
</head>
<body>
<table>
    <tr>
    <td>
        <c:out value="${user.getId()}"/>
    </td>
    <td>
        <c:out value="${user.getName()}"/>
    </td>
    <td>
        <c:out value="${user.getEmail()}"/>
    </td>
    <td>
        <c:out value="${user.getCountry()}"/>
    </td>
    </tr>
    <tr>
        <a href="list.jsp">Quay về lại danh sách</a>
    </tr>
</table>
</body>
</html>
