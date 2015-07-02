

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.ProductDB;
import models.Product;

/**
 * Servlet implementation class createOrder
 */
@WebServlet("/createOrder")
public class createOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public createOrder() {
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
		boolean isAuthenticated = false;  	// initialize and provide a debug breakpoint record if needed
		String url = "/login.jsp";			// default to sending user back to login page
		int productId = 0;
		Product product;
		HttpSession session = request.getSession();
		
		if(session.getAttribute("isAuthenticated") != null)		// check to see if the user has been authenticated
			isAuthenticated = (boolean)session.getAttribute("isAuthenticated");
		else
			isAuthenticated = false; 
		
		if (request.getParameter("productId") == null)	// check to see if coming from login page where existing user selected product
		{
			if(session.getAttribute("productId") != null)	// check to see if existing user previously selected a product before logging in
			{
				productId = (int)session.getAttribute("productId");	// get the product selected before logging in and enable 
			}
		}
		else	// REQUEST parameter from product page set so get information
		{
			productId = Integer.parseInt(request.getParameter("productId"));	// get the productId selected in the product page
			session.setAttribute("productId", productId);						// set it in session variable for create order page
		} 
		
		if (!isAuthenticated)	// user not authenticated - direct back to login page - saved product info above for later reuse
		{
			url = "/login.jsp";
			isAuthenticated = false;
			session.setAttribute("isAuthenticated", isAuthenticated);
		}
		
		else	// user authenticated and product found - proceed to create order page
		{
			String message = "1";	// set a default quantity of one for the createdPage order item
			session.setAttribute("quantity", message);
			product = ProductDB.getProductById(productId);
			session.setAttribute("product", product);
			url = "/createOrder.jsp";
		}
		
		getServletContext().getRequestDispatcher(url).forward(request, response);
	}

}
