package com.gl.crm.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.gl.crm.entity.Customer;
import com.gl.crm.service.ICustomerService;

@Repository
public class CustomerServiceDao implements ICustomerService {
	private SessionFactory sessionFactory;
	private Session session;

	@Autowired
	public CustomerServiceDao(SessionFactory sessionFactory) {
		super();
		this.sessionFactory = sessionFactory;
		try {
			session = sessionFactory.getCurrentSession();
		} catch (HibernateException e) {
			session = sessionFactory.openSession();
		}
	}

	@Transactional
	@Override
	public List<Customer> findAll() {
		Transaction transaction = session.beginTransaction();
		List<Customer> customers = session.createQuery("from Customer", Customer.class).list();
		transaction.commit();

		return customers;
	}

	@Transactional
	@Override
	public Customer findById(int customerId) {
		Customer customer = new Customer();

		Transaction transaction = session.beginTransaction();
		customer = session.get(Customer.class, customerId);
		transaction.commit();

		return customer;
	}

	@Transactional
	@Override
	public boolean save(Customer customer) {
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			session.saveOrUpdate(customer);
		} catch (Exception ex) {
			System.out.println("Error occurred while saving data - " + ex.getMessage());
			return false;
		} finally {
			if (transaction != null) {
				session.flush();
				transaction.commit();
			}
		}

		return true;
	}

	@Transactional
	@Override
	public boolean deleteById(int customerId) {
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			Customer customer = session.get(Customer.class, customerId);
			session.delete(customer);
		} catch (Exception ex) {
			System.out.println("Error occurred while deleting data - " + ex.getMessage());
			return false;
		} finally {
			if (transaction != null)
				transaction.commit();
		}

		return true;
	}

}
