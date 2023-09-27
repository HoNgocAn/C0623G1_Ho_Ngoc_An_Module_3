

<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />--%>
<%--<head>--%>
<%--    <title>Simple Dictionary</title>--%>
<%--    <link rel="stylesheet" type="text/css" href="css/style.css">--%>
<%--</head>--%>
<%--<body>--%>
<%--<h2>Vietnamese Dictionary</h2>--%>
<%--<form action="/translate" method="post">--%>
<%--    <input type="text" name="txtSearch" placeholder="Enter your word: "/>--%>
<%--    <input type = "submit" id = "submit" value = "Search"/>--%>
<%--</form>--%>
<%--</body>--%>
<%--&lt;%&ndash;</html>&ndash;%&gt;--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Product Discount Calculator</title>
</head>
<body>
<h1>Product detail</h1>

<form method="post" action="/calculatorServlet">
    <label for="description">Product Description:</label><br>
    <input type="text" name="description" id="description" size="30"><br>

    <label for="price">List Price:</label><br>
    <input type="text" name="price" id="price" size="30"><br>

    <label for="discountPercent">Discount Percent:</label><br>
    <input type="text" name="discountPercent" id="discountPercent"><br>

    <input type="submit" value="Calculate Discount">
</form>

</body>
</html>