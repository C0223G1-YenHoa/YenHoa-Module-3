<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 30-05-2023
  Time: 10:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Create new product</title>
</head>
<body>
<h1>
    Thêm mới sản phẩm
</h1>
<form action="/product?action=create" method="post">
    <tr>
        <label>Nhập ID :</label>
        <input type="number" name="id">
    </tr>
    <tr>
        <label>Nhập tên :</label>
        <input type="text" name="name">
    </tr>
    <tr>
        <label>Nhập giá : </label>
        <input type="number" name="price">
    </tr>
    <tr>
        <label>Mô tả : </label>
        <input type="text" name="description">
    </tr>
    <tr>
        <label>Hãng sản xuất : </label>
        <input type="text" name="manufacturer">
    </tr>
    <tr>
        <button type="submit"> Create new product</button>
    </tr>
</form>
</body>
</html>
