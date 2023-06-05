<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 01-06-2023
  Time: 12:42 PM
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
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
<form action="/user?action=find" method="post">
    <input type="number" name="id" placeholder="Nhập ID bạn muốn tìm">
    <button type="submit">Tìm</button>
</form>
<form action="/user" method="get">
    <tr>
    <button> <a href="/user?action=insert">Thêm người dùng</a></button>

    </tr>
    <br>
    <br>
    <table>
        <tr>
            <th>ID</th>
            <th>Tên</th>
            <th>Email</th>
            <th>Country</th>
        </tr>
        <c:forEach var="u" items="${userList}">
        <tr>
            <td>
                <c:out value="${u.id}"/>
            </td>
            <td>
                <c:out value="${u.name}"/>
            </td>
            <td>
                <c:out value="${u.email}"/>
            </td>
            <td>
                <c:out value="${u.country}"/>
            </td>
            <td>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"
                        onclick="remove(${u.id},'${u.name}')">
                    Xóa
                </button>
                <button> <a href="/user?action=edit&id=${u.getId()}">Sửa</a></button>
            </td>
            </c:forEach>
        </tr>
    </table>
</form>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Xóa người dùng</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <h2>Bạn có chắc chắn muốn xóa <span id="nameDelete"></span>?</h2>
            </div>
            <div class="modal-footer">
                <form action="/user?action=delete" method="post">
                    <input type="hidden" id="idDelete" name="idDelete">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-primary">Xóa</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    function remove(id,name){
        document.getElementById("nameDelete").innerText=name;
        document.getElementById("idDelete").value=id;
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
