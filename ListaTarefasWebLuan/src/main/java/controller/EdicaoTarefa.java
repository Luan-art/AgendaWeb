package controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;

import dao.TarefaDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import jakarta.servlet.http.HttpSession;
import model.Tarefa;

@WebServlet("/EdicaoTarefa")

public class EdicaoTarefa extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	TarefaDao tarefaDao = new TarefaDao();
	Tarefa tarefa = new Tarefa();
	
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	HttpSession session = request.getSession(); // Obtém a sessão existente (se não existir, retorna null)

    	if (session != null && session.getAttribute("idUser") != null) {
    		String paramId_tarefa = request.getParameter("idTarefa");
    		int id_tarefa = Integer.valueOf(paramId_tarefa);
    		
    		TarefaDao tarefaDao = new TarefaDao();
    		Tarefa tarefa = null;
    		
    		try {
    			tarefa = tarefaDao.getById(id_tarefa);
    		} catch (ClassNotFoundException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
    		
    		System.out.println(tarefa.getTitulo());
    		
    		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/EdicaoTarefa.jsp");
    		
    		request.setAttribute("tarefa", tarefa);
    		rd.forward(request, response);
        // O usuário está logado, permite o acesso à página principal
        doPost(request, response);
    	} else {
        // O usuário não está logado, redireciona-o para a página de login
    		response.sendRedirect(request.getContextPath() + "/PaginaPrincipal");
    	}
    	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Alterando Tarefa");
		
		String paramId_tarefa = request.getParameter("idTarefa");
		int idTarefa = Integer.valueOf(paramId_tarefa);
		
        HttpSession session = request.getSession();
        int id_usuario = (int) session.getAttribute("idUser");
        
		String titulo = request.getParameter("titulo");
		String descricao = request.getParameter("descricao");
		String data_criacao = request.getParameter("data_criacao");
		String data_conclusao = request.getParameter("data_conclusao");
		String status = request.getParameter("status");
		
		if (titulo.isEmpty() || descricao.isEmpty() || data_criacao.isEmpty() || data_conclusao.isEmpty()) {
            // Campos não preenchidos, redireciona para a página anterior
            request.setAttribute("errorMessage", "Por favor, preencha todos os campos.");
            doGet(request, response);
            return;
        }
		
		tarefa.setId(idTarefa);
		tarefa.setTitulo(titulo);
		tarefa.setDescricao(descricao);

		
		if(status == null) {
			tarefa.setStatus(false);
		} else {
			tarefa.setStatus(true);
		}
		
		java.util.Date dataCriacao = null;
		java.util.Date dataConclusao = null;
		
		//Verifica se o formato esta correto!!!
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			dataCriacao = sdf.parse(data_criacao);
			dataConclusao = sdf.parse(data_conclusao);
		} catch (ParseException e) {
			throw new ServletException(e);
		}
		
		tarefa.setData_criacao(data_criacao);
		tarefa.setData_conclusao(data_conclusao);
		
		try {
			tarefaDao.editarTarefa(tarefa);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("idUser", id_usuario);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/PaginaPrincipal");
		dispatcher.forward(request, response);
	}
	

}