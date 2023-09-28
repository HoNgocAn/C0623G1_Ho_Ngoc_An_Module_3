<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Product Discount Calculator</title>
</head>
<body>
<h1>Product detail</h1>
<form method="post" action="calculator-servlet">
    <label for="description">Product Description:</label><br>
    <input type="text" name="description" id="description"><br>

    <label for="price">List Price:</label><br>
    <input type="number" name="price" id="price"><br>

    <label for="discountPercent">Discount Percent:</label><br>
    <input type="number" name="discountPercent" id="discountPercent"><br>

    <input type="submit" value="Calculate Discount">
</form>

</body>
</html>