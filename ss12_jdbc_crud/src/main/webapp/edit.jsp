<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 31-05-2023
  Time: 9:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <style>
        h1{
            text-align: center;
        }
        table {
            border-collapse: collapse;
        }

        tr, th, td {
            width: 300px;
            height: 30px;
            border: black solid 1px;
            padding: 0;
            text-align: center;
        }
    </style>
</head>
<body>
<h1>
    Chỉnh sửa
</h1>
<form action="/user?action=edit" method="post">
    <br>
    <br>
    <tr>
        <label>ID :</label>
        <input type="number" name="id" readonly value="${user.getId()}">
    </tr>
    <tr>
        <label>Nhập tên :</label>
        <input type="text" name="name" value="${user.getName()}">
    </tr>
    <tr>
        <label>Nhập email: </label>
        <input type="text" name="email" value="${user.getEmail()}">
    </tr>
    <tr>
        <label>Nhập nơi ở : </label>
        <input type="text" name="country" value="${user.getCountry()}">
    </tr>
    <br>
    <br>
    <tr>
        <button type="button" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#exampleModal">
            Sửa tài khoản
        </button>
    </tr>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Chỉnh sửa</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Bạn có chắc chắn muốn sửa người dùng này?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-primary">Sửa</button>
                </div>
            </div>
        </div>
    </div>
</form>
</body>
</html>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
