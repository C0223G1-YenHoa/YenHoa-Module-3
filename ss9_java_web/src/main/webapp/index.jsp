<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Discount Calculation</title>
    <style>
        form{
            padding-top: 20px;
            width: 500px;
            height: 200px;
            border: black solid;
            margin-left: 400px;
        }
        div{
            padding-left: 50px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<form action="/DiscountCalculatorServlet" method="post">
    <div>
    <label>Product Description:</label>
    <input type="text" name="description" placeholder="Product Description"><br>
    </div>
    <div>
    <label>List Price:</label>
    <input style="margin-left: 50px" type="number" name="price" placeholder="List Price"><br>
    </div>
    <div>
    <label>Discount Percent:</label>
    <input style="margin-left: 20px" type="number" name="percent" placeholder="Discount Percent"><br>
    </div>
    <div>
    <input type="submit" value="Calculate Discount">
    </div>
</form>
</body>
</html>