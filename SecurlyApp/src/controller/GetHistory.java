package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.HistoryDAO;
import model.History;
import model.User;

/**
 * Servlet implementation class GetHistory
 */
public class GetHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetHistory() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<History> listOfHistory = new ArrayList<History>();
		User user = new User();
		user.setId(Integer.parseInt(request.getParameter("userid")));
		listOfHistory = HistoryDAO.getHistory(user);
		Gson gson = new Gson();
		String json = gson.toJson(listOfHistory);
		/*request.setAttribute("listOfHistory", listOfHistory);
		request.setAttribute("json", json);
		RequestDispatcher dispatcher = request.getRequestDispatcher("history.jsp");
		dispatcher.forward(request, response);*/
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(json);
		out.flush();
	
	}

}
