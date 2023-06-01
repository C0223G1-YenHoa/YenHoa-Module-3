<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 01-06-2023
  Time: 4:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/user?action=insert" method="post">
    <table>
        <tr>
        <label>Tên</label>
            <input name="name" type="text">
        </tr>
        <tr>
        <label>Email</label>
            <input name="email" type="text">
        </tr>
        <tr>
        <label>Nơi ở</label>
            <input name="country" type="text">
        </tr>
        <tr>
        <button type="submit">Thêm</button>
        </tr>
    </table>
</form>
</body>
</html>
