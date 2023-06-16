<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
    /* Estilos gerais */
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
    }

    .container {
        max-width: 400px;
        margin: 0 auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    h1 {
        text-align: center;
        color: #333;
    }

    table {
        width: 100%;
        margin-bottom: 20px;
    }

    th, td {
        padding: 10px;
        text-align: left;
        border-bottom: 1px solid #ccc;
    }

    input[type="text"],
    input[type="password"] {
        width: 100%;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    input[type="submit"] {
        display: block;
        width: 100%;
        padding: 10px;
        background-color: #333;
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    input[type="submit"]:hover {
        background-color: #555;
    }

    .error-message {
        color: red;
        text-align: center;
        margin-top: 10px;
    }
</style>
</head>
<body>

<div class="container">
    <h1>Realizar Login</h1>
    <form action="<%= request.getContextPath() %>/Login" method="post">
        <table>
            <tr>
                <td>Login</td>
                <td><input type="text" name="login" requerid/></td>
            </tr>
            <tr>
                <td>Senha</td>
                <td><input type="password" name="senha" requerid /></td>
            </tr>
        </table>
        <input type="submit" value="Entrar" />
    </form>
    <% String errorMessage = (String) request.getAttribute("errorMessage");
    if (errorMessage != null) { %>
        <p class="error-message"><%= errorMessage %></p>
    <% } %>
</div>

</body>
</html>
