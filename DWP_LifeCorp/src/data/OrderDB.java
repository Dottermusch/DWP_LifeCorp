package data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import models.Order;
import models.Product;
import customTools.DBUtil;

public class OrderDB
{
	public static boolean insertOrder(Order order)
	{
		EntityManager em = DBUtil.getEmFactory().createEntityManager();
		EntityTransaction trans = em.getTransaction();
		
		try
		{
			trans.begin();
			em.persist(order);
			trans.commit();
			return true;
		}
		catch (Exception e)
		{
			trans.rollback();
			System.out.println("A problem occurred in the insertOrder method: " + e);
			return false;
		}
		finally 
		{
			em.close();
		}
	}
	
	public static List<Order> getOrdersByCustomerId(long custId)
	{
		EntityManager em = DBUtil.getEmFactory().createEntityManager();
		String qString = "SELECT o FROM Order o WHERE o.customer.customerId = :customerId ORDER BY o.orderDate DESC";
		TypedQuery<Order> q = em.createQuery(qString, Order.class);
		q.setParameter("customerId", custId);
		
		List<Order> orders;
		
		try
		{
			orders = q.getResultList();
			if (orders == null || orders.isEmpty())
				orders = null;
		}
		catch (Exception e)
		{
			System.out.println("Exception encountered in getAllProducts: " + e);
			return null;
		}
		finally
		{
			em.close();
		}
		
		return orders;
	}
}
