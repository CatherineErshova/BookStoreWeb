<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : 13.06.2018, 20:19:31
    Author     : KatyaPc
--%>

<sql:query var="result" dataSource="jdbc/BookStore">
    SELECT author_name FROM Authors
</sql:query>
    
<table border="1">
    <!-- column headers -->
    <tr>
    <c:forEach var="columnName" items="${result.columnNames}">
        <th><c:out value="${columnName}"/></th>
    </c:forEach>
</tr>
<!-- column data -->
<c:forEach var="row" items="${result.rowsByIndex}">
    <tr>
    <c:forEach var="column" items="${row}">
        <td><c:out value="${column}"/></td>
    </c:forEach>
    </tr>
</c:forEach>
</table>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Книжный магазин</title>
        
    </head>
    <body>
        <h1>Добро пожаловать в книжный магазин!</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Выберите книгу:</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><form action="response.jsp">
                            <strong>Жанр книги:</strong>
                            <select name="genre_id">
                                <option></option>
                                <option></option>
                            </select>
                        </form></td>
                </tr>
                <tr>
                    <td><form action="response.jsp">
                            <strong>Автор книги:</strong>
                            <select name="genre_id">
                                <option></option>
                                <option></option>
                            </select></td>
                </tr>
            </tbody>
        </table>
<!--тут попробовать добавить свою форму ввода -->
    </body>
</html>
