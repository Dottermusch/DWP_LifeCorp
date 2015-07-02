

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.OrderDB;
import models.Customer;
import models.Order;

/**
 * Servlet implementation class confirmOrder
 */
@WebServlet("/confirmOrder")
public class confirmOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public confirmOrder() {
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
		HttpSession session = request.getSession();
		String url = "/thankYou.jsp";
		String message = "Thank you for today's order and your previous orders.";
		Order order = (Order)session.getAttribute("order");		// get the current order to add to the database
		Customer customer = (Customer)session.getAttribute("customer");	// get the current customer to get ID for order list
		
		long custId = customer.getCustomerId();
		
		boolean insertOK = OrderDB.insertOrder(order);	// insert the order into the order list
		
		
		List<Order> orders = OrderDB.getOrdersByCustomerId(customer.getCustomerId());	// get the order list for 
																						// save in request variable 
		request.setAttribute("orders", orders);											// for display on thank-you page
		
		if (orders.size() > 1)
			request.setAttribute("message", message);									// thank customer for prior orders if any
			
		
		getServletContext().getRequestDispatcher(url).forward(request, response);
	}

}
