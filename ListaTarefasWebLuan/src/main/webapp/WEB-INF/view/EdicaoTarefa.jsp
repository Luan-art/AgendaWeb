<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Tarefa" %>
<%@ page import="javax.servlet.http.HttpSession" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Tarefa</title>
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
        textarea,
        input[type="date"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="checkbox"] {
            margin-top: 10px;
            margin-bottom: 10px;
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
    <h1>Edição de Tarefa</h1>

    <form action="<%= request.getContextPath() %>/EdicaoTarefa" method="post">
        <label for="titulo">Título:</label>
        <input type="text" id="titulo" name="titulo" value="${tarefa.titulo}"><br>

        <label for="descricao">Descrição:</label>
        <textarea id="descricao" name="descricao">${tarefa.descricao}</textarea><br>

        <label for="data_criacao">Data de Criação:</label>
        <input type="date" id="data_criacao" name="data_criacao" value="${tarefa.data_criacao}"><br>

        <label for="data_conclusao">Data de Conclusão:</label>
        <input type="date" id="data_conclusao" name="data_conclusao" value="${tarefa.data_conclusao}"><br>

        <label for="status">Status:</label>
        <%
            Tarefa tarefa = (Tarefa) request.getAttribute("tarefa");
            if (tarefa.isStatus()) {
        %>
        <input type="checkbox" name="status" checked>Concluído
        <%
            } else {
        %>
        <input type="checkbox" name="status">Pendente
        <%
            }
        %>
        <br>

        <input type="hidden" name="idTarefa" value="${tarefa.id}">
        <input type="hidden" name="idUser" value="${tarefa.idUser}">
        <input type="submit" value="Salvar">
    </form>
</div>
</body>
</html>
