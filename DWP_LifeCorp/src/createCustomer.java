

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import data.CustomerDB;
import models.Customer;

/**
 * Servlet implementation class createCustomer
 */
@WebServlet("/createCustomer")
public class createCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public createCustomer() {
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
		String url = "/displayProducts";
		Customer customer = new Customer();
		customer.setFirstName(request.getParameter("firstName"));
		customer.setLastName(request.getParameter("lastName"));
		customer.setEmailAddress(request.getParameter("email"));
		customer.setPassword(request.getParameter("password"));
		customer.setAddress1(request.getParameter("address1"));
		customer.setCity(request.getParameter("city"));
		customer.setState(request.getParameter("state"));
		customer.setZipCode(request.getParameter("zipCode"));
		
		boolean insertOk = CustomerDB.insertCustomer(customer);
		
		getServletContext().getRequestDispatcher(url).forward(request, response);
	}

}
