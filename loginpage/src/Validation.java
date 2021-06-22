

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class validation
 */
@WebServlet(name = "Valid", urlPatterns = { "/Valid" })
public class Validation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Validation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email,password;
		email = request.getParameter("email");
		password = request.getParameter("pass");
		PrintWriter p = response.getWriter();
		if(email.equalsIgnoreCase("admin@gmail.com") && password.equalsIgnoreCase("admin"))
		{
			
			p.write("<div class='alert alert-success' role='alert'>Successfully Logged In.....</div>");
		}
		else if(email.equals("") || password.equals("")) {
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			  p.write("<div class='alert alert-warning' role='alert'>All Fields Are Required!</div>");

			rd.include(request, response);
		    

		}
		else
		{
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			  p.write("<div class='alert alert-danger' role='alert'>Invalid Username or Password!</div>");

			rd.include(request, response);
		}
		
		
	   
	}

}
