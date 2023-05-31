<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 30-05-2023
  Time: 9:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        table {
            border-collapse: collapse;
        }

        tr, th, td {
            width: 200px;
            height: 50px;
            border: black solid 1px;
            padding: 0;
            text-align: center;
        }
    </style>
</head>
<body>
<form action="/product_servlet" method="get">
    <table>
        <tr>
            <th>STT</th>
            <th>ID sản phẩm</th>
            <th>Tên sản phẩm</th>
            <th>Giá sản phẩm</th>
            <th>Mô tả</th>
            <th>Hãng sản xuất</th>
            <th>
                <button><a href="/product_servlet?action=create">Create new product</a></button>
            </th>
        </tr>
        <tr>
            <c:forEach var="p" items="${list}" varStatus="loop">
            <td>
                <c:out value="${loop.count}"/>
            </td>
            <td>
                <c:out value="${p.id}"/>
            </td>
            <td>
                <c:out value="${p.name}"/>
            </td>
            <td>
                <c:out value="${p.price}"/>
            </td>
            <td>
                <c:out value="${p.description}"/>
            </td>
            <td>
                <c:out value="${p.manufacturer}"/>
            </td>
            <td>
                <button><a href="/product_servlet?action=delete&id=${p.getId()}">Delete</a></button>
                <button><a href="/product_servlet?action=edit&id=${p.getId()}">Edit</a></button>
            </td>
        </tr>
        </c:forEach>
    </table>
</form>

</body>
</html>
