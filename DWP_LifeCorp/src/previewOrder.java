

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import oracle.sql.DATE;
import data.OrderDB;
import models.Customer;
import models.Order;
import models.Product;

/**
 * Servlet implementation class previewOrder
 */
@WebServlet("/previewOrder")
public class previewOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public previewOrder() {
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
		Date date = new Date();
		Integer quantity = Integer.parseInt(request.getParameter("quantity"));
		String url = "/confirm.jsp";
		
		
		// test the OrderDB method for inserting
		Order order = new Order();
		Customer cust = (Customer)session.getAttribute("customer");
		Product prod = (Product)session.getAttribute("product");
		order.setCustomer(cust);
		order.setProduct(prod);
		order.setQuantity(new BigDecimal(quantity));
		order.setOrderDate(date);
		BigDecimal total = order.getProduct().getListPrice();
		total = total.multiply(new BigDecimal(quantity));
		
		// boolean orderEntered = OrderDB.insertOrder(order);
		session.setAttribute("order", order);
		request.setAttribute("total", total);
		getServletContext().getRequestDispatcher(url).forward(request, response);
	}

}
