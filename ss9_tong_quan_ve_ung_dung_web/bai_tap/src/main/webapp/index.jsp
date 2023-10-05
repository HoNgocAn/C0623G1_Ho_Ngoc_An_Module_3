<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Product Discount Calculator</title>
</head>
<body>
<h1>Product detail</h1>
<table border="1px" style="width: 500px; height: 500px">
<form method="post" action="calculator-servlet">
    <label for="description">Product Description:</label><br>
    <input type="text" name="description" id="description"><br>

    <label for="price">List Price:</label><br>
    <input type="number" name="price" id="price"><br>

    <label for="discountPercent">Discount Percent:</label><br>
    <input type="number" name="discountPercent" id="discountPercent"><br>

    <input type="submit" value="Calculate Discount">
</form>
</table>
</body>
</html>