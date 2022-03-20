package com.gl.crm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gl.crm.service.ICustomerService;
import com.gl.crm.entity.Customer;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	private ICustomerService customerService;

	@RequestMapping("/")
	public String welcome() {
		return "redirect:./..";
	}

	@RequestMapping("/customers")
	public String getRegistrations(Model model) {
		List<Customer> customers = customerService.findAll();
		model.addAttribute("Customers", customers);
		return "customers";
	}

	@RequestMapping("/customer-details-form")
	public String showCustomerDetailsForm(Model model) {
		Customer customer = new Customer();
		model.addAttribute("customer", customer);
		return "customer-details";
	}

	@RequestMapping("/edit-customer-details")
	public String showCustomerDetailsForm(@RequestParam("customerId") int customerId, Model model) {
		Customer customer = customerService.findById(customerId);
		if (customer != null) {
			model.addAttribute("customer", customer);
			return "customer-details";
		}
		return "redirect:./message?msg=" + "Failed to find customer with id " + customerId;
	}

	@PostMapping("/save")
	public String saveCustomer(Customer customerModel) {
		Customer customer;
		System.out.println(customerModel.toString());
		if (customerModel.getCustomerId() == 0) {
			customer = new Customer(customerModel.getCustomerId(), customerModel.getFirstName(),
					customerModel.getLastName(), customerModel.getEmail());
		} else {
			customer = customerService.findById(customerModel.getCustomerId());
			if (customer != null) {
				customer.setFirstName(customerModel.getFirstName());
				customer.setLastName(customerModel.getLastName());
				customer.setEmail(customerModel.getEmail());
			}
		}

		return customerService.save(customer) ? "redirect: ./customers"
				: "redirect:./message?msg=Failed to save customer details!!";
	}

	@RequestMapping("/delete-customer")
	public String deleteCustomer(@RequestParam("customerId") int customerId) {
		return customerService.deleteById(customerId) ? "redirect:./customers"
				: "redirect:./message?msg=" + "Failed to delete customer with id " + customerId;
	}

	@RequestMapping("/message")
	public String showMessagePage(@RequestParam("msg") String message, Model model) {
		model.addAttribute("message", message);
		return "message";
	}
}
