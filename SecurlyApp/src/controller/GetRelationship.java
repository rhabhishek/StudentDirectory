package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import businessLogic.FindRelationship;
import dao.HistoryDAO;
import model.History;
import model.StringConstants;
import model.Student;
import model.User;

/**
 * Servlet implementation class GetRelationship
 */
public class GetRelationship extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetRelationship() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = new User();
		user.setId(Integer.parseInt(request.getParameter("userid")));
		
		Student student1 = new Student();
		Student student2 = new Student();
		student1.setEmail(request.getParameter("student1"));
		student2.setEmail(request.getParameter("student2"));
		Boolean connection = FindRelationship.findRelationship(student1, student2);
		if(("false").equals(request.getParameter("history"))){
			History history = new History();
			history.setUser(user);
			history.setSearchType(StringConstants.SEARCHTYPE_RELATIONSHIP);
			history.setListOfInputs("{\"student1\":\""+student1.getEmail()+"\",\"student2\":\""+student2.getEmail()+"\"}");
			HistoryDAO.insert(history);
		}
		
		JsonObject json = new JsonObject();
		json.addProperty("connection", connection.toString());
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(json);
		out.flush();
	}
}
