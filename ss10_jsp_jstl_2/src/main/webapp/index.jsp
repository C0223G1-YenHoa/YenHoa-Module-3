<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form method="get" action="/CalculatorServlet">
<h1>Simple Calculator</h1>
<fieldset>
    <legend>Calculator</legend>
    <label>First operand: </label>
    <input type="number" name="first" placeholder="First operand"> <br> <br>
    <label>Operator: </label>
    <select name="operator">
    <option value="+">Add</option>
    <option value="-">Sub</option>
    <option value="*">Multip</option>
    <option value="/">Division</option>
    </select><br><br>
    <label>Second operand: </label>
    <input type="number" name="second" placeholder="Second operand"> <br> <br>
    <br><br>
    <button type="submit">Calculate</button>
</fieldset>
</form>
</body>
</html>