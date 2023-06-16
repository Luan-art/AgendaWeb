<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cadastrar novo Usuário!</title>
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

        label {
            display: block;
            margin-bottom: 10px;
            color: #333;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"] {
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
    </style>
</head>
<body>
<div class="container">
    <h1>Registro de Novo Usuário</h1>
    <form action="<%= request.getContextPath() %>/CadastrarUsuario" method="post">
        <table style="width: 80%">
            <tr>
                <td>Nome</td>
                <td><input type="text" name="nome" required/></td>
            </tr>
            <tr>
                <td>Login</td>
                <td><input type="text" name="login" required/></td>
            </tr>
            <tr>
                <td>Senha</td>
                <td><input type="password" name="senha" required/></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><input type="email" name="email" required/></td>
            </tr>
        </table>
        <br>
        <input type="submit" value="Cadastrar"/>
    </form>
</div>
</body>
</html>
