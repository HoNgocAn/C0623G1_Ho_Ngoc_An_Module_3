<%--
  Created by IntelliJ IDEA.
  User: HO NGOC AN
  Date: 10/1/2023
  Time: 11:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="calculator" method="post">
<table>
    <tr>
        <td>First: </td>
        <td>
            <input type="number" name="a">
        </td>
    </tr>
    <tr>
        <td>Second: </td>
        <td>
            <input type="number" name="b">
        </td>
    </tr>
    <tr>
        <td>Operator: </td>
        <td>
            <select name="ope">
                <option>+</option>
                <option>-</option>
                <option>*</option>
                <option>/</option>
            </select>
        </td>
    </tr>
    <tr>
        <td> </td>
        <td>
            <button type="submit">Compute</button>
        </td>
    </tr>
    <tr>
        <td>Result: </td>
        <td>
            <input type="number" value="${r}">
        </td>
    </tr>
</table>
</form>
</body>
</html>
