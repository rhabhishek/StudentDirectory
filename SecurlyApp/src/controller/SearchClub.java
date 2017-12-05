package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import dao.HistoryDAO;
import dao.SearchDAO;
import model.Club;
import model.History;
import model.StringConstants;
import model.Student;
import model.User;

/**
 * Servlet implementation class SearchClub
 */
public class SearchClub extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchClub() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User();
		user.setId(Integer.parseInt(request.getParameter("userid")));
		
		Club club= new Club();
		club.setName(request.getParameter("clubName"));
		club = SearchDAO.clubSearch(club);
		List<Student> listOfStudents = SearchDAO.getListOfStudentsInClub(club);
		if(("false").equals(request.getParameter("history"))){
			History history = new History();
			history.setUser(user);
			history.setSearchType(StringConstants.SEARCHTYPE_CLUB);
			history.setListOfInputs("{\"clubName\":\""+club.getName()+"\"}");
			HistoryDAO.insert(history);
		}
		Gson gson = new Gson();
		String clubJson = gson.toJson(club);
		String listJson = gson.toJson(listOfStudents);
		JsonObject json = new JsonObject();
		json.addProperty("club", clubJson.toString());
		json.addProperty("listOfStudents", listJson.toString());
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(json);
		out.flush();
	}

}
