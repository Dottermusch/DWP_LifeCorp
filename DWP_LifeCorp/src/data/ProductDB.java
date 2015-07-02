package data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import customTools.DBUtil;
import models.Product;

public class ProductDB 
{
	public static List<Product> getAllProducts()
	{
		EntityManager em = DBUtil.getEmFactory().createEntityManager();
		String qString = "SELECT p FROM Product p ORDER BY p.productId";
		TypedQuery<Product> q = em.createQuery(qString, Product.class);
		
		List<Product> products;
		
		try
		{
			products = q.getResultList();
			if (products == null || products.isEmpty())
				products = null;
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
		
		return products;
	}
	
	public static Product getProductById(int prodId)
	{
		EntityManager em = DBUtil.getEmFactory().createEntityManager();
		String qString = "SELECT p FROM Product p WHERE p.productId = :productId";
		TypedQuery<Product> q = em.createQuery(qString, Product.class);
		q.setParameter("productId", prodId);
		
		Product product = null;
		
		try
		{
			product = q.getSingleResult();
		}
		catch (NoResultException nre)
		{
			System.out.println("Exception encountered in getProductById: " + nre);
		}
		finally
		{
			em.close();
		}
		
		return product;
	}
}
