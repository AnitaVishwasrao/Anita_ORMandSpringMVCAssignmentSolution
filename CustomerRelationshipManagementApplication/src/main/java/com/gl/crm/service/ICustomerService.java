package com.gl.crm.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gl.crm.entity.Customer;

@Service
public interface ICustomerService {
	public List<Customer> findAll();

	public Customer findById(int customerId);

	public boolean save(Customer student);

	public boolean deleteById(int customerId);
}
