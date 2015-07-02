package data;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import models.Customer;
import models.Order;
import models.Product;
import customTools.DBUtil;

public class CustomerDB 
{
	public static Customer getCustomer(String email, String password)
	{
		EntityManager em = DBUtil.getEmFactory().createEntityManager();
		String qString = "SELECT c FROM Customer c WHERE c.emailAddress = :emailAddress AND c.password = :password";
		TypedQuery<Customer> q = em.createQuery(qString, Customer.class);
		q.setParameter("emailAddress", email);
		q.setParameter("password", password);
		
		Customer customer = null;
		
		try
		{
			customer = q.getSingleResult();
			return customer;
		}
		catch (NoResultException nre)
		{
			System.out.println("Exception encountered in getProductById: " + nre);
			return null;
		}
		finally
		{
			em.close();
		}
		
	}
	
	public static boolean insertCustomer(Customer customer)
	{
		EntityManager em = DBUtil.getEmFactory().createEntityManager();
		EntityTransaction trans = em.getTransaction();
		
		try
		{
			trans.begin();
			em.persist(customer);
			trans.commit();
			return true;
		}
		catch (Exception e)
		{
			trans.rollback();
			System.out.println("A problem occurred in the insertCustomer method: " + e);
			return false;
		}
		finally 
		{
			em.close();
		}
	}
}
