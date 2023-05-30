<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 30-05-2023
  Time: 1:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>

        th, td {
            width: 100px;
            height: 100px;
            border: 1px solid;
            text-align: center;
        }
    </style>
</head>
<body>
<table border="1px" style="border: solid">
    <h1 style="text-align: center">DANH SÁCH KHÁCH HÀNG</h1>
    <tr>
        <th>STT</th>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>
    <c:forEach var="c" items="${list}" varStatus="loop">
        <tr>
            <td>
                <c:out value="${loop.count}"/>
            </td>
            <td>
                <c:out value="${c.name}"/>
            </td>
            <td>
                <c:out value="${c.dateOfBirth}"/>
            </td>
            <td>
                <c:out value="${c.address}"/>
            </td>
            <td>
                <img width="50px" height="50px" src="<c:out value="${c.image}"/>">
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
