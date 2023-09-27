<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<a href="/result.jsp">Result</a>
<h1>SIMPLE CALCULATOR</h1>
<form method="get" action="calculator-servlet">
    <fieldset>
        <p>Calculator</p>
        <table>
            <tr>
                <th>First operand:</th>
                <td> <input type="number" name="firstOperand"></td>
            </tr>
            <tr>
                <th>Operator:</th>
                <td>
                    <select>
                        <option>Addition</option>
                        <option>Subtraction</option>
                        <option>Multiplication</option>
                        <option>Division</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Second operand:</th>
                <td><input type="number" name="secondOperand"></td>
            </tr>
            <tr>
                <td><input type="submit" value="calculate"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>