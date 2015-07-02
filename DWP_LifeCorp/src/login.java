

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Customer;
import models.Product;
import data.CustomerDB;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String url = "/login.jsp";
		String message = "";
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		boolean isAuthenticated = false;
		int productId = 0;
		HttpSession session = request.getSession();
		
		if(session.getAttribute("productId") != null)  // check to see if coming from a product seletion
		{
			productId = (int)session.getAttribute("productId");
		}
		
		Customer customer = CustomerDB.getCustomer(email, password);  // get customer from database if exists
		
		if (customer !=  null && productId != 0)	// customer found and product selected from displayProducts
		{
			url = "/createOrder";
			session.setAttribute("customer", customer);
			session.setAttribute("isAuthenticated", true);
			session.setAttribute("productId", productId);
		}
		else if (customer == null)	// login attempted but user not found - try login again
		{
			url = "/login.jsp";
			session.setAttribute("isAuthenticated", false);
			message = "Customer for " + email + " could not be found or password incorrect.";
			request.setAttribute("message", message);
		}
		else if(customer != null && productId == 0)	// existing customer but product is 0 so need to select a product
		{
			session.setAttribute("customer", customer);
			session.setAttribute("isAuthenticated", true);
			url = "/displayProducts";
		}
			
		getServletContext().getRequestDispatcher(url).forward(request, response);
		
	}

}
