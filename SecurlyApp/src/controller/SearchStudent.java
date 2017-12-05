package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.HistoryDAO;
import dao.SearchDAO;
import model.History;
import model.StringConstants;
import model.Student;
import model.User;

/**
 * Servlet implementation class SearchStudent
 */
public class SearchStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchStudent() {
        super();
        // TODO Auto-generated constructor stub
    }

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User();
		user.setId(Integer.parseInt(request.getParameter("userid")));
		
		Student student = new Student();
		student.setEmail(request.getParameter("email"));
		student = SearchDAO.studentSearch(student);
		student.setListOfClubs(SearchDAO.getListOfClubs(student));
		if(("false").equals(request.getParameter("history"))){
			History history = new History();
			history.setUser(user);
			history.setSearchType(StringConstants.SEARCHTYPE_STUDENT);
			
			history.setListOfInputs("{\"email\": \""+student.getEmail()+"\"}");
			HistoryDAO.insert(history);
		}
		Gson gson = new Gson();
		String json = gson.toJson(student);
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(json);
		out.flush();
	}

}
